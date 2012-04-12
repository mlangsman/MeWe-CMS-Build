<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
* Low Reorder Module Class
*
* Class to be used in templates
*
* @package         low-reorder-ee2_addon
* @author          Lodewijk Schutte ~ Low <low@loweblog.com>
* @link            http://gotolow.com/addons/low-reorder
* @copyright       Copyright (c) 2010, Low
* @since           1.0.2
*/

class Low_reorder {

	// --------------------------------------------------------------------
	// PROPERTIES
	// --------------------------------------------------------------------

	/**
	* Return data
	*
	* @access      public
	* @var         string
	*/
	public $return_data = '';

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
	public function Low_reorder()
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
		// Get global object
		$this->EE =& get_instance();
	}

	// --------------------------------------------------------------------

	/**
	* Get next entry in custom order
	*
	* @access      public
	* @return      string
	*/
	public function next_entry()
	{
		return $this->_prev_next('next');
	}

	// --------------------------------------------------------------------

	/**
	* Get previous entry in custom order
	*
	* @access      public
	* @return      string
	*/
	public function prev_entry()
	{
		return $this->_prev_next('prev');
	}

	// --------------------------------------------------------------------

	/**
	* Get next or previous entry in custom order
	*
	* @access      private
	* @param       string
	* @return      string
	*/
	private function _prev_next($which)
	{
		// --------------------------------------
		// Load helper
		// --------------------------------------

		$this->EE->load->helper('low_reorder');

		// --------------------------------------
		// Get parameters
		// --------------------------------------

		foreach (array('field', 'entry_id', 'url_title', 'prefix', 'no_results', 'loop', 'category') AS $param)
		{
			$$param = $this->EE->TMPL->fetch_param($param);
		}

		// --------------------------------------
		// Get site id
		// --------------------------------------

		$site_id = $this->EE->config->item('site_id');

		// --------------------------------------
		// Check field parameter
		// --------------------------------------

		if ( ! $field || ! isset($this->EE->session->cache['channel']['custom_channel_fields'][$site_id][$field]))
		{
			$this->EE->TMPL->log_item('Low Reorder: field not found, returning empty string');
			return '';
		}

		// --------------------------------------
		// We need a $entry_id or $url_title to go on
		// --------------------------------------

		if ( ! $entry_id && ! $url_title)
		{
			$this->EE->TMPL->log_item('Low Reorder: no entry_id or url_title given, returning empty string');
			return '';
		}

		// --------------------------------------
		// Retrieve field id from cache
		// --------------------------------------

		$field_id = $this->EE->session->cache['channel']['custom_channel_fields'][$site_id][$field];

		// --------------------------------------
		// Retrieve current entry's channel and order
		// --------------------------------------

		if (isset($this->EE->session->cache['low']['reorder']['entries'][$entry_id]))
		{
			// Getting this entry's data from cache
			$entry = $this->EE->session->cache['low']['reorder']['entries'][$entry_id];
		}
		else
		{
			// Getting this entry's data from DB
			$this->EE->db->select("d.entry_id, d.channel_id, d.field_id_{$field_id} AS current_order");
			$this->EE->db->from('exp_channel_data d');

			if ($entry_id === FALSE)
			{
				// If $entry_id is false, $url_title must be given, as checked above
				// Only if there's no entry_id, we'll join the exp_channel_titles table,
				// otherwise it's not necessary
				$this->EE->db->join('exp_channel_titles t', 'd.entry_id = t.entry_id');
				$this->EE->db->where('t.url_title', $url_title);
			}
			else
			{
				// There is an entry id, so just query that
				$this->EE->db->where('d.entry_id', $entry_id);
			}

			// Site id and limit by one, which is good practice
			$this->EE->db->where('d.site_id', $site_id);
			$this->EE->db->limit(1);
			$query = $this->EE->db->get();

			if ($query->num_rows())
			{
				// If we have results, store it in session cache
				$entry = $query->row_array();
				$this->EE->session->cache['low']['reorder']['entries'][$entry['entry_id']] = $entry;
			}
			else
			{
				// No results for given entry? Nothing to do...
				$this->EE->TMPL->log_item('Low Reorder: Could not retrieve details for given entry, returning empty string');
				return '';
			}
		}

		// --------------------------------------
		// Compose marker for cache
		// --------------------------------------

		$marker = $field_id.'-'.$entry_id['channel_id'];

		// --------------------------------------
		// Get settings for channel/field combo
		// --------------------------------------

		if (isset($this->EE->session->cache['low']['reorder']['settings'][$marker]))
		{
			$settings = $this->EE->session->cache['low']['reorder']['settings'][$marker];
		}
		else
		{
			// Get settings from DB
			$query = $this->EE->db->get_where('low_reorder_settings', array(
				'channel_id' => $entry['channel_id'],
				'field_id' => $field_id
			));

			// Get the settings
			$settings = decode_reorder_settings($query->row('settings'));

			// Get actual statuses
			if ($settings['statuses'])
			{
				$query = $this->EE->db->select('status')
				       ->from('statuses')
				       ->where_in('status_id', $settings['statuses'])
				       ->get();

				// Reset statuses in settings
				$settings['statuses'] = array();

				foreach ($query->result_array() AS $row)
				{
					$settings['statuses'][] = $row['status'];
				}
			}

			// Save settings in cache
			$this->EE->session->cache['low']['reorder']['settings'][$marker] = $settings;
		}

		// --------------------------------------
		// Compose marker for list cache
		// --------------------------------------

		if ($category) $marker .= '-'.$category;

		// --------------------------------------
		// Get list of sorted entries from cache or DB
		// --------------------------------------

		if (isset($this->EE->session->cache['low']['reorder']['list'][$marker]))
		{
			$list = $this->EE->session->cache['low']['reorder']['list'][$marker];
		}
		else
		{
			// --------------------------------------
			//	Get channel entries
			// --------------------------------------

			$this->EE->db->select("DISTINCT(t.entry_id), t.title, t.url_title, d.field_id_{$field_id} AS sort_order")
			             ->from('exp_channel_titles t')
			             ->join('exp_channels c', 't.channel_id = c.channel_id')
			             ->join('exp_channel_data d', 't.entry_id = d.entry_id')
			             ->where('c.site_id', $this->EE->config->item('site_id'))
			             ->where('c.channel_id', $entry['channel_id']);

			// Limit by status
			if ($settings['statuses'])
			{
				$this->EE->db->where_in('t.status', $settings['statuses']);
			}

			// Limit by category
			if ($settings['categories'] || $category)
			{
				$this->EE->db->join('exp_category_posts cp', 't.entry_id = cp.entry_id', 'left');

				if ($category)
				{
					$this->EE->db->where('cp.cat_id', $category);
				}
				else
				{
					$sql_where = "cp.cat_id IN ('".implode("','", $this->EE->db->escape_str($settings['categories']))."')";

					// account for uncategorized entries
					if (in_array('0', $settings['categories']))
					{
						$sql_where = "( ({$sql_where}) OR (cp.cat_id IS NULL) )";
					}

					$this->EE->db->where($sql_where);
				}
			}		

			// Hide expired entries
			if ( $settings['show_expired'] == 'n' )
			{
				$this->EE->db->where("(t.expiration_date = 0 OR t.expiration_date >= {$this->EE->localize->now})");
			}

			// Hide expired entries
			if ( $settings['show_future'] == 'n' )
			{
				$this->EE->db->where('t.entry_date <=', $this->EE->localize->now);
			}

			$this->EE->db->order_by('sort_order', $settings['sort_order']);
			$this->EE->db->order_by('t.entry_date', 'desc');
			$query = $this->EE->db->get();

			$list = array();

			// set array keys to sort order
			foreach ($query->result_array() AS $row)
			{
				$list[(int) $row['sort_order']] = $row;
			}

			$this->EE->session->cache['low']['reorder']['list'][$marker] = $list;
		}

		// --------------------------------------
		// Current order index
		// --------------------------------------

		$current = (int) $entry['current_order'];

		// --------------------------------------
		// Get previous and next indeces
		// --------------------------------------

		$orders = array_keys($list);
		$current_index = 0;
		$max = count($orders) - 1;

		foreach ($orders AS $i => $order)
		{
			if ($order == $current)
			{
				$current_index = $i;
			}
		}

		$prev = ($current_index > 0)    ? $current_index - 1 : FALSE;
	    $next = ($current_index < $max) ? $current_index + 1 : FALSE;

		// // Account for looping
		if ($loop == 'yes' && $prev === FALSE)
		{
			$prev = $max;
		}

		if ($loop == 'yes' && $next === FALSE)
		{
			$next = 0;
		}

		// --------------------------------------
		// Parse variables or show no_results
		// --------------------------------------

		if ($$which !== FALSE && array_key_exists($orders[$$which], $list))
		{
			$row = $list[$orders[$$which]];

			// Add prefix to variables if so desired
			if ($prefix)
			{
				// Copy row
				$tmp = $row;

				foreach ($tmp AS $key => $val)
				{
					// Add prefix
					$row[$prefix.$key] = $val;

					// remove original
					unset($row[$key]);
				}

				// clean up
				unset($tmp);
			}

			// Parse template
			$this->return_data = $this->EE->TMPL->parse_variables($this->EE->TMPL->tagdata, array($row));
		}
		else
		{
			// No results if no record found
			$this->return_data = ($no_results === FALSE) ? $this->EE->TMPL->no_results() :  $no_results;
		}

		// --------------------------------------
		// Please return it
		// --------------------------------------

		return $this->return_data;
	}

	// --------------------------------------------------------------------

}
// END Low_reorder class