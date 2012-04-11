<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Backup_proish_settings_model extends CI_Model
{
	private $_table = 'backup_proish_settings';
	
	public $_defaults = array(
						'auto_threshold' => '0',
						'exclude_paths' => '',
						'enable_cron' => '0',
						'cron_notify_emails' => '',
						'cron_attach_backups' => '0',
						'cron_attach_threshold' => '0',
						'backup_store_location' => '',
						'backup_file_location' => ''
	);
	
	private $_serialized = array(
						'cron_notify_emails',
						'exclude_paths'
	);
	
	public function __construct()
	{
		parent::__construct();
		$this->_defaults['backup_file_location'] = realpath($_SERVER['DOCUMENT_ROOT']);
		$this->_defaults['backup_store_location'] = realpath(dirname(realpath(__FILE__)).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'backups');
	}
	
	/**
	 * Adds a setting to the databse
	 * @param string $setting
	 */
	public function add_setting($setting)
	{
		$data = array(
		   'setting_key' => $setting,
		   'setting_value' => ''
		);
		
		return $this->db->insert($this->_table, $data); 
	}	
	
	public function get_settings()
	{
		$this->db->select('setting_key, setting_value, `serialized`');
		$query = $this->db->get($this->_table);	
		$_settings = $query->result_array();
		$settings = array();	
		foreach($_settings AS $setting)
		{
			$settings[$setting['setting_key']] = ($setting['serialized'] == '1' ? unserialize($setting['setting_value']) : $setting['setting_value']);
		}
		
		//now check to make sure they're all there and set default values if not
		foreach ($this->_defaults as $key => $value)
		{
			//setup the override check
			if(isset($this->config->config['backup_proish'][$key]))
			{
				$settings[$key] = $this->config->config['backup_proish'][$key];
			}
			
			//normal default check
			if(!isset($settings[$key]))
			{
				$settings[$key] = $value;
			}
		}		

		if($settings['backup_file_location'] == '')
		{
			$settings['backup_file_location'] = $this->_defaults['backup_file_location'];
		}
		
		if($settings['backup_store_location'] == '')
		{
			$settings['backup_store_location'] = $this->_defaults['backup_store_location'];
		}		

		return $settings;
	}
	
	/**
	 * Returns the value straigt from the database
	 * @param string $setting
	 */
	public function get_setting($setting)
	{
		return $this->db->get_where($this->_table, array('setting_key' => $setting))->result_array();
	}	
	
	public function update_settings(array $data)
	{
		foreach($data AS $key => $value)
		{
			
			if(in_array($key, $this->_serialized))
			{
				$value = explode("\n", $value);
				
				//hack to remove bad email addresses from list
				if($key == 'cron_notify_emails')
				{
					$temp = array();
					foreach($value AS $email)
					{
						if($this->backup_proish_lib->check_email($email))
						{
							$temp[] = $email;
						}						
					}
					$value = $temp;
				}				
			}
			
			$this->update_setting($key, $value);
		}
		
		return TRUE;
	}
	
	/**
	 * Updates the value of a setting
	 * @param string $key
	 * @param string $value
	 */
	public function update_setting($key, $value)
	{
		if(!$this->_check_setting($key))
		{
			return FALSE;
		}

		$data = array();
		if(is_array($value))
		{
			$value = serialize($value);
			$data['serialized '] = '1';
		}
		
		$data['setting_value'] = $value;
		$this->db->where('setting_key', $key);
		$this->db->update($this->_table, $data);
		
	}

	/**
	 * Verifies that a submitted setting is valid and exists. If it's valid but doesn't exist it is created.
	 * @param string $setting
	 */
	private function _check_setting($setting)
	{
		if(array_key_exists($setting, $this->_defaults))
		{
			if(!$this->get_setting($setting))
			{
				$this->add_setting($setting);
			}
			
			return TRUE;
		}		
	}	
	
	public function get_member_groups()
	{
		$this->db->select('group_title , group_id')->where('group_id != 1');
		$query = $this->db->get('member_groups');	
		$_groups = $query->result_array();	
		$groups = array();
		foreach($_groups AS $group)
		{
			$groups[$group['group_id']] = $group['group_title'];
		}
		return $groups;
	}
	
}