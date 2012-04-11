<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Backup_proish_mcp 
{
	public $url_base = '';
	
	/**
	 * The amount of pagination items per page
	 * @var int
	 */
	public $perpage = 10;
	
	/**
	 * The delimiter for the datatables jquery
	 * @var stirng
	 */
	public $pipe_length = 1;
	
	/**
	 * The name of the module; used for links and whatnots
	 * @var string
	 */
	private $mod_name = 'backup_proish';
	
	/**
	 * The name of the class for the module references
	 * @var string
	 */
	public $class = 'Backup_proish';
	
	
	public function __construct()
	{
		$this->EE =& get_instance();
		
		$this->db_conf = array(
					 'user' => $this->EE->db->username, 
					 'pass' => $this->EE->db->password,
					 'db_name' => $this->EE->db->database, 
					 'host' => $this->EE->db->hostname
		);

		//load EE stuff
		$this->EE->load->library('javascript');
		$this->EE->load->library('table');
		$this->EE->load->helper('form');	
		
		$this->EE->load->model('backup_proish_settings_model', 'backup_proish_settings', TRUE);	
		$this->EE->load->library('backup_proish_js');
		$this->EE->load->library('backup_proish_lib');
		$this->EE->load->library('backup_proish_sql_backup');	
		$this->settings = $this->EE->backup_proish_settings->get_settings();
		
		//verify the user is either a super admin or is on the allowed groups list
		if($this->EE->session->userdata('group_id') != '1' && isset($this->settings['allowed_access_levels']) && is_array($this->settings['allowed_access_levels']))
		{
			if(!in_array($this->EE->session->userdata('group_id'), $this->settings['allowed_access_levels']))
			{
				show_error($this->EE->lang->line('not_authorized'));
			}		
		}
		
		$this->query_base = 'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module='.$this->mod_name.AMP.'method=';
		$this->url_base = BASE.AMP.$this->query_base;
		
		$this->EE->backup_proish_lib->set_url_base($this->url_base);
		$this->EE->backup_proish_lib->set_backup_dir($this->settings['backup_store_location']);
		$this->EE->backup_proish_lib->set_db_info($this->db_conf);
		$this->backup_location = $this->settings['backup_store_location'];
		
		$this->EE->cp->set_variable('url_base', $this->url_base);
		$this->EE->cp->set_variable('query_base', $this->query_base);
		
		$this->EE->cp->set_breadcrumb(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module='.$this->mod_name, $this->EE->lang->line('backup_proish_module_name'));
		
		$this->EE->cp->set_right_nav($this->EE->backup_proish_lib->get_right_menu());	
		$this->total_space_used = $this->EE->backup_proish_lib->get_space_used();
		if($this->total_space_used > $this->settings['auto_threshold'])
		{
			$this->EE->backup_proish_lib->cleanup_backups($this->settings['auto_threshold'], $this->total_space_used);
		}
		
		$this->errors = $this->EE->backup_proish_lib->error_check();
	}
	
	public function index()
	{
		$vars = array();
		$vars['errors'] = $this->errors;
		$vars['paths'] = array(
							  'db' => $this->EE->backup_proish_lib->backup_db_dir, 
							  'files' => $this->EE->backup_proish_lib->backup_files_dir
		);
			
		$this->EE->cp->set_variable('cp_page_title', $this->EE->lang->line('backup_proish_module_name'));
		
		$vars['backups'] = $this->EE->backup_proish_lib->get_backups();		
		
		$this->EE->javascript->output($this->EE->backup_proish_js->get_check_toggle());
		$this->EE->cp->add_js_script('ui', 'accordion'); 
		$this->EE->javascript->output($this->EE->backup_proish_js->get_accordian_css()); 

		$this->EE->jquery->tablesorter('#database_backups table', '{headers: {3: {sorter: false}}, widgets: ["zebra"], sortList: [[0,1]]}');  
		$this->EE->jquery->tablesorter('#file_backups table', '{headers: {3: {sorter: false}}, widgets: ["zebra"], sortList: [[0,1]]}');  
		
		$this->EE->javascript->compile();
		
		return $this->EE->load->view('index', $vars, TRUE); 
	}	
	
	public function backup_db()
	{
		$path = $this->EE->backup_proish_lib->make_db_filename();
		if($this->EE->backup_proish_sql_backup->backup($path, $this->db_conf))
		{	
			$this->EE->session->set_flashdata('message_success', $this->EE->lang->line('db_backup_created'));
			$this->EE->functions->redirect($this->url_base.'index');	
			exit;
		}
		else
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('db_backup_failure'));
			$this->EE->functions->redirect($this->url_base.'index');	
			exit;				
		}		
	}
	
	public function backup_files()
	{
		//some systems have a low(ish) memory limit so we have to remove that.
		ini_set('memory_limit', -1);
		set_time_limit(3600); //limit the time to 1 hours
		if($this->EE->backup_proish_lib->backup_files())
		{
			$this->EE->session->set_flashdata('message_success', $this->EE->lang->line('file_backup_created'));
			$this->EE->functions->redirect($this->url_base.'index');
			exit;
		}
		else
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('file_backup_failure'));
			$this->EE->functions->redirect($this->url_base.'index');	
			exit;			
		}		
	}
	
	public function download_backup()
	{
		$file_name = base64_decode($this->EE->input->get_post('id', TRUE));
		$type = $this->EE->input->get_post('type');
		if($type == 'files')
		{
			$file = $this->backup_location.'/files/'.$file_name;
		}
		else
		{
			$file = $this->backup_location.'/database/'.$file_name;	
		}
		
		if(file_exists($file))
		{
			$new_name = $this->EE->backup_proish_lib->make_pretty_filename($file_name, $type);
			$this->EE->backup_proish_lib->file_download($file, $new_name);
			exit;
		}
		else
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('db_backup_not_found'));
			$this->EE->functions->redirect($this->url_base.'index');	
			exit;			
		}
	}
	
	public function delete_backup_confirm()
	{
		$backups = $this->EE->input->get_post('toggle', TRUE);
		if(!$backups || count($backups) == 0)
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('backups_not_found'));
			$this->EE->functions->redirect($this->url_base.'index');	
			exit;			
		}
		
		$ids = array();
		$i = 0;
		foreach($backups AS $backup)
		{
			$file = base64_decode($backup);
			$ids[$i]['path'] = $file;
			$ids[$i]['type'] = (substr($file, 0, 5) == 'files' ? 'files' : 'database');
			$parts = explode('/', $file);
			$ids[$i]['details'] = $this->EE->backup_proish_lib->parse_filename($parts['1'], $ids[$i]['type']);
			$i++;
		}

		$this->EE->cp->set_variable('cp_page_title', $this->EE->lang->line('delete_backup_confirm'));
		$this->EE->cp->set_variable('download_delete_question', $this->EE->lang->line('delete_backup_confirm'));
		
		$vars = array();
		$vars['form_action'] = $this->query_base.'delete_backups';
		$vars['damned'] = $ids;
		return $this->EE->load->view('delete_confirm', $vars, TRUE);
	}
	
	public function delete_backups()
	{
		$backups = $this->EE->input->get_post('delete', TRUE);
		if($this->EE->backup_proish_lib->delete_backups($backups))
		{
			$this->EE->session->set_flashdata('message_success', $this->EE->lang->line('backups_deleted'));
			$this->EE->functions->redirect($this->url_base.'index');	
			exit;			
		}
		
		$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('backup_delete_failure'));
		$this->EE->functions->redirect($this->url_base.'index');
		exit;	
				
	}
	
	public function restore_db_confirm()
	{
		$backup = base64_decode($this->EE->input->get_post('id', TRUE));
		$file = $this->backup_location.'/database/'.$backup;
		if(!file_exists($file))
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('db_backup_not_found'));
			$this->EE->functions->redirect($this->url_base.'index');	
			exit;	
		}		
		
		$vars = array();
		$vars['backup_details'] = $this->EE->backup_proish_lib->parse_filename($backup, 'database');
		$vars['backup'] = base64_encode($backup);
		$vars['form_action'] = $this->query_base.'restore_db';
		$this->EE->cp->set_variable('cp_page_title', $this->EE->lang->line('restore_db'));
		return $this->EE->load->view('restore_confirm', $vars, TRUE);
	}

	public function restore_db()
	{
		$path = $this->backup_location.'/database/'.base64_decode($this->EE->input->get_post('restore_db', TRUE));
		if(!file_exists($path))
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('db_backup_not_found'));
			$this->EE->functions->redirect($this->url_base.'index');	
			exit;				
		}
		
		$tmp = $this->backup_location.'/database/tmp';
		if(!file_exists($tmp))
		{
			mkdir($tmp);
		}
				
		$path = $this->EE->backup_proish_lib->unzip_db_backup($path, $tmp);	
		if($this->EE->backup_proish_sql_backup->restore($path, $this->db_conf))
		{
			$this->EE->backup_proish_lib->delete_dir($tmp);
			$this->EE->session->set_flashdata('message_success', $this->EE->lang->line('database_restored'));
			$this->EE->functions->redirect($this->url_base.'index');	
			exit;	
		}
	}
	
	public function settings()
	{
		if(isset($_POST['go_settings']))
		{
			if(!isset($_POST['cron_attach_backups']))
			{
				$_POST['cron_attach_backups'] = '0';	
			}
			
			if(!isset($_POST['ftp_passive']))
			{
				$_POST['ftp_passive'] = '0';
			}
			
			if($this->EE->backup_proish_settings->update_settings($_POST))
			{			
				$this->EE->session->set_flashdata('message_success', $this->EE->lang->line('settings_updated'));
				$this->EE->functions->redirect($this->url_base.'settings');		
				exit;			
			}
			else
			{
				$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('settings_update_fail'));
				$this->EE->functions->redirect($this->url_base.'settings');	
				exit;					
			}
		}
		
		$this->EE->cp->set_variable('cp_page_title', $this->EE->lang->line('settings'));
		
		$this->EE->cp->add_js_script('ui', 'accordion'); 
		$this->EE->javascript->output($this->EE->backup_proish_js->get_accordian_css()); 		
		$this->EE->javascript->compile();	

		$vars = array();
		$vars['errors'] = $this->errors;
		$vars['paths'] = array(
							  'db' => $this->EE->backup_proish_lib->backup_db_dir, 
							  'files' => $this->EE->backup_proish_lib->backup_files_dir
		);
		
		//if the settings are in the config we want to disable the settings form (but still display for convenience.
		$vars['settings_disable'] = FALSE;
		if(isset($this->EE->config->config['backup_proish']))
		{
			$vars['settings_disable'] = 'disabled="disabled"';
		}
		$vars['settings'] = $this->settings;
		$vars['total_space_used'] = $this->EE->backup_proish_lib->filesize_format($this->total_space_used);
		$vars['member_groups'] = $this->EE->backup_proish_settings->get_member_groups();
		$vars['cron_commands'] = $this->EE->backup_proish_lib->get_cron_commands($this->class);

		return $this->EE->load->view('settings', $vars, TRUE);
	}
}