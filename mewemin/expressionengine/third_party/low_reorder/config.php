<?php

/**
* Low Reorder config file
*
* @package		low-reorder-ee2_addon
* @author		Lodewijk Schutte ~ Low <low@loweblog.com>
* @link			http://gotolow.com/addons/low-reorder
* @copyright	Copyright (c) 2010, Low
*/

if ( ! defined('LOW_REORDER_NAME'))
{
	define('LOW_REORDER_NAME',         'Low Reorder');
	define('LOW_REORDER_CLASS_NAME',   'Low_reorder');
	define('LOW_REORDER_VERSION',      '1.2.1');
	define('LOW_REORDER_DOCS',         'http://gotolow.com/addons/low-reorder');
}

$config['name']    = LOW_REORDER_NAME;
$config['version'] = LOW_REORDER_VERSION;

$config['nsm_addon_updater']['versions_xml'] = LOW_REORDER_DOCS.'/feed';
