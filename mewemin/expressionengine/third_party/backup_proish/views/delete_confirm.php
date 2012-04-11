<?php echo form_open($form_action)?>
<?php foreach($damned as $id):?>
	<?php echo form_hidden('delete[]', base64_encode($id['path']))?>
<?php endforeach;?>

<p class="notice"><?php echo lang('action_can_not_be_undone')?></p>

<h3><?php echo lang($download_delete_question); ?></h3>
<p>
<?php foreach($damned AS $item): ?>
	<?php echo '<strong>'.lang('type').':</strong> '.lang($item['type']).'  <strong>Taken on:</strong> '.date('F j, Y, g:i a', $item['details']['file_date']).' <strong>Size</strong>:'.$item['details']['file_size'];?><br />
<?php endforeach; ?>
</p>

<p>
	<?php echo form_submit(array('name' => 'submit', 'value' => lang('delete'), 'class' => 'submit'))?>
</p>

<?php echo form_close()?>