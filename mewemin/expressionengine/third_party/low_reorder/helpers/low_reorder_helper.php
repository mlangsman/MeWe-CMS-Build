<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


/**
* Low Reorder Helper functions
*
* @package         low-reorder-ee2_addon
* @author          Lodewijk Schutte ~ Low <low@loweblog.com>
* @link            http://gotolow.com/addons/low-reorder
* @copyright       Copyright (c) 2010, Low
*/

// --------------------------------------------------------------------

/**
* Encode settings for DB
*
* @param      array     Array to encode
* @return     string
*/
if ( ! function_exists('encode_reorder_settings'))
{
	function encode_reorder_settings($array = array())
	{
		return str_replace('=', '', base64_encode(serialize($array)));
	}
}

// --------------------------------------------------------------------

/**
* Decode string back to array
*
* @param      string    String to decode
* @return     array
*/
if ( ! function_exists('decode_reorder_settings'))
{
	function decode_reorder_settings($str = '')
	{
		$default_settings = array(
			'category_options' => 'all',
			'categories'       => FALSE,
			'statuses'         => FALSE,
			'show_expired'     => 'y',
			'show_future'      => 'y',
			'sort_order'       => 'asc',
			'permissions'      => array(),
			'clear_cache'      => 'n'
		);

		// Try to decode, fallback to empty array
		if ( ! ($settings = @unserialize(base64_decode($str))))
		{
			$settings = array();
		}

		// Merge default and given settings
		$settings = array_merge($default_settings, $settings);

		// Check category settings
		if ($settings['categories'] !== FALSE)
		{
			if ( in_array($settings['categories'], array('all', 'one')) )
			{
				$settings['category_options'] = $settings['categories'];
				$settings['categories'] = FALSE;
			}
			else
			{
				$settings['category_options'] = 'some';
				$settings['categories'] = (strlen($settings['categories'])) ? explode('|', $settings['categories']) : FALSE;
			}
		}

		// Check status settings
		if ($settings['statuses'] !== FALSE)
		{
			$settings['statuses'] = (strlen($settings['statuses'])) ? explode('|', $settings['statuses']) : FALSE;
		}

		return $settings;
	}
}

// --------------------------------------------------------------------

/**
* Flatten results
*
* Given a DB result set, this will return an (associative) array
* based on the keys given
*
* @param      array
* @param      string    key of array to use as value
* @param      string    key of array to use as key (optional)
* @return     array
*/
if ( ! function_exists('low_flatten_results'))
{
	function low_flatten_results($resultset, $val, $key = FALSE)
	{
		$array = array();

		foreach ($resultset AS $row)
		{
			if ($key !== FALSE)
			{
				$array[$row[$key]] = $row[$val];
			}
			else
			{
				$array[] = $row[$val];
			}
		}

		return $array;
	}	
}

// --------------------------------------------------------------
