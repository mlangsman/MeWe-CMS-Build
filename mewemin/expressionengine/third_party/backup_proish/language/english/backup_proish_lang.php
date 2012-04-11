<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

 /**
 * mithra62 - Backup Pro(ish)
 *
 * @package		mithra62:backup_proish
 * @author		Eric Lamb
 * @copyright	Copyright (c) 2011, mithra62, Eric Lamb.
 * @link		http://mithra62.com/projects/view/backup-proish/
 * @version		1.0.4
 * @filesource 	./system/expressionengine/third_party/backup_proish/
 */

$lang = array(

'backup_proish_module_name'		=> 'Backup Pro(ish)',
'backup_proish_module_description'	=> 'A trimmed down version of <a href="http://www.mithra62.com/projects/view/backup-pro/">Backup Pro</a> that allows you to create database and file backups of your site. ',

'index' => 'View Backups',
'no_backups' => 'No Backups',
'backups' => 'Backups',
'database_backups' => 'Database Backups',
'backup_db' => 'Backup Database',
'db_backup_created' => 'Database Backup Created',
'file_backup_created' => 'File Backup Created',
'database_backups' => 'Database Backups',
'file_name' => 'File Name',
'backup_files' => 'Backup Files',
'file_backups' => 'File Backups',
'delete_selected' => 'Delete Selected',
'action' => 'Action',
'download' => 'Download',
'restore' => 'Restore',
'date_taken' => 'Date Taken',
'db_backup_not_found' => 'Database Download Not Found',
'file_size' => 'File Size',
'file_backup_failure' => 'Couldn\'t Create File Backup',
'db_backup_failure' => 'Couldn\'t Create Database Backup',
'backups_not_found' => 'Backup Not Found',
'delete_backup_confirm' => 'Are you sure you want to remove the below backups?',
'restore_db_question' => 'Are you sure you want to restore the below database?',
'database_restored' => 'Database Restored!',
'files' => 'Files',

'settings' => 'Settings',
'backup_file_location' => 'File Backup Location',
'backup_file_location_instructions' => 'Put simply; what do you want to include for the file backup? Put the full path',
'backup_store_location' => 'Backup Store Location',
'backup_store_location_instructions' => 'Where do you want to store your backups? Ideally, this wouldn\'t be in your site\'s document root (for security) but if it is it won\'t be included within the file backup. Remember to make this directory writable by your webserver so chmod it to either 0666 or 0777.',
'license_number' => 'License Number',
'configure_backups' => 'Backup Settings',
'configure_cron' => 'Configure Cron',
'enable_cron' => 'Enable Cron',
'cron_control' => 'Cron Control',
'cron_notify_emails' => 'Notification Emails',
'cron_notify_emails_instructions' => 'Put a single email address on each line that you want to be notified on completion of the backup(s). If no email addresses are entered no notification will be sent. Invalid email addresses will be stripped.',
'cron_attach_backups' => 'Attach Backups To Email',
'cron_attach_backups_instructions' => 'By default Backup Pro(ish) will send a link to download the email but if you\'d like to have the backup files sent as an attachment with the notification email we can do that too. ',
'cron_attach_threshold' => 'Attachment Max Size',
'cron_attach_threshold_instructions' => 'Depending on the size of your site the backups can get pretty large. Sometimes, too large for your email provider. If the attachment size is in bytes larger than the value here links the backups aren\'t attached and links to download are included instead. ',
'auto_threshold_instructions' => 'Over time the amount of space used by Backup Pro(ish) can be quite considerable. To keep things sane Backup Pro(ish) can watch the space used and respond accoringly by removing older backups to make space for newer backups. Be sure to enter the maximum amount in bytes. If set to 0 then no threshold is enforced.',
'auto_threshold' => 'Auto Prune Threshold',
'allowed_access_levels' => 'Allowed Access Levels',
'allowed_access_levels_instructions' => 'Backup Pro(ish) will initially only allow Super Admins access but if you need to allow other groups select them from the list.',
'settings_updated' => 'Settings Updated',
'settings_update_fail' => 'Couldn\'t Update Settings',

'cron_command_instructions' => 'Use the below commands for your Cron based on the type of backup you\'d like to automate. ',
'cron_notification' => 'Backup Pro(ish) Cron Notification',
'cron_control_instructions' => 'To make sure requests to the Cron functionality is secured you have to include a random query paramater to each request. Initially, Backup Pro(ish) creates this for you but if you\'d like to change it do so here',
'exclude_paths' => 'Exclude Paths',
'exclude_paths_instructions' => 'By default Backup Pro(ish) will backup everything within your site\'s document root but for some sites that just won\'t work. If you want to exclude anything from the backup put the full path to the document or file here, one per line. ',

'files_dir_not_writable' => 'Files backup directory is not writable. Make sure the permissions for "#files_dir#" are set to 0666 or 0777.',
'files_dir_missing' => 'Files backup directory is missing. Make sure "#files_dir#" exists and is writable.',
'db_dir_not_writable' => 'Database backup directory is not writable. Make sure the permissions for "#db_dir#" are set to 0666 or 0777.',
'db_dir_missing' => 'Database backup directory is missing. Make sure "#db_dir#" exists and is writable.',
'database' => 'Database',
'type' => 'Type',
'restore_db' => 'Restore Database',
'backups_deleted' => 'Backups Deleted',
'back_dir_not_writable' => 'The backup directory isn\'t writable!',
'module_instructions' => 'To take a backup simply click the button for the type you\'d like. Once it\'s complete you can 
						  download it from the list(s) below. If you\'d like to restore your database just click "restore" 
						  from the database backup list. Note that backing up your files may take a couple minutes to finish. ',


'cron_message' => '
Hello,

Your backup has ran successfully.

Backup Pro(ish)',
'cron_txt_message' => '',

'file_backup' => 'File Backup',
'db_backup' => 'Database Backup',
'combined' => 'Combined Backup (both file and database in one run)',

''=>''
);