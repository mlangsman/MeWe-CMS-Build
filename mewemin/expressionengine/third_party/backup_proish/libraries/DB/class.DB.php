<?php

//
// Edit History:
//
//  Last $Author: munroe $
//  Last Modified: $Date: 2006/02/07 14:37:32 $
//
//  Dick Munroe (munroe@csworks.com) 05-Feb-2006
//      Initial version created (derived from dm.DB/class.DB.php)
//

/**
 * @author Dick Munroe <munroe@csworks.com>
 * @copyright copyright @ 2006 by Dick Munroe, Cottage Software Works, Inc.
 * @license http://www.csworks.com/publications/ModifiedNetBSD.html
 * @version 1.0.0
 * @package dm.DB
 * @example ./example.php
 */

/**
 * Compatibility class to give current users of dm.DB functionality without having
 * to change their code.
 */

include_once 'class.MySQL.DB.php' ;

class DB extends MySQLDB
{
    /**
     * Constructor
     *
     * @param      String $dblogin, String $dbpass, String $dbname
     * @return     void
     * @access     public
     */

    function DB($dblogin, $dbpass, $dbname, $dbhost = null)
    {
        $this->MySQLDB($dblogin, $dbpass, $dbname, $dbhost) ;
    }

}

?>
