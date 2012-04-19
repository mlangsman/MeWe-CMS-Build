<?php if ( ! defined('EXT')) exit('No direct script access allowed');

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
 * User - Config
 *
 * NSM Addon Updater Config File
 *
 * @package 	Solspace:User
 * @author		Solspace DevTeam
 * @filesource 	./system/expressionengine/third_party/user/config.php
 */

//since we are 1.x/2.x compatible, we only want this to run in 1.x just in case
if (defined('APP_VER') AND APP_VER >= 2.0)
{
	require_once PATH_THIRD . '/user/constants.user.php';

	$config['name']    								= 'User';
	$config['version'] 								= USER_VERSION;
	$config['nsm_addon_updater']['versions_xml'] 	= 'http://www.solspace.com/software/nsm_addon_updater/user';
}
