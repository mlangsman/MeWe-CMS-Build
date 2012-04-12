<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

// Get config file
require(PATH_THIRD.'low_reorder/config.php');

/**
* Low Reorder MCP class
*
* @package         low-reorder-ee2_addon
* @author          Lodewijk Schutte ~ Low <low@loweblog.com>
* @link            http://gotolow.com/addons/low-reorder
* @copyright       Copyright (c) 2010, Low
*/
class Low_reorder_mcp {

	// --------------------------------------------------------------------
	// PROPERTIES
	// --------------------------------------------------------------------

	/**
	* Helper array for views
	*
	* @access      private
	* @var         array
	*/
	private $data = array();

	/**
	* EE object
	*
	* @access      private
	* @var         object
	*/
	private $EE;

	// --------------------------------------------------------------------
	// PUBLIC METHODS
	// --------------------------------------------------------------------

	/**
	* PHP4 Constructor
	*
	* @see         __construct()
	*/
	public function Low_reorder_mcp()
	{
		$this->__construct();
	}

	// --------------------------------------------------------------------

	/**
	* Constructor
	*
	* @access      public
	* @return      void
	*/
	public function __construct()
	{
		// Get global instance
		$this->EE =& get_instance();

		// Load others
		$this->EE->load->helper('low_reorder');

		// module url homepage
		$this->base_url = $this->data['base_url'] = BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module='.LOW_REORDER_CLASS_NAME;
	}

	// --------------------------------------------------------------------

	/**
	* Home screen for module
	*
	* @access      public
	* @return      string
	*/
	public function index()
	{
		// --------------------------------------
		// Load necessary items
		// --------------------------------------

		$this->EE->load->library('javascript');

		// --------------------------------------
		// Show message if present
		// --------------------------------------

		if ($msg = $this->EE->session->flashdata('reorder_msg'))
		{
			$this->_ee_notice($msg);
		}

		// --------------------------------------
		// Set page title
		// --------------------------------------

		$this->EE->cp->set_variable('cp_page_title', $this->EE->lang->line('low_reorder_module_name'));

		// --------------------------------------
		// Initiate fields and channels array
		// --------------------------------------

		$current = $fields = $items = array();

		// --------------------------------------
		// Get current records from DB
		// --------------------------------------

		$query = $this->EE->db->get('low_reorder_settings');

		foreach ($query->result() AS $row)
		{
			$current[$row->channel_id . '-' . $row->field_id] = decode_reorder_settings($row->settings);
		}

		// --------------------------------------
		// Get all low_reorder custom fields for this site
		// --------------------------------------

		$query = $this->EE->db->select('field_id, field_label, group_id')
		       ->from('channel_fields')
		       ->where('site_id', $this->EE->config->item('site_id'))
		       ->where('field_type', 'low_reorder')
		       ->order_by('field_label', 'asc')
		       ->get();

		// Store custom fields and their field groups
		foreach ($query->result_array() AS $row)
		{
			$fields[$row['group_id']][] = $row;
		}

		// --------------------------------------
		// Get all channels user is assigned to
		// and contain low_reorder fields
		// --------------------------------------

		if (count($groups = array_keys($fields)) && ($allowed = $this->EE->functions->fetch_assigned_channels()))
		{
			// Get channels
			$query = $this->EE->db->select('channel_id, channel_title, field_group')
			       ->from('channels')
			       ->where_in('channel_id', $allowed)
			       ->where_in('field_group', $groups)
			       ->order_by('channel_title', 'asc')
			       ->get();

			// Loop through channels and check permissions
			foreach ($query->result() AS $row)
			{
				// Loop through assigned fields
				foreach ($fields[$row->field_group] AS $field)
				{
					// Determine unique key so we can look up the record in $current
					$key = $row->channel_id . '-' . $field['field_id'];

					// Set default permission to all access
					$permission = 2;

					// Check permission if not Super Admin
					if ($this->EE->session->userdata['group_id'] != 1)
					{
						if (isset($current[$key]['permissions'][$this->EE->session->userdata['group_id']]))
						{
							$permission = $current[$key]['permissions'][$this->EE->session->userdata['group_id']];
						}
					}

					// Log row if permission is not 0
					if ($permission)
					{
						$items[$key] = array(
							'channel_id'   => $row->channel_id,
							'field_id'     => $field['field_id'],
							'channel_name' => $row->channel_title,
							'field_name'   => $field['field_label'],
							'permission'   => $permission
						);
					}
				}
			}
		}
		else
		{
			$items = array();
		}

		// --------------------------------------
		// Store items in $this->data for the view
		// --------------------------------------

		$this->data['items'] = $items;

		// Clean up
		unset($fields, $items);

		// --------------------------------------
		// Add CSS and JS
		// --------------------------------------

		$this->EE->cp->load_package_css('low_reorder');
		$this->EE->javascript->compile();

		// Load view
		return $this->EE->load->view('index', $this->data, TRUE);
	}

	// --------------------------------------------------------------------

	/**
	* Display settings form
	*
	* @access      public
	* @return      string
	*/
	function settings()
	{
		// --------------------------------------
		// Load necessary items
		// --------------------------------------

		$this->EE->load->library('api');
		$this->EE->api->instantiate('channel_categories');

		// Get channel and field id
		$channel_id = $this->EE->input->get('channel_id');
		$field_id = $this->EE->input->get('field_id');

		// no channel or field id -> invalid request
		if ( ! $channel_id || ! $field_id )
		{
			return $this->_show_error('invalid_request');
		}

		// --------------------------------------
		//	Get Channel details
		// --------------------------------------

		$query = $this->EE->db->select('channel_id AS id, channel_name AS short_name, channel_title AS name, cat_group AS category_groups, status_group, field_group')
		       ->from('channels')
		       ->where_in('channel_id', $this->EE->functions->fetch_assigned_channels())
		       ->where('channel_id', $channel_id)
		       ->get();

		if ($query->num_rows())
		{
			$this->data['channel'] = $query->row_array();
		}
		else
		{
			return $this->_show_error('channel_not_found');
		}

		// --------------------------------------
		//	Get Field details
		// --------------------------------------

		$query = $this->EE->db->select('field_id AS id, field_name AS short_name, field_label AS name')
		       ->from('channel_fields')
		       ->where('field_id', $field_id)
		       ->where('group_id', $this->data['channel']['field_group'])
		       ->where('field_type', 'low_reorder')
		       ->get();

		if ($query->num_rows())
		{
			$this->data['field'] = $query->row_array();
		}
		else
		{
			return $this->_show_error('field_not_found');
		}

		// --------------------------------------
		//	Get Low Reorder Settings
		// --------------------------------------

		$settings = $this->_get_settings($channel_id, $field_id);

		// --------------------------------------
		//	Fetch channel statuses
		// --------------------------------------

		$query = $this->EE->db->select('status_id, status, highlight')
		       ->from('statuses')
		       ->where('group_id', $this->data['channel']['status_group'])
		       ->order_by('status_order', 'asc')
		       ->get();

		$this->data['all_statuses'] = $query->result_array();

		// --------------------------------------
		//	Fetch channel category groups
		// --------------------------------------

		$this->data['category_groups'] = empty($this->data['channel']['category_groups']) ? FALSE : explode('|', $this->data['channel']['category_groups']);

		if ($this->data['category_groups'])
		{
			// get group details from DB
			$query = $this->EE->db->select('group_id, group_name, sort_order')
			       ->from('category_groups')
			       ->where_in('group_id', $this->data['category_groups'])
			       ->order_by('group_name', 'asc')
			       ->get();

			$this->data['category_groups'] = $query->result_array();

			// Loop through groups and get the category group from API
			foreach ($this->data['category_groups'] AS $key => $row)
			{
				$this->EE->api_channel_categories->categories = array();
				$this->EE->api_channel_categories->category_tree($row['group_id'], '', $row['sort_order']);

				$row['categories'] = $this->EE->api_channel_categories->categories;
				$this->data['category_groups'][$key] = $row;
			}
		}

		// --------------------------------------
		//	Fetch member groups
		// --------------------------------------

		$query = $this->EE->db->select('group_id, group_title')
		       ->from('member_groups')
		       ->where_not_in('group_id', array('1','2','3','4'))
		       ->where('can_access_cp', 'y')
		       ->order_by('group_title', 'asc')
		       ->get();

		$this->data['member_groups'] = low_flatten_results($query->result_array(), 'group_title', 'group_id');

		// --------------------------------------
		//	Create array to help with tag generation
		// --------------------------------------

		$this->data['json'] = array(
			'channel' => $this->data['channel']['short_name'],
			'field' => $this->data['field']['short_name'],
			'statuses' => low_flatten_results($this->data['all_statuses'], 'status', 'status_id')
		);

		// --------------------------------------
		//	Add settings to data array
		// --------------------------------------

		$this->data['settings'] = $settings;

		// Set page title
		$this->EE->cp->set_variable('cp_page_title', $this->EE->lang->line('edit_settings').': '.$this->data['channel']['name'].', '.$this->data['field']['name']);

		// Set breadcrumb
		$this->EE->cp->set_breadcrumb($this->base_url, $this->EE->lang->line('low_reorder_module_name'));

		// Set right nav
		$this->EE->cp->set_right_nav(array(
			'reorder_entries' => $this->base_url.AMP.'method=display'.AMP.'channel_id='.$channel_id.AMP.'field_id='.$field_id
		));

		$this->EE->cp->load_package_css('low_reorder'.AMP.time());
		$this->EE->cp->load_package_js('low_reorder');

		// Return settings form
		return $this->EE->load->view('settings', $this->data, TRUE);
	}

	// --------------------------------------------------------------------

	/**
	* Save the New Settings; redirects to the module home page
	*
	* @access      public
	* @return      string
	*/
	function save_settings()
	{
		// --------------------------------------
		// Get channel and field ids
		// --------------------------------------

		$channel_id = $this->EE->input->post('channel_id');
		$field_id   = $this->EE->input->post('field_id');

		// no channel or field id -> invalid request
		if ( ! $channel_id || ! $field_id )
		{
			return $this->_show_error('invalid_request');
		}

		// --------------------------------------
		// Init settings array
		// --------------------------------------

		$settings = array();

		// --------------------------------------
		// Do what with categories?
		// --------------------------------------

		if ( in_array($this->EE->input->post('category_options'), array('all', 'one')) )
		{
			$settings['categories'] = $this->EE->input->post('category_options');
		}
		else
		{
			$settings['categories'] = $this->EE->input->post('categories') ? implode('|', $this->EE->input->post('categories')) : '';
		}

		// Check input
		$settings['statuses']     = $this->EE->input->post('statuses')     ? implode('|', $this->EE->input->post('statuses')) : '';
		$settings['show_expired'] = $this->EE->input->post('show_expired') ? 'y' : 'n';
		$settings['show_future']  = $this->EE->input->post('show_future')  ? 'y' : 'n';
		$settings['sort_order']   = $this->EE->input->post('sort_order');
		$settings['clear_cache']  = $this->EE->input->post('clear_cache')  ? 'y' : 'n';
		$settings['permissions']  = $this->EE->input->post('permissions');

		// Data to put into the DB
		$data = array(
			'channel_id' => $channel_id,
			'field_id' => $field_id,
			'settings' => encode_reorder_settings($settings)
		);

		// I want to use REPLACE INTO, to replace existing settings and insert if not exists
		// That means no active record!
		$sql = "REPLACE INTO exp_low_reorder_settings (".implode(',', array_keys($data)).") VALUES ('".implode("','", $this->EE->db->escape_str(array_values($data)))."')";
		$this->EE->db->query($sql);

		$this->EE->session->set_flashdata('reorder_msg', $this->EE->lang->line('settings_saved'));
		$this->EE->functions->redirect($this->base_url);
		exit;
	}

	// --------------------------------------------------------------------

	/**
	* List entries for single channel/field combo
	*
	* @return	string
	*/
	function display()
	{
		// Load some libs/helpers/language files
		$this->EE->load->library('javascript');
		$this->EE->load->library('table');
		$this->EE->load->helper('low_reorder');
		$this->EE->cp->load_package_js('low_reorder');
		$this->EE->cp->load_package_css('low_reorder');

		// Show feedback msg?
		if ($msg = $this->EE->session->flashdata('reorder_msg'))
		{
			$this->_ee_notice($msg);
		}

		// Get channel and field id
		$channel_id = $this->EE->input->get('channel_id');
		$field_id   = $this->EE->input->get('field_id');

		// no channel or field id -> invalid request
		if ( ! $channel_id || ! $field_id )
		{
			return $this->_show_error('invalid_request');
		}

		// --------------------------------------
		//	Fetch channel/field details; return error message if not TRUE
		// --------------------------------------

		if ( ($res = $this->_get_channel_and_field($channel_id, $field_id)) !== TRUE )
		{
			return $res;
		}

		// Initiate page title
		$page_title = $this->data['channel']['name'].', '.$this->data['field']['name'];

		// --------------------------------------
		//	Get settings
		// --------------------------------------

		$settings = $this->_get_settings($channel_id, $field_id);

		// --------------------------------------
		//	Create category selection if necessary
		// --------------------------------------

		$this->data['select_category'] = FALSE;
		$this->data['selected_category'] = 0;

		// Do we have to select a category first?
		if ($settings['category_options'] == 'one')
		{
			// Yes, we need to show the select element
			$this->data['select_category'] = TRUE;

			// Is there a category selected? Override settings accordingly
			if ( ! ($cat_id = $this->EE->input->get('category')) )
			{
				$settings['categories'] = array('-1');
			}
			else
			{
				$settings['categories'] = array($cat_id);
				$this->data['selected_category'] = $cat_id;
			}

			// Load categories API
			$this->EE->load->library('api');
			$this->EE->api->instantiate('channel_categories');

			// Get category group ids from channel
			$query = $this->EE->db->select('cat_group')
			       ->from('channels')
			       ->where('channel_id', $channel_id)
			       ->get();

			if ($query->num_rows())
			{
				$cat_groups = $query->row_array();
				$cat_groups = explode('|', $cat_groups['cat_group']);
			}

			// get group details from DB
			$query = $this->EE->db->select('group_id, group_name, sort_order')
			       ->from('category_groups')
			       ->where_in('group_id', $cat_groups)
			       ->order_by('group_name', 'asc')
			       ->get();

			$this->data['category_groups'] = $query->result_array();

			// Loop through groups and get the category group from API
			foreach ($this->data['category_groups'] AS $key => $row)
			{
				$this->EE->api_channel_categories->categories = array();
				$this->EE->api_channel_categories->category_tree($row['group_id'], '', $row['sort_order']);

				$row['categories'] = $this->EE->api_channel_categories->categories;
				$this->data['category_groups'][$key] = $row;
			}

			$this->data['url'] = $this->base_url.AMP.'method=display'.AMP.'channel_id='.$settings['channel_id'].AMP.'field_id='.$settings['field_id'].AMP.'category=';

		}

		// --------------------------------------
		//	Get statuses
		// --------------------------------------

		$this->data['statuses'] = array();

		if ($settings['statuses'])
		{
			$query = $this->EE->db->select('status, highlight')
			       ->from('statuses')
			       ->where_in('status_id', $settings['statuses'])
			       ->get();

			foreach ($query->result() AS $row)
			{
				$sql_status[] = $row->status;
				$this->data['statuses'][$row->status] = $row->highlight;
			}

			$this->data['statuses'] = array_filter($this->data['statuses']);
		}
		else
		{
			$sql_status = FALSE;
		}

		// --------------------------------------
		//	Get channel entries
		// --------------------------------------

		$this->EE->db->select('DISTINCT(t.entry_id), t.title, t.status')
		             ->from('exp_channel_titles t')
		             ->join('exp_channels c', 't.channel_id = c.channel_id')
		             ->join('exp_channel_data d', 't.entry_id = d.entry_id')
		             ->where('c.site_id', $this->EE->config->item('site_id'))
		             ->where('c.channel_id', $channel_id);

		// Limit by status
		if ($sql_status)
		{
			$this->EE->db->where_in('t.status', $sql_status);
		}

		// Limit by category
		if ($settings['categories'] !== FALSE)
		{
			$this->EE->db->join('exp_category_posts cp', 't.entry_id = cp.entry_id', 'left');

			$sql_where = "cp.cat_id IN ('".implode("','", $this->EE->db->escape_str($settings['categories']))."')";

			// account for uncategorized entries
			if (in_array('0', $settings['categories']))
			{
				$sql_where = "( ({$sql_where}) OR (cp.cat_id IS NULL) )";
			}

			$this->EE->db->where($sql_where);
		}

		// Hide expired entries
		if ($settings['show_expired'] == 'n')
		{
			$this->EE->db->where("(t.expiration_date = 0 OR t.expiration_date >= {$this->EE->localize->now})");
		}

		// Hide expired entries
		if ($settings['show_future'] == 'n')
		{
			$this->EE->db->where('t.entry_date <=', $this->EE->localize->now);
		}

		// Order by custom order, fallback to entry date
		$this->EE->db->order_by('d.field_id_'.$field_id, $settings['sort_order']);
		$this->EE->db->order_by('t.entry_date', 'desc');
		$query = $this->EE->db->get();

		// --------------------------------------
		//	Add entries to data array for view
		// --------------------------------------

		$this->data['entries'] = $query->result_array();

		// Add settings to data as well
		$this->data['settings'] = $settings;

		// --------------------------------------
		//	Set page title, breadcrumb and right nav, compile JS and load view
		// --------------------------------------

		// Set page title
		$this->EE->cp->set_variable('cp_page_title', $page_title);

		// Set breadcrumb
		$this->EE->cp->set_breadcrumb($this->base_url, $this->EE->lang->line('low_reorder_module_name'));

		// Check whether to show the settings button
		$group_id = $this->EE->session->userdata['group_id'];
		if ( ! isset($settings['permissions'][$group_id]) || $group_id == '1' || (isset($settings['permissions'][$group_id]) && $settings['permissions'][$group_id] == '2'))
		{
			// Set right nav
			$this->EE->cp->set_right_nav(array(
				'edit_settings'	=> $this->base_url.AMP.'method=settings'.AMP.'channel_id='.$channel_id.AMP.'field_id='.$field_id
			));
		}

		$this->EE->javascript->compile();

		return $this->EE->load->view('display', $this->data, TRUE);	

	}

	// --------------------------------------------------------------------

	/**
	* Save the New Order (dundundun)
	*
	* @return	void
	*/
	public function save_order()
	{
		// --------------------------------------
		// Get posted vars
		// --------------------------------------

		$entries    = $this->EE->input->post('entries');
		$channel_id = $this->EE->input->post('channel_id');
		$field_id   = $this->EE->input->post('field_id');
		$category   = $this->EE->input->post('category');
		$field      = 'field_id_'.$field_id;

		// --------------------------------------
		// And get settings for channel/field combo
		// --------------------------------------

		$settings = $this->_get_settings($channel_id, $field_id);

		// --------------------------------------
		// Loop through entries, set new order
		// --------------------------------------

		for ($i = 0, $total = count($entries); $i < $total; $i++)
		{
			$entry_id = $entries[$i];

			// Ascend or descend depending on settings
			$new_order = (string) ($settings['sort_order'] == 'asc') ? ($i + 1) : ($total - $i);

			// Add leading zeroes
			$new_order = str_pad($new_order, 4, '0', STR_PAD_LEFT);

			// Update entry
			$this->EE->db->where('entry_id', $entry_id);
			$this->EE->db->update('channel_data', array($field => $new_order));
		}

		// --------------------------------------
		// That's the entries updated
		// Now, do we need to clear the cache?
		// --------------------------------------

		if ($this->EE->input->post('clear_caching') == 'y')
		{
			$this->EE->functions->clear_caching('all', '', TRUE);
		}

		// --------------------------------------
		// Get ready to redirect back
		// --------------------------------------

		$url = $this->base_url.AMP.'method=display&amp;channel_id='.$channel_id.'&amp;field_id='.$field_id;

		// Redirect to selected category, if any
		if ($category)
		{
			$url .= AMP.'category='.$category;
		}

		// --------------------------------------
		// Set flashdata for feedback
		// --------------------------------------

		$this->EE->session->set_flashdata('reorder_msg', $this->EE->lang->line('new_order_saved'));

		// And go back
		$this->EE->functions->redirect($url);
		exit;
	}

	// --------------------------------------------------------------------
	// PRIVATE METHODS
	// --------------------------------------------------------------------

	/**
	* Show error message in module
	*
	* @access      private
	* @param       string
	* @return      string
	*/
	private function _show_error($msg)
	{
		// Set page title
		$this->EE->cp->set_variable('cp_page_title', $this->EE->lang->line('error'));

		// Set breadcrumb
		$this->EE->cp->set_breadcrumb(BASE.AMP.$this->mod_url, $this->EE->lang->line('low_reorder_module_name'));

		$this->data['error_msg'] = $msg;

		return $this->EE->load->view('error', $this->data, TRUE);
	}

	// --------------------------------------------------------------------

	/**
	* Get channel and field details and store them in $this->data
	*
	* @access      private
	* @param       int
	* @param       int
	* @return      mixed     TRUE if successful, string if unsuccessful
	*/
	private function _get_channel_and_field($channel_id, $field_id)
	{
		// --------------------------------------
		//	Get Channel details
		// --------------------------------------

		$query = $this->EE->db->select('channel_id AS id, channel_title AS name, cat_group AS category_groups, status_group, field_group')
		       ->from('channels')
		       ->where('channel_id', $channel_id)
		       ->get();

		if ($query->num_rows())
		{
			$this->data['channel'] = $query->row_array();	
		}
		else
		{
			return $this->_show_error('channel_not_found');
		}

		// --------------------------------------
		//	Get Field details
		// --------------------------------------

		$query = $this->EE->db->select('field_id AS id, field_label AS name, field_instructions AS notes')
		       ->from('channel_fields')
		       ->where('field_id', $field_id)
		       ->where('group_id', $this->data['channel']['field_group'])
		       ->where('field_type', 'low_reorder')
		       ->get();

		if ($query->num_rows())
		{
			$this->data['field'] = $query->row_array();
		}
		else
		{
			return $this->_show_error('field_not_found');
		}

		return TRUE;
	}

	// --------------------------------------------------------------------

	/**
	* Get settings for channel/field combination
	*
	* @access      private
	* @param       int
	* @param       int
	* @return      array
	*/
	private function _get_settings($channel_id, $field_id)
	{
		$query = $this->EE->db->select('settings')
		       ->from('low_reorder_settings')
		       ->where('channel_id', $channel_id)
		       ->where('field_id', $field_id)
		       ->get();

		$settings = $query->num_rows() ? $query->row('settings') : '';
		$settings = decode_reorder_settings($settings);
		$settings['channel_id'] = $channel_id;
		$settings['field_id'] = $field_id;

		return $settings;
	}

	// --------------------------------------------------------------------

	/**
	* Show EE notification and hide it after a few seconds
	*
	* @access      private
	* @param       string
	* @return      void
	*/
	private function _ee_notice($msg)
	{
		$this->EE->javascript->output(array(
			'$.ee_notice("'.$msg.'",{type:"success",open:true});',
			'window.setTimeout(function(){$.ee_notice.destroy()}, 2000);'
		));
	}

	// --------------------------------------------------------------------

}
// End mcp.low_reorder.php