<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

// Get config file
require(PATH_THIRD.'low_reorder/config.php');

/**
* Low Reorder UPD class
*
* @package         low-reorder-ee2_addon
* @author          Lodewijk Schutte ~ Low <low@loweblog.com>
* @link            http://gotolow.com/addons/low-reorder
* @copyright       Copyright (c) 2010, Low
*/
class Low_reorder_upd {

	// --------------------------------------------------------------------
	// PROPERTIES
	// --------------------------------------------------------------------

	/**
	* Version number
	*
	* @access      public
	* @var         string
	*/
	public $version = LOW_REORDER_VERSION;

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
	* Constructor
	*
	* @access      public
	* @return      void
	*/
	public function __construct()
	{
		// Get global instance
		$this->EE =& get_instance();
	}

	// --------------------------------------------------------------------

	/**
	* Uninstall the module
	*
	* @access      public
	* @return      bool
	*/
	public function install()
	{
		// Load forge
		$this->EE->load->dbforge();

		// Insert row into modules table
		$this->EE->db->insert('modules', array(
			'module_name'		=> LOW_REORDER_CLASS_NAME,
			'module_version'	=> LOW_REORDER_VERSION,
			'has_cp_backend'	=> 'y'
		));

		// Create new table for settings
		$this->EE->dbforge->add_field(array(
			'channel_id'	=> array('type'	=> 'int', 'constraint'	=> '6', 'unsigned' => TRUE, 'null' => FALSE),
			'field_id'		=> array('type'	=> 'int', 'constraint'	=> '6', 'unsigned' => TRUE, 'null' => FALSE),
			'settings'		=> array('type' => 'text', 'null' => FALSE)
		));

		// Set primary key
		$this->EE->dbforge->add_key(array('channel_id', 'field_id'), TRUE);

		// Engage!
		$this->EE->dbforge->create_table('low_reorder_settings');

		return TRUE;
	}

	// --------------------------------------------------------------------

	/**
	* Uninstall the module
	*
	* @access      public
	* @return      bool
	*/
	public function uninstall()
	{
		// Load forge
		$this->EE->load->dbforge();

		// get module id
		$this->EE->db->select('module_id');
		$this->EE->db->from('modules');
		$this->EE->db->where('module_name', LOW_REORDER_CLASS_NAME);
		$query = $this->EE->db->get();

		// remove references from module_member_groups
		$this->EE->db->where('module_id', $query->row('module_id'));
		$this->EE->db->delete('module_member_groups');

		// remove references from modules
		$this->EE->db->where('module_name', LOW_REORDER_CLASS_NAME);
		$this->EE->db->delete('modules');

		// Drop table
		$this->EE->dbforge->drop_table('low_reorder_settings');

		return TRUE;
	}

	// --------------------------------------------------------------------

	/**
	* Update the module
	*
	* @access      public
	* @param       string    Current version of the module
	* @return      bool
	*/
	public function update($current = '')
	{
		// --------------------------------------
		// Same version? A-okay, daddy-o!
		// --------------------------------------

		if ($current == '' OR version_compare($current, LOW_REORDER_VERSION) === 0)
		{
			return FALSE;
		}

		// --------------------------------------
		// Update to 1.0.5
		// --------------------------------------

		if (version_compare($current, '1.0.5', '<'))
		{
			// Adds sorting order as setting
			$this->EE->db->query("ALTER TABLE `exp_low_reorder_settings` ADD `sort_order` ENUM('asc','desc') NOT NULL DEFAULT 'asc'");
		}

		// --------------------------------------
		// Update to 1.2.0
		// --------------------------------------

		if (version_compare($current, '1.2.0', '<'))
		{
			// Old attributes
			$oldies = array('statuses', 'categories', 'show_expired', 'show_future', 'sort_order');

			// New attribute to store settings
			$this->EE->db->query("ALTER TABLE `exp_low_reorder_settings` ADD `settings` TEXT NOT NULL");

			// Get all current settings and store in new settings attribute
			$query = $this->EE->db->get('exp_low_reorder_settings');

			foreach ($query->result_array() AS $row)
			{
				// Store oldies in their own array
				foreach ($oldies AS $attr)
				{
					$data[$attr] = $row[$attr];
				}

				// Save encoded array in new attribute
				$this->EE->db->where('channel_id', $row['channel_id']);
				$this->EE->db->where('field_id',   $row['field_id']);
				$this->EE->db->update('low_reorder_settings', array('settings' => base64_encode(serialize($data))));
			}

			// Get rid of old attributes
			foreach ($oldies AS $attr)
			{
				$this->EE->db->query("ALTER TABLE `exp_low_reorder_settings` DROP `{$attr}`");
			}
		}

		// --------------------------------------
		// All done updating
		// --------------------------------------

		return TRUE;

	}

	// --------------------------------------------------------------------

}

/* End of file upd.low_reorder.php */