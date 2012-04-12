<?php if (empty($items)): ?>

	<p><?=lang('no_reorder_fields')?></p>

<?php else: ?>

	<table cellpadding="0" cellspacing="0" style="width:100%" class="mainTable">
		<colgroup>
			<col style="width:25%" />
			<col style="width:25%" />
			<col style="width:25%" />
			<col style="width:25%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><?=lang('channel')?></th>
				<th scope="col"><?=lang('field')?></th>
				<th scope="col"><?=lang('settings')?></th>
				<th scope="col"><?=lang('reorder')?></th>
			</tr>
		</thead>
		<tbody>
			<?php $i = 0; foreach ($items AS $row) : ?>
				<tr class="<?=((++$i % 2)?'odd':'even')?>">
					<td><strong><?=htmlspecialchars($row['channel_name'])?></strong></td>
					<td><?=htmlspecialchars($row['field_name'])?></td>
					<td>
						<?php if ($row['permission'] == '2') : ?>
							<a href="<?=$base_url?>&amp;method=settings&amp;channel_id=<?=$row['channel_id']?>&amp;field_id=<?=$row['field_id']?>"><?=lang('edit_settings')?></a>
						<?php else : ?>
							--
						<?php endif; ?>
					</td>
					<td>
						<a href="<?=$base_url?>&amp;method=display&amp;channel_id=<?=$row['channel_id']?>&amp;field_id=<?=$row['field_id']?>"><?=lang('reorder_entries')?></a>
					</td>
				</tr>
			<?php endforeach; ?>
		</tbody>
	</table>

<?php endif; ?>