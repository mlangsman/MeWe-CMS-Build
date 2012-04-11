<?php

include_once('DB/class.factory.DB.php') ;
include_once 'pclzip.lib.php';

class Backup_proish_sql_backup
{
    /**
     * @var object for the type of database to be save or restored.
     * @access private
     */
    
    var $m_dbObject ;
    
    /**
     * @var resource the file pointer for the input/output file.
     * @access private
     */
    
    var $m_fptr;
    
    /**
     * @var string the name of the output file.
     * @access private
     */
    
    var $m_output;
    
    /**
     * @var boolean TRUE if only the structure of the database is to be saved.
     * @access private
     */
    
    var $m_structureOnly;
    
    function __construct()
    {
    	$this->EE =& get_instance();
        $this->m_structureOnly = FALSE;
        $this->settings = $this->EE->backup_proish_settings->get_settings();
    }
    
    public function set_settings($settings)
    {
    	$this->settings = $settings;
    }

    /**
     * @desc Restore a backup file.
     * @returns void
     * @access public
     */
    
    function restore($store_path, $db_info)
    {
        $this->m_dbObject =& FactoryDB::factory($db_info['user'], $db_info['pass'], $db_info['db_name'], $db_info['host'], dmDB_MySQL) ;
    	$this->m_output = $store_path;
        $this->m_fptr = fopen($this->m_output, "r") ;
        
        if ($this->m_fptr === FALSE)
        {
            die(sprintf("Can't open %s", $this->m_output)) ;
        }
        
        while (!feof($this->m_fptr))
        {
            $theQuery = fgets($this->m_fptr) ;
            $theQuery = substr($theQuery, 0, strlen($theQuery) - 1) ;
            
            if ($theQuery != '')
            {
                $this->m_dbObject->query(utf8_decode($theQuery)) ;
            }
        }
        
        fclose($this->m_fptr);
        return true;
    }

    /**
     * @desc write an SQL statement to the backup file.
     * @param string The string to be written.
     * @access private
     */
    
    function _Out($s)  
    {  
        if ($this->m_fptr === false)
        {
            echo("$s");
        }
        else
        {
            fputs($this->m_fptr, utf8_encode($s));
        }
    }

    /**
     * @desc public interface for backup.
     * @returns void
     * @access public
     */
    
    function backup($store_path, $db_info)
    {
        $this->m_dbObject =& FactoryDB::factory($db_info['user'], $db_info['pass'], $db_info['db_name'], $db_info['host'], dmDB_MySQL) ;
    	$this->m_output = $store_path;
    	$this->m_fptr=fopen($this->m_output,"w");
    	//enumerate tables 

        $this->m_dbObject->queryConstant('SHOW TABLES') ;
        
        while ($theTable =& $this->m_dbObject->fetchRow())
        {
            $theTableName = $theTable[0] ;  
    
            $theDB = clone($this->m_dbObject) ;
            $theCreateTable = $theDB->showCreateTable($theTableName) ;
            $theDB->clear() ;
            
            $theCreateTable = preg_replace('/\s*\n\s*/', ' ', $theCreateTable) ;
            $theCreateTable = preg_replace('/\(\s*/', '(', $theCreateTable) ;
            $theCreateTable = preg_replace('/\s*\)/', ')', $theCreateTable) ;
            
            $this->_Out(sprintf("DROP TABLE IF EXISTS `%s` ;\n", $theTableName)) ;
            
            $this->_Out($theCreateTable . ";\n\n");  
    
            if ($this->m_structureOnly != true)  
            {  
                $theDB->queryConstant(sprintf('SELECT * FROM %s', $theTableName)) ;
                
                //parse out the table's data and generate the SQL INSERT statements in order to replicate the data itself... 
                
                $theFieldNames = '' ;
                
                while ($theDataRow =& $theDB->fetchAssoc())
                {
                    if ($theFieldNames == '')
                    {
                        $theFieldNames = '`' . implode('`, `', array_keys($theDataRow)) . '`' ;
                    }

                    $theData = array() ;
                    
                    foreach ($theDataRow as $theValue)
                    {
                        $theData[] = $theDB->escape_string($theValue) ;
                    }
                    
                    $theData = '"' . implode('", "', $theData) . '"' ;
                    
                    $theInsert = sprintf("INSERT INTO `%s` (%s) VALUES (%s) ;\n",
                                         $theTableName, $theFieldNames,
                                         $theData) ;
                                         
                    $this->_Out($theInsert);  
    
                   }  
    
                $this->_Out("\n");  
            }  
    
            $theDB->clear() ;    
        }  
        
        $this->m_dbObject->clear() ;
        
        if ($this->m_fptr!=false)
        {
            fclose($this->m_fptr);
        }
        
        $zip = new PclZip62($this->m_output.'.zip');
		if ($zip->create($this->m_output, PCLZIP_OPT_REMOVE_ALL_PATH) == 0) 
		{
			return FALSE;
		}      
		unlink($this->m_output);
		
        return $this->m_output.'.zip';
    }
}
?>