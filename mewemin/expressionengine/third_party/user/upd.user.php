<?php if ( ! defined('EXT') ) exit('No direct script access allowed');
 
 /**
 * Solspace - User
 *
 * @package		Solspace:User
 * @author		Solspace DevTeam
 * @copyright	Copyright (c) 2008-2012, Solspace, Inc.
 * @link		http://solspace.com/docs/addon/c/User/
 * @version		3.3.9
 * @filesource 	./system/expressionengine/third_party/user/
 */
 
 /**
 * User Module Class - Install/Uninstall/Update class
 *
 * @package 	Solspace:User
 * @author		Solspace DevTeam
 * @filesource 	./system/expressionengine/third_party/user/upd.user.php
 */

require_once 'upd.user.base.php';

if (APP_VER < 2.0)
{
	eval('class User_updater extends User_updater_base { }');
}
else
{
	eval('class User_upd extends User_updater_base { }');
}

?>
