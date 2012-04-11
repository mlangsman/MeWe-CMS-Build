<?php $this->load->view('errors'); ?>
<?php 
echo lang('module_instructions'); ?>
<div class="clear_left shun"></div>

<?php echo form_open($query_base.'delete_backup_confirm', array('id'=>'my_accordion')); ?>

<h3  class="accordion"><?=lang('database_backups')?></h3>
<div id="database_backups">
	<?php 
if(count($backups['database']) > 0): 
	$this->table->set_template($cp_pad_table_template);
	$this->table->set_heading(
		lang('date_taken'),
		lang('file_size'),
		lang('action'),
		form_checkbox('select_all', 'true', FALSE, 'class="toggle_all_db" id="select_all"').NBS.lang('delete', 'select_all')
	);
	
	foreach($backups['database'] as $backup)
	{
		$toggle = array(
				  'name'		=> 'toggle[]',
				  'id'		=> 'edit_box_'.$backup['file_name'],
				  'value'		=> base64_encode('database/'.$backup['file_name']),
				  'class'		=>'toggle_db'
				  );
	
		$this->table->add_row(
								'<!-- '.$backup['file_date'].'-->'. date('F j, Y, g:i a', $backup['file_date']),
								'<!-- '.$backup['file_size_raw'].'-->'.$backup['file_size'],
								'<a href="'.$url_base.'download_backup'.AMP.'id='.base64_encode($backup['file_name']).'">'.lang('download').'</a> / '.
								'<a href="'.$url_base.'restore_db_confirm'.AMP.'id='.base64_encode($backup['file_name']).'">'.lang('restore').'</a>',
								form_checkbox($toggle)
								);
	}
	
	echo $this->table->generate();
	?>
	<?php else: ?>
	<p><?php echo lang('no_backups')?></p>
	<?php endif; ?>
</div>

<h3  class="accordion"><?php echo lang('file_backups')?></h3>
<div id="file_backups">
	<?php if(count($backups['files']) > 0): ?>
	<?php 
	$this->table->clear();
	$this->table->set_template($cp_pad_table_template);
	$this->table->set_heading(
		lang('date_taken'),
		lang('file_size'),
		lang('action'),
		form_checkbox('select_all', 'true', FALSE, 'class="toggle_all_files" id="select_all"').NBS.lang('delete', 'select_all')
	);
	
	foreach($backups['files'] as $file)
	{
		$toggle = array(
				  'name'		=> 'toggle[]',
				  'id'		=> 'edit_box_'.$file['file_name'],
				  'value'		=> base64_encode('files/'.$file['file_name']),
				  'class'		=>'toggle_files'
				  );
	
		$this->table->add_row(
								date('F j, Y, g:i a', $file['file_date']),
								$file['file_size'],
								'<a href="'.$url_base.'download_backup'.AMP.'id='.base64_encode($file['file_name']).AMP.'type=files">'.lang('download').'</a>',
								form_checkbox($toggle)
								);
	}
	
	echo $this->table->generate();	
	?>
	<?php else: ?>
	<?php echo lang('no_backups')?>
	<?php endif; ?>	
</div>
<br />
<div class="tableFooter">
	<div class="tableSubmit">
		<?php echo form_submit(array('name' => 'submit', 'value' => lang('delete_selected'), 'class' => 'submit'));?>
	</div>
</div>	
<?php echo form_close()?>