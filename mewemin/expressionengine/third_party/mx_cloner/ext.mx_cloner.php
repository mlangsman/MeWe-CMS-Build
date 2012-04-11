<?php

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * MX Cloner
 *
 * MX Cloner  Adds the Ability to Clone Entries
 *
 * @package  ExpressionEngine
 * @category Extension
 * @author    Max Lazar <max@eec.ms>
 * @copyright Copyright (c) 2010 Max Lazar (http://eec.ms)
 * @license   http://creativecommons.org/licenses/MIT/  MIT License
 * @version 1.1.2
 * @Thanks to Leevi Graham (http://leevigraham.com/) for permission to use his SET/GET settings function for EE2!
 */


/* !TODO
	

*/

class Mx_cloner_ext
{
	var $settings        = array();

	var $addon_name     = 'MX Cloner';
	var $name			= 'MX Cloner';
	var $version		= '1.1.2';
	var $description	= 'Adds the Ability to Clone Entries';
	var $settings_exist	= 'y';
	var $docs_url		= '';

	/**
	 * Defines the ExpressionEngine hooks that this extension will intercept.
	 *
	 * @since Version 1.0.1
	 * @access private
	 * @var mixed an array of strings that name defined hooks
	 * @see http://codeigniter.com/user_guide/general/hooks.html
	 **/
	private $hooks = array(
		'publish_form_entry_data'       => 'publish_form_entry_data'

	);
	// -------------------------------
	// Constructor
	// -------------------------------
	function Mx_cloner_ext($settings='')
	{
		$this->EE =& get_instance();
		$this->settings = $settings;
	}

	public function __construct($settings=FALSE)
	{
		$this->EE =& get_instance();

		// define a constant for the current site_id rather than calling $PREFS->ini() all the time
		if
		(defined('SITE_ID') == FALSE)
			define('SITE_ID', $this->EE->config->item('site_id'));

		// set the settings for all other methods to access
		$this->settings = ($settings == FALSE) ? $this->_getSettings() : $this->_saveSettingsToSession($settings);
	}


	/**
	 * Prepares and loads the settings form for display in the ExpressionEngine control panel.
	 * @since Version 1.0.0
	 * @access public
	 * @return void
	 **/
	public function settings_form()
	{
		$this->EE->lang->loadfile('mx_cloner');

		// Create the variable array
		$vars = array(
			'addon_name' => $this->addon_name,
			'error' => FALSE,
			'input_prefix' => __CLASS__,
			'message' => FALSE,
			'settings_form' =>FALSE,
			'channel_data' => $this->EE->channel_model->get_channels()->result(),
			'language_packs' => ''
		);

		$vars['settings'] = $this->settings;
		$vars['settings_form'] = TRUE;

		if
		($new_settings = $this->EE->input->post(__CLASS__))
		{
			$vars['settings'] = $new_settings;
			$this->_saveSettingsToDB($new_settings);
			$vars['message'] = $this->EE->lang->line('extension_settings_saved_success');
		}



		$js = str_replace('"', '\"', str_replace("\n", "", $this->EE->load->view('form_settings', $vars, TRUE)));

		return $this->EE->load->view('form_settings', $vars, true);

	}
	// END


	/**
	 * entry_submission_start function.
	 * 
	 * @access public
	 * @param mixed $data
	 * @return void
	 */
	function entry_submission_start($data)
	{

		if  ($this->EE->input->get('clone') == 'y')
		{

			$_GET['entry_id'] ='';

		}

		return false;
	}

	/**
	 * publish_form_entry_data function.
	 * 
	 * @access public
	 * @param mixed $data
	 * @return void
	 */
	function publish_form_entry_data($data)
	{

		if  ($this->EE->input->get('clone') == 'y')
		{

			$suffix = (string) $this->settings['title_suffix'];
			$url_suffix = (string) $this->settings['url_suffix'];

			$ext_data= array (
				'title' => $data['title'].$suffix,
				'url_title' => $data['url_title'].$url_suffix,
				'versioning_enabled' => 'n',
				'recent_comment_date' => '',
				'comment_total' => '' ,
				'ip_address' => $this->EE->input->ip_address(),
			);

			if (isset($this->settings['update_time']))
			{
				$ext_data= array_merge($ext_data, array (
						'entry_date' => '',
						'edit_date'     => '',
						'year'      => '',
						'month'      => '',
						'day'      => '',
						'year' => '',
						'month' => '',
						'day' => '',
						'expiration_date' => '',
						'comment_expiration_date' => '',
						'edit_date' => '',
					));
			}
			
			foreach ($ext_data as $key => $val)
			{
				$data[$key] = $val;
			}
		}
		return $data;
	}



	// --------------------------------
	//  Activate Extension
	// --------------------------------

	function activate_extension()
	{
		$this->_createHooks();
	}

	/**
	 * Saves the specified settings array to the database.
	 *
	 * @since Version 1.0.0
	 * @access protected
	 * @param array $settings an array of settings to save to the database.
	 * @return void
	 **/
	private function _getSettings($refresh = FALSE)
	{
		$settings = FALSE;
		if
		(isset($this->EE->session->cache[$this->addon_name][__CLASS__]['settings']) === FALSE || $refresh === TRUE)
		{
			$settings_query = $this->EE->db->select('settings')
			->where('enabled', 'y')
			->where('class', __CLASS__)
			->get('extensions', 1);

			if
			($settings_query->num_rows())
			{
				$settings = unserialize($settings_query->row()->settings);
				$this->_saveSettingsToSession($settings);
			}
		}
		else
		{
			$settings = $this->EE->session->cache[$this->addon_name][__CLASS__]['settings'];
		}
		return $settings;
	}

	/**
	 * Saves the specified settings array to the session.
	 * @since Version 1.0.0
	 * @access protected
	 * @param array $settings an array of settings to save to the session.
	 * @param array $sess A session object
	 * @return array the provided settings array
	 **/
	private function _saveSettingsToSession($settings, &$sess = FALSE)
	{
		// if there is no $sess passed and EE's session is not instaniated
		if
		($sess == FALSE && isset($this->EE->session->cache) == FALSE)
			return $settings;

		// if there is an EE session available and there is no custom session object
		if
		($sess == FALSE && isset($this->EE->session) == TRUE)
			$sess =& $this->EE->session;

		// Set the settings in the cache
		$sess->cache[$this->addon_name][__CLASS__]['settings'] = $settings;

		// return the settings
		return $settings;
	}


	/**
	 * Saves the specified settings array to the database.
	 *
	 * @since Version 1.0.0
	 * @access protected
	 * @param array $settings an array of settings to save to the database.
	 * @return void
	 **/
	private function _saveSettingsToDB($settings)
	{
		$this->EE->db->where('class', __CLASS__)
		->update('extensions', array('settings' => serialize($settings)));
	}
	/**
	 * Sets up and subscribes to the hooks specified by the $hooks array.
	 * @since Version 1.0.0
	 * @access private
	 * @param array $hooks a flat array containing the names of any hooks that this extension subscribes to. By default, this parameter is set to FALSE.
	 * @return void
	 * @see http://codeigniter.com/user_guide/general/hooks.html
	 **/
	private function _createHooks($hooks = FALSE)
	{
		if (!$hooks)
		{
			$hooks = $this->hooks;
		}

		$hook_template = array(
			'class' => __CLASS__,
			'settings' =>'',
			'version' => $this->version,
		);

		$hook_template['settings']['multilanguage'] = 'n';

		foreach ($hooks as $key => $hook)
		{
			if (is_array($hook))
			{
				$data['hook'] = $key;
				$data['method'] = (isset($hook['method']) === TRUE) ? $hook['method'] : $key;
				$data = array_merge($data, $hook);
			}
			else
			{
				$data['hook'] = $data['method'] = $hook;
			}

			$hook = array_merge($hook_template, $data);
			$hook['settings'] = serialize($hook['settings']);
			$this->EE->db->query($this->EE->db->insert_string('exp_extensions', $hook));
		}
	}

	/**
	 * Removes all subscribed hooks for the current extension.
	 *
	 * @since Version 1.0.0
	 * @access private
	 * @return void
	 * @see http://codeigniter.com/user_guide/general/hooks.html
	 **/
	private function _deleteHooks()
	{
		$this->EE->db->query("DELETE FROM `exp_extensions` WHERE `class` = '".__CLASS__."'");
	}


	// END




	// --------------------------------
	//  Update Extension
	// --------------------------------

	function update_extension( $current='' )
	{

		if ($current == '' or $current == $this->version)
		{
			return FALSE;
		}

		if ($current < '2.0.1')
		{
			// Update to next version
		}

		$this->EE->db->query("UPDATE exp_extensions SET version = '".$this->EE->db->escape_str($this->version)."' WHERE class = '".get_class($this)."'");
	}
	// END

	// --------------------------------
	//  Disable Extension
	// --------------------------------

	function disable_extension()
	{

		$this->EE->db->delete('exp_extensions', array('class' => get_class($this)));
	}
	// END
}

/* End of file ext.mx_cloner.php */
/* Location: ./system/expressionengine/third_party/mx_cloner/ext.mx_cloner.php */