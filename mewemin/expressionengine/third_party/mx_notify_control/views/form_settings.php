<div class="mor">

<?php if($message) : ?>
<div class="mor alert success">
<p><?php print($message); ?></p>
</div>
<?php endif; ?>

<?php if($settings_form) : ?>

<?= form_open(
'C=addons_extensions&M=extension_settings&file=&file=mx_notify_control',
'',
array("file" => "mx_notify_control")
)
?>
<div class="tg">
		<h2><?= lang('extension_settings_config')?></h2>
		<div class="alert info"><?= lang('extension_settings_info')?></div>
		
<table class="mainTable padTable" id="event_table" border="0" cellpadding="0" cellspacing="0">

<?php
		
		$out_result = "";
		$row_ids = 1;
		if (isset($settings['row_order'])) {
			foreach ($settings['row_order'] as $row_order => $row_id)
			{
			$out_result  .= table_notify($input_prefix, $row_ids,$row_id, $template_list,  $settings, $member_groups, $channel_data, $statuses,$custom_fields);
			$row_ids	+=	1;
			}

		}
		
		echo $out_result;
?>

</table>
</div>

<div style="width:100%;" class="actions"><span style="float:right;padding-right:20px;" ><input name="edit_field_group_name" value="<?= lang('add_new_rule'); ?>" id="add_event"  class="submit" type="button"></span></div>
<p class="centerSubmit"><input name="edit_field_group_name" value="<?= lang('save_extension_settings'); ?>" class="submit" type="submit"></p>

<?php

			$out_result = '<script type="text/javascript">'
			.'template = "'. str_replace('"','\"',str_replace(array("\r", "\r\n", "\n\r", "\n"), "", table_notify($input_prefix, "{row}","{row}", $template_list, null, $member_groups, $channel_data, $statuses,$custom_fields))).'";
			 index_row = '.$row_ids.';
			 default_title = "'.lang('message').'";
			
			 jQuery(function() {
		
				jQuery("#add_event").click(function () {		
					jQuery("#event_table").append(template.replace(/{row}/g, index_row));
				
						jQuery("#pm_settings_"+index_row).fadeOut();
						jQuery("#email_settings_"+index_row).fadeIn();
						jQuery("#template_alt_"+index_row).fadeOut();
					
					index_row +=1;

				});
				 	 
				 
				 if  (index_row == 1){
					jQuery("#event_table").append(template.replace(/{row}/g, index_row));
					index_row +=1;
				 }

			
				jQuery(".mail_format").live("change", function() 
				{
					mail_format = jQuery(this).val(); 
					row = jQuery(this). attr("rel");
					
					if (mail_format == "html")
					{
						jQuery("#template_alt_"+row).fadeIn();
					}
					else
					{
						jQuery("#template_alt_"+row).fadeOut();
					}
					
				});
				 
				 jQuery(".method_type").live("change", function() 
				{ 		 
					method_type = jQuery(this).val(); 
					row = jQuery(this). attr("rel");
					if (method_type == "pm")
					{

						if (jQuery("#trigger_"+row).val() != "5" && jQuery("#trigger_"+row).val() != "6")
						{
							jQuery("#email_settings_"+row).fadeOut();
							jQuery("#pm_settings_"+row).fadeIn();
							jQuery("#template_alt_"+row).fadeOut();
						}
						else
						{
							alert("'.lang('type_alert').'")
							jQuery(this).val("email");
						}				
					}
					else {
						jQuery("#pm_settings_"+row).fadeOut();
						jQuery("#email_settings_"+row).fadeIn();
						
						mail_format = jQuery("#mail_format_"+row).val(); 		
						
						if (mail_format == "html")
						{
							jQuery("#template_alt_"+row).fadeIn();
						}
						else
						{
							jQuery("#template_alt_"+row).fadeOut();
						}						
						
					}
					
					
				});
				
				jQuery(".trigger_title").live("click", function() 
				{ 
					row = jQuery(this). attr("rel");
					jQuery("#trigger_title_"+row).fadeOut("fast");
					jQuery("#trigger_name_"+row).fadeIn().focus();
				
				});
				
				jQuery(".name_input").live("focusout", function() 
				{ 
					row = jQuery(this).attr("rel");
					name =  (jQuery(this).val()).replace(/^\s*([\S\s]*?)\s*$/, "$1");
					jQuery(this).val(name);
					
					jQuery("#trigger_name_"+row).fadeOut();
					
					if (!isEmpty(name) ) {
						jQuery("#trigger_title_"+row).html(name);
					}
					else {
						name = default_title + row;
						jQuery(this).val(name);
						jQuery("#trigger_title_"+row).html(name);
					}

					jQuery("#trigger_title_"+row).fadeIn("fast");
				});
				
				
				 jQuery(".select").live("change", function() 
				{ 		 
					trigger = jQuery(this).val(); 
					row = jQuery(this). attr("rel");
					
					if (trigger == "5" || trigger == "6")
					{
						jQuery("#method_type_" + row).val("email");
						jQuery("#pm_settings_"+row).fadeOut();
						jQuery("#email_settings_"+row).fadeIn();
						jQuery("#channel_"+row).fadeIn();
					}
					
					
					
					
				});

			
			})
			
			function delete_line (row_id){
				jQuery(".event_" +row_id).remove();
		
			}

			function isEmpty( inputStr ) { if ( null == inputStr || "" == inputStr ) { return true; } return false; }
			
			</script>';
			echo $out_result;
?>





<?= form_close(); ?>

<?php endif; ?>



<?php 

function table_notify($input_prefix, $row_ids,$row_id, $template_list, $settings, $member_groups,$channel_data, $statuses, $custom_fields) {

$out = '
<tbody class="event_'.$row_ids.'">
<tr class="header">
<th><span class="trigger_title" rel="'.$row_id.'"  id="trigger_title_'.$row_ids.'">'.((isset($settings['trigger_name_'.$row_id])) ? ((trim($settings['trigger_name_'.$row_id]) != "") ? $settings['trigger_name_'.$row_id] : lang('message').$row_ids) : lang('message').$row_ids).' </span><input name="'.$input_prefix.'[row_order][]"  value="'.$row_ids.'" type="hidden"/><input dir="ltr" style="width: 100%;display:none;" name="'.$input_prefix.'[trigger_name_'.$row_ids.']" id="trigger_name_'.$row_ids.'" value ="'.((isset($settings['trigger_name_'.$row_id])) ? $settings['trigger_name_'.$row_id]: '').'" size="20" maxlength="120"  class="name_input" type="text" rel="'.$row_id.'"><span></th>
<th><div style="width: 100%;"><span style="float: right;" OnClick="delete_line('.$row_ids.');">
<input  value="'.lang('delete_rule').'" class="submit" type="button"></span></div></th>
</tr>
<tr class="even">
<td style="width: 45%;">

<div class="defaultBold">'.lang('trigger').'</div>

</td>
<td>

<select name="'.$input_prefix.'[trigger_'.$row_ids.']" id="trigger_'.$row_ids.'" class="select" 0="" rel="'.$row_ids.'">
	<option value="1"  '.((isset($settings['trigger_'.$row_id])) ? (($settings['trigger_'.$row_id] == '1') ? " selected='selected'" : "" ) : "").'>CP register</option>
	<option value="8" '.((isset($settings['trigger_'.$row_id])) ? (($settings['trigger_'.$row_id] == '8') ? " selected='selected'" : "" ) : "").'>CP Validation</option>	
	<option value="2"  '.((isset($settings['trigger_'.$row_id])) ? (($settings['trigger_'.$row_id] == '2') ? " selected='selected'" : "" ) : "").'>Member Validation</option>
	<option value="3"  '.((isset($settings['trigger_'.$row_id])) ? (($settings['trigger_'.$row_id] == '3') ? " selected='selected'" : "" ) : "").'>User Register (Solspace)</option>
	<option value="4"  '.((isset($settings['trigger_'.$row_id])) ? (($settings['trigger_'.$row_id] == '4') ? " selected='selected'" : "" ) : "").'>Member Register</option>
	<option value="5"  '.((isset($settings['trigger_'.$row_id])) ? (($settings['trigger_'.$row_id] == '5') ? " selected='selected'" : "" ) : "").'>Entry Added</option>
	<option value="6"  '.((isset($settings['trigger_'.$row_id])) ? (($settings['trigger_'.$row_id] == '6') ? " selected='selected'" : "" ) : "").'>Entry Update</option>
	<option value="7"  '.((isset($settings['trigger_'.$row_id])) ? (($settings['trigger_'.$row_id] == '7') ? " selected='selected'" : "" ) : "").'>Zoo Visitor Registration</option>
</select>



</td>
</tr>
<tr class="odd">
<td class="tableCellTwo" style="width: 45%;">

<div class="defaultBold">'.lang('type').'</div>

</td>
<td class="tableCellTwo">
<select name="'.$input_prefix.'[type_'.$row_ids.']" class="method_type"  id="method_type_'.$row_ids.'" rel="'.$row_ids.'">
	<option value="email"  '.((isset($settings['type_'.$row_id])) ? (($settings['type_'.$row_id] == 'email') ? " selected='selected'" : "" ) : "").'>Email</option>
	<option value="pm"  '.((isset($settings['type_'.$row_id])) ? (($settings['type_'.$row_id] == 'pm') ? " selected='selected'" : "" ) : "").'>PM</option>
</select>
</td></tr>

<tr id="channel_'.$row_ids.'" '.((isset($settings['trigger_'.$row_id])) ? (($settings['trigger_'.$row_id] == '6' OR $settings['trigger_'.$row_id] == '5') ? "" : "style='display:none;'" ) : "").'>
	<td class="tableCellOne" style="width: 45%;" >

	<div class="defaultBold">'.lang('channel').'</div>

	<div class="default">'.lang('channel_i').'</div>

	</td>
	<td class="tableCellOne">
	<table class="padTable" id="channels_table_'.$row_ids.'" border="0" cellpadding="0" cellspacing="0">
	<tr class="header">
	<th>'.lang('channel').'</th>
	<th>'.lang('statuses').'</th>
	</tr>
	
	


	';
	


	foreach ($channel_data as $channel)
	{
		$details = array('name' =>$input_prefix.'[channel_'.$row_ids.']['.$channel->channel_id.']', 'value' => $channel->channel_id, 'checked' => ((isset($settings['channel_'.$row_id][$channel->channel_id])) ? true : false));
		$out  .=  '<tr><td>'.form_checkbox($details).' &nbsp;'.$channel->channel_title.'</td>';
		$out  .=  '<td><ul style="list-style: none"> 	';
	
		if (isset($statuses[$channel->status_group])) {
			foreach ($statuses[$channel->status_group] as $status)
			{
				$details = array('name' =>$input_prefix.'[channel_'.$row_ids.']['.$channel->channel_id.'_'.$status['status'].']', 'value' => $status['status'], 'checked' => ((isset($settings['channel_'.$row_id][$channel->channel_id.'_'.$status['status']])) ? true : false));
				$out  .=  '<li><label>'.form_checkbox($details).' &nbsp;'.$status['status'].'</label></li>';
			}
		}
		else
		{
			$out  .=  '<li><label>'.form_checkbox(array('name' =>$input_prefix.'[channel_'.$row_ids.']['.$channel->channel_id.'_open]', 'value' => $channel->channel_id, 'checked' => ((isset($settings['channel_'.$row_id][$channel->channel_id.'_'.'open'])) ? true : false))).' &nbsp;open</label></li>';
			$out  .=  '<li><label>'.form_checkbox(array('name' =>$input_prefix.'[channel_'.$row_ids.']['.$channel->channel_id.'_close]', 'value' => $channel->channel_id, 'checked' => ((isset($settings['channel_'.$row_id][$channel->channel_id.'_'.'close'])) ? true : false))).' &nbsp;close</label></li>';

		}

		$out  .=  '</ul></td></tr>';
	};
	
$out .= '</table></td>
</tr>

</tbody>

<tbody id="email_settings_'.$row_ids.'"  class="event_'.$row_ids.'" '.((isset($settings['type_'.$row_id])) ? (($settings['type_'.$row_id] == 'email') ? "" : "style='display:none;'" ) : "").'>
<tr  class="even">
	<td class="tableCellOne" style="width: 45%;" >

	<div class="defaultBold">'.lang('from_name').'</div>

	<div class="default">'.lang('from_name_i').'</div>

	</td>
	<td class="tableCellOne">
	<input dir="ltr" style="width: 100%;" name="'.$input_prefix.'[from_'.$row_ids.']" id="from_'.$row_ids.'" value ="'.((isset($settings['from_'.$row_id])) ? $settings['from_'.$row_id]: '').'" size="20" maxlength="120" class="input" type="text">
	</td>
</tr>
<tr class="odd">
<td class="tableCellTwo" style="width: 45%;">

<div class="defaultBold">'.lang('from_email').'</div>

<div class="default">'.lang('from_email_i').'</div>

</td>
<td class="tableCellTwo">
<input dir="ltr" style="width: 100%;" name="'.$input_prefix.'[email_'.$row_ids.']" id="email_'.$row_ids.'" value ="'.((isset($settings['email_'.$row_id])) ? $settings['email_'.$row_id]: '').'" size="20" maxlength="120" class="input" type="text">

</td>
</tr>


<tr class="even">
<td class="tableCellTwo" style="width: 45%;">

<div class="defaultBold">'.lang('to_email').'</div>

<div class="default">'.lang('to_email_i').'</div>

</td>
<td class="tableCellTwo">
<input dir="ltr" style="width: 100%;" name="'.$input_prefix.'[toemail_'.$row_ids.']" id="toemail_'.$row_ids.'" value ="'.((isset($settings['toemail_'.$row_id])) ? $settings['toemail_'.$row_id]: '').'" size="20" maxlength="120" class="input" type="text">

</td>
</tr>

<tr class="even">
<td class="tableCellTwo" style="width: 45%;">

<div class="defaultBold">'.lang('to_custom_list').'</div>

<div class="default"></div>

</td>
<td class="tableCellTwo">
<input dir="ltr" style="width: 100%;" name="'.$input_prefix.'[tocustomlist_'.$row_ids.']" id="tocustomlist_'.$row_ids.'" value ="'.((isset($settings['tocustomlist_'.$row_id])) ? $settings['tocustomlist_'.$row_id]: '').'" size="20" maxlength="120" class="input" type="text">

</td>


<tr class="odd">
<td class="tableCellTwo" style="width: 45%;">

<div class="defaultBold">'.lang('to_delegate_list').'</div>

<div class="default"></div>

</td>
<td class="tableCellTwo">
'.form_dropdown($input_prefix.'[custom_fields_'.$row_ids.']', $custom_fields, ((isset($settings['custom_fields_'.$row_ids.''])) ? $settings['custom_fields_'.$row_ids.''] : '' ), 'id="custom_fields_'.$row_ids.'"').NBS.NBS.'
</td>gro
</tr>
</tr>

<tr class="even">
<td class="tableCellTwo" style="width: 45%;">

<div class="defaultBold">'.lang('to_member_groups').'</div>

<div class="default">'.lang('to_member_groups_i').'</div>

</td>
<td class="tableCellTwo">
<ul style="list-style: none">
';

	foreach ($member_groups as $group ) {
		$details = array('name' => $input_prefix.'[mbr_groups_'.$row_ids.']['.$group->group_id.']', 'value' => $group->group_id, 'checked' => ((isset($settings['mbr_groups_'.$row_id][$group->group_id])) ? true : false));
		$out  .=  '<li><label>'.form_checkbox($details).' &nbsp;'.$group->group_title.'</label></li>';
	};

$out .= '
</ul>
</td>
</tr>


<tr class="odd">
<td class="tableCellTwo" style="width: 45%;">

<div class="defaultBold">'.lang('mail_format').'</div>

</td>
<td class="tableCellTwo">
	<select name="'.$input_prefix.'[mail_format_'.$row_ids.']" class="mail_format" id="mail_format_'.$row_id.'" rel="'.$row_id.'">
		<option value="text"  '.((isset($settings['mail_format_'.$row_id])) ? (($settings['mail_format_'.$row_id] == 'text') ? " selected='selected'" : "" ) : "").'>Plain Text</option>
		<option value="html"  '.((isset($settings['mail_format_'.$row_id])) ? (($settings['mail_format_'.$row_id] == 'html') ? " selected='selected'" : "" ) : "").'>HTML</option>
	</select>
</td></tr>

</tbody>

<tbody id="pm_settings_'.$row_ids.'"  class="event_'.$row_ids.'" '.((isset($settings['type_'.$row_id])) ? (($settings['type_'.$row_id] == 'pm') ? "" : "style='display:none;'" ) : "").'>
<tr class="even">
<td class="tableCellOne" style="width: 45%;">

<div class="defaultBold">'.lang('sender_id').'</div>

<div class="default">'.lang('sender_id_i').'</div>

</td>
<td class="tableCellOne">
<input dir="ltr" style="width: 100%;" name="'.$input_prefix.'[sender_'.$row_ids.']" id="sender_'.$row_ids.'" value ="'.((isset($settings['sender_'.$row_id])) ? $settings['sender_'.$row_id]: '').'" size="20" maxlength="120" class="input" type="text">
</td>
</tr>

</tbody>

<tbody  class="event_'.$row_ids.'">
<tr class="odd">

<td class="tableCellTwo" style="width: 45%;">

<div class="defaultBold">'.lang('title').'</div>

</td>
<td class="tableCellTwo">
<input dir="ltr" style="width: 100%;" name="'.$input_prefix.'[title_'.$row_ids.']" id="title_'.$row_ids.'" value ="'.((isset($settings['title_'.$row_id])) ? $settings['title_'.$row_id]: '').'" size="20" maxlength="120" class="input" type="text">
</td>
</tr>
<tr class="even">
<td class="tableCellOne" style="width: 45%;">

<div class="defaultBold">'.lang('template').'</div>

</td>

<td class="tableCellOne">
<select name="'.$input_prefix.'[tempale_'.$row_ids.']" class="select" 0="">
';
			foreach ($template_list as $template_id => $template)
			{
			$out .= '<option value="'.$template_id.'"  '.((isset($settings['tempale_'.$row_id])) ? (($settings['tempale_'.$row_id] == $template_id) ? " selected='selected'" : "" ) : "").'>'.$template.'</option>'
			;
			}
$out .= '</select></td>

</tr>

<tr class="odd" '.((isset ($settings['mail_format_'.$row_id]) AND isset($settings['type_'.$row_id]) ) ? (($settings['mail_format_'.$row_id] == 'html'  AND $settings['type_'.$row_id] == 'email' ) ? '' : 'style="display:none"') : 'style="display:none"').' id="template_alt_'.$row_ids.'">
<td class="tableCellOne" style="width: 45%;">

<div class="defaultBold">'.lang('template_alt').'</div>

</td>

<td class="tableCellOne">
<select name="'.$input_prefix.'[template_alt_'.$row_ids.']" class="select" 0="">
<option value=""></option>
';
			foreach ($template_list as $template_id => $template)
			{
			$out .= '<option value="'.$template_id.'"  '.((isset($settings['template_alt_'.$row_id])) ? (($settings['template_alt_'.$row_id] == $template_id) ? " selected='selected'" : "" ) : "").'>'.$template.'</option>'
			;
			}
$out .= '</select></td>

</tr>
</tbody>
';
return $out;
}


?>
</div>