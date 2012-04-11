<?php echo form_open($form_action)?>
<?php echo form_hidden('restore_db', base64_encode($backup_details['file_name']))?>

<p class="notice"><?=lang('action_can_not_be_undone')?></p>

<h3><?php echo lang('restore_db_question'); ?></h3>
<p>
	<?php echo '<strong>Taken on:</strong> '.date('F j, Y, g:i a', $backup_details['file_date']).' <strong>Size</strong>:'.$backup_details['file_size'];?><br />
</p>

<p>
	<?php echo form_submit(array('name' => 'submit', 'value' => lang('restore'), 'class' => 'submit'))?>
</p>

<?php echo form_close()?>