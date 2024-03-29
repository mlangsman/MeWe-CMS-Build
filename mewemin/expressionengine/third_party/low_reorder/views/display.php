
<?php if ( ! empty($field['notes'])): ?>
	<div id="reorder-instructions"><?=$field['notes']?></div>
<?php endif; ?>

<form method="post" action="<?=$base_url?>&amp;method=save_order">
	<div>
		<input type="hidden" name="XID" value="<?=XID_SECURE_HASH?>" />
		<input type="hidden" name="channel_id" value="<?=$channel['id']?>" />
		<input type="hidden" name="field_id" value="<?=$field['id']?>" />
	</div>

	<?php if ($select_category): ?>
		<div id="reorder-category-select">
			<input type="hidden" name="url" value="<?=$url?>" />
			<select name="category">
				<option value="0"><?=lang('select_category')?></option>
				<?php foreach ($category_groups AS $key => $group): ?>
					<optgroup label="<?=htmlspecialchars($group['group_name'])?>">
					<?php foreach ($group['categories'] AS $v): ?>
						<?php $indent = ($v['5'] != 1) ? repeater(NBS.NBS, $v['5']) : ''; ?>
						<option value="<?=$v['0']?>"<?php if($v['0']==$selected_category):?> selected="selected"<?php endif; ?>><?=$indent.$v['1']?></option>
					<?php endforeach; ?>
					</optgroup>
				<?php endforeach; ?>
			</select>
		</div>
	<?php endif; ?>

	<div id="reorder-entries">
		<?php if (empty($entries)): ?>
			<p class="alert"><?=lang('no_entries_found')?></p>
		<?php else: ?>
			<ul id="low-reorder">
				<?php for($i = 0, $total = count($entries); $i < $total; $i++): $row = $entries[$i]; ?>
					<li id="entry-<?=$row['entry_id']?>" class="odd">
						<input type="hidden" name="entries[]" value="<?=$row['entry_id']?>" />
						<span class="order"<?php if (isset($statuses[$row['status']])): ?> style="color:#<?=$statuses[$row['status']]?>"<?php endif; ?>><?=($i + 1)?></span>
						<!-- <span class="order"><?=($total - $i)?></span> -->
						<span class="title"><?=htmlspecialchars($row['title'])?></span>
					</li>
				<?php endfor; ?>
			</ul>
			<p>
				<input type="submit" class="submit" value="<?=lang('save')?>" />
				<label>
					<input type="checkbox" name="clear_caching" value="y"
					<?php if (isset($settings['clear_cache']) && $settings['clear_cache'] == 'y'): ?> checked="checked"<?php endif; ?> />
					<?=lang('clear_caching')?>
				</label>
			</p>	
		<?php endif; ?>
	</div>

</form>