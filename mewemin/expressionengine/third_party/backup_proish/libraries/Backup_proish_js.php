<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Backup_proish_js
{
	
	public function __construct()
	{
		$this->EE =& get_instance();
	}
	
	public function get_accordian_css()
	{
		return ' $("#my_accordion").accordion({autoHeight: false,header: "h3"}); ';
	}
	
	public function get_check_toggle()
	{
		return array(
						'$(".toggle_all_db").toggle(
							function(){
								$("input.toggle_db").each(function() {
									this.checked = true;
								});
							}, function (){
								var checked_status = this.checked;
								$("input.toggle_db").each(function() {
									this.checked = false;
								});
							}
						);',
		
						'$(".toggle_all_files").toggle(
							function(){
								$("input.toggle_files").each(function() {
									this.checked = true;
								});
							}, function (){
								var checked_status = this.checked;
								$("input.toggle_files").each(function() {
									this.checked = false;
								});
							}
						);'		
					);		
	}

}