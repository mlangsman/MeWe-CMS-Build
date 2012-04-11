<?php $this->load->view('errors'); ?>
<?php 

$tmpl = array (
	'table_open'          => '<table class="mainTable" border="0" cellspacing="0" cellpadding="0">',

	'row_start'           => '<tr class="even">',
	'row_end'             => '</tr>',
	'cell_start'          => '<td style="width:50%;">',
	'cell_end'            => '</td>',

	'row_alt_start'       => '<tr class="odd">',
	'row_alt_end'         => '</tr>',
	'cell_alt_start'      => '<td>',
	'cell_alt_end'        => '</td>',

	'table_close'         => '</table>'
);

$this->table->set_template($tmpl); 
$this->table->set_empty("&nbsp;");
?>
<div class="clear_left shun"></div>

<?php echo form_open($query_base.'settings', array('id'=>'my_accordion'))?>
<input type="hidden" value="yes" name="go_settings" />
<h3  class="accordion"><?=lang('configure_backups')?></h3>
<div>
	<?php 
	$settings['exclude_paths'] = (is_array($settings['exclude_paths']) ? implode("\n", $settings['exclude_paths']) : $settings['exclude_paths']);
	$this->table->set_heading('&nbsp;',' ');	
	$this->table->add_row('<label for="backup_file_location">'.lang('backup_file_location').'</label><div class="subtext">'.lang('backup_file_location_instructions').'</div>', form_input('backup_file_location', $settings['backup_file_location'], 'id="backup_file_location" ' . $settings_disable));
	$this->table->add_row('<label for="backup_store_location">'.lang('backup_store_location').'</label><div class="subtext">'.lang('backup_store_location_instructions').'</div>', form_input('backup_store_location', $settings['backup_store_location'], 'id="backup_store_location" ' . $settings_disable));	
	$this->table->add_row('<label for="auto_threshold">'.lang('auto_threshold').' <!--('.$total_space_used.')--></label><div class="subtext">'.lang('auto_threshold_instructions').'</div>', form_input('auto_threshold', $settings['auto_threshold'], 'id="auto_threshold" '. $settings_disable));
	
	
	$this->table->add_row('<label for="exclude_paths">'.lang('exclude_paths').'</label><div class="subtext">'.lang('exclude_paths_instructions').'</div>', form_textarea('exclude_paths', $settings['exclude_paths'], 'cols="90" rows="6" '. $settings_disable));
	echo $this->table->generate();
	$this->table->clear();	
	?>
</div>

<h3  class="accordion"><?=lang('configure_cron')?></h3>
<div>
	<?php 
	$settings['cron_notify_emails'] = (is_array($settings['cron_notify_emails']) ? implode("\n", $settings['cron_notify_emails']) : $settings['cron_notify_emails']);
	$this->table->set_heading('&nbsp;',' ');
	$this->table->add_row('<label for="cron_notify_emails">'.lang('cron_notify_emails').'</label><div class="subtext">'.lang('cron_notify_emails_instructions').'</div>', form_textarea('cron_notify_emails', $settings['cron_notify_emails'], 'id="cron_notify_emails" ' . $settings_disable));
	$this->table->add_row('<label for="cron_attach_backups">'.lang('cron_attach_backups').'</label><div class="subtext">'.lang('cron_attach_backups_instructions').'</div>', form_checkbox('cron_attach_backups', '1', $settings['cron_attach_backups'], 'id="cron_attach_backups" '. $settings_disable));
	
	echo $this->table->generate();
	$this->table->clear();	
	
	echo '<strong>'.lang('cron_command_instructions').'</strong>';
	if(count($cron_commands) >= 1)
	{
		$this->table->set_heading('Backup Type','Cron Commands');
		foreach($cron_commands AS $key => $value)
		{
			$this->table->add_row(lang($key), $value);
		}
		echo $this->table->generate();
		$this->table->clear();	
	}	
	//
	?>
</div>
<br />
<div class="tableFooter">
	<div class="tableSubmit">
		<?php echo form_submit(array('name' => 'submit', 'value' => lang('submit'), 'class' => 'submit'));?>
	</div>
</div>	
<?php echo form_close()?>