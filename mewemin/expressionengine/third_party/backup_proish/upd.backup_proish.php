<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

 /**
 * mithra62 - Backup Pro(ish)
 *
 * @package		mithra62:backup_proish
 * @author		Eric Lamb
 * @copyright	Copyright (c) 2011, mithra62, Eric Lamb.
 * @link		http://mithra62.com/projects/view/backup-proish/
 * @version		1.8.2
 * @filesource 	./system/expressionengine/third_party/backup_proish/
 */
 
 /**
 * Backup Pro - Updater
 *
 * Update class
 *
 * @package 	mithra62:backup_proish
 * @author		Eric Lamb
 * @filesource 	./system/expressionengine/third_party/backup_proish/upd.backup_proish.php
 */
class Backup_proish_upd { 

    public $version = '1.0.4'; 
    
    public $name = 'Backup_proish';
    
    public $class = 'Backup_proish';
    
    public $settings_table = 'backup_proish_settings';
     
    public function __construct() 
    { 
		// Make a local reference to the ExpressionEngine super object
		$this->EE =& get_instance();
    } 
    
	public function install() 
	{
		$this->EE->load->dbforge();
	
		$data = array(
			'module_name' => $this->name,
			'module_version' => $this->version,
			'has_cp_backend' => 'y',
			'has_publish_fields' => 'n'
		);
	
		$this->EE->db->insert('modules', $data);
		
		$sql = "INSERT INTO exp_actions (class, method) VALUES ('".$this->name."', 'cron')";
		$this->EE->db->query($sql);

		$this->add_settings_table();
		
		return TRUE;
	} 
	
	private function add_settings_table()
	{
		$this->EE->load->dbforge();
		$fields = array(
						'id'	=> array(
											'type'			=> 'int',
											'constraint'	=> 10,
											'unsigned'		=> TRUE,
											'null'			=> FALSE,
											'auto_increment'=> TRUE
										),
						'setting_key'	=> array(
											'type' 			=> 'varchar',
											'constraint'	=> '30',
											'null'			=> FALSE,
											'default'		=> ''
										),
						'setting_value'  => array(
											'type' 			=> 'text',
											'null'			=> FALSE
										),
						'serialized' => array(
											'type' => 'int',
											'constraint' => 1,
											'null' => TRUE,
											'default' => '0'
						)										
		);

		$this->EE->dbforge->add_field($fields);
		$this->EE->dbforge->add_key('id', TRUE);
		$this->EE->dbforge->create_table($this->settings_table, TRUE);		
	}

	public function uninstall()
	{
		$this->EE->load->dbforge();
	
		$this->EE->db->select('module_id');
		$query = $this->EE->db->get_where('modules', array('module_name' => $this->class));
	
		$this->EE->db->where('module_id', $query->row('module_id'));
		$this->EE->db->delete('module_member_groups');
	
		$this->EE->db->where('module_name', $this->class);
		$this->EE->db->delete('modules');
	
		$this->EE->db->where('class', $this->class);
		$this->EE->db->delete('actions');
		
		$this->EE->dbforge->drop_table($this->settings_table);
	
		return TRUE;
	}

	public function update($current = '')
	{
		if ($current == $this->version)
		{
			return TRUE;
		}	
		
		return TRUE;
	}	
    
}