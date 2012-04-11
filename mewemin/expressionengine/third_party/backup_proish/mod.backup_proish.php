<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Backup_proish {

	public $return_data	= '';
	
	public function __construct()
	{
		// Make a local reference to the ExpressionEngine super object
		$this->EE =& get_instance();
		
		$this->db_conf = array(
					 'user' => $this->EE->db->username, 
					 'pass' => $this->EE->db->password,
					 'db_name' => $this->EE->db->database, 
					 'host' => $this->EE->db->hostname
		);
		
		$this->EE->load->model('backup_proish_settings_model', 'backup_proish_settings', TRUE);
		$this->EE->load->library('backup_proish_lib');
		$this->EE->load->library('backup_proish_sql_backup');	
		$this->EE->load->library('email');		
			
		$this->settings = $this->EE->backup_proish_settings->get_settings();
		$this->EE->backup_proish_lib->set_backup_dir($this->settings['backup_store_location']);		
	}
	
	public function void()
	{
		
	}
	
	public function cron()
	{
		ini_set('memory_limit', -1);
		set_time_limit(3600); //limit the time to 1 hours

		$type = $this->EE->input->get_post('type', FALSE);
		if(!$type)
		{
			exit;
		}

		$this->EE->backup_proish_lib->set_db_info($this->db_conf);
		$path = $this->EE->backup_proish_lib->make_db_filename();	
		$backup_paths = array();
		switch($type)
		{
			case 'db':
				$backup_paths['db_backup'] = $this->EE->backup_proish_sql_backup->backup($path, $this->db_conf);
			break;
			
			case 'files':
				$backup_paths['files_backup'] = $this->EE->backup_proish_lib->backup_files();
			break;
			
			case 'combined':
				$backup_paths['db_backup'] = $this->EE->backup_proish_sql_backup->backup($path, $this->db_conf);
				$backup_paths['files_backup'] = $this->EE->backup_proish_lib->backup_files();
			break;
		}
		
		if(count($backup_paths) >= 1 && count($this->settings['cron_notify_emails']) >= 1)
		{
			$this->EE->backup_proish_lib->send_notification($backup_paths);
		}
		exit;
	}
}