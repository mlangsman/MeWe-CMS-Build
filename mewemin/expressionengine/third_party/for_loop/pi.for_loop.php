<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * ExpressionEngine Loop Plugin
 *
 * @package		Loop Plugin
 * @subpackage		Plugins
 * @category		Plugins
 * @author		Ben Croker
 * @link			http://www.putyourlightson.net/projects/loop/
 */

$plugin_info = array(
				'pi_name'			=> 'Loop Plugin',
				'pi_version'		=> '1.2',
				'pi_author'		=> 'Ben Croker',
				'pi_author_url'	=> 'http://www.putyourlightson.net/',
				'pi_description'	=> 'Provides loop functionality in templates',
				'pi_usage'		=> For_loop::usage()
			);


class For_loop {

	var $return_data;

	
	/**
	  *  Constructor
	  */
	function For_loop()
	{
		// make a local reference to the ExpressionEngine super object
		$this->EE =& get_instance();
		
		// get parameters and assign defaults if not set
		$start = ($this->EE->TMPL->fetch_param('start') !== false) ? $this->EE->TMPL->fetch_param('start') : 1;
		$end = ($this->EE->TMPL->fetch_param('end') !== false) ? $this->EE->TMPL->fetch_param('end') : 3;
		$increment = ($this->EE->TMPL->fetch_param('increment') !== false) ? $this->EE->TMPL->fetch_param('increment') : 1;
		
		// are we incrementing or decrementing
		$ascending = true;
		
		if ($increment < 0)
		{
			$ascending = false;
		}
		
		$count = 1;
		
		// so the loop doesn't time-out
		$max_count = 100000;
	
		$return_data = "";
		
		$i = $start;
		
		for ($i = $start; (($ascending && $i <= $end) || (!$ascending && $i >= $end)) && $count < $max_count; $i = $i + $increment)
		{		
			$tagdata = $this->EE->TMPL->tagdata;
		
			foreach ($this->EE->TMPL->var_single as $key)
			{
				if ($key == "index") 
				{
					$tagdata = $this->EE->TMPL->swap_var_single($key, $i, $tagdata);
				}
				
				else if ($key == "loop_count") 
				{
					$tagdata = $this->EE->TMPL->swap_var_single($key, $count, $tagdata);
				}
			}
			
			$count++;
			
			$return_data .= $tagdata;
		}
		
		$this->return_data = $return_data;
	}
	/* END */
	
	
// ----------------------------------------
//  Plugin Usage
// ----------------------------------------

// This function describes how the plugin is used.
//  Make sure and use output buffering

function usage()
{
ob_start(); 
?>
Use as follows:

{exp:for_loop start="5" end="10" increment="1"}

This loop has been executed {loop_count} times and is now on iteration number {index}.

{/exp:for_loop}

<?php
$buffer = ob_get_contents();
	
ob_end_clean(); 

return $buffer;
}
/* END */


}
// END CLASS

/* End of file pi.for_loop.php */
/* Location: ./system/expressionengine/third_party/for_loop/pi.for_loop.php */
?>