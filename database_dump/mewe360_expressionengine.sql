-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 23, 2012 at 05:16 PM
-- Server version: 5.0.95
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mewe360_expressionengine`
--

-- --------------------------------------------------------

--
-- Table structure for table `exp_accessories`
--

CREATE TABLE IF NOT EXISTS `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL auto_increment,
  `class` varchar(75) NOT NULL default '',
  `member_groups` varchar(50) NOT NULL default 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY  (`accessory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_accessories`
--

INSERT INTO `exp_accessories` (`accessory_id`, `class`, `member_groups`, `controllers`, `accessory_version`) VALUES
(1, 'Expressionengine_info_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.0'),
(2, 'Draggable_acc', '1|5|6', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.3'),
(3, 'Greeny_acc', '1|5|6', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.0');

-- --------------------------------------------------------

--
-- Table structure for table `exp_actions`
--

CREATE TABLE IF NOT EXISTS `exp_actions` (
  `action_id` int(4) unsigned NOT NULL auto_increment,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY  (`action_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES
(1, 'Comment', 'insert_new_comment'),
(2, 'Comment_mcp', 'delete_comment_notification'),
(3, 'Comment', 'comment_subscribe'),
(4, 'Comment', 'edit_comment'),
(5, 'Email', 'send_email'),
(6, 'Safecracker', 'submit_entry'),
(7, 'Safecracker', 'combo_loader'),
(8, 'Search', 'do_search'),
(9, 'Channel', 'insert_new_entry'),
(10, 'Channel', 'filemanager_endpoint'),
(11, 'Channel', 'smiley_pop'),
(12, 'Member', 'registration_form'),
(13, 'Member', 'register_member'),
(14, 'Member', 'activate_member'),
(15, 'Member', 'member_login'),
(16, 'Member', 'member_logout'),
(17, 'Member', 'retrieve_password'),
(18, 'Member', 'reset_password'),
(19, 'Member', 'send_member_email'),
(20, 'Member', 'update_un_pw'),
(21, 'Member', 'member_search'),
(22, 'Member', 'member_delete'),
(23, 'Backup_proish', 'cron'),
(24, 'Freeform', 'insert_new_entry'),
(25, 'Freeform', 'retrieve_entries'),
(26, 'Freeform', 'delete_freeform_notification'),
(27, 'User', 'group_edit'),
(28, 'User', 'edit_profile'),
(29, 'User', 'reg'),
(30, 'User', 'reassign_jump'),
(31, 'User', 'retrieve_password'),
(32, 'User', 'do_logout'),
(33, 'User', 'do_search'),
(34, 'User', 'delete_account'),
(35, 'User', 'activate_member'),
(36, 'User', 'retrieve_username'),
(37, 'User', 'create_key'),
(38, 'Greeny', 'update');

-- --------------------------------------------------------

--
-- Table structure for table `exp_backup_proish_settings`
--

CREATE TABLE IF NOT EXISTS `exp_backup_proish_settings` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `setting_key` varchar(30) NOT NULL default '',
  `setting_value` text NOT NULL,
  `serialized` int(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_captcha`
--

CREATE TABLE IF NOT EXISTS `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL auto_increment,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY  (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

CREATE TABLE IF NOT EXISTS `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) default NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY  (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_fields`
--

CREATE TABLE IF NOT EXISTS `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL default '',
  `field_label` varchar(50) NOT NULL default '',
  `field_type` varchar(12) NOT NULL default 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL default '128',
  `field_ta_rows` tinyint(2) NOT NULL default '8',
  `field_default_fmt` varchar(40) NOT NULL default 'none',
  `field_show_fmt` char(1) NOT NULL default 'y',
  `field_text_direction` char(3) NOT NULL default 'ltr',
  `field_required` char(1) NOT NULL default 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_field_data`
--

CREATE TABLE IF NOT EXISTS `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY  (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_groups`
--

CREATE TABLE IF NOT EXISTS `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL default 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL default '0',
  `field_html_formatting` char(4) NOT NULL default 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_posts`
--

CREATE TABLE IF NOT EXISTS `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entry_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels`
--

CREATE TABLE IF NOT EXISTS `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(225) default NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL default '0',
  `total_comments` mediumint(8) NOT NULL default '0',
  `last_entry_date` int(10) unsigned NOT NULL default '0',
  `last_comment_date` int(10) unsigned NOT NULL default '0',
  `cat_group` varchar(255) default NULL,
  `status_group` int(4) unsigned default NULL,
  `deft_status` varchar(50) NOT NULL default 'open',
  `field_group` int(4) unsigned default NULL,
  `search_excerpt` int(4) unsigned default NULL,
  `deft_category` varchar(60) default NULL,
  `deft_comments` char(1) NOT NULL default 'y',
  `channel_require_membership` char(1) NOT NULL default 'y',
  `channel_max_chars` int(5) unsigned default NULL,
  `channel_html_formatting` char(4) NOT NULL default 'all',
  `channel_allow_img_urls` char(1) NOT NULL default 'y',
  `channel_auto_link_urls` char(1) NOT NULL default 'n',
  `channel_notify` char(1) NOT NULL default 'n',
  `channel_notify_emails` varchar(255) default NULL,
  `comment_url` varchar(80) default NULL,
  `comment_system_enabled` char(1) NOT NULL default 'y',
  `comment_require_membership` char(1) NOT NULL default 'n',
  `comment_use_captcha` char(1) NOT NULL default 'n',
  `comment_moderate` char(1) NOT NULL default 'n',
  `comment_max_chars` int(5) unsigned default '5000',
  `comment_timelock` int(5) unsigned NOT NULL default '0',
  `comment_require_email` char(1) NOT NULL default 'y',
  `comment_text_formatting` char(5) NOT NULL default 'xhtml',
  `comment_html_formatting` char(4) NOT NULL default 'safe',
  `comment_allow_img_urls` char(1) NOT NULL default 'n',
  `comment_auto_link_urls` char(1) NOT NULL default 'y',
  `comment_notify` char(1) NOT NULL default 'n',
  `comment_notify_authors` char(1) NOT NULL default 'n',
  `comment_notify_emails` varchar(255) default NULL,
  `comment_expiration` int(4) unsigned NOT NULL default '0',
  `search_results_url` varchar(80) default NULL,
  `ping_return_url` varchar(80) default NULL,
  `show_button_cluster` char(1) NOT NULL default 'y',
  `rss_url` varchar(80) default NULL,
  `enable_versioning` char(1) NOT NULL default 'n',
  `max_revisions` smallint(4) unsigned NOT NULL default '10',
  `default_entry_title` varchar(100) default NULL,
  `url_title_prefix` varchar(80) default NULL,
  `live_look_template` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `ping_return_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`) VALUES
(1, 1, 'about', 'About Page', '/', 'Contnet for the About page', 'en', 1, 0, 1334134023, 0, NULL, 1, 'open', 2, 2, '', 'n', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'n', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', '', 'n', 10, '', '', 0),
(2, 1, 'news', 'MeWe News', '/', '', 'en', 3, 3, 1337272756, 1335205982, NULL, 1, 'open', 3, 4, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 'y', 5000, 0, 'y', 'none', 'none', 'n', 'y', 'n', 'n', '', 0, '', '', 'y', '', 'n', 10, '', '', 0),
(3, 1, 'incubator', 'Incubator Page', '/', '', 'en', 1, 0, 1334136888, 0, NULL, 1, 'open', 5, 7, '', 'n', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'n', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', '', 'n', 10, '', '', 0),
(4, 1, 'workspace', 'Workspace Page', '/', NULL, 'en', 1, 0, 1334139294, 0, NULL, 1, 'open', 6, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, '', 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, '', NULL, 'y', NULL, 'n', 10, '', '', 0),
(6, 1, 'membership', 'Membership Page', '/', '', 'en', 1, 0, 1334153756, 0, NULL, 1, 'open', 8, 38, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'n', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'y', '', 'n', 10, '', '', 0),
(9, 1, 'past_events', 'Past Events', '/', NULL, 'en', 2, 0, 1336740533, 0, NULL, 1, 'open', 11, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, '', 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, '', NULL, 'y', NULL, 'n', 10, '', '', 0),
(10, 1, 'home', 'Home Page', '/', '', 'en', 1, 0, 1334595365, 0, NULL, 1, 'open', 4, NULL, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'y', '', 'n', 10, '', '', 0),
(11, 1, 'footer_content', 'Footer', '/', '', 'en', 1, 0, 1334902724, 0, NULL, 1, 'open', 12, 70, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'y', '', 'n', 10, '', '', 0),
(12, 1, 'events', 'Events Page', '/', NULL, 'en', 1, 0, 1335946802, 0, NULL, 1, 'open', 13, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, '', 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, '', NULL, 'y', NULL, 'n', 10, '', '', 0),
(13, 1, 'resources', 'Resources Page', '/', '', 'en', 1, 0, 1336471542, 0, NULL, 1, 'open', 14, NULL, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'y', '', 'n', 10, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data`
--

CREATE TABLE IF NOT EXISTS `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` text,
  `field_ft_5` tinytext,
  `field_id_7` text,
  `field_ft_7` tinytext,
  `field_id_8` text,
  `field_ft_8` tinytext,
  `field_id_9` text,
  `field_ft_9` tinytext,
  `field_id_10` text,
  `field_ft_10` tinytext,
  `field_id_11` text,
  `field_ft_11` tinytext,
  `field_id_12` text,
  `field_ft_12` tinytext,
  `field_id_13` text,
  `field_ft_13` tinytext,
  `field_id_14` text,
  `field_ft_14` tinytext,
  `field_id_38` text,
  `field_ft_38` tinytext,
  `field_id_39` text,
  `field_ft_39` tinytext,
  `field_id_45` int(10) default '0',
  `field_dt_45` varchar(8) default NULL,
  `field_ft_45` tinytext,
  `field_id_58` text,
  `field_ft_58` tinytext,
  `field_id_59` text,
  `field_ft_59` tinytext,
  `field_id_60` text,
  `field_ft_60` tinytext,
  `field_id_61` text,
  `field_ft_61` tinytext,
  `field_id_62` text,
  `field_ft_62` tinytext,
  `field_id_70` text,
  `field_ft_70` tinytext,
  `field_id_71` text,
  `field_ft_71` tinytext,
  `field_id_72` text,
  `field_ft_72` tinytext,
  `field_id_73` text,
  `field_ft_73` tinytext,
  `field_id_74` text,
  `field_ft_74` tinytext,
  `field_id_75` text,
  `field_ft_75` tinytext,
  `field_id_76` text,
  `field_ft_76` tinytext,
  `field_id_77` text,
  `field_ft_77` tinytext,
  `field_id_78` text,
  `field_ft_78` tinytext,
  `field_id_79` text,
  `field_ft_79` tinytext,
  `field_id_80` text,
  `field_ft_80` tinytext,
  `field_id_81` text,
  `field_ft_81` tinytext,
  `field_id_82` text,
  `field_ft_82` tinytext,
  `field_id_83` text,
  `field_ft_83` tinytext,
  `field_id_85` text,
  `field_ft_85` tinytext,
  `field_id_86` text,
  `field_ft_86` tinytext,
  `field_id_87` text,
  `field_ft_87` tinytext,
  `field_id_88` text,
  `field_ft_88` tinytext,
  `field_id_89` text,
  `field_ft_89` tinytext,
  `field_id_90` text,
  `field_ft_90` tinytext,
  `field_id_91` text,
  `field_ft_91` tinytext,
  `field_id_92` text,
  `field_ft_92` tinytext,
  `field_id_93` text,
  `field_ft_93` tinytext,
  `field_id_94` text,
  `field_ft_94` tinytext,
  `field_id_95` text,
  `field_ft_95` tinytext,
  `field_id_96` text,
  `field_ft_96` tinytext,
  `field_id_97` text,
  `field_ft_97` tinytext,
  `field_id_98` text,
  `field_ft_98` tinytext,
  `field_id_99` text,
  `field_ft_99` tinytext,
  `field_id_100` text,
  `field_ft_100` tinytext,
  `field_id_101` text,
  `field_ft_101` tinytext,
  PRIMARY KEY  (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_channel_data`
--

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_7`, `field_ft_7`, `field_id_8`, `field_ft_8`, `field_id_9`, `field_ft_9`, `field_id_10`, `field_ft_10`, `field_id_11`, `field_ft_11`, `field_id_12`, `field_ft_12`, `field_id_13`, `field_ft_13`, `field_id_14`, `field_ft_14`, `field_id_38`, `field_ft_38`, `field_id_39`, `field_ft_39`, `field_id_45`, `field_dt_45`, `field_ft_45`, `field_id_58`, `field_ft_58`, `field_id_59`, `field_ft_59`, `field_id_60`, `field_ft_60`, `field_id_61`, `field_ft_61`, `field_id_62`, `field_ft_62`, `field_id_70`, `field_ft_70`, `field_id_71`, `field_ft_71`, `field_id_72`, `field_ft_72`, `field_id_73`, `field_ft_73`, `field_id_74`, `field_ft_74`, `field_id_75`, `field_ft_75`, `field_id_76`, `field_ft_76`, `field_id_77`, `field_ft_77`, `field_id_78`, `field_ft_78`, `field_id_79`, `field_ft_79`, `field_id_80`, `field_ft_80`, `field_id_81`, `field_ft_81`, `field_id_82`, `field_ft_82`, `field_id_83`, `field_ft_83`, `field_id_85`, `field_ft_85`, `field_id_86`, `field_ft_86`, `field_id_87`, `field_ft_87`, `field_id_88`, `field_ft_88`, `field_id_89`, `field_ft_89`, `field_id_90`, `field_ft_90`, `field_id_91`, `field_ft_91`, `field_id_92`, `field_ft_92`, `field_id_93`, `field_ft_93`, `field_id_94`, `field_ft_94`, `field_id_95`, `field_ft_95`, `field_id_96`, `field_ft_96`, `field_id_97`, `field_ft_97`, `field_id_98`, `field_ft_98`, `field_id_99`, `field_ft_99`, `field_id_100`, `field_ft_100`, `field_id_101`, `field_ft_101`) VALUES
(8, 1, 2, '', 'br', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat...', 'xhtml', '', 'none', '', 'br', '', 'none', '', 'br', '', 'br', '', 'br', '', 'none', '', 'none', '', 'br', '', 'none', '', 'none', 0, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(10, 1, 1, 'We set out to empower creative entrepreneurs to fully realise their ambitions and help turn ideas or existing ventures into sustainable thriving businesses. MeWe combines a not-for-profit network (MeWe House) that provides subsidised support and development and a fully commercial investment arm that aims to invest in the best of the businesses.\n\nThe combination of talent and business development on the one side and investment capital on the other provide total support for untapped leadership talent.\n\nWe are based in premises offering top quality facilities near Piccadilly Circus in central London.', 'br', '', NULL, '', NULL, '', 'br', 'A one-stop development house for ambitious and talented creative entrepreneurs', 'none', 'Many of our members will already have reached considerable professional success but know they are capable of more. Others may be emerging talent at the beginning of their careers. Both will be determined that their full talent does not go untapped and committed to seizing the opportunity to develop further.\n\nWe believe it is often access to networks and resources, gaps in knowledge and lack of rounded skills that prevents so many brilliant ideas and projects getting properly off the ground or reaching the true heights of success possible. Addressing these issues on your own is incredibly difficult and financially impossible for many.', 'br', 'Driven by our members’ needs to push their venture forward (ME) and championing the power to do it together (WE). MeWe360 creates the breadth of support, resources and development required for you to succeed. We provide:\n\n<strong>A programme of events</strong> - workshops, presentations, networking, showcasing and specialist Q&A clinics led by top UK experts.\n<strong>Access to facilities</strong> - professional meeting, cinema and conference rooms, work and events space.\n<strong>Incubator</strong> – designed to get you and your project investment ready with professional coaching and access to our network of industry contacts.\n<strong>Finance/Investment</strong> – Access to working capital to support exciting new projects with the opportunity to pitch for investment from our venture fund.', 'br', '● Increase your access to opportunities, networks and resources to help grow your business.\n● Develop business and personal skills to enable you to maximize these opportunities and drive your project forward.\n● Connect with others, pool resources and share ideas.\n● Benefit from a stimulating and inspiring workspace.\n● Your own high-end facilities for meetings, events or to launch new projects.\n● Subsidised rates you can afford.', 'br', '', 'none', '', 'none', '', 'br', '', 'none', '', 'none', 0, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', 'Kevin Osborne\nMrs Team Members\n', 'none', 'Mr Board Member\n', NULL, 'Mr Advisor\n', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '{filedir_3}5.jpg', 'none', 'http://www.youtube.com/watch?v=tbi21-ZsB-A&feature=g-feat', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(11, 1, 3, '', 'br', '', NULL, '', NULL, 'MeWe360 is launching a new £1million business incubator and venture fund for entrepreneurs in the arts and creative industries.\n\nWe will identify and develop creative talent from around the country and incubate associated new businesses. Through our venture arm we will invest up to £200,000 in five promising new projects.\n\nWe are currently seeking talented artists, designers, digital media entrepreneurs and others from across the creative spectrum for development and investment.', 'br', '', NULL, '', NULL, '', NULL, '', NULL, 'Incubator', 'none', '', 'none', '', 'br', '', 'none', '', 'none', 0, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '{filedir_3}5.jpg', 'none', 'http://vimeo.com/41342994', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '{filedir_5}MeWe_Events_Programme.pdf', 'none'),
(12, 1, 4, '', 'br', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Workspace', 'none', 'Our modern offices are just 2 minutes walk from Piccadilly Circus tube station in central London.\n\nAll members are free to use the open plan workspaces for a set number of hours per month depending on the membership type selected. Additional hours can be purchased on a pay as you go basis. \n\nMembers can also hire other rooms on an hourly or daily basis. The rooms vary from a small meeting room for 6 people to a large boardroom. We also have a cinema that can be hired for larger presentations or events.\n', 'br', '', 'none', '', 'none', 0, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '{filedir_3}workspace.jpg', 'none', '', 'none', '', 'none', '1', 'none', '', 'none', '', 'none'),
(16, 1, 6, '', 'br', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 'Our services are subsidised by the UK Arts Council and all our profits go back in to growing our members businesses.', 'none', 'Special Offer: 10% Discount on 1 years membership', 'none', 0, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', 'What time is the workspace open until?\n7pm on weekdays\nCan I pay in installments ?\nMembership can be paid yearly or every six months.\nWill I be able to print documents?\nNo problem! But please take note of our fair use policy. \n', 'none', '', 'none', '', NULL, '', NULL, '', 'none', '1', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '1', 'none', 'y', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(24, 1, 9, '', 'br', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 1333274356, 'UTC', 'none', '', 'none', 'Investment and the Creative What''s in it for me?', 'none', '1', 'none', 'Ameet Shah (Chairman of MeWe Foundation) was joined by Patrick McKenna (CEO - Ingenious Media), Mike Kelly (Managing Director - Northan Alliance), Jon Kingsbury (Programme Director - NESTA) and Tom Adeyoola (CEO - Metail) to discuss the following topices;\n1. Why are creative projects and businesses more difficult to invest in and what makes the difference?\n2. The Entrepreneurial Perspective – what did you do to turn a good idea into a real business?\n3. The Role of the Public Bodies\n4.  The Nature of Investor – Entrepreneur Transaction & Concerns of the Entrepreneur.', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(25, 1, 2, '', 'br', 'Creative England has revealed the team who will be leading its new strand of business development support. Jim Farmery, formerly of regional development agency Yorkshire Forward, and Lynne McCadden, previously at regional screen agency Vision+Media, join Creative England as it prepares to boost its offer to digital media SMEs across the English regions.\n\nJim Farmery will take up the post of Director of Business Development on April 16. He has extensive commercial experience in the worlds of small business and large corporations, both in the private and public sectors, and has spent the last ten years working at Yorkshire Forward on economic development projects.\n\nJim is well placed to understand and respond to the needs of digital media companies across the English regions. He has already worked extensively within the sector, having spent two years as Digital Sector Manager at Yorkshire Forward. His subsequent work for the agency included responsibility for a variety of initiatives and projects to stimulate growth and regeneration, such as regional screen agency, Screen Yorkshire, the VC and loan fund, Finance Yorkshire, the Channel 4-partnered investment scheme, 4IP, and Science City York. He also presided over the roll-out of superfast broadband in Yorkshire and oversaw the regional network for the games industry, Games Republic. Jim has also worked at Pace Micro Technology, having started his career as a management trainee for Sainsbury’s.\n\nLynne McCadden, who joined Creative England last month, brings 25 years’ experience of working in media environments to her role as Head of New Projects. Starting out as a journalist, she worked at the BBC as a producer for 10 years and has also produced for C4 and ITV. Lynne oversaw the merger of Media Training North West with North West Vision to create the regional screen agency for the North West, Vision+Media. She shouldered responsibility for an entire change management programme at the new agency, led the delivery of £7.5m business and skills contracts, and brought major industry partners on board to strengthen the organisation’s business proposition.\n\nJim and Lynne will oversee the roll out of Creative England’s new business development programme, which will support creative and digital SMEs across the English regions. It will include £5 million of European funding, which will form the basis of a private sector-led scheme providing development funding and market expertise to small creative and digital businesses working in cross-platform content and services.\n\nThe funding will enable Creative England to offer increasingly specialist support to games, digital and creative services, making the organisation the first joined up, dedicated support agency for the creative industries outside London.\n\nCaroline Norbury, Creative England’s Chief Executive (as pictured), said: “Our expansion into the digital media arena via our business development programme is an exciting new venture for Creative England. It’s essential we have a safe pair of hands to handle this area of our work and I’m delighted to say that with Jim and Lynne we have just that. Their experience in both traditional and new media industries gives them a terrific head start in delivering a programme that we hope will benefit digital media SMEs across the country.”\n\nJim Farmery said: “I am really looking forward to be joining Creative England at such an exciting time in their development. I am very impressed with Caroline and the team she has built in such a short time and look forward to leading the development of a wide range of programmes to support growth across the creative sector in England.”\n\nLynne McCadden said: “I’ve always been energised by working closely with creative businesses and this is wonderful opportunity to build new opportunities for employers and individuals throughout England.”', 'xhtml', '{filedir_1}test-news-image.jpg', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 0, NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', NULL, NULL, NULL, NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(26, 1, 10, '', 'br', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 0, NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', 'We provide access to the best funding, mentoring and incubation to propel your creative business.', 'none', '', 'none', '', 'none', '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', 'https://vimeo.com/42404978', 'none', '{filedir_3}5.jpg', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '1', 'none', '', 'none', '', 'none', '', 'none'),
(27, 1, 11, '', 'br', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 0, NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '1', 'none', 'MeWe Foundation\nGolden Square\nLondon, W1 123', 'none', 'info@mewe.com', 'none', '020 7123 4567', 'none', 'http://www.twitter.com/mewe360', 'none', 'http://www.facebook.com/mewe360', 'none', 'http://www.linkedin.com/mewe360', 'none', '', 'none', '', 'none', '', 'none', '', NULL, '', NULL, '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '1', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', 'Me We Foundation CIC – 239A Alexandra Park Road, London N22 7BJ – Registered in England and Wales – Company No.7638993.', 'none', '', 'none'),
(28, 1, 12, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 0, NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '{filedir_5}MeWe_Events_Programme.pdf', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(29, 1, 13, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 0, NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '1', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none', '', 'none'),
(30, 1, 9, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 1337086133, 'UTC', 'none', '', 'none', 'This is a test', 'none', '', 'none', 'Here is some bumf on the event...', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none'),
(31, 1, 2, '', NULL, 'blah blah blah', 'xhtml', '{filedir_1}stock-photo-16355867-disco-dance-happy-vintage-man-enjoy-party.jpg', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, 0, NULL, NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', 'none', '', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_entries_autosave`
--

CREATE TABLE IF NOT EXISTS `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL auto_increment,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL default '0',
  `pentry_id` int(10) NOT NULL default '0',
  `forum_topic_id` int(10) unsigned default NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL default 'n',
  `view_count_one` int(10) unsigned NOT NULL default '0',
  `view_count_two` int(10) unsigned NOT NULL default '0',
  `view_count_three` int(10) unsigned NOT NULL default '0',
  `view_count_four` int(10) unsigned NOT NULL default '0',
  `allow_comments` varchar(1) NOT NULL default 'y',
  `sticky` varchar(1) NOT NULL default 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL default 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL default '0',
  `comment_expiration_date` int(10) NOT NULL default '0',
  `edit_date` bigint(14) default NULL,
  `recent_comment_date` int(10) default NULL,
  `comment_total` int(4) unsigned NOT NULL default '0',
  `entry_data` text,
  PRIMARY KEY  (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_fields`
--

CREATE TABLE IF NOT EXISTS `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL default 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL default 'n',
  `field_pre_channel_id` int(6) unsigned default NULL,
  `field_pre_field_id` int(6) unsigned default NULL,
  `field_related_to` varchar(12) NOT NULL default 'channel',
  `field_related_id` int(6) unsigned NOT NULL default '0',
  `field_related_orderby` varchar(12) NOT NULL default 'date',
  `field_related_sort` varchar(4) NOT NULL default 'desc',
  `field_related_max` smallint(4) NOT NULL default '0',
  `field_ta_rows` tinyint(2) default '8',
  `field_maxl` smallint(3) default NULL,
  `field_required` char(1) NOT NULL default 'n',
  `field_text_direction` char(3) NOT NULL default 'ltr',
  `field_search` char(1) NOT NULL default 'n',
  `field_is_hidden` char(1) NOT NULL default 'n',
  `field_fmt` varchar(40) NOT NULL default 'xhtml',
  `field_show_fmt` char(1) NOT NULL default 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL default 'any',
  `field_settings` text,
  PRIMARY KEY  (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

--
-- Dumping data for table `exp_channel_fields`
--

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_related_to`, `field_related_id`, `field_related_orderby`, `field_related_sort`, `field_related_max`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES
(2, 1, 2, 'about_main_copy', 'Main Copy', 'This is the main copy at the top of the about page', 'textarea', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'br', 'n', 1, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(4, 1, 3, 'news_article', 'News Article', 'Please enter the main news article here', 'textarea', '', '0', 0, 0, 'channel', 2, 'title', 'desc', 0, 20, 128, 'y', 'ltr', 'y', 'n', 'xhtml', 'n', 2, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJ5IjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6InkiO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6InkiO30='),
(5, 1, 3, 'news_image', 'Main Image', 'This will be the main headline image for this news story and will be used for the thumbnail displayed on the homepage.', 'file', '', '0', 0, 0, 'channel', 2, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(7, 1, 5, 'incubator_main_copy', 'Main Copy', 'This is the introductory block of copy right at the top of the Incubator page', 'textarea', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'br', 'n', 1, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(8, 1, 2, 'about_headline', 'Headline', 'This is the main headline displayed at the top of the about page', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 100, 'y', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(9, 1, 2, 'about_why_mewe', 'Why MeWe?', 'This paragraph of text is displayed under the ''Why MeWe'' heading. ', 'textarea', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'br', 'n', 3, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(10, 1, 2, 'about_how_we_work', 'How We Work', 'This text is displayed under the ''How We Work'' heading.', 'textarea', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'br', 'n', 4, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(11, 1, 2, 'about_why_join', 'Why Join?', 'This text is displayed under the ''Why Join'' heading.', 'textarea', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'br', 'n', 5, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(12, 1, 5, 'incubator_headline', 'Page Headline', 'This is the main headline for the incubator page.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 50, 'y', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(13, 1, 6, 'workspace_heading', 'Heading', 'This is the workspace page main heading', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 20, 'y', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(14, 1, 6, 'workspace_main_copy', 'Main Copy', 'This is the main block of copy at the top of the workspace page.', 'textarea', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'br', 'n', 2, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6InkiO30='),
(38, 1, 8, 'membership_headline', 'Page Headline', 'This is the headline at  the top of the membership page.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(39, 1, 8, 'membership_banner', 'Banner Copy', 'This is the special offer banner that sits above the membership comparison area.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(45, 1, 11, 'past_event_date', 'Event Date', '', 'date', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(58, 1, 11, 'past_event_video', 'Event Video', 'Please paste the full URL to the Vimeo or Youtube video here', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(59, 1, 11, 'past_event_description', 'Event Description', 'This is a short description of the even which will appear under the title.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'y', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(60, 1, 11, 'past_event_photo_gallery', 'Event Photo Gallery', 'A gallery of photos for this event can be created here. Just add each photo below, the gallery can hold up to 32 images.', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MjoiMzIiO3M6NzoiY29sX2lkcyI7YToxOntpOjA7czoxOiIxIjt9fQ=='),
(61, 1, 11, 'past_event_review', 'Event Review', 'Please enter descriptive copy which will give details about this event, what happened, who attended etc...', 'textarea', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 15, 128, 'y', 'ltr', 'y', 'n', 'none', 'n', 5, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6InkiO30='),
(62, 1, 3, 'news_video_url', 'Video URL', 'If there is a youtube or vimeo video for this news article then paste the full URL into this box. This will be displayed at the top of the story and as the thumbnail for this story on the main page. \n\nIf there is no video, then the Content Management System will look to see if there a main image to use instead. ', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(70, 1, 12, 'footer_map_image', 'Map Image', 'This is the map image showing MeWe''s location in the site footer.', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjEiO3M6ODoibWF4X3Jvd3MiO3M6MToiMSI7czo3OiJjb2xfaWRzIjthOjI6e2k6MDtzOjE6IjIiO2k6MTtpOjU0O319'),
(71, 1, 12, 'footer_address', 'Address', 'This is MeWe''s address which appears in the site footer', 'textarea', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 4, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(72, 1, 12, 'footer_email', 'Email', '', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(73, 1, 12, 'footer_phone_number', 'Phone Number', '', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(74, 1, 12, 'footer_twitter', 'Twitter URL', 'The URL should be fully qualified so it includes http:// at the beginning.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 5, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(75, 1, 12, 'footer_facebook', 'Facebook URL', 'The URL should be fully qualified so it includes http:// at the beginning.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 6, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(76, 1, 12, 'footer_linkedin', 'Linkedin URL', 'The URL should be fully qualified so it includes http:// at the beginning.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 7, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(77, 1, 4, 'strapline', 'Strapline', 'This is the main home page strapline. Be very careful when changing this !!', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 120, 'y', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(78, 1, 8, 'faq', 'FAQ''s', 'Enter frequently asked questions below :', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'y', 'n', 'none', 'n', 3, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6Mzp7aTowO3M6MToiMyI7aToxO3M6MToiNCI7aToyO2k6NTM7fX0='),
(79, 1, 2, 'team', 'The Team', '', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 6, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6NDp7aTowO3M6MToiNSI7aToxO3M6MjoiMTYiO2k6MjtzOjE6IjYiO2k6MztzOjE6IjciO319'),
(80, 1, 2, 'board', 'The Board', '', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 7, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6NDp7aTowO3M6MjoiMTciO2k6MTtzOjI6IjIwIjtpOjI7czoyOiIxOCI7aTozO3M6MjoiMTkiO319'),
(81, 1, 2, 'advisors', 'Advisors', '', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 8, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6NDp7aTowO3M6MjoiMjEiO2k6MTtzOjI6IjI0IjtpOjI7czoyOiIyMiI7aTozO3M6MjoiMjMiO319'),
(82, 1, 13, 'events_file', 'Event details PDF file', 'This is the PDF file which provides more details of the events MeWe runs, linked off the events page.', 'file', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjUiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(83, 1, 8, 'membership_tiers', 'Membership Tiers', '', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjMiO3M6ODoibWF4X3Jvd3MiO3M6MToiMyI7czo3OiJjb2xfaWRzIjthOjExOntpOjA7czoyOiIyNSI7aToxO3M6MjoiMjYiO2k6MjtzOjI6IjI3IjtpOjM7czoyOiIyOCI7aTo0O3M6MjoiMjkiO2k6NTtzOjI6IjMwIjtpOjY7czoyOiIzMSI7aTo3O3M6MjoiMzIiO2k6ODtzOjI6IjMzIjtpOjk7czoyOiIzNSI7aToxMDtzOjI6IjM0Ijt9fQ=='),
(85, 1, 2, 'about_show_advisors', 'Show Advisors ?', 'Use this to turn on/off the advisors tab.', 'pt_switch', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 9, 'any', 'YToxMTp7czo5OiJvZmZfbGFiZWwiO3M6MzoiT0ZGIjtzOjc6Im9mZl92YWwiO3M6MDoiIjtzOjg6Im9uX2xhYmVsIjtzOjI6Ik9OIjtzOjY6Im9uX3ZhbCI7czoxOiJ5IjtzOjc6ImRlZmF1bHQiO3M6Mjoib24iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(86, 1, 4, 'home_video', 'Video ', 'Please paste the link to a YouTube or Vimeo video here to be shown at the top of the page. If there is no video then please make sure an image is uploaded below to be used instead.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(87, 1, 4, 'home_main_image', 'Main Image', 'This is the main image for the home page. ', 'file', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMyI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(88, 1, 14, 'resources_list', 'Resources', 'Please add any resource files, links ', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 1, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjAiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6NDp7aTowO3M6MjoiMzYiO2k6MTtzOjI6IjM3IjtpOjI7czoyOiIzOCI7aTozO3M6MjoiMzkiO319'),
(89, 1, 12, 'sponsors', 'Sponsors', 'This is a list of sponsor images and corresponding links which appear at the top of the footer.', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 8, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjEiO3M6ODoibWF4X3Jvd3MiO3M6MToiNSI7czo3OiJjb2xfaWRzIjthOjM6e2k6MDtzOjI6IjQyIjtpOjE7czoyOiI0MCI7aToyO3M6MjoiNDEiO319'),
(90, 1, 8, 'topups_and_extras', 'Top-ups and Extras', 'Here you can update the copy which live sin the Top-Ups and extras box.', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 5, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjEiO3M6ODoibWF4X3Jvd3MiO3M6MDoiIjtzOjc6ImNvbF9pZHMiO2E6Mjp7aTowO3M6MjoiNDMiO2k6MTtzOjI6IjQ0Ijt9fQ=='),
(91, 1, 8, 'special_offer_visible', 'Special Offer Visible', 'Turn the special offer banner on/off', 'pt_switch', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 6, 'any', 'YToxMTp7czo5OiJvZmZfbGFiZWwiO3M6MzoiT0ZGIjtzOjc6Im9mZl92YWwiO3M6MDoiIjtzOjg6Im9uX2xhYmVsIjtzOjI6Ik9OIjtzOjY6Im9uX3ZhbCI7czoxOiJ5IjtzOjc6ImRlZmF1bHQiO3M6Mjoib24iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(92, 1, 2, 'about_main_image', 'Main image', 'This is the main image at the top of the page. If there is no video uploaded then this needs to be provided.', 'file', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 10, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMyI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(93, 1, 2, 'about_video', 'Video', 'Please paste the link to a YouTube or Vimeo video here to be shown at the top of the page. If there is no video then please make sure an image is uploaded to be used instead.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 11, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(94, 1, 5, 'incubator_main_image', 'Main Image', 'This is the main image at the top of the page. If there is no video uploaded then this needs to be provided.', 'file', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMyI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(95, 1, 5, 'incubator_video', 'Video', 'Please paste the link to a YouTube or Vimeo video here to be shown at the top of the page. If there is no video then please make sure an image is uploaded below to be used instead.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(96, 1, 6, 'workspace_main_image', 'Main Image', 'This is the main image at the top of the page. If there is no video uploaded then this needs to be provided.', 'file', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 6, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiMyI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(97, 1, 6, 'workspace_video', 'Video', 'Please paste the link to a YouTube or Vimeo video here to be shown at the top of the page. If there is no video then please make sure an image is uploaded below to be used instead.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 7, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(98, 1, 4, 'home_four_columns', 'Four Column Area', '', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 4, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjQiO3M6ODoibWF4X3Jvd3MiO3M6MToiNCI7czo3OiJjb2xfaWRzIjthOjU6e2k6MDtzOjI6IjQ1IjtpOjE7czoyOiI0NiI7aToyO3M6MjoiNDciO2k6MztzOjI6IjQ4IjtpOjQ7aTo0OTt9fQ=='),
(99, 1, 6, 'workspace_four_columns', 'Four column Area', 'This is the four column area which shows the different types of rooms/spaces MeWe has to offer.', 'matrix', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 8, 'any', 'YTozOntzOjg6Im1pbl9yb3dzIjtzOjE6IjQiO3M6ODoibWF4X3Jvd3MiO3M6MToiNCI7czo3OiJjb2xfaWRzIjthOjM6e2k6MDtzOjI6IjUwIjtpOjE7czoyOiI1MSI7aToyO3M6MjoiNTIiO319'),
(100, 1, 12, 'company_info', 'Company Info', 'Company registered address and company registration number appear in small type at the bottom of the footer.', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 9, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(101, 1, 5, 'incubator_file', 'Incubator PDF', 'This PDF file is linked to at the bottom of the Incubator page and provides more information on the process. ', 'file', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 5, 'any', 'YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjUiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ==');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_channel_member_groups`
--

INSERT INTO `exp_channel_member_groups` (`group_id`, `channel_id`) VALUES
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 6),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(6, 13);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_titles`
--

CREATE TABLE IF NOT EXISTS `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL default '0',
  `pentry_id` int(10) NOT NULL default '0',
  `forum_topic_id` int(10) unsigned default NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL default 'n',
  `view_count_one` int(10) unsigned NOT NULL default '0',
  `view_count_two` int(10) unsigned NOT NULL default '0',
  `view_count_three` int(10) unsigned NOT NULL default '0',
  `view_count_four` int(10) unsigned NOT NULL default '0',
  `allow_comments` varchar(1) NOT NULL default 'y',
  `sticky` varchar(1) NOT NULL default 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL default 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL default '0',
  `comment_expiration_date` int(10) NOT NULL default '0',
  `edit_date` bigint(14) default NULL,
  `recent_comment_date` int(10) default NULL,
  `comment_total` int(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `exp_channel_titles`
--

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(8, 1, 2, 1, 0, NULL, '127.0.0.1', 'News Headline', 'news-headline', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1333636009, 'n', '2012', '04', '05', 0, 0, 20120508115350, 0, 0),
(10, 1, 1, 1, 0, NULL, '127.0.0.1', 'About Page', 'about', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1334134023, 'n', '2012', '04', '11', 0, 0, 20120518193505, 0, 0),
(11, 1, 3, 1, 0, NULL, '86.13.126.103', 'Incubator Page', 'incubator', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1334136888, 'n', '2012', '04', '11', 0, 0, 20120523170349, 0, 0),
(12, 1, 4, 1, 0, NULL, '88.97.10.145', 'Workspace Page', 'workspace', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1334139294, 'n', '2012', '04', '11', 0, 0, 20120521131956, 0, 0),
(16, 1, 6, 1, 0, NULL, '127.0.0.1', 'Membership Page', 'membership-page', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1334153756, 'n', '2012', '04', '11', 0, 0, 20120511131658, 0, 0),
(24, 1, 9, 1, 0, NULL, '88.97.10.145', 'Networking Event & Panel discussion', 'mewe-networking-event', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1334312356, 'n', '2012', '04', '13', 0, 0, 20120521135917, 0, 0),
(25, 1, 2, 1, 0, NULL, '127.0.0.1', 'Creative England reveals business development team', 'creative-england-reveals-business-development-team', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1334481295, 'n', '2012', '04', '15', 0, 0, 20120417100056, 1335205982, 3),
(26, 1, 10, 1, 0, NULL, '88.97.10.145', 'Home Page Content', 'home-page-content', 'open', 'y', 0, 0, 0, 0, 'n', 'n', 1334595365, 'n', '2012', '04', '16', 0, 0, 20120521131606, 0, 0),
(27, 1, 11, 1, 0, NULL, '88.97.10.145', 'Footer Content', 'map-image', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1334902724, 'n', '2012', '04', '20', 0, 0, 20120522115045, 0, 0),
(28, 1, 12, 1, 0, NULL, '127.0.0.1', 'Events Page Content', 'events-page-content', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1335946802, 'n', '2012', '05', '02', 0, 0, 20120502092904, 0, 0),
(29, 1, 13, 1, 0, NULL, '127.0.0.1', 'Resources', 'resources', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1336471542, 'n', '2012', '05', '08', 0, 0, 20120508110743, 0, 0),
(30, 1, 9, 1, 0, NULL, '127.0.0.1', 'Ne wEvent', 'ne-wevent', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1336740533, 'n', '2012', '05', '11', 0, 0, 20120511134854, 0, 0),
(31, 1, 2, 1, 0, NULL, '127.0.0.1', 'Another news story', 'another-news-story', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1337272756, 'n', '2012', '05', '17', 0, 0, 20120517174017, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_comments`
--

CREATE TABLE IF NOT EXISTS `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) default '1',
  `entry_id` int(10) unsigned default '0',
  `channel_id` int(4) unsigned default '1',
  `author_id` int(10) unsigned default '0',
  `status` char(1) default '0',
  `name` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `url` varchar(75) default NULL,
  `location` varchar(50) default NULL,
  `ip_address` varchar(16) default NULL,
  `comment_date` int(10) default NULL,
  `edit_date` int(10) default NULL,
  `comment` text,
  PRIMARY KEY  (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_comments`
--

INSERT INTO `exp_comments` (`comment_id`, `site_id`, `entry_id`, `channel_id`, `author_id`, `status`, `name`, `email`, `url`, `location`, `ip_address`, `comment_date`, `edit_date`, `comment`) VALUES
(1, 1, 25, 2, 1, 'o', 'Administrator', 'marc@langsman.com', '', 'London', '127.0.0.1', 1335181145, NULL, 'This is a comment on how interesting this new story is ! '),
(2, 1, 25, 2, 1, 'o', 'Administrator', 'marc@langsman.com', '', 'London', '127.0.0.1', 1335205228, NULL, 'Another comment...'),
(3, 1, 25, 2, 1, 'o', 'Administrator', 'marc@langsman.com', '', 'London', '127.0.0.1', 1335205982, NULL, 'sdsd'),
(4, 1, 25, 2, 0, 'p', 'Mr Tiger', 'kak@kak.com', '', '', '127.0.0.1', 1335206880, NULL, 'hello chickens');

-- --------------------------------------------------------

--
-- Table structure for table `exp_comment_subscriptions`
--

CREATE TABLE IF NOT EXISTS `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned default NULL,
  `member_id` int(10) default '0',
  `email` varchar(50) default NULL,
  `subscription_date` varchar(10) default NULL,
  `notification_sent` char(1) default 'n',
  `hash` varchar(15) default NULL,
  PRIMARY KEY  (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_log`
--

CREATE TABLE IF NOT EXISTS `exp_cp_log` (
  `id` int(10) NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=258 ;

--
-- Dumping data for table `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'admin', '127.0.0.1', 1332434777, 'Logged in'),
(2, 1, 1, 'admin', '0.0.0.0', 1333614007, 'Logged in'),
(3, 1, 1, 'admin', '0.0.0.0', 1333614352, 'Channel Created:&nbsp;&nbsp;Pages'),
(4, 1, 1, 'admin', '0.0.0.0', 1333615165, 'Field Group Created:&nbsp;About'),
(5, 1, 1, 'admin', '127.0.0.1', 1333618296, 'Logged in'),
(6, 1, 1, 'admin', '0.0.0.0', 1333619827, 'Field group Deleted:&nbsp;&nbsp;About'),
(7, 1, 1, 'admin', '0.0.0.0', 1333620299, 'Field Group Created:&nbsp;about'),
(8, 1, 1, 'admin', '127.0.0.1', 1333631918, 'Logged in'),
(9, 1, 1, 'admin', '127.0.0.1', 1333635423, 'Channel Created:&nbsp;&nbsp;MeWe News'),
(10, 1, 1, 'admin', '127.0.0.1', 1333635485, 'Field Group Created:&nbsp;news'),
(11, 1, 1, 'admin', '127.0.0.1', 1334051151, 'Logged in'),
(12, 1, 1, 'admin', '127.0.0.1', 1334058627, 'Field Group Created:&nbsp;Home'),
(13, 1, 1, 'admin', '127.0.0.1', 1334076781, 'Logged in'),
(14, 1, 1, 'admin', '127.0.0.1', 1334077615, 'Channel Created:&nbsp;&nbsp;Incubator Page'),
(15, 1, 1, 'admin', '127.0.0.1', 1334077654, 'Field Group Created:&nbsp;incubator'),
(16, 1, 1, 'admin', '127.0.0.1', 1334121608, 'Logged in'),
(17, 1, 1, 'admin', '127.0.0.1', 1334121900, 'Member profile created:&nbsp;&nbsp;test'),
(18, 1, 1, 'admin', '127.0.0.1', 1334123085, 'Logged in'),
(19, 1, 1, 'admin', '127.0.0.1', 1334123307, 'Member Group Updated:&nbsp;&nbsp;Members'),
(20, 1, 1, 'admin', '127.0.0.1', 1334123542, 'Member Group Created:&nbsp;&nbsp;Content and Member Admin'),
(21, 1, 1, 'admin', '127.0.0.1', 1334123689, 'Member Group Updated:&nbsp;&nbsp;Content and Member Admin'),
(22, 1, 1, 'admin', '127.0.0.1', 1334123737, 'Member profile created:&nbsp;&nbsp;mewe360'),
(23, 1, 1, 'admin', '127.0.0.1', 1334123792, 'Logged out'),
(24, 1, 3, 'mewe360', '127.0.0.1', 1334123799, 'Logged in'),
(25, 1, 3, 'mewe360', '127.0.0.1', 1334123907, 'Logged out'),
(26, 1, 1, 'admin', '127.0.0.1', 1334123919, 'Logged in'),
(27, 1, 1, 'admin', '127.0.0.1', 1334128414, 'Logged in'),
(28, 1, 1, 'admin', '127.0.0.1', 1334138604, 'Channel Created:&nbsp;&nbsp;Workspace Page'),
(29, 1, 1, 'admin', '127.0.0.1', 1334138622, 'Field Group Created:&nbsp;workspace'),
(30, 1, 1, 'admin', '127.0.0.1', 1334143280, 'Logged in'),
(31, 1, 1, 'admin', '127.0.0.1', 1334143308, 'Channel Created:&nbsp;&nbsp;Membership'),
(32, 1, 1, 'admin', '127.0.0.1', 1334143391, 'Field Group Created:&nbsp;membership'),
(33, 1, 1, 'admin', '127.0.0.1', 1334148774, 'Logged out'),
(34, 1, 3, 'mewe360', '127.0.0.1', 1334148784, 'Logged in'),
(35, 1, 3, 'mewe360', '127.0.0.1', 1334148846, 'Logged out'),
(36, 1, 1, 'admin', '127.0.0.1', 1334148848, 'Logged in'),
(37, 1, 1, 'admin', '127.0.0.1', 1334148894, 'Member Group Updated:&nbsp;&nbsp;Content and Member Admin'),
(38, 1, 1, 'admin', '127.0.0.1', 1334149739, 'Status Group Created:&nbsp;Membership Tiers'),
(39, 1, 1, 'admin', '127.0.0.1', 1334151969, 'Channel Created:&nbsp;&nbsp;Memership Page Content'),
(40, 1, 1, 'admin', '127.0.0.1', 1334153509, 'Field Group Created:&nbsp;membership'),
(41, 1, 1, 'admin', '127.0.0.1', 1334217897, 'Logged in'),
(42, 1, 1, 'admin', '127.0.0.1', 1334217927, 'Channel Created:&nbsp;&nbsp;FAQ'),
(43, 1, 1, 'admin', '127.0.0.1', 1334217947, 'Field Group Created:&nbsp;FAQ'),
(44, 1, 1, 'admin', '127.0.0.1', 1334219696, 'Channel Created:&nbsp;&nbsp;Top Ups and Extras'),
(45, 1, 1, 'admin', '127.0.0.1', 1334219757, 'Field Group Created:&nbsp;topups_and_extras'),
(46, 1, 1, 'admin', '127.0.0.1', 1334229973, 'Logged out'),
(47, 1, 1, 'admin', '127.0.0.1', 1334238516, 'Logged in'),
(48, 1, 1, 'admin', '127.0.0.1', 1334238593, 'Channel Created:&nbsp;&nbsp;Past Events'),
(49, 1, 1, 'admin', '127.0.0.1', 1334238636, 'Field Group Created:&nbsp;past events'),
(50, 1, 1, 'admin', '127.0.0.1', 1334242554, 'Logged in'),
(51, 1, 1, 'admin', '127.0.0.1', 1334307873, 'Logged in'),
(52, 1, 1, 'admin', '127.0.0.1', 1334311761, 'Custom Field Deleted:&nbsp;past_event_image_2'),
(53, 1, 1, 'admin', '127.0.0.1', 1334311882, 'Custom Field Deleted:&nbsp;past_event_image_1'),
(54, 1, 1, 'admin', '127.0.0.1', 1334311891, 'Custom Field Deleted:&nbsp;past_event_image_4'),
(55, 1, 1, 'admin', '127.0.0.1', 1334311894, 'Custom Field Deleted:&nbsp;past_event_image_6'),
(56, 1, 1, 'admin', '127.0.0.1', 1334311899, 'Custom Field Deleted:&nbsp;past_event_image_7'),
(57, 1, 1, 'admin', '127.0.0.1', 1334311902, 'Custom Field Deleted:&nbsp;past_event_image_5'),
(58, 1, 1, 'admin', '127.0.0.1', 1334311905, 'Custom Field Deleted:&nbsp;past_event_image_8'),
(59, 1, 1, 'admin', '127.0.0.1', 1334311918, 'Custom Field Deleted:&nbsp;past_event_image_3'),
(60, 1, 1, 'admin', '127.0.0.1', 1334311922, 'Custom Field Deleted:&nbsp;past_event_image_9'),
(61, 1, 1, 'admin', '127.0.0.1', 1334311926, 'Custom Field Deleted:&nbsp;past_event_image_10'),
(62, 1, 1, 'admin', '127.0.0.1', 1334311929, 'Custom Field Deleted:&nbsp;past_event_image_11'),
(63, 1, 1, 'admin', '127.0.0.1', 1334311933, 'Custom Field Deleted:&nbsp;past_event_image_12'),
(64, 1, 1, 'admin', '127.0.0.1', 1334328755, 'Logged out'),
(65, 1, 1, 'admin', '127.0.0.1', 1334328757, 'Logged in'),
(66, 1, 1, 'admin', '127.0.0.1', 1334335869, 'Logged out'),
(67, 1, 1, 'admin', '127.0.0.1', 1334336703, 'Logged in'),
(68, 1, 1, 'admin', '127.0.0.1', 1334337425, 'Logged in'),
(69, 1, 1, 'admin', '127.0.0.1', 1334398189, 'Logged in'),
(70, 1, 1, 'admin', '127.0.0.1', 1334479895, 'Logged in'),
(71, 1, 1, 'admin', '127.0.0.1', 1334556461, 'Logged in'),
(72, 1, 1, 'admin', '127.0.0.1', 1334563712, 'Logged out'),
(73, 1, 1, 'admin', '127.0.0.1', 1334563746, 'Logged in'),
(74, 1, 1, 'admin', '127.0.0.1', 1334569223, 'Logged in'),
(75, 1, 1, 'admin', '127.0.0.1', 1334575426, 'Logged in'),
(76, 1, 1, 'admin', '127.0.0.1', 1334581929, 'Logged in'),
(77, 1, 1, 'admin', '127.0.0.1', 1334583420, 'Logged out'),
(78, 1, 1, 'admin', '127.0.0.1', 1334583741, 'Logged in'),
(79, 1, 1, 'admin', '127.0.0.1', 1334587786, 'Logged in'),
(80, 1, 1, 'admin', '127.0.0.1', 1334588208, 'Logged in'),
(81, 1, 1, 'admin', '127.0.0.1', 1334589072, 'Logged out'),
(82, 1, 1, 'admin', '127.0.0.1', 1334589380, 'Logged in'),
(83, 1, 1, 'admin', '127.0.0.1', 1334589532, 'Logged in'),
(84, 1, 1, 'admin', '127.0.0.1', 1334590539, 'Member Group Updated:&nbsp;&nbsp;Content and Member Admin'),
(85, 1, 1, 'admin', '127.0.0.1', 1334594767, 'Logged in'),
(86, 1, 1, 'admin', '127.0.0.1', 1334594806, 'Channel Created:&nbsp;&nbsp;index'),
(87, 1, 1, 'admin', '127.0.0.1', 1334596711, 'Logged out'),
(88, 1, 1, 'admin', '127.0.0.1', 1334608441, 'Logged in'),
(89, 1, 1, 'admin', '127.0.0.1', 1334653013, 'Logged in'),
(90, 1, 1, 'admin', '127.0.0.1', 1334660066, 'Logged in'),
(91, 1, 1, 'admin', '127.0.0.1', 1334660086, 'Custom Field Deleted:&nbsp;News Excerpt'),
(92, 1, 1, 'admin', '127.0.0.1', 1334676544, 'Logged in'),
(93, 1, 1, 'admin', '127.0.0.1', 1334693284, 'Logged out'),
(94, 1, 1, 'admin', '127.0.0.1', 1334738070, 'Logged in'),
(95, 1, 1, 'admin', '127.0.0.1', 1334741112, 'Logged in'),
(96, 1, 1, 'admin', '127.0.0.1', 1334748534, 'Logged out'),
(97, 1, 1, 'admin', '127.0.0.1', 1334749225, 'Logged in'),
(98, 1, 1, 'admin', '127.0.0.1', 1334756433, 'Logged in'),
(99, 1, 1, 'admin', '127.0.0.1', 1334759161, 'Logged out'),
(100, 1, 1, 'admin', '127.0.0.1', 1334760405, 'Logged in'),
(101, 1, 1, 'admin', '127.0.0.1', 1334839378, 'Logged in'),
(102, 1, 1, 'admin', '127.0.0.1', 1334856511, 'Logged in'),
(103, 1, 1, 'admin', '127.0.0.1', 1334865239, 'Logged out'),
(104, 1, 1, 'admin', '127.0.0.1', 1334865538, 'Logged in'),
(105, 1, 1, 'admin', '127.0.0.1', 1334865563, 'Logged in'),
(106, 1, 1, 'admin', '127.0.0.1', 1334865664, 'Logged in'),
(107, 1, 1, 'admin', '127.0.0.1', 1334866225, 'Logged in'),
(108, 1, 1, 'admin', '127.0.0.1', 1334866726, 'Logged in'),
(109, 1, 1, 'admin', '127.0.0.1', 1334899008, 'Logged in'),
(110, 1, 1, 'admin', '127.0.0.1', 1334901741, 'Channel Created:&nbsp;&nbsp;Footer Content'),
(111, 1, 1, 'admin', '127.0.0.1', 1334901770, 'Field Group Created:&nbsp;footer_content'),
(112, 1, 1, 'admin', '127.0.0.1', 1334909390, 'Logged in'),
(113, 1, 1, 'admin', '127.0.0.1', 1334909474, 'Logged in'),
(114, 1, 1, 'admin', '127.0.0.1', 1334914367, 'Channel Deleted:&nbsp;&nbsp;FAQ'),
(115, 1, 1, 'admin', '127.0.0.1', 1334914380, 'Field group Deleted:&nbsp;&nbsp;FAQ'),
(116, 1, 1, 'admin', '127.0.0.1', 1334924665, 'Logged in'),
(117, 1, 1, 'admin', '127.0.0.1', 1334925963, 'Logged in'),
(118, 1, 1, 'admin', '127.0.0.1', 1334995949, 'Logged in'),
(119, 1, 1, 'admin', '127.0.0.1', 1335000572, 'Logged in'),
(120, 1, 1, 'admin', '127.0.0.1', 1335005220, 'Logged in'),
(121, 1, 1, 'admin', '127.0.0.1', 1335170881, 'Logged in'),
(122, 1, 1, 'admin', '127.0.0.1', 1335177038, 'Logged in'),
(123, 1, 1, 'admin', '127.0.0.1', 1335205127, 'Logged in'),
(124, 1, 1, 'admin', '127.0.0.1', 1335206897, 'Logged in'),
(125, 1, 1, 'admin', '127.0.0.1', 1335249284, 'Logged in'),
(126, 1, 1, 'admin', '127.0.0.1', 1335251871, 'Member profile created:&nbsp;&nbsp;johndoe'),
(127, 1, 1, 'admin', '127.0.0.1', 1335256354, 'Logged in'),
(128, 1, 1, 'admin', '127.0.0.1', 1335256389, 'Member profile created:&nbsp;&nbsp;kevin'),
(129, 1, 1, 'admin', '127.0.0.1', 1335256739, 'Logged in'),
(130, 1, 1, 'admin', '127.0.0.1', 1335258344, 'Logged in'),
(131, 1, 1, 'admin', '127.0.0.1', 1335280463, 'Logged in'),
(132, 1, 1, 'admin', '127.0.0.1', 1335346888, 'Logged in'),
(133, 1, 1, 'admin', '127.0.0.1', 1335433908, 'Logged in'),
(134, 1, 1, 'admin', '127.0.0.1', 1335435598, 'Custom Field Deleted:&nbsp;Page Title'),
(135, 1, 1, 'admin', '127.0.0.1', 1335435606, 'Custom Field Deleted:&nbsp;Page Title'),
(136, 1, 1, 'admin', '127.0.0.1', 1335435615, 'Custom Field Deleted:&nbsp;Page Title'),
(137, 1, 1, 'admin', '127.0.0.1', 1335435636, 'Custom Field Deleted:&nbsp;Page Title'),
(138, 1, 1, 'admin', '127.0.0.1', 1335435653, 'Custom Field Deleted:&nbsp;Page Title'),
(139, 1, 1, 'admin', '127.0.0.1', 1335442852, 'Logged out'),
(140, 1, 1, 'admin', '127.0.0.1', 1335602797, 'Logged in'),
(141, 1, 1, 'admin', '127.0.0.1', 1335603649, 'Logged in'),
(142, 1, 1, 'admin', '127.0.0.1', 1335802247, 'Logged in'),
(143, 1, 1, 'admin', '127.0.0.1', 1335806542, 'Logged in'),
(144, 1, 1, 'admin', '127.0.0.1', 1335860991, 'Logged in'),
(145, 1, 1, 'admin', '127.0.0.1', 1335874249, 'Logged out'),
(146, 1, 1, 'admin', '127.0.0.1', 1335875406, 'Logged in'),
(147, 1, 5, 'kevin', '127.0.0.1', 1335882644, 'Logged out'),
(148, 1, 1, 'admin', '127.0.0.1', 1335887731, 'Logged in'),
(149, 1, 1, 'admin', '127.0.0.1', 1335937306, 'Logged in'),
(150, 1, 1, 'admin', '127.0.0.1', 1335939051, 'Logged in'),
(151, 1, 1, 'admin', '127.0.0.1', 1335946587, 'Channel Created:&nbsp;&nbsp;Events Page'),
(152, 1, 1, 'admin', '127.0.0.1', 1335946603, 'Field Group Created:&nbsp;events'),
(153, 1, 1, 'admin', '127.0.0.1', 1335951415, 'Field group Deleted:&nbsp;&nbsp;membership_tiers'),
(154, 1, 1, 'admin', '127.0.0.1', 1335951429, 'Channel Deleted:&nbsp;&nbsp;Membership Tiers'),
(155, 1, 1, 'admin', '127.0.0.1', 1335979869, 'Logged in'),
(156, 1, 1, 'admin', '127.0.0.1', 1336043506, 'Logged in'),
(157, 1, 1, 'admin', '127.0.0.1', 1336044345, 'Custom Field Deleted:&nbsp;test_video'),
(158, 1, 1, 'admin', '127.0.0.1', 1336058499, 'Logged in'),
(159, 1, 1, 'admin', '127.0.0.1', 1336062335, 'Logged in'),
(160, 1, 1, 'admin', '127.0.0.1', 1336466339, 'Logged in'),
(161, 1, 1, 'admin', '127.0.0.1', 1336469255, 'Logged out'),
(162, 1, 1, 'admin', '127.0.0.1', 1336469524, 'Logged in'),
(163, 1, 1, 'admin', '127.0.0.1', 1336470851, 'Channel Created:&nbsp;&nbsp;Resources Page'),
(164, 1, 1, 'admin', '127.0.0.1', 1336470885, 'Field Group Created:&nbsp;Resources'),
(165, 1, 1, 'admin', '127.0.0.1', 1336487296, 'Logged in'),
(166, 1, 1, 'admin', '127.0.0.1', 1336487561, 'Logged out'),
(167, 1, 1, 'admin', '127.0.0.1', 1336492777, 'Logged in'),
(168, 1, 1, 'admin', '127.0.0.1', 1336493733, 'Channel Deleted:&nbsp;&nbsp;Top Ups and Extras'),
(169, 1, 1, 'admin', '127.0.0.1', 1336493742, 'Field group Deleted:&nbsp;&nbsp;topups_and_extras'),
(170, 1, 1, 'admin', '127.0.0.1', 1336504513, 'Custom Field Deleted:&nbsp;Incubator Image'),
(171, 1, 1, 'admin', '127.0.0.1', 1336504519, 'Custom Field Deleted:&nbsp;Incubator Copy'),
(172, 1, 1, 'admin', '127.0.0.1', 1336504524, 'Custom Field Deleted:&nbsp;Workspace Copy'),
(173, 1, 1, 'admin', '127.0.0.1', 1336504529, 'Custom Field Deleted:&nbsp;Workspace Image'),
(174, 1, 1, 'admin', '127.0.0.1', 1336504534, 'Custom Field Deleted:&nbsp;Events Copy'),
(175, 1, 1, 'admin', '127.0.0.1', 1336504539, 'Custom Field Deleted:&nbsp;Events Image'),
(176, 1, 1, 'admin', '127.0.0.1', 1336504543, 'Custom Field Deleted:&nbsp;Membership Copy'),
(177, 1, 1, 'admin', '127.0.0.1', 1336504548, 'Custom Field Deleted:&nbsp;Membership Image'),
(178, 1, 1, 'admin', '127.0.0.1', 1336505341, 'Custom Field Deleted:&nbsp;Room 1 Heading'),
(179, 1, 1, 'admin', '127.0.0.1', 1336505350, 'Custom Field Deleted:&nbsp;Room 2 Heading'),
(180, 1, 1, 'admin', '127.0.0.1', 1336505355, 'Custom Field Deleted:&nbsp;Room 3 Heading'),
(181, 1, 1, 'admin', '127.0.0.1', 1336505360, 'Custom Field Deleted:&nbsp;Room 4 Heading'),
(182, 1, 1, 'admin', '127.0.0.1', 1336505366, 'Custom Field Deleted:&nbsp;Room 1 Copy'),
(183, 1, 1, 'admin', '127.0.0.1', 1336505371, 'Custom Field Deleted:&nbsp;Room 2 Copy'),
(184, 1, 1, 'admin', '127.0.0.1', 1336505376, 'Custom Field Deleted:&nbsp;Room 3 Copy'),
(185, 1, 1, 'admin', '127.0.0.1', 1336505381, 'Custom Field Deleted:&nbsp;Room 4 Copy'),
(186, 1, 1, 'admin', '127.0.0.1', 1336505386, 'Custom Field Deleted:&nbsp;Room 1 Image'),
(187, 1, 1, 'admin', '127.0.0.1', 1336505391, 'Custom Field Deleted:&nbsp;Room 2 Image'),
(188, 1, 1, 'admin', '127.0.0.1', 1336505396, 'Custom Field Deleted:&nbsp;Room 3 Image'),
(189, 1, 1, 'admin', '127.0.0.1', 1336505401, 'Custom Field Deleted:&nbsp;Room 4 Image'),
(190, 1, 1, 'admin', '127.0.0.1', 1336729945, 'Logged in'),
(191, 1, 1, 'admin', '127.0.0.1', 1336730040, 'Status Group Deleted:&nbsp;Membership Tiers'),
(192, 1, 1, 'admin', '127.0.0.1', 1336730043, 'Status Group Deleted:&nbsp;Statuses'),
(193, 1, 5, 'kevin', '127.0.0.1', 1336730324, 'Logged out'),
(194, 1, 1, 'admin', '127.0.0.1', 1336733850, 'Logged in'),
(195, 1, 1, 'admin', '127.0.0.1', 1336733905, 'Logged in'),
(196, 1, 1, 'admin', '127.0.0.1', 1336739195, 'Member Group Updated:&nbsp;&nbsp;Content and Member Admin'),
(197, 1, 1, 'admin', '127.0.0.1', 1336739826, 'Member profile created:&nbsp;&nbsp;marc'),
(198, 1, 1, 'admin', '127.0.0.1', 1336746302, 'Logged in'),
(199, 1, 1, 'admin', '127.0.0.1', 1336747646, 'Logged out'),
(200, 1, 1, 'admin', '127.0.0.1', 1336748495, 'Logged in'),
(201, 1, 1, 'admin', '127.0.0.1', 1336752721, 'Logged in'),
(202, 1, 1, 'admin', '127.0.0.1', 1336759256, 'Logged in'),
(203, 1, 1, 'admin', '127.0.0.1', 1337073945, 'Logged in'),
(204, 1, 1, 'admin', '127.0.0.1', 1337078749, 'Logged in'),
(205, 1, 1, 'admin', '127.0.0.1', 1337079798, 'Logged in'),
(206, 1, 1, 'admin', '127.0.0.1', 1337093648, 'Logged in'),
(207, 1, 1, 'admin', '127.0.0.1', 1337093733, 'Logged in'),
(208, 1, 1, 'admin', '127.0.0.1', 1337094250, 'Logged in'),
(209, 1, 1, 'admin', '127.0.0.1', 1337159859, 'Logged in'),
(210, 1, 1, 'admin', '127.0.0.1', 1337159950, 'Member profile created:&nbsp;&nbsp;bobuser'),
(211, 1, 1, 'admin', '127.0.0.1', 1337180990, 'Logged in'),
(212, 1, 1, 'admin', '127.0.0.1', 1337180998, 'Logged in'),
(213, 1, 1, 'admin', '127.0.0.1', 1337188259, 'Logged out'),
(214, 1, 1, 'admin', '127.0.0.1', 1337188590, 'Logged in'),
(215, 1, 1, 'admin', '127.0.0.1', 1337195724, 'Logged out'),
(216, 1, 1, 'admin', '127.0.0.1', 1337238913, 'Logged in'),
(217, 1, 1, 'admin', '127.0.0.1', 1337255237, 'Logged in'),
(218, 1, 1, 'admin', '127.0.0.1', 1337269984, 'Logged in'),
(219, 1, 1, 'admin', '127.0.0.1', 1337270701, 'Logged in'),
(220, 1, 1, 'admin', '127.0.0.1', 1337272774, 'Logged in'),
(221, 1, 1, 'admin', '127.0.0.1', 1337277946, 'Logged in'),
(222, 1, 1, 'admin', '127.0.0.1', 1337279132, 'Logged in'),
(223, 1, 1, 'admin', '127.0.0.1', 1337345905, 'Logged in'),
(224, 1, 1, 'admin', '127.0.0.1', 1337358513, 'Logged in'),
(225, 1, 1, 'admin', '127.0.0.1', 1337364345, 'Logged in'),
(226, 1, 1, 'admin', '127.0.0.1', 1337364939, 'Logged in'),
(227, 1, 1, 'admin', '127.0.0.1', 1337365095, 'Logged out'),
(228, 1, 3, 'mewe360', '127.0.0.1', 1337365109, 'Logged in'),
(229, 1, 3, 'mewe360', '127.0.0.1', 1337365250, 'Logged out'),
(230, 1, 1, 'admin', '127.0.0.1', 1337365256, 'Logged in'),
(231, 1, 1, 'admin', '127.0.0.1', 1337365603, 'Status Group Created:&nbsp;published'),
(232, 1, 1, 'admin', '127.0.0.1', 1337365919, 'Logged out'),
(233, 1, 3, 'mewe360', '127.0.0.1', 1337365926, 'Logged in'),
(234, 1, 3, 'mewe360', '127.0.0.1', 1337365986, 'Logged out'),
(235, 1, 1, 'admin', '127.0.0.1', 1337365990, 'Logged in'),
(236, 1, 1, 'admin', '127.0.0.1', 1337597304, 'Logged in'),
(237, 1, 1, 'admin', '127.0.0.1', 1337600888, 'Member profile created:&nbsp;&nbsp;test user x'),
(238, 1, 1, 'admin', '86.13.126.103', 1337601746, 'Logged in'),
(239, 1, 3, 'mewe360', '88.97.10.145', 1337601984, 'Logged in'),
(240, 1, 1, 'admin', '86.13.126.103', 1337601996, 'Logged in'),
(241, 1, 3, 'mewe360', '88.97.10.145', 1337683546, 'Logged in'),
(242, 1, 3, 'mewe360', '86.13.126.103', 1337771300, 'Logged in'),
(243, 1, 3, 'mewe360', '86.13.126.103', 1337771759, 'Logged out'),
(244, 1, 1, 'admin', '86.13.126.103', 1337771800, 'Logged in'),
(245, 1, 1, 'admin', '86.13.126.103', 1337771918, 'Member Group Updated:&nbsp;&nbsp;Content and Member Admin'),
(246, 1, 1, 'admin', '86.13.126.103', 1337771955, 'Member Group Updated:&nbsp;&nbsp;Members'),
(247, 1, 1, 'admin', '86.13.126.103', 1337771961, 'Logged out'),
(248, 1, 3, 'mewe360', '86.13.126.103', 1337772004, 'Logged in'),
(249, 1, 3, 'mewe360', '86.13.126.103', 1337772901, 'Logged out'),
(250, 1, 1, 'admin', '86.13.126.103', 1337772936, 'Logged in'),
(251, 1, 1, 'admin', '86.13.126.103', 1337772966, 'Member profile created:&nbsp;&nbsp;marc.langsman'),
(252, 1, 1, 'admin', '86.13.126.103', 1337773352, 'Member Group Updated:&nbsp;&nbsp;Content and Member Admin'),
(253, 1, 1, 'admin', '86.13.126.103', 1337773371, 'Logged out'),
(254, 1, 3, 'mewe360', '86.13.126.103', 1337773395, 'Logged in'),
(255, 1, 3, 'mewe360', '86.13.126.103', 1337775630, 'Email was changed to:&nbsp;&nbsp;admin@mewe360.com'),
(256, 1, 1, 'admin', '86.13.126.103', 1337782097, 'Logged in'),
(257, 1, 3, 'mewe360', '88.97.10.145', 1337787469, 'Logged in');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_search_index`
--

CREATE TABLE IF NOT EXISTS `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL auto_increment,
  `controller` varchar(20) default NULL,
  `method` varchar(50) default NULL,
  `language` varchar(20) default NULL,
  `access` varchar(50) default NULL,
  `keywords` text,
  PRIMARY KEY  (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_developer_log`
--

CREATE TABLE IF NOT EXISTS `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL default 'n',
  `description` text,
  `function` varchar(100) default NULL,
  `line` int(10) unsigned default NULL,
  `file` varchar(255) default NULL,
  `deprecated_since` varchar(10) default NULL,
  `use_instead` varchar(100) default NULL,
  PRIMARY KEY  (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL auto_increment,
  `cache_date` int(10) unsigned NOT NULL default '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL default 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL default 'y',
  `priority` char(1) NOT NULL default '3',
  PRIMARY KEY  (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_mg`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY  (`cache_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_ml`
--

CREATE TABLE IF NOT EXISTS `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY  (`cache_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_console_cache`
--

CREATE TABLE IF NOT EXISTS `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL auto_increment,
  `cache_date` int(10) unsigned NOT NULL default '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY  (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_tracker`
--

CREATE TABLE IF NOT EXISTS `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL auto_increment,
  `email_date` int(10) unsigned NOT NULL default '0',
  `sender_ip` varchar(16) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL default '1',
  PRIMARY KEY  (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_ping_status`
--

CREATE TABLE IF NOT EXISTS `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entry_id`,`ping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_versioning`
--

CREATE TABLE IF NOT EXISTS `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY  (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_extensions`
--

CREATE TABLE IF NOT EXISTS `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL auto_increment,
  `class` varchar(50) NOT NULL default '',
  `method` varchar(50) NOT NULL default '',
  `hook` varchar(50) NOT NULL default '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL default '10',
  `version` varchar(10) NOT NULL default '',
  `enabled` char(1) NOT NULL default 'y',
  PRIMARY KEY  (`extension_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Safecracker_ext', 'form_declaration_modify_data', 'form_declaration_modify_data', '', 10, '2.1', 'y'),
(2, 'Cp_menu_master_ext', 'cp_menu_array', 'cp_menu_array', 'a:3:{s:11:"hover_menus";s:1:"y";s:22:"hide_filter_by_channel";s:1:"y";s:15:"hidden_channels";a:8:{i:0;s:1:"1";i:1;s:2:"12";i:2;s:2:"11";i:3;s:2:"10";i:4;s:1:"3";i:5;s:1:"6";i:6;s:2:"13";i:7;s:1:"4";}}', 10, '2.2.0', 'y'),
(3, 'Draggable_ext', 'update_order', 'sessions_end', '', 10, '1.3', 'y'),
(4, 'Matrix_ext', 'channel_entries_tagdata', 'channel_entries_tagdata', '', 10, '2.2.4', 'y'),
(5, 'User_ext', 'insert_comment_start', 'insert_comment_start', '', 5, '3.3.9', 'y'),
(6, 'User_ext', 'insert_rating_start', 'insert_rating_start', '', 5, '3.3.9', 'y'),
(7, 'User_ext', 'paypalpro_payment_start', 'paypalpro_payment_start', '', 5, '3.3.9', 'y'),
(8, 'User_ext', 'freeform_module_insert_begin', 'freeform_module_insert_begin', '', 5, '3.3.9', 'y'),
(9, 'User_ext', 'cp_members_validate_members', 'cp_members_validate_members', '', 1, '3.3.9', 'y'),
(10, 'User_ext', 'publish_form_new_tabs', 'publish_form_new_tabs', '', 5, '3.3.9', 'y'),
(11, 'User_ext', 'publish_form_new_tabs_block', 'publish_form_new_tabs_block', '', 5, '3.3.9', 'y'),
(12, 'User_ext', 'submit_new_entry_end', 'submit_new_entry_end', '', 5, '3.3.9', 'y'),
(13, 'User_ext', 'delete_entries_start', 'delete_entries_start', '', 5, '3.3.9', 'y'),
(14, 'User_ext', 'sessions_end', 'sessions_end', '', 5, '3.3.9', 'y'),
(15, 'User_code_pack_ext', 'code_pack_list', 'code_pack_list', 'a:0:{}', 10, '1.0.1', 'y'),
(16, 'User_code_pack_ext', 'code_pack_install', 'code_pack_module_install_begin_user_code_pack', 'a:0:{}', 10, '1.0.1', 'y'),
(17, 'Sc_publish_redirect_ext', 'entry_submission_redirect', 'entry_submission_redirect', 'a:3:{s:15:"redirect_select";s:10:"custom_url";s:12:"redirect_url";s:8:"/mewemin";s:13:"success_flash";s:24:"Entry saved successfully";}', 5, '1.0.1', 'y'),
(18, 'System_messages_ext', 'output_show_message', 'output_show_message', 'a:1:{i:1;a:8:{s:11:"enable_ajax";s:1:"n";s:14:"bypass_success";s:1:"y";s:20:"redirect_to_template";s:1:"n";s:19:"submission_template";s:12:"site/message";s:16:"general_template";s:12:"site/message";s:13:"accessibility";s:7:"default";s:7:"actions";a:1:{i:0;s:0:"";}s:16:"action_templates";a:1:{i:0;s:0:"";}}}', 1, '2.4', 'y'),
(19, 'System_messages_ext', 'extend_output_class', 'sessions_start', 'a:1:{i:1;a:8:{s:11:"enable_ajax";s:1:"n";s:14:"bypass_success";s:1:"y";s:20:"redirect_to_template";s:1:"n";s:19:"submission_template";s:12:"site/message";s:16:"general_template";s:12:"site/message";s:13:"accessibility";s:7:"default";s:7:"actions";a:1:{i:0;s:0:"";}s:16:"action_templates";a:1:{i:0;s:0:"";}}}', 1, '2.4', 'y'),
(20, 'Md_character_count_ext', 'cp_js_end', 'cp_js_end', 'a:1:{i:1;a:3:{s:14:"field_defaults";a:27:{i:2;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:8;a:3:{s:9:"count_max";s:3:"100";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:9;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:10;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:11;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:93;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:4;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:62;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:77;a:3:{s:9:"count_max";s:3:"120";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:86;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:7;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:12;a:3:{s:9:"count_max";s:2:"50";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:95;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:13;a:3:{s:9:"count_max";s:2:"20";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:14;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:97;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:38;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:39;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:59;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:58;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:61;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:71;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:72;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:73;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:74;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:75;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:76;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}}s:3:"css";s:151:".charcounter {\n  font-size: 11px;\n  float: left;\n  clear: left;\n  padding: 6px 0 0 2px;\n  }\n\n.charcounter_err {\n  color: #933;\n  font-weight: bold;\n  }";s:6:"submit";s:15:"Update Settings";}}', 10, '2.0', 'y'),
(21, 'Md_character_count_ext', 'cp_css_end', 'cp_css_end', 'a:1:{i:1;a:3:{s:14:"field_defaults";a:27:{i:2;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:8;a:3:{s:9:"count_max";s:3:"100";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:9;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:10;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:11;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:93;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:4;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:62;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:77;a:3:{s:9:"count_max";s:3:"120";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:86;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:7;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:12;a:3:{s:9:"count_max";s:2:"50";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:95;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:13;a:3:{s:9:"count_max";s:2:"20";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:14;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:97;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:38;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:39;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:59;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:58;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:61;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:71;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:72;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:73;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:74;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:75;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:76;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}}s:3:"css";s:151:".charcounter {\n  font-size: 11px;\n  float: left;\n  clear: left;\n  padding: 6px 0 0 2px;\n  }\n\n.charcounter_err {\n  color: #933;\n  font-weight: bold;\n  }";s:6:"submit";s:15:"Update Settings";}}', 10, '2.0', 'y'),
(22, 'Md_character_count_ext', 'publish_form_channel_preferences', 'publish_form_channel_preferences', 'a:1:{i:1;a:3:{s:14:"field_defaults";a:27:{i:2;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:8;a:3:{s:9:"count_max";s:3:"100";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:9;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:10;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:11;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:93;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:4;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:62;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:77;a:3:{s:9:"count_max";s:3:"120";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:86;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:7;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:12;a:3:{s:9:"count_max";s:2:"50";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:95;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:13;a:3:{s:9:"count_max";s:2:"20";s:10:"count_type";s:5:"false";s:12:"count_format";s:0:"";}i:14;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:97;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:38;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:39;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:59;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:58;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:61;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:71;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:72;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:73;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:74;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:75;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}i:76;a:3:{s:9:"count_max";s:0:"";s:10:"count_type";s:4:"true";s:12:"count_format";s:0:"";}}s:3:"css";s:151:".charcounter {\n  font-size: 11px;\n  float: left;\n  clear: left;\n  padding: 6px 0 0 2px;\n  }\n\n.charcounter_err {\n  color: #933;\n  font-weight: bold;\n  }";s:6:"submit";s:15:"Update Settings";}}', 10, '2.0', 'y'),
(23, 'Mx_notify_control_ext', 'member_member_register', 'member_member_register', 'a:1:{i:1;a:14:{s:9:"row_order";a:1:{i:0;s:1:"1";}s:14:"trigger_name_1";s:0:"";s:9:"trigger_1";s:1:"1";s:6:"type_1";s:5:"email";s:6:"from_1";s:7:"MeWe360";s:7:"email_1";s:17:"admin@mewe360.com";s:9:"toemail_1";s:11:"{mbr_email}";s:14:"tocustomlist_1";s:0:"";s:15:"custom_fields_1";s:2:"--";s:13:"mail_format_1";s:4:"text";s:8:"sender_1";s:0:"";s:7:"title_1";s:15:"Welcome to MeWe";s:9:"tempale_1";s:2:"68";s:14:"template_alt_1";s:0:"";}}', 10, '2.3.0', 'y'),
(24, 'Mx_notify_control_ext', 'member_register_validate_members', 'member_register_validate_members', 'a:1:{i:1;a:14:{s:9:"row_order";a:1:{i:0;s:1:"1";}s:14:"trigger_name_1";s:0:"";s:9:"trigger_1";s:1:"1";s:6:"type_1";s:5:"email";s:6:"from_1";s:7:"MeWe360";s:7:"email_1";s:17:"admin@mewe360.com";s:9:"toemail_1";s:11:"{mbr_email}";s:14:"tocustomlist_1";s:0:"";s:15:"custom_fields_1";s:2:"--";s:13:"mail_format_1";s:4:"text";s:8:"sender_1";s:0:"";s:7:"title_1";s:15:"Welcome to MeWe";s:9:"tempale_1";s:2:"68";s:14:"template_alt_1";s:0:"";}}', 10, '2.3.0', 'y'),
(25, 'Mx_notify_control_ext', 'cp_members_member_create', 'cp_members_member_create', 'a:1:{i:1;a:14:{s:9:"row_order";a:1:{i:0;s:1:"1";}s:14:"trigger_name_1";s:0:"";s:9:"trigger_1";s:1:"1";s:6:"type_1";s:5:"email";s:6:"from_1";s:7:"MeWe360";s:7:"email_1";s:17:"admin@mewe360.com";s:9:"toemail_1";s:11:"{mbr_email}";s:14:"tocustomlist_1";s:0:"";s:15:"custom_fields_1";s:2:"--";s:13:"mail_format_1";s:4:"text";s:8:"sender_1";s:0:"";s:7:"title_1";s:15:"Welcome to MeWe";s:9:"tempale_1";s:2:"68";s:14:"template_alt_1";s:0:"";}}', 10, '2.3.0', 'y'),
(26, 'Mx_notify_control_ext', 'entry_submission_end', 'entry_submission_end', 'a:1:{i:1;a:14:{s:9:"row_order";a:1:{i:0;s:1:"1";}s:14:"trigger_name_1";s:0:"";s:9:"trigger_1";s:1:"1";s:6:"type_1";s:5:"email";s:6:"from_1";s:7:"MeWe360";s:7:"email_1";s:17:"admin@mewe360.com";s:9:"toemail_1";s:11:"{mbr_email}";s:14:"tocustomlist_1";s:0:"";s:15:"custom_fields_1";s:2:"--";s:13:"mail_format_1";s:4:"text";s:8:"sender_1";s:0:"";s:7:"title_1";s:15:"Welcome to MeWe";s:9:"tempale_1";s:2:"68";s:14:"template_alt_1";s:0:"";}}', 10, '2.3.0', 'y'),
(27, 'Mx_notify_control_ext', 'cp_members_validate_members', 'cp_members_validate_members', 'a:1:{i:1;a:14:{s:9:"row_order";a:1:{i:0;s:1:"1";}s:14:"trigger_name_1";s:0:"";s:9:"trigger_1";s:1:"1";s:6:"type_1";s:5:"email";s:6:"from_1";s:7:"MeWe360";s:7:"email_1";s:17:"admin@mewe360.com";s:9:"toemail_1";s:11:"{mbr_email}";s:14:"tocustomlist_1";s:0:"";s:15:"custom_fields_1";s:2:"--";s:13:"mail_format_1";s:4:"text";s:8:"sender_1";s:0:"";s:7:"title_1";s:15:"Welcome to MeWe";s:9:"tempale_1";s:2:"68";s:14:"template_alt_1";s:0:"";}}', 10, '2.3.0', 'y'),
(28, 'Mx_notify_control_ext', 'user_register_end', 'user_register_end', 'a:1:{i:1;a:14:{s:9:"row_order";a:1:{i:0;s:1:"1";}s:14:"trigger_name_1";s:0:"";s:9:"trigger_1";s:1:"1";s:6:"type_1";s:5:"email";s:6:"from_1";s:7:"MeWe360";s:7:"email_1";s:17:"admin@mewe360.com";s:9:"toemail_1";s:11:"{mbr_email}";s:14:"tocustomlist_1";s:0:"";s:15:"custom_fields_1";s:2:"--";s:13:"mail_format_1";s:4:"text";s:8:"sender_1";s:0:"";s:7:"title_1";s:15:"Welcome to MeWe";s:9:"tempale_1";s:2:"68";s:14:"template_alt_1";s:0:"";}}', 10, '2.3.0', 'y'),
(29, 'Mx_notify_control_ext', 'zoo_visitor_register', 'zoo_visitor_register', 'a:1:{i:1;a:14:{s:9:"row_order";a:1:{i:0;s:1:"1";}s:14:"trigger_name_1";s:0:"";s:9:"trigger_1";s:1:"1";s:6:"type_1";s:5:"email";s:6:"from_1";s:7:"MeWe360";s:7:"email_1";s:17:"admin@mewe360.com";s:9:"toemail_1";s:11:"{mbr_email}";s:14:"tocustomlist_1";s:0:"";s:15:"custom_fields_1";s:2:"--";s:13:"mail_format_1";s:4:"text";s:8:"sender_1";s:0:"";s:7:"title_1";s:15:"Welcome to MeWe";s:9:"tempale_1";s:2:"68";s:14:"template_alt_1";s:0:"";}}', 10, '2.3.0', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_fieldtypes`
--

CREATE TABLE IF NOT EXISTS `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) default 'n',
  PRIMARY KEY  (`fieldtype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0', 'YTowOnt9', 'n'),
(3, 'textarea', '1.0', 'YTowOnt9', 'n'),
(4, 'date', '1.0', 'YTowOnt9', 'n'),
(5, 'file', '1.0', 'YTowOnt9', 'n'),
(6, 'multi_select', '1.0', 'YTowOnt9', 'n'),
(7, 'checkboxes', '1.0', 'YTowOnt9', 'n'),
(8, 'radio', '1.0', 'YTowOnt9', 'n'),
(9, 'rel', '1.0', 'YTowOnt9', 'n'),
(10, 'low_reorder', '1.2.1', 'YTowOnt9', 'n'),
(11, 'matrix', '2.2.4', 'YTowOnt9', 'y'),
(13, 'pt_switch', '1.0.4', 'YTowOnt9', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_formatting`
--

CREATE TABLE IF NOT EXISTS `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL auto_increment,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY  (`formatting_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=304 ;

--
-- Dumping data for table `exp_field_formatting`
--

INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES
(4, 2, 'none'),
(5, 2, 'br'),
(6, 2, 'xhtml'),
(10, 4, 'none'),
(11, 4, 'br'),
(12, 4, 'xhtml'),
(13, 5, 'none'),
(14, 5, 'br'),
(15, 5, 'xhtml'),
(19, 7, 'none'),
(20, 7, 'br'),
(21, 7, 'xhtml'),
(22, 8, 'none'),
(23, 8, 'br'),
(24, 8, 'xhtml'),
(25, 9, 'none'),
(26, 9, 'br'),
(27, 9, 'xhtml'),
(28, 10, 'none'),
(29, 10, 'br'),
(30, 10, 'xhtml'),
(31, 11, 'none'),
(32, 11, 'br'),
(33, 11, 'xhtml'),
(34, 12, 'none'),
(35, 12, 'br'),
(36, 12, 'xhtml'),
(37, 13, 'none'),
(38, 13, 'br'),
(39, 13, 'xhtml'),
(40, 14, 'none'),
(41, 14, 'br'),
(42, 14, 'xhtml'),
(112, 38, 'none'),
(113, 38, 'br'),
(114, 38, 'xhtml'),
(115, 39, 'none'),
(116, 39, 'br'),
(117, 39, 'xhtml'),
(133, 45, 'none'),
(134, 45, 'br'),
(135, 45, 'xhtml'),
(172, 58, 'none'),
(173, 58, 'br'),
(174, 58, 'xhtml'),
(175, 59, 'none'),
(176, 59, 'br'),
(177, 59, 'xhtml'),
(178, 60, 'none'),
(179, 60, 'br'),
(180, 60, 'xhtml'),
(181, 61, 'none'),
(182, 61, 'br'),
(183, 61, 'xhtml'),
(184, 62, 'none'),
(185, 62, 'br'),
(186, 62, 'xhtml'),
(208, 70, 'none'),
(209, 70, 'br'),
(210, 70, 'xhtml'),
(211, 71, 'none'),
(212, 71, 'br'),
(213, 71, 'xhtml'),
(214, 72, 'none'),
(215, 72, 'br'),
(216, 72, 'xhtml'),
(217, 73, 'none'),
(218, 73, 'br'),
(219, 73, 'xhtml'),
(220, 74, 'none'),
(221, 74, 'br'),
(222, 74, 'xhtml'),
(223, 75, 'none'),
(224, 75, 'br'),
(225, 75, 'xhtml'),
(226, 76, 'none'),
(227, 76, 'br'),
(228, 76, 'xhtml'),
(229, 77, 'none'),
(230, 77, 'br'),
(231, 77, 'xhtml'),
(232, 78, 'none'),
(233, 78, 'br'),
(234, 78, 'xhtml'),
(235, 79, 'none'),
(236, 79, 'br'),
(237, 79, 'xhtml'),
(238, 80, 'none'),
(239, 80, 'br'),
(240, 80, 'xhtml'),
(241, 81, 'none'),
(242, 81, 'br'),
(243, 81, 'xhtml'),
(244, 82, 'none'),
(245, 82, 'br'),
(246, 82, 'xhtml'),
(247, 83, 'none'),
(248, 83, 'br'),
(249, 83, 'xhtml'),
(253, 85, 'none'),
(254, 85, 'br'),
(255, 85, 'xhtml'),
(256, 86, 'none'),
(257, 86, 'br'),
(258, 86, 'xhtml'),
(259, 87, 'none'),
(260, 87, 'br'),
(261, 87, 'xhtml'),
(262, 88, 'none'),
(263, 88, 'br'),
(264, 88, 'xhtml'),
(265, 89, 'none'),
(266, 89, 'br'),
(267, 89, 'xhtml'),
(268, 90, 'none'),
(269, 90, 'br'),
(270, 90, 'xhtml'),
(271, 91, 'none'),
(272, 91, 'br'),
(273, 91, 'xhtml'),
(274, 92, 'none'),
(275, 92, 'br'),
(276, 92, 'xhtml'),
(277, 93, 'none'),
(278, 93, 'br'),
(279, 93, 'xhtml'),
(280, 94, 'none'),
(281, 94, 'br'),
(282, 94, 'xhtml'),
(283, 95, 'none'),
(284, 95, 'br'),
(285, 95, 'xhtml'),
(286, 96, 'none'),
(287, 96, 'br'),
(288, 96, 'xhtml'),
(289, 97, 'none'),
(290, 97, 'br'),
(291, 97, 'xhtml'),
(292, 98, 'none'),
(293, 98, 'br'),
(294, 98, 'xhtml'),
(295, 99, 'none'),
(296, 99, 'br'),
(297, 99, 'xhtml'),
(298, 100, 'none'),
(299, 100, 'br'),
(300, 100, 'xhtml'),
(301, 101, 'none'),
(302, 101, 'br'),
(303, 101, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_groups`
--

CREATE TABLE IF NOT EXISTS `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(2, 1, 'about'),
(3, 1, 'news'),
(4, 1, 'home'),
(5, 1, 'incubator'),
(6, 1, 'workspace'),
(8, 1, 'membership'),
(11, 1, 'past_events'),
(12, 1, 'footer_content'),
(13, 1, 'events'),
(14, 1, 'resources');

-- --------------------------------------------------------

--
-- Table structure for table `exp_files`
--

CREATE TABLE IF NOT EXISTS `exp_files` (
  `file_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned default '1',
  `title` varchar(255) default NULL,
  `upload_location_id` int(4) unsigned default '0',
  `rel_path` varchar(255) default NULL,
  `mime_type` varchar(255) default NULL,
  `file_name` varchar(255) default NULL,
  `file_size` int(10) default '0',
  `description` text,
  `credit` varchar(255) default NULL,
  `location` varchar(255) default NULL,
  `uploaded_by_member_id` int(10) unsigned default '0',
  `upload_date` int(10) default NULL,
  `modified_by_member_id` int(10) unsigned default '0',
  `modified_date` int(10) default NULL,
  `file_hw_original` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `exp_files`
--

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `rel_path`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`) VALUES
(1, 1, '5.jpg', 1, '/Applications/MAMP/htdocs/MeWe_CMS/article_images/5.jpg', 'image/jpeg', '5.jpg', 114299, NULL, NULL, NULL, 1, 1333643158, 1, 1333643158, '230 400'),
(2, 1, '1.jpg', 2, '/Applications/MAMP/htdocs/MeWe_CMS/event_photos/1.jpg', 'image/jpeg', '1.jpg', 182743, NULL, NULL, NULL, 1, 1334312886, 1, 1334312886, '321 450'),
(3, 1, 'stock-photo-15002733-group-in-a-limousine-having-drinks-on-way-to-party.jpg', 2, '/Applications/MAMP/htdocs/MeWe_CMS/event_photos/stock-photo-15002733-group-in-a-limousine-having-drinks-on-way-to-party.jpg', 'image/jpeg', 'stock-photo-15002733-group-in-a-limousine-having-drinks-on-way-to-party.jpg', 69847, NULL, NULL, NULL, 1, 1334312941, 1, 1334312941, '253 380'),
(4, 1, 'stock-photo-16355867-disco-dance-happy-vintage-man-enjoy-party.jpg', 2, '/Applications/MAMP/htdocs/MeWe_CMS/event_photos/stock-photo-16355867-disco-dance-happy-vintage-man-enjoy-party.jpg', 'image/jpeg', 'stock-photo-16355867-disco-dance-happy-vintage-man-enjoy-party.jpg', 103301, NULL, NULL, NULL, 1, 1334312956, 1, 1334317073, '253 380'),
(5, 1, 'stock-photo-16854809-apple-launches-upgraded-ipod.jpg', 2, '/Applications/MAMP/htdocs/MeWe_CMS/event_photos/stock-photo-16854809-apple-launches-upgraded-ipod.jpg', 'image/jpeg', 'stock-photo-16854809-apple-launches-upgraded-ipod.jpg', 53565, NULL, NULL, NULL, 1, 1334312972, 1, 1334312972, '380 282'),
(6, 1, 'temp_file_stock-photo-16854809-apple-launches-upgraded-ipod1.jpg', 2, '/Applications/MAMP/htdocs/MeWe_CMS/event_photos/temp_file_stock-photo-16854809-apple-launches-upgraded-ipod1.jpg', 'image/jpeg', 'temp_file_stock-photo-16854809-apple-launches-upgraded-ipod1.jpg', 53565, NULL, NULL, NULL, 1, 1334312983, 1, 1334312983, '380 282'),
(7, 1, 'stock-photo-18619520-happy-man-at-a-charity-race-with-copy-space.jpg', 2, '/Applications/MAMP/htdocs/MeWe_CMS/event_photos/stock-photo-18619520-happy-man-at-a-charity-race-with-copy-space.jpg', 'image/jpeg', 'stock-photo-18619520-happy-man-at-a-charity-race-with-copy-space.jpg', 59484, NULL, NULL, NULL, 1, 1334312994, 1, 1334312994, '253 380'),
(8, 1, 'stock-photo-18830144-cinema-audience.jpg', 2, '/Applications/MAMP/htdocs/MeWe_CMS/event_photos/stock-photo-18830144-cinema-audience.jpg', 'image/jpeg', 'stock-photo-18830144-cinema-audience.jpg', 49152, NULL, NULL, NULL, 1, 1334313006, 1, 1334313006, '253 380'),
(9, 1, 'test-news-image.jpg', 1, '/Applications/MAMP/htdocs/MeWe_CMS/article_images/test-news-image.jpg', 'image/jpeg', 'test-news-image.jpg', 82278, NULL, NULL, NULL, 1, 1334481464, 1, 1334481464, '232 350'),
(10, 1, 'incubator.png', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/incubator.png', 'image/png', 'incubator.png', 70420, NULL, NULL, NULL, 1, 1334595549, 1, 1334595549, '140 220'),
(11, 1, 'consulting.jpg', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/consulting.jpg', 'image/jpeg', 'consulting.jpg', 64236, NULL, NULL, NULL, 1, 1334595623, 1, 1334595623, '253 380'),
(12, 1, 'events.jpg', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/events.jpg', 'image/jpeg', 'events.jpg', 35318, 'A programme of events designed to connect, inspire and inform.', '', '', 1, 1334595646, 3, 1337602179, '225 400'),
(13, 1, 'map.png', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/map.png', 'image/png', 'map.png', 12042, NULL, NULL, NULL, 1, 1334902659, 1, 1334902750, '200 200'),
(14, 1, 'placeholder.jpg', 4, '/Applications/MAMP/htdocs/MeWe_CMS/mewe_staff_photos/placeholder.jpg', 'image/jpeg', 'placeholder.jpg', 7588, NULL, NULL, NULL, 1, 1335272241, 1, 1335272241, '140 200'),
(15, 1, 'board_member.jpg', 4, '/Applications/MAMP/htdocs/MeWe_CMS/mewe_staff_photos/board_member.jpg', 'image/jpeg', 'board_member.jpg', 5018, NULL, NULL, NULL, 1, 1335274633, 1, 1335274633, '140 200'),
(16, 1, 'advisor.jpg', 4, '/Applications/MAMP/htdocs/MeWe_CMS/mewe_staff_photos/advisor.jpg', 'image/jpeg', 'advisor.jpg', 9574, NULL, NULL, NULL, 1, 1335274682, 1, 1335274682, '140 200'),
(17, 1, 'room1.jpg', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/room1.jpg', 'image/jpeg', 'room1.jpg', 4721, NULL, NULL, NULL, 1, 1335944876, 1, 1335944876, '115 200'),
(18, 1, 'room2.jpg', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/room2.jpg', 'image/jpeg', 'room2.jpg', 4086, NULL, NULL, NULL, 1, 1335944893, 1, 1335944893, '115 200'),
(19, 1, 'room3.jpg', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/room3.jpg', 'image/jpeg', 'room3.jpg', 6021, NULL, NULL, NULL, 1, 1335944915, 1, 1335944915, '115 200'),
(20, 1, 'room4.jpg', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/room4.jpg', 'image/jpeg', 'room4.jpg', 4782, NULL, NULL, NULL, 1, 1335944927, 1, 1335944927, '115 200'),
(21, 1, 'MeWe_Events_Programme.pdf', 5, '/Applications/MAMP/htdocs/MeWe_CMS/client_pdfs/MeWe_Events_Programme.pdf', 'application/pdf', 'MeWe_Events_Programme.pdf', 39916, NULL, NULL, NULL, 1, 1335947338, 1, 1335947338, ' '),
(22, 1, 'cinema.png', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/cinema.png', 'image/png', 'cinema.png', 47677, NULL, NULL, NULL, 1, 1335954276, 1, 1335954276, '113 200'),
(23, 1, 'openplanspace.png', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/openplanspace.png', 'image/png', 'openplanspace.png', 45066, NULL, NULL, NULL, 1, 1335954300, 1, 1335954300, '114 199'),
(24, 1, 'meetingroom.png', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/meetingroom.png', 'image/png', 'meetingroom.png', 33618, NULL, NULL, NULL, 1, 1335954320, 1, 1335954320, '114 200'),
(25, 1, 'boardroom.png', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/boardroom.png', 'image/png', 'boardroom.png', 41103, NULL, NULL, NULL, 1, 1335954338, 1, 1335954338, '115 199'),
(26, 1, 'KO_About_MeWe.mp4', 6, '/Applications/MAMP/htdocs/MeWe_CMS/videos/KO_About_MeWe.mp4', 'audio/mp4', 'KO_About_MeWe.mp4', 23357102, NULL, NULL, NULL, 1, 1336466649, 1, 1336466649, ' '),
(27, 1, '5.jpg', 3, '/Applications/MAMP/htdocs/MeWe_CMS/client_managed_site_images/5.jpg', 'image/jpeg', '5.jpg', 114299, NULL, NULL, NULL, 1, 1336469641, 1, 1336469641, '230 400'),
(28, 1, 'MeWe_Arts_Cncl.png', 7, '/Applications/MAMP/htdocs/MeWe_CMS/client_uploads/sponsor_logos/MeWe_Arts_Cncl.png', 'image/png', 'MeWe_Arts_Cncl.png', 6902, NULL, NULL, NULL, 1, 1336475884, 1, 1336475884, '70 156'),
(29, 1, 'MeWe_Ingenious.png', 7, '/Applications/MAMP/htdocs/MeWe_CMS/client_uploads/sponsor_logos/MeWe_Ingenious.png', 'image/png', 'MeWe_Ingenious.png', 3369, NULL, NULL, NULL, 1, 1336475896, 1, 1336475896, '70 102'),
(30, 1, 'MeWe_Esmee.png', 7, '/Applications/MAMP/htdocs/MeWe_CMS/client_uploads/sponsor_logos/MeWe_Esmee.png', 'image/png', 'MeWe_Esmee.png', 5652, NULL, NULL, NULL, 1, 1336475908, 1, 1336475908, '70 101'),
(31, 1, 'stock-photo-16355867-disco-dance-happy-vintage-man-enjoy-party.jpg', 1, '/Applications/MAMP/htdocs/MeWe_CMS/client_uploads/article_images/stock-photo-16355867-disco-dance-happy-vintage-man-enjoy-party.jpg', 'image/jpeg', 'stock-photo-16355867-disco-dance-happy-vintage-man-enjoy-party.jpg', 103301, NULL, NULL, NULL, 1, 1337272802, 1, 1337272802, '253 380'),
(32, 1, 'membership.jpg', 3, '/home/mewe360/public_html/client_uploads/site_images/membership.jpg', 'image/jpeg', 'membership.jpg', 46316, 'Three levels of subsidised membership so that you can access exactly what you need when you need it.', '', '', 3, 1337602026, 3, 1337787538, '394 700'),
(34, 1, 'openplanspace.jpg', 3, '/home/mewe360/public_html/client_uploads/site_images/openplanspace.jpg', 'image/jpeg', 'openplanspace.jpg', 36475, 'A generous open plan space overlooking one of the premium squares in central London. Facilities include presentation screen, photocopier, printer, WiFi and kitchen.', '', '', 3, 1337602196, 3, 1337602744, '225 400'),
(35, 1, 'workspace.jpg', 3, '/home/mewe360/public_html/client_uploads/site_images/workspace.jpg', 'image/jpeg', 'workspace.jpg', 50627, 'A professional work, meeting and event space.', '', '', 3, 1337602245, 3, 1337602493, '394 700'),
(36, 1, 'boardroom.jpg', 3, '/home/mewe360/public_html/client_uploads/site_images/boardroom.jpg', 'image/jpeg', 'boardroom.jpg', 12411, 'With full audio, video and presentation equipment this is an impressive space to host that important meeting, presentation or small event.', '', '', 3, 1337602653, 3, 1337602674, '225 400'),
(37, 1, 'cinema.jpg', 3, '/home/mewe360/public_html/client_uploads/site_images/cinema.jpg', 'image/jpeg', 'cinema.jpg', 41585, 'An ultra stylish contemporary cinema seating 41 people in luxury and comfort.', '', '', 3, 1337602689, 3, 1337602706, '225 400'),
(39, 1, 'E_010412_001.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/E_010412_001.jpg', 'image/jpeg', 'E_010412_001.jpg', 10240, NULL, NULL, NULL, 3, 1337602900, 3, 1337602900, '225 400'),
(40, 1, 'E_010412_002.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/E_010412_002.jpg', 'image/jpeg', 'E_010412_002.jpg', 16343, NULL, NULL, NULL, 3, 1337602912, 3, 1337602912, '225 400'),
(41, 1, 'E_010412_003.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/E_010412_003.jpg', 'image/jpeg', 'E_010412_003.jpg', 11336, NULL, NULL, NULL, 3, 1337602922, 3, 1337602922, '225 400'),
(42, 1, 'E_010412_004.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/E_010412_004.jpg', 'image/jpeg', 'E_010412_004.jpg', 13097, NULL, NULL, NULL, 3, 1337602932, 3, 1337602932, '225 400'),
(43, 1, 'E_010412_005.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/E_010412_005.jpg', 'image/jpeg', 'E_010412_005.jpg', 9124, NULL, NULL, NULL, 3, 1337602945, 3, 1337602945, '225 400'),
(44, 1, 'E_010412_006.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/E_010412_006.jpg', 'image/jpeg', 'E_010412_006.jpg', 9615, NULL, NULL, NULL, 3, 1337602956, 3, 1337602956, '225 400'),
(45, 1, 'E_010412_007.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/E_010412_007.jpg', 'image/jpeg', 'E_010412_007.jpg', 9748, NULL, NULL, NULL, 3, 1337602969, 3, 1337602969, '225 400'),
(46, 1, 'E_010412_008.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/E_010412_008.jpg', 'image/jpeg', 'E_010412_008.jpg', 9830, NULL, NULL, NULL, 3, 1337602988, 3, 1337602988, '225 400'),
(47, 1, 'E_010412_009.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/E_010412_009.jpg', 'image/jpeg', 'E_010412_009.jpg', 10189, NULL, NULL, NULL, 3, 1337602999, 3, 1337602999, '225 400'),
(48, 1, 'PD_010412_001.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/PD_010412_001.jpg', 'image/jpeg', 'PD_010412_001.jpg', 12308, NULL, NULL, NULL, 3, 1337603020, 3, 1337603020, '225 400'),
(49, 1, 'PD_010412_002.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/PD_010412_002.jpg', 'image/jpeg', 'PD_010412_002.jpg', 7352, NULL, NULL, NULL, 3, 1337603032, 3, 1337603032, '225 400'),
(50, 1, 'PD_010412_003.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/PD_010412_003.jpg', 'image/jpeg', 'PD_010412_003.jpg', 8489, NULL, NULL, NULL, 3, 1337603046, 3, 1337603046, '225 400'),
(51, 1, 'PD_010412_004.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/PD_010412_004.jpg', 'image/jpeg', 'PD_010412_004.jpg', 14152, NULL, NULL, NULL, 3, 1337603058, 3, 1337603058, '225 400'),
(52, 1, 'PD_010412_006.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/PD_010412_006.jpg', 'image/jpeg', 'PD_010412_006.jpg', 10854, NULL, NULL, NULL, 3, 1337603071, 3, 1337603071, '225 400'),
(53, 1, 'PD_010412_005.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/PD_010412_005.jpg', 'image/jpeg', 'PD_010412_005.jpg', 8622, NULL, NULL, NULL, 3, 1337603090, 3, 1337603090, '225 400'),
(54, 1, 'PD_010412_007.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/PD_010412_007.jpg', 'image/jpeg', 'PD_010412_007.jpg', 11121, NULL, NULL, NULL, 3, 1337603123, 3, 1337603123, '225 400'),
(55, 1, 'PD_010412_008.jpg', 2, '/home/mewe360/public_html/client_uploads/event_photos/PD_010412_008.jpg', 'image/jpeg', 'PD_010412_008.jpg', 9646, NULL, NULL, NULL, 3, 1337603136, 3, 1337603136, '225 400');

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_categories`
--

CREATE TABLE IF NOT EXISTS `exp_file_categories` (
  `file_id` int(10) unsigned default NULL,
  `cat_id` int(10) unsigned default NULL,
  `sort` int(10) unsigned default '0',
  `is_cover` char(1) default 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_dimensions`
--

CREATE TABLE IF NOT EXISTS `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned default '1',
  `upload_location_id` int(4) unsigned default NULL,
  `title` varchar(255) default '',
  `short_name` varchar(255) default '',
  `resize_type` varchar(50) default '',
  `width` int(10) default '0',
  `height` int(10) default '0',
  `watermark_id` int(4) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_watermarks`
--

CREATE TABLE IF NOT EXISTS `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL auto_increment,
  `wm_name` varchar(80) default NULL,
  `wm_type` varchar(10) default 'text',
  `wm_image_path` varchar(100) default NULL,
  `wm_test_image_path` varchar(100) default NULL,
  `wm_use_font` char(1) default 'y',
  `wm_font` varchar(30) default NULL,
  `wm_font_size` int(3) unsigned default NULL,
  `wm_text` varchar(100) default NULL,
  `wm_vrt_alignment` varchar(10) default 'top',
  `wm_hor_alignment` varchar(10) default 'left',
  `wm_padding` int(3) unsigned default NULL,
  `wm_opacity` int(3) unsigned default NULL,
  `wm_hor_offset` int(4) unsigned default NULL,
  `wm_vrt_offset` int(4) unsigned default NULL,
  `wm_x_transp` int(4) default NULL,
  `wm_y_transp` int(4) default NULL,
  `wm_font_color` varchar(7) default NULL,
  `wm_use_drop_shadow` char(1) default 'y',
  `wm_shadow_distance` int(3) unsigned default NULL,
  `wm_shadow_color` varchar(7) default NULL,
  PRIMARY KEY  (`wm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_attachments`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_attachments` (
  `attachment_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned NOT NULL default '0',
  `pref_id` int(10) unsigned NOT NULL default '0',
  `entry_date` int(10) NOT NULL default '0',
  `server_path` varchar(150) NOT NULL default '',
  `filename` varchar(150) NOT NULL default '',
  `extension` varchar(7) NOT NULL default '',
  `filesize` int(10) NOT NULL default '1',
  `emailed` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`attachment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `pref_id` (`pref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_entries`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_entries` (
  `entry_id` int(10) unsigned NOT NULL auto_increment,
  `group_id` int(10) unsigned NOT NULL default '0',
  `weblog_id` int(4) unsigned NOT NULL default '0',
  `author_id` int(10) unsigned NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `form_name` varchar(50) NOT NULL default '',
  `template` varchar(150) NOT NULL default '',
  `entry_date` int(10) NOT NULL default '0',
  `edit_date` int(10) NOT NULL default '0',
  `status` char(10) NOT NULL default 'open',
  `first_name` varchar(150) NOT NULL default '',
  `last_name` varchar(150) NOT NULL default '',
  `email` varchar(150) NOT NULL default '',
  `phone_number` varchar(150) NOT NULL default '',
  `creative_industry` varchar(150) NOT NULL default '',
  `membership_type` varchar(150) NOT NULL default '',
  `business_stage` varchar(150) NOT NULL default '',
  `message` text NOT NULL,
  `subject` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`entry_id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `exp_freeform_entries`
--

INSERT INTO `exp_freeform_entries` (`entry_id`, `group_id`, `weblog_id`, `author_id`, `ip_address`, `form_name`, `template`, `entry_date`, `edit_date`, `status`, `first_name`, `last_name`, `email`, `phone_number`, `creative_industry`, `membership_type`, `business_stage`, `message`, `subject`) VALUES
(1, 1, 0, 1, '127.0.0.1', 'Contact Us', 'default_template', 1334759025, 1334759025, 'open', '', '', 'bob@tiger.com', '', '', '', '', '', ''),
(2, 1, 0, 1, '127.0.0.1', 'Contact Us', 'default_template', 1334759068, 1334759068, 'open', '', '', 'bob@tiger.com', '', '', '', '', '', ''),
(3, 1, 0, 1, '127.0.0.1', 'Contact Us', 'default_template', 1334762147, 1334762147, 'open', '', '', 'tiger@bob.com', '', '', '', '', '', ''),
(4, 1, 0, 1, '127.0.0.1', 'Sign Up', 'default_template', 1335206598, 1335206598, 'open', 'aaaa', 'S', 'bob@cvhicken.com', 'qeqe', 'Design', 'Hub', '', '', ''),
(5, 1, 0, 1, '127.0.0.1', 'Sign Up', 'default_template', 1336049698, 1336049698, 'open', 'Testing', 'Tester', 'bob@testing.com', '123', 'Design', 'Network', 'Established over 1 year', '', ''),
(6, 3, 0, 0, '127.0.0.1', 'Sign Up', 'default_template', 1337074550, 1337074550, 'open', 'Marc', 'Langsamn', 'marc@langsman.com', '123', 'Design', 'Network', 'Start-up', '', ''),
(7, 3, 0, 0, '127.0.0.1', 'Contact Us', 'default_template', 1337076783, 1337076783, 'open', '', '', 'marc@langsman.com', '', '', '', '', '', ''),
(8, 3, 0, 0, '127.0.0.1', 'Contact Us', 'default_template', 1337079314, 1337079314, 'open', '', '', 'marc@langsman.com', '', '', '', '', 'blah blah \n                   ', 'test message'),
(9, 5, 0, 5, '127.0.0.1', 'Contact Us', 'default_template', 1337277879, 1337277879, 'open', '', '', 'bob@chicken.com', '', '', '', '', '123\n                   ', 'TESTING'),
(10, 1, 0, 1, '127.0.0.1', 'Contact Us', 'mewe_notification_template', 1337278715, 1337278715, 'open', '', '', 'tiger@chickenland.com', '', '', '', '', 'the messagee', '123'),
(11, 1, 0, 1, '127.0.0.1', 'Contact Us', 'mewe_notification_template', 1337278836, 1337278836, 'open', '', '', '123@lsk.com', '', '', '', '', 'qweqwe', 'sdfsff'),
(12, 3, 0, 0, '127.0.0.1', 'Sign Up', 'mewe_notification_template', 1337279093, 1337279093, 'open', 'bob', 'tiger', 'tiger@booya.com', '123', 'Design', 'Network', 'Pre start-up / concept development', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_fields`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_fields` (
  `field_id` int(10) unsigned NOT NULL auto_increment,
  `field_order` int(10) NOT NULL default '0',
  `field_type` varchar(50) NOT NULL default 'text',
  `field_length` int(3) NOT NULL default '150',
  `form_name` varchar(50) NOT NULL default '',
  `name` varchar(50) NOT NULL default '',
  `name_old` varchar(50) NOT NULL default '',
  `label` varchar(100) NOT NULL default '',
  `weblog_id` int(4) unsigned NOT NULL default '0',
  `author_id` int(10) unsigned NOT NULL default '0',
  `entry_date` int(10) NOT NULL default '0',
  `edit_date` int(10) NOT NULL default '0',
  `editable` char(1) NOT NULL default 'y',
  `status` char(10) NOT NULL default 'open',
  PRIMARY KEY  (`field_id`),
  KEY `name` (`name`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `exp_freeform_fields`
--

INSERT INTO `exp_freeform_fields` (`field_id`, `field_order`, `field_type`, `field_length`, `form_name`, `name`, `name_old`, `label`, `weblog_id`, `author_id`, `entry_date`, `edit_date`, `editable`, `status`) VALUES
(14, 1, 'text', 150, '', 'first_name', '', 'First Name', 0, 0, 0, 0, 'y', 'open'),
(15, 2, 'text', 150, '', 'last_name', '', 'Last Name', 0, 0, 0, 0, 'y', 'open'),
(16, 3, 'text', 150, '', 'email', '', 'Email', 0, 0, 0, 0, 'y', 'open'),
(17, 4, 'text', 150, '', 'phone_number', '', 'Phone Number', 0, 0, 0, 0, 'y', 'open'),
(18, 5, 'text', 150, '', 'creative_industry', '', 'Creative Industry', 0, 0, 0, 0, 'y', 'open'),
(19, 6, 'text', 150, '', 'membership_type', '', 'Membership Type', 0, 0, 0, 0, 'y', 'open'),
(20, 7, 'text', 150, '', 'business_stage', '', 'Business Stage', 0, 0, 0, 0, 'y', 'open'),
(21, 8, 'textarea', 1024, '', 'message', '', 'Message', 0, 0, 0, 0, 'y', 'open'),
(22, 9, 'text', 200, '', 'subject', '', 'Subject', 0, 0, 0, 0, 'y', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_params`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_params` (
  `params_id` int(10) unsigned NOT NULL auto_increment,
  `entry_date` int(10) NOT NULL default '0',
  `data` text NOT NULL,
  PRIMARY KEY  (`params_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=109 ;

--
-- Dumping data for table `exp_freeform_params`
--

INSERT INTO `exp_freeform_params` (`params_id`, `entry_date`, `data`) VALUES
(107, 1337776374, 'a:24:{s:15:"require_captcha";s:2:"no";s:9:"form_name";s:7:"Sign Up";s:10:"require_ip";s:0:"";s:11:"ee_required";s:0:"";s:9:"ee_notify";s:17:"marc@projoosr.com";s:18:"allowed_file_types";s:0:"";s:8:"reply_to";b:0;s:20:"reply_to_email_field";s:0:"";s:19:"reply_to_name_field";s:0:"";s:11:"output_json";s:1:"n";s:12:"ajax_request";s:1:"y";s:10:"recipients";s:1:"n";s:15:"recipient_limit";s:2:"10";s:17:"static_recipients";b:0;s:22:"static_recipients_list";a:0:{}s:18:"recipient_template";s:16:"default_template";s:13:"discard_field";s:0:"";s:15:"send_attachment";s:0:"";s:15:"send_user_email";s:3:"yes";s:20:"send_user_attachment";s:0:"";s:19:"user_email_template";s:13:"mewe_template";s:8:"template";s:26:"mewe_notification_template";s:20:"prevent_duplicate_on";s:0:"";s:11:"file_upload";s:0:"";}'),
(108, 1337781826, 'a:24:{s:15:"require_captcha";s:2:"no";s:9:"form_name";s:7:"Sign Up";s:10:"require_ip";s:0:"";s:11:"ee_required";s:0:"";s:9:"ee_notify";s:17:"marc@projoosr.com";s:18:"allowed_file_types";s:0:"";s:8:"reply_to";b:0;s:20:"reply_to_email_field";s:0:"";s:19:"reply_to_name_field";s:0:"";s:11:"output_json";s:1:"n";s:12:"ajax_request";s:1:"y";s:10:"recipients";s:1:"n";s:15:"recipient_limit";s:2:"10";s:17:"static_recipients";b:0;s:22:"static_recipients_list";a:0:{}s:18:"recipient_template";s:16:"default_template";s:13:"discard_field";s:0:"";s:15:"send_attachment";s:0:"";s:15:"send_user_email";s:3:"yes";s:20:"send_user_attachment";s:0:"";s:19:"user_email_template";s:13:"mewe_template";s:8:"template";s:26:"mewe_notification_template";s:20:"prevent_duplicate_on";s:0:"";s:11:"file_upload";s:0:"";}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_preferences`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_preferences` (
  `preference_id` int(10) unsigned NOT NULL auto_increment,
  `preference_name` varchar(80) NOT NULL default '',
  `preference_value` text NOT NULL,
  PRIMARY KEY  (`preference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_templates`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_templates` (
  `template_id` int(6) unsigned NOT NULL auto_increment,
  `enable_template` char(1) NOT NULL default 'y',
  `wordwrap` char(1) NOT NULL default 'y',
  `html` char(1) NOT NULL default 'n',
  `template_name` varchar(150) NOT NULL default '',
  `template_label` varchar(150) NOT NULL default '',
  `data_from_name` varchar(150) NOT NULL default '',
  `data_from_email` varchar(200) NOT NULL default '',
  `data_title` varchar(80) NOT NULL default '',
  `template_data` text NOT NULL,
  PRIMARY KEY  (`template_id`),
  KEY `template_name` (`template_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_freeform_templates`
--

INSERT INTO `exp_freeform_templates` (`template_id`, `enable_template`, `wordwrap`, `html`, `template_name`, `template_label`, `data_from_name`, `data_from_email`, `data_title`, `template_data`) VALUES
(1, 'y', 'y', 'n', 'default_template', 'Default Template', '', '', 'Someone has posted to Freeform', 'Someone has posted to Freeform. Here are the details:  \n			 		\nEntry Date: {entry_date}\n{all_custom_fields}'),
(2, 'y', 'n', 'n', 'mewe_template', 'Mewe Email Template', 'The MeWe360 Team', 'admin@mewe360.com', 'Thanks for contacting us!', 'This is just a quick note to let you know that we have received your message! \n\nWe get back to everyone personally so please bear with us for a few days and one of our team will drop you a line.\n\nSpeak Soon ! \n\nThe MeWe360 Team'),
(3, 'y', 'n', 'n', 'mewe_notification_template', 'MeWe Notification Template', '', '', 'MeWe Website Enquiry', 'Someone has posted to the MeWe Website.\n\nHere are the details:\n\nDate: {entry_date}\n\n{all_custom_fields}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_freeform_user_email`
--

CREATE TABLE IF NOT EXISTS `exp_freeform_user_email` (
  `email_id` int(10) unsigned NOT NULL auto_increment,
  `entry_id` int(10) unsigned NOT NULL default '0',
  `email_count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_global_variables`
--

CREATE TABLE IF NOT EXISTS `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY  (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_global_variables`
--

INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES
(1, 1, 'user_theme_folder_url', 'http://mewe_cms.local/themes/third_party/code_pack/user/default/');

-- --------------------------------------------------------

--
-- Table structure for table `exp_greeny`
--

CREATE TABLE IF NOT EXISTS `exp_greeny` (
  `greeny_id` int(10) unsigned NOT NULL auto_increment,
  `dir_path` varchar(1024) default NULL,
  `env_key` varchar(15) default NULL,
  PRIMARY KEY  (`greeny_id`),
  KEY `dir_path` (`dir_path`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_greeny`
--

INSERT INTO `exp_greeny` (`greeny_id`, `dir_path`, `env_key`) VALUES
(1, '/Applications/MAMP/htdocs/MeWe_CMS/', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_html_buttons`
--

CREATE TABLE IF NOT EXISTS `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) NOT NULL default '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL default '1',
  `classname` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'b', '<strong>', '</strong>', 'b', 1, '1', 'btn_b'),
(2, 1, 0, 'i', '<em>', '</em>', 'i', 2, '1', 'btn_i'),
(3, 1, 0, 'blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'btn_blockquote'),
(4, 1, 0, 'a', '<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', '</a>', 'a', 4, '1', 'btn_a'),
(5, 1, 0, 'img', '<img src="[![Link:!:http://]!]" alt="[![Alternative text]!]" />', '', '', 5, '1', 'btn_img');

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish`
--

CREATE TABLE IF NOT EXISTS `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_group` int(4) unsigned NOT NULL default '0',
  `channel_id` int(4) unsigned NOT NULL default '0',
  `field_layout` text,
  PRIMARY KEY  (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

--
-- Dumping data for table `exp_layout_publish`
--

INSERT INTO `exp_layout_publish` (`layout_id`, `site_id`, `member_group`, `channel_id`, `field_layout`) VALUES
(31, 1, 1, 9, 'a:2:{s:7:"publish";a:14:{s:10:"_tab_label";s:7:"Publish";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:45;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:59;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:58;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:60;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:61;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:4:{s:10:"_tab_label";s:4:"Date";s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(32, 1, 6, 9, 'a:2:{s:7:"publish";a:14:{s:10:"_tab_label";s:7:"Publish";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:45;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:59;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:58;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:60;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:61;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:4:{s:10:"_tab_label";s:4:"Date";s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(35, 1, 1, 2, 'a:1:{s:7:"publish";a:15:{s:10:"_tab_label";s:7:"Publish";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:62;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:5;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:4;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(36, 1, 6, 2, 'a:1:{s:7:"publish";a:15:{s:10:"_tab_label";s:7:"Publish";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:62;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:5;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:4;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(73, 1, 1, 12, 'a:2:{s:7:"publish";a:9:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:82;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:5:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(74, 1, 6, 12, 'a:2:{s:7:"publish";a:9:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:82;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:5:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(75, 1, 1, 13, 'a:2:{s:7:"publish";a:9:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:88;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"20%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"20%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"40%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:5:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"60%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"30%";}}}'),
(76, 1, 6, 13, 'a:2:{s:7:"publish";a:9:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:88;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"20%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"20%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"40%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:5:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"60%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"30%";}}}'),
(89, 1, 1, 11, 'a:2:{s:7:"publish";a:17:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"20%";}i:70;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"60%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"20%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"50%";}i:71;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:72;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:73;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:74;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:75;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:76;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:89;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:100;a:4:{s:7:"visible";s:4:"true";s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}}s:4:"date";a:5:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(90, 1, 6, 11, 'a:2:{s:7:"publish";a:17:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"20%";}i:70;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"60%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"20%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"50%";}i:71;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:72;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:73;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:74;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:75;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:76;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:89;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:100;a:4:{s:7:"visible";s:4:"true";s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}}s:4:"date";a:5:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(99, 1, 1, 3, 'a:2:{s:7:"publish";a:13:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:12;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:7;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:94;a:4:{s:7:"visible";s:4:"true";s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:95;a:4:{s:7:"visible";s:4:"true";s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:101;a:4:{s:7:"visible";s:4:"true";s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}}s:4:"date";a:4:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"90%";}}}'),
(100, 1, 6, 3, 'a:2:{s:7:"publish";a:13:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:12;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:7;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:94;a:4:{s:7:"visible";s:4:"true";s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:95;a:4:{s:7:"visible";s:4:"true";s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:101;a:4:{s:7:"visible";s:4:"true";s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}}s:4:"date";a:4:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"90%";}}}'),
(101, 1, 1, 6, 'a:2:{s:7:"publish";a:14:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:38;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:39;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:91;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:78;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:83;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:90;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:4:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(102, 1, 6, 6, 'a:2:{s:7:"publish";a:14:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:38;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:39;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:91;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:78;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:83;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:90;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:4:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(107, 1, 1, 1, 'a:2:{s:7:"publish";a:19:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:93;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:92;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:2;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:8;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:9;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:10;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:11;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:79;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:80;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:81;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:85;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:4:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(108, 1, 6, 1, 'a:2:{s:7:"publish";a:19:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:93;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:92;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:2;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:8;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:9;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:10;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:11;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:79;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:80;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:81;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:85;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:4:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(109, 1, 1, 4, 'a:2:{s:7:"publish";a:13:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:13;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:97;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:96;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:14;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:99;a:4:{s:7:"visible";s:4:"true";s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}}s:4:"date";a:5:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(110, 1, 6, 4, 'a:2:{s:7:"publish";a:13:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:13;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:97;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:96;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:14;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:99;a:4:{s:7:"visible";s:4:"true";s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}}s:4:"date";a:5:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}}'),
(111, 1, 1, 10, 'a:2:{s:7:"publish";a:12:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:77;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:86;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:87;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:98;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:5:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"40%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"30%";}}}'),
(112, 1, 6, 10, 'a:2:{s:7:"publish";a:12:{s:10:"_tab_label";s:7:"Publish";s:9:"url_title";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:77;a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:0;s:5:"width";s:4:"100%";}i:86;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:87;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:8:"category";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:11:"new_channel";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"status";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:6:"author";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:7:"options";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:4:"ping";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}i:98;a:4:{s:7:"visible";b:1;s:8:"collapse";b:1;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}}s:4:"date";a:5:{s:10:"_tab_label";s:4:"Date";s:5:"title";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:10:"entry_date";a:4:{s:7:"visible";b:1;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:4:"100%";}s:15:"expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"40%";}s:23:"comment_expiration_date";a:4:{s:7:"visible";b:0;s:8:"collapse";b:0;s:11:"htmlbuttons";b:1;s:5:"width";s:3:"30%";}}}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_low_reorder_settings`
--

CREATE TABLE IF NOT EXISTS `exp_low_reorder_settings` (
  `channel_id` int(6) unsigned NOT NULL,
  `field_id` int(6) unsigned NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY  (`channel_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_low_reorder_settings`
--

INSERT INTO `exp_low_reorder_settings` (`channel_id`, `field_id`, `settings`) VALUES
(7, 44, 'YTo3OntzOjEwOiJjYXRlZ29yaWVzIjtzOjA6IiI7czo4OiJzdGF0dXNlcyI7czowOiIiO3M6MTI6InNob3dfZXhwaXJlZCI7czoxOiJ5IjtzOjExOiJzaG93X2Z1dHVyZSI7czoxOiJ5IjtzOjEwOiJzb3J0X29yZGVyIjtzOjM6ImFzYyI7czoxMToiY2xlYXJfY2FjaGUiO3M6MToibiI7czoxMToicGVybWlzc2lvbnMiO2I6MDt9'),
(8, 43, 'YTo3OntzOjEwOiJjYXRlZ29yaWVzIjtzOjA6IiI7czo4OiJzdGF0dXNlcyI7czowOiIiO3M6MTI6InNob3dfZXhwaXJlZCI7czoxOiJ5IjtzOjExOiJzaG93X2Z1dHVyZSI7czoxOiJ5IjtzOjEwOiJzb3J0X29yZGVyIjtzOjM6ImFzYyI7czoxMToiY2xlYXJfY2FjaGUiO3M6MToibiI7czoxMToicGVybWlzc2lvbnMiO2I6MDt9');

-- --------------------------------------------------------

--
-- Table structure for table `exp_matrix_cols`
--

CREATE TABLE IF NOT EXISTS `exp_matrix_cols` (
  `col_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned default '1',
  `field_id` int(6) unsigned default NULL,
  `col_name` varchar(32) default NULL,
  `col_label` varchar(50) default NULL,
  `col_instructions` text,
  `col_type` varchar(50) default 'text',
  `col_required` char(1) default 'n',
  `col_search` char(1) default 'n',
  `col_order` int(3) unsigned default NULL,
  `col_width` varchar(4) default NULL,
  `col_settings` text,
  PRIMARY KEY  (`col_id`),
  KEY `site_id` (`site_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `exp_matrix_cols`
--

INSERT INTO `exp_matrix_cols` (`col_id`, `site_id`, `field_id`, `col_name`, `col_label`, `col_instructions`, `col_type`, `col_required`, `col_search`, `col_order`, `col_width`, `col_settings`) VALUES
(1, 1, 60, 'image', 'image', 'Add the images for this event here', 'file', 'n', 'n', 0, '100%', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiIyIjtzOjEyOiJjb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO30='),
(2, 1, 70, 'image', 'Map Image', 'This image should be 200x200 pixels in size', 'file', 'y', 'n', 0, '33%', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiIzIjtzOjEyOiJjb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO30='),
(3, 1, 78, 'question', 'Question', '', 'text', 'y', 'y', 0, '33%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(4, 1, 78, 'answer', 'Answer', '', 'text', 'y', 'y', 1, '', 'YTozOntzOjQ6Im1heGwiO3M6MzoiMTQwIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(5, 1, 79, 'name', 'Name', 'Enter the team member''s name', 'text', 'y', 'y', 0, '25%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(6, 1, 79, 'photo', 'Photo', 'Please choose a photo for this person', 'file', 'y', 'n', 2, '25%', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiI0IjtzOjEyOiJjb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO30='),
(7, 1, 79, 'video', 'Video', 'Please enter a vimeo url. If this is not provided only the photo will be shown', 'text', 'n', 'n', 3, '25%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(16, 1, 79, 'bio', 'Bio', 'A short description of this person''s role or biog.', 'text', 'y', 'n', 1, '25%', 'YTo0OntzOjQ6Im1heGwiO3M6MzoiMjUwIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(17, 1, 80, 'name', 'Name', 'Enter the board member''s name', 'text', 'y', 'y', 0, '33%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(18, 1, 80, 'photo', 'Photo', 'Please choose a photo for this person', 'file', 'y', 'n', 2, '', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiI0IjtzOjEyOiJjb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO30='),
(19, 1, 80, 'video', 'Video', 'Please enter a Vimeo url. If this is not provided only their photo will be shown', 'text', 'n', 'n', 3, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(20, 1, 80, 'bio', 'Bio', 'A short description of this person''s role or biog.', 'text', 'n', 'n', 1, '', 'YTo0OntzOjQ6Im1heGwiO3M6MzoiMjUwIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(21, 1, 81, 'name', 'Name', 'Enter the advisors name', 'text', 'y', 'y', 0, '33%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(22, 1, 81, 'photo', 'Photo', 'Please choose a photo for this person', 'file', 'y', 'n', 2, '', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiI0IjtzOjEyOiJjb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO30='),
(23, 1, 81, 'video', 'Video', 'Please enter a Vimeo url. If this is not provided only their photo will be shown', 'text', 'n', 'n', 3, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(24, 1, 81, 'bio', 'Bio', 'A short description of this person''s role or biog.', 'text', 'n', 'n', 1, '', 'YTo0OntzOjQ6Im1heGwiO3M6MzoiMjUwIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(25, 1, 83, 'membership_tier_name', 'Tier Name', 'This is the name of the membership tier (hub, club, etc)', 'text', 'y', 'n', 0, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(26, 1, 83, 'membership_primary_description', 'Primary Option Description', 'This is the description for this option (e.g 12 months membership)', 'text', 'y', 'n', 1, '', 'YTo0OntzOjQ6Im1heGwiO3M6MzoiMTQwIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(27, 1, 83, 'membership_primary_price', 'Primary Option Price', 'The price for each period (e.g. month). Please make sure to include a £/€ currency symbol.', 'text', 'y', 'n', 2, '', 'YTozOntzOjQ6Im1heGwiO3M6MToiNyI7czozOiJmbXQiO3M6NDoibm9uZSI7czo3OiJjb250ZW50IjtzOjM6ImFsbCI7fQ=='),
(28, 1, 83, 'membership_primary_period', 'Primary Option Period', 'The price breakdown period (e.g month)', 'text', 'y', 'n', 3, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(29, 1, 83, 'membership_secondary_description', 'Secondary Option Description', 'This is the description for this option (e.g 6 months membership)', 'text', 'y', 'n', 4, '', 'YTo0OntzOjQ6Im1heGwiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(30, 1, 83, 'membership_secondary_price', 'Secondary Option Price', 'The price for each period (e.g. month). Please make sure to include a £/€ currency symbol.', 'text', 'n', 'n', 5, '', 'YTozOntzOjQ6Im1heGwiO3M6MToiNyI7czozOiJmbXQiO3M6NDoibm9uZSI7czo3OiJjb250ZW50IjtzOjM6ImFsbCI7fQ=='),
(31, 1, 83, 'membership_secondary_period', 'Secondary Option Period', 'The price breakdown period (e.g month)', 'text', 'n', 'n', 6, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(32, 1, 83, 'membership_feature_1', 'Feature 1', '1st feature in the comparison table', 'text', 'y', 'n', 7, '', 'YTo0OntzOjQ6Im1heGwiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(33, 1, 83, 'membership_feature_2', 'Feature 2', '2nd feature in the comparison table', 'text', 'y', 'n', 8, '', 'YTo0OntzOjQ6Im1heGwiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(34, 1, 83, 'membership_differentiator', 'Feature Differentiator', 'This is used to create a feature in a different colour. (for example you might add ''access to investment'' to one of the tiers).', 'text', 'n', 'n', 10, '', 'YTo0OntzOjQ6Im1heGwiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(35, 1, 83, 'membership_feature_3', 'Feature 3', '3rd feature in the comparison table', 'text', 'y', 'n', 9, '', 'YTo0OntzOjQ6Im1heGwiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(36, 1, 88, 'name', 'Name', 'This is the title of the resource', 'text', 'n', 'n', 0, '33%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(37, 1, 88, 'description', 'Description', 'Tell the members what this resource is', 'text', 'n', 'n', 1, '', 'YTo0OntzOjQ6Im1heGwiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(38, 1, 88, 'file', 'File', 'If this resource is a file such as a PDF or video then upload here ', 'file', 'n', 'n', 2, '', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czozOiJhbGwiO3M6MTI6ImNvbnRlbnRfdHlwZSI7czozOiJhbGwiO30='),
(39, 1, 88, 'url', 'URL', 'If this resource has a link then enter it here', 'text', 'n', 'n', 3, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(40, 1, 89, 'logo', 'Sponsor Logo', '', 'file', 'y', 'n', 1, '33%', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiI3IjtzOjEyOiJjb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO30='),
(41, 1, 89, 'url', 'Sponsor URL', 'This should be fully qualified with http:// at the beginning.', 'text', 'n', 'n', 2, '', 'YTozOntzOjQ6Im1heGwiO3M6MzoiMTQwIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(42, 1, 89, 'name', 'Sponsor Name', '', 'text', 'y', 'n', 0, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(43, 1, 90, 'title', 'Section Title', 'This is the title of section', 'text', 'y', 'n', 0, '33%', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(44, 1, 90, 'copy', 'Copy', 'This is the copy which goes below', 'text', 'y', 'n', 1, '', 'YTo0OntzOjQ6Im1heGwiO3M6MDoiIjtzOjk6Im11bHRpbGluZSI7czoxOiJ5IjtzOjM6ImZtdCI7czoyOiJiciI7czo3OiJjb250ZW50IjtzOjM6ImFsbCI7fQ=='),
(45, 1, 98, 'title', 'Title', 'This text is the column title', 'text', 'y', 'n', 0, '', 'YTozOntzOjQ6Im1heGwiO3M6MjoiMTgiO3M6MzoiZm10IjtzOjQ6Im5vbmUiO3M6NzoiY29udGVudCI7czozOiJhbGwiO30='),
(46, 1, 98, 'copy', 'Copy', 'The main section of copy in the column', 'text', 'y', 'n', 1, '', 'YTozOntzOjQ6Im1heGwiO3M6MzoiMjAwIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(47, 1, 98, 'image', 'Image', '', 'file', 'y', 'n', 2, '', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiIzIjtzOjEyOiJjb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO30='),
(48, 1, 98, 'button_copy', 'Button Copy', 'The text on the CTA button', 'text', 'y', 'n', 3, '', 'YTozOntzOjQ6Im1heGwiO3M6MjoiMTgiO3M6MzoiZm10IjtzOjQ6Im5vbmUiO3M6NzoiY29udGVudCI7czozOiJhbGwiO30='),
(49, 1, 98, 'url', 'URL', 'This is the address of the page the button links to.', 'text', 'n', 'n', 4, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(50, 1, 99, 'title', 'Title', 'This is the column/area title', 'text', 'y', 'n', 0, '', 'YTozOntzOjQ6Im1heGwiO3M6MjoiMTgiO3M6MzoiZm10IjtzOjQ6Im5vbmUiO3M6NzoiY29udGVudCI7czozOiJhbGwiO30='),
(51, 1, 99, 'image', 'Image', 'A picture for this column', 'file', 'y', 'n', 1, '', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiIzIjtzOjEyOiJjb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO30='),
(52, 1, 99, 'copy', 'Copy', 'Descriptive copy', 'text', 'y', 'n', 2, '', 'YTozOntzOjQ6Im1heGwiO3M6MzoiMTgwIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9'),
(53, 1, 78, 'file', 'PDF attachment', 'If you wish to attach a PDF to this question then upload it here.', 'file', 'n', 'n', 2, '', 'YToyOntzOjk6ImRpcmVjdG9yeSI7czoxOiI1IjtzOjEyOiJjb250ZW50X3R5cGUiO3M6MzoiYWxsIjt9'),
(54, 1, 70, 'map_link', 'URL', 'Paste a link to the location on google maps', 'text', 'y', 'n', 1, '', 'YTozOntzOjQ6Im1heGwiO3M6MDoiIjtzOjM6ImZtdCI7czo0OiJub25lIjtzOjc6ImNvbnRlbnQiO3M6MzoiYWxsIjt9');

-- --------------------------------------------------------

--
-- Table structure for table `exp_matrix_data`
--

CREATE TABLE IF NOT EXISTS `exp_matrix_data` (
  `row_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned default '1',
  `entry_id` int(10) unsigned default NULL,
  `field_id` int(6) unsigned default NULL,
  `row_order` int(4) unsigned default NULL,
  `col_id_1` text,
  `col_id_2` text,
  `col_id_3` text,
  `col_id_4` text,
  `col_id_5` text,
  `col_id_6` text,
  `col_id_7` text,
  `col_id_16` text,
  `col_id_17` text,
  `col_id_18` text,
  `col_id_19` text,
  `col_id_20` text,
  `col_id_21` text,
  `col_id_22` text,
  `col_id_23` text,
  `col_id_24` text,
  `col_id_25` text,
  `col_id_26` text,
  `col_id_27` text,
  `col_id_28` text,
  `col_id_29` text,
  `col_id_30` text,
  `col_id_31` text,
  `col_id_32` text,
  `col_id_33` text,
  `col_id_34` text,
  `col_id_35` text,
  `col_id_36` text,
  `col_id_37` text,
  `col_id_38` text,
  `col_id_39` text,
  `col_id_40` text,
  `col_id_41` text,
  `col_id_42` text,
  `col_id_43` text,
  `col_id_44` text,
  `col_id_45` text,
  `col_id_46` text,
  `col_id_47` text,
  `col_id_48` text,
  `col_id_49` text,
  `col_id_50` text,
  `col_id_51` text,
  `col_id_52` text,
  `col_id_53` text,
  `col_id_54` text,
  PRIMARY KEY  (`row_id`),
  KEY `site_id` (`site_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `exp_matrix_data`
--

INSERT INTO `exp_matrix_data` (`row_id`, `site_id`, `entry_id`, `field_id`, `row_order`, `col_id_1`, `col_id_2`, `col_id_3`, `col_id_4`, `col_id_5`, `col_id_6`, `col_id_7`, `col_id_16`, `col_id_17`, `col_id_18`, `col_id_19`, `col_id_20`, `col_id_21`, `col_id_22`, `col_id_23`, `col_id_24`, `col_id_25`, `col_id_26`, `col_id_27`, `col_id_28`, `col_id_29`, `col_id_30`, `col_id_31`, `col_id_32`, `col_id_33`, `col_id_34`, `col_id_35`, `col_id_36`, `col_id_37`, `col_id_38`, `col_id_39`, `col_id_40`, `col_id_41`, `col_id_42`, `col_id_43`, `col_id_44`, `col_id_45`, `col_id_46`, `col_id_47`, `col_id_48`, `col_id_49`, `col_id_50`, `col_id_51`, `col_id_52`, `col_id_53`, `col_id_54`) VALUES
(1, 1, 24, 60, 0, '{filedir_2}E_010412_001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 24, 60, 1, '{filedir_2}E_010412_002.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 24, 60, 2, '{filedir_2}E_010412_003.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 24, 60, 3, '{filedir_2}E_010412_004.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 24, 60, 4, '{filedir_2}E_010412_005.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, 24, 60, 5, '{filedir_2}E_010412_006.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, 24, 60, 6, '{filedir_2}E_010412_007.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, 27, 70, 0, NULL, '{filedir_3}map.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://g.co/maps/z5syp'),
(9, 1, 16, 78, 0, NULL, NULL, 'What time is the workspace open until?', '7pm on weekdays', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL),
(10, 1, 16, 78, 1, NULL, NULL, 'Can I pay in installments ?', 'Membership can be paid yearly or every six months.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL),
(11, 1, 16, 78, 2, NULL, NULL, 'Will I be able to print documents?', 'No problem! But please take note of our fair use policy. ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_5}MeWe_Events_Programme.pdf', NULL),
(12, 1, 10, 79, 0, NULL, NULL, NULL, NULL, 'Kevin Osborne', '{filedir_4}placeholder.jpg', 'https://vimeo.com/42404978', 'Kevin is the Director of MeWe and has many years developing creative talent.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1, 10, 80, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mr Board Member', '{filedir_4}board_member.jpg', '', 'This board member has a vast experience in advising and backing startups.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 1, 10, 81, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mr Advisor', '{filedir_4}advisor.jpg', '', 'This advisor is skilled in telling other people what to do.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 1, 16, 83, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Network', '1 year membership', '£25', 'month', '6 month membership', '£27.50', 'month', '2 hours per year of business coaching from our leading experts', '10 hours per month of Central London workspace ', '', 'Access to 10 networking and 2 business leadership events per year', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 1, 16, 83, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hub', '1 year membership', '£37.50', 'month', '6 month membership', '£41.67', 'month', '4 hours per year of business coaching from our leading experts', '40 hours per month of Central London workspace ', '', 'Access to 10 networking and 4 business leadership events per year', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 1, 16, 83, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Incubator', '1 year membership', '£112.50', 'month', '6 month membership', '', '', '10 hours per year of business coaching from our leading experts', '80 hours per month of Central London workspace ', 'Access to investment ', 'Access to 10 networking and 6 business leadership events per year', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 1, 10, 79, 1, NULL, NULL, NULL, NULL, 'Mrs Team Members', '{filedir_4}board_member.jpg', '', 'This team member has a video.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 1, 29, 88, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Resource 1', 'This is a really useful resource for members. ', '{filedir_5}MeWe_Events_Programme.pdf', 'http://www.goodresource.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 1, 29, 88, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Resource 2', 'Here is another resource which can help members network and run their business more effectively.', '', 'http://www.another-resource.co.uk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 1, 27, 89, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_7}MeWe_Arts_Cncl.png', 'http://www.artscouncil.org.uk', 'The UK Arts Council', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 1, 27, 89, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_7}MeWe_Ingenious.png', 'http://www.ingeniousmedia.co.uk', 'Ingenious Media', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 1, 27, 89, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{filedir_7}MeWe_Esmee.png', 'http://esmeefairbairn.org.uk/', 'Esmee Fairbairn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 1, 16, 90, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Consultancy', '£50 per hour', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 1, 16, 90, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Workspace', '10 hours £30\n40 hours £80\n80 hours £120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 1, 16, 90, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Events', 'Networking £15-£20\nSpeakers £25-£40\nWorkshops £25-£50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 1, 16, 90, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Room Hire', 'Meeting Rooms £20 p/hour, £100 p/day\nLarger Rooms £50 p/hour, £250 p/day\nBoard Rooms £75 p/hour, £375 p/day\nCinema £100 p/hour, £600 p/day', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 1, 26, 98, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Incubator', 'Support and resources to fast track the successful development of your business.', '{filedir_3}5.jpg', 'Fund your business', '/incubator', NULL, NULL, NULL, NULL, NULL),
(29, 1, 26, 98, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Workspace', 'A professional work, meeting and event space.', '{filedir_3}workspace.jpg', 'See the workspace', '/workspace', NULL, NULL, NULL, NULL, NULL),
(30, 1, 26, 98, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Events', 'A programme of events designed to connect, inspire and inform.', '{filedir_3}events.jpg', 'Come to an event', '/events', NULL, NULL, NULL, NULL, NULL),
(31, 1, 26, 98, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Membership', 'Three levels of subsidised membership so that you can access exactly what you need when you need it.', '{filedir_3}membership.jpg', 'Find out more', '/membership', NULL, NULL, NULL, NULL, NULL),
(32, 1, 12, 99, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Cinema', '{filedir_3}cinema.jpg', 'An ultra stylish contemporary cinema seating 41 people in luxury and comfort.', NULL, NULL),
(33, 1, 12, 99, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Open plan office', '{filedir_3}openplanspace.jpg', 'A generous open plan space overlooking one of the premium squares in central London. Facilities include presentation screen, photocopier, printer, WiFi and kitchen.', NULL, NULL),
(34, 1, 12, 99, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Meeting rooms', '{filedir_3}meetingroom.png', 'Versatile, top quality meeting rooms of different sizes and aspects to ensure you find the perfect match for your requirements', NULL, NULL),
(35, 1, 12, 99, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Boardroom', '{filedir_3}boardroom.jpg', 'With full audio, video and presentation equipment this is an impressive space to host that important meeting, presentation or small event.', NULL, NULL),
(36, 1, 24, 60, 7, '{filedir_2}E_010412_008.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 1, 24, 60, 8, '{filedir_2}E_010412_009.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 1, 24, 60, 9, '{filedir_2}PD_010412_001.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 1, 24, 60, 10, '{filedir_2}PD_010412_002.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 1, 24, 60, 11, '{filedir_2}PD_010412_003.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 1, 24, 60, 12, '{filedir_2}PD_010412_004.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 1, 24, 60, 13, '{filedir_2}PD_010412_005.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 1, 24, 60, 14, '{filedir_2}PD_010412_006.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 1, 24, 60, 15, '{filedir_2}PD_010412_007.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 1, 24, 60, 16, '{filedir_2}PD_010412_008.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_members`
--

CREATE TABLE IF NOT EXISTS `exp_members` (
  `member_id` int(10) unsigned NOT NULL auto_increment,
  `group_id` smallint(4) NOT NULL default '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL default '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) default NULL,
  `authcode` varchar(10) default NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) default NULL,
  `location` varchar(50) default NULL,
  `occupation` varchar(80) default NULL,
  `interests` varchar(120) default NULL,
  `bday_d` int(2) default NULL,
  `bday_m` int(2) default NULL,
  `bday_y` int(4) default NULL,
  `aol_im` varchar(50) default NULL,
  `yahoo_im` varchar(50) default NULL,
  `msn_im` varchar(50) default NULL,
  `icq` varchar(50) default NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) default NULL,
  `avatar_width` int(4) unsigned default NULL,
  `avatar_height` int(4) unsigned default NULL,
  `photo_filename` varchar(120) default NULL,
  `photo_width` int(4) unsigned default NULL,
  `photo_height` int(4) unsigned default NULL,
  `sig_img_filename` varchar(120) default NULL,
  `sig_img_width` int(4) unsigned default NULL,
  `sig_img_height` int(4) unsigned default NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL default '0',
  `accept_messages` char(1) NOT NULL default 'y',
  `last_view_bulletins` int(10) NOT NULL default '0',
  `last_bulletin_date` int(10) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `join_date` int(10) unsigned NOT NULL default '0',
  `last_visit` int(10) unsigned NOT NULL default '0',
  `last_activity` int(10) unsigned NOT NULL default '0',
  `total_entries` smallint(5) unsigned NOT NULL default '0',
  `total_comments` smallint(5) unsigned NOT NULL default '0',
  `total_forum_topics` mediumint(8) NOT NULL default '0',
  `total_forum_posts` mediumint(8) NOT NULL default '0',
  `last_entry_date` int(10) unsigned NOT NULL default '0',
  `last_comment_date` int(10) unsigned NOT NULL default '0',
  `last_forum_post_date` int(10) unsigned NOT NULL default '0',
  `last_email_date` int(10) unsigned NOT NULL default '0',
  `in_authorlist` char(1) NOT NULL default 'n',
  `accept_admin_email` char(1) NOT NULL default 'y',
  `accept_user_email` char(1) NOT NULL default 'y',
  `notify_by_default` char(1) NOT NULL default 'y',
  `notify_of_pm` char(1) NOT NULL default 'y',
  `display_avatars` char(1) NOT NULL default 'y',
  `display_signatures` char(1) NOT NULL default 'y',
  `parse_smileys` char(1) NOT NULL default 'y',
  `smart_notifications` char(1) NOT NULL default 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(8) NOT NULL,
  `daylight_savings` char(1) NOT NULL default 'n',
  `localization_is_site_default` char(1) NOT NULL default 'n',
  `time_format` char(2) NOT NULL default 'us',
  `cp_theme` varchar(32) default NULL,
  `profile_theme` varchar(32) default NULL,
  `forum_theme` varchar(32) default NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL default '20',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL default '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL default 'n',
  `pmember_id` int(10) NOT NULL default '0',
  `profile_views` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `daylight_savings`, `localization_is_site_default`, `time_format`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `profile_views`) VALUES
(1, 1, 'admin', 'Administrator', '851681b75445e162ef4fc5b3cb645c0d555e58ef0e7cfdb529fe8e7fafcb258c02a5fdbb9e3111ac253ba605641b125d40d5fd6d541b7aca0d5f9d0f230db539', '2cG&W1iG.#i`zn|bZ#,a$&l,v+1pJD"\\{KlL8G?r-<R35{@98=v6f,_QH#R|CnW@aT"_H1r;cJ\\6/{o6oZ@]LD$&QM\\Cw|"Tv%$u+H?<-J*L33uk2Bnv^u7mJXRRf65"', 'e6383410a67ec1a6ba095d0a0f00561963b17dd3', '5b27c318272bbcd2fa443c194542f0fbc22cc790', NULL, 'marc@langsman.com', 'http://www.marc.com', 'London', '', '', 4, 2, 2012, '', '', '', '', 'This is my story', NULL, 'avatar_1.jpg', 100, 100, NULL, 500, 335, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1332434213, 1337773352, 1337789227, 13, 3, 0, 0, 1337272817, 1335205982, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'n', 'y', 'y', 'english', 'UTC', 'y', 'n', 'us', NULL, NULL, NULL, NULL, '20', NULL, '18', '', 'Pages|index.php?S=435749ed7c6eaed9fd1b3703a306c0b48ed90769&amp;D=cp&amp;C=addons_modules&M=show_module_cp&module=pages|1\nTemplate Manager|index.php?S=435749ed7c6eaed9fd1b3703a306c0b48ed90769&amp;D=cp&amp;C=design&M=manager|2\nChannel Fields|index.php?S=647d5411e9a344da653795a21c7454256b07dd9f&amp;D=cp&amp;C=admin_content&M=field_group_management|3\nChannels|index.php?S=03db8fa121cf43fbe16c0f4c3a7183b18f250a70&amp;D=cp&amp;C=admin_content&M=channel_management|4\nManage Entries|index.php?S=329453769acc0386d827f7575a74386497b9315c&amp;D=cp&amp;C=addons_modules&M=show_module_cp&module=freeform|6\nModules|index.php?S=1a298f761763011f64ed45f495c4987f24e2305e&amp;D=cp&amp;C=addons_modules|7', 'y', 0, 1),
(2, 5, 'test', 'Test User', '5faa6aac2ff0e375dedd288d1dfc8710d086af2e', '', 'a322784ced2e9e6682f5d32fdb6c67d71ee4a86f', NULL, NULL, 'test@langsman.com', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1334121900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'n', 'y', 'y', 'english', 'UTC', 'y', 'n', 'us', NULL, NULL, NULL, NULL, '20', NULL, '18', NULL, NULL, 'n', 0, 19),
(3, 6, 'mewe360', 'MeWe Admin', 'df2e9debcdfd9c1b2d5505aeb7e367ec443678b19d0b230b218722e25442d70adb2870d784e78a7b6277c21e343beb2a79a80991d3e6e909e143a294ecce602c', '&mw"=s:o>sApr2Ux>kaG(j;uACLF(Jb/''P`{cBqHdoj[QvE89Bl3^@GS''Wbs3L,KUN"v!C=Uxo-fvpfF_T[`*Q.jpHI/%C}B4\\;#Q5q*fj''hC``v5:[V*JfzQMoN,Sq^', '2b58d9068564ebe1efa2ac42066ce60438258de5', '0241502fb403f895e050e524e6bfc1cde56b08c9', NULL, 'admin@mewe360.com', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1334123737, 1337781814, 1337787470, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'n', 'y', 'y', 'english', 'UTC', 'y', 'n', 'us', NULL, NULL, NULL, NULL, '20', NULL, '18', NULL, 'Publish|index.php?S=6779b4712d03870b4d9bcd9373cf8a46326d153b&amp;D=cp&amp;C=content_publish|1', 'n', 0, 2),
(4, 5, 'johndoe', 'John Doe', '275839b1c6c7929a4d498e6016ee9d07a8ac36f8', '', 'efb1c50988e07806ac00dba9201c7e3e2a7cd9fd', NULL, NULL, 'jondoe@projoosr.com', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1335251871, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'n', 'y', 'y', 'english', 'UTC', 'y', 'n', 'us', NULL, NULL, NULL, NULL, '20', NULL, '18', NULL, NULL, 'n', 0, 6),
(5, 5, 'kevin', 'Kevin Osborne', 'c52cbca95c85e3e81abc7efcfdd4694b1c11d45ad932f2e18f78dd70605d2169f6f48b106b264e23b23c6cc30eee3994d39e0cc0f0255d20ec2778f5c39d58bf', 'w>INK/Ifk.Q^cvi3PBsF[m6eO~4W5Qvk0Qe=(ux]4g5_]}~*wz14(qD7E(@"t%s"3~h06Js1lwCXU[QG"F3w>QWvHkA}N/415FCEy!p}sLmtTbJ?Jq9qD(z)P+&_p$R2', 'ef230dccd526b150667489e70e56472f75611b0a', 'd45d3e3df98ff33ec5ef904cd3bfcafe26b259fd', NULL, 'kevin@projoosr.com', 'http://www.mewe360.com', 'London', '', '', NULL, NULL, NULL, '', '', '', '', 'My biog', NULL, 'avatar_5.jpg', 100, 62, 'photo_5.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1335256389, 1337277856, 1337364734, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'n', 'y', 'y', 'english', 'UTC', 'y', 'n', 'us', NULL, NULL, NULL, NULL, '20', NULL, '18', NULL, NULL, 'n', 0, 59),
(6, 5, 'marc', 'marc langsman', '5faa6aac2ff0e375dedd288d1dfc8710d086af2e', '', '41824d270d8c3670711820511d449b878519c778', NULL, NULL, 'marc1@langsman.com', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1336739826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'n', 'y', 'y', 'english', 'UTC', 'y', 'n', 'us', NULL, NULL, NULL, NULL, '20', NULL, '18', NULL, NULL, 'n', 0, 0),
(7, 5, 'test user x', 'test user x', '5c51a43d03cee2baf4ef7f721a25ee9035254158', '', 'aeb182504e70150173722c72b2068c2c398be327', NULL, NULL, 'test@projoosr.com', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '127.0.0.1', 1337600888, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'n', 'y', 'y', 'english', 'UTC', 'y', 'n', 'us', NULL, NULL, NULL, NULL, '20', NULL, '18', NULL, NULL, 'n', 0, 0),
(8, 5, 'marc.langsman', 'marc.langsman', '5faa6aac2ff0e375dedd288d1dfc8710d086af2e', '', '691f23e2fca777feb5ad4436f3664cb003413c99', NULL, NULL, 'marc2@projoosr.com', '', '', '', '', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '86.13.126.103', 1337772966, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'n', 'y', 'y', 'english', 'UTC', 'y', 'n', 'us', NULL, NULL, NULL, NULL, '20', NULL, '18', NULL, NULL, 'n', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_bulletin_board`
--

CREATE TABLE IF NOT EXISTS `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL auto_increment,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL default '',
  `bulletin_expires` int(10) unsigned NOT NULL default '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY  (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_data`
--

CREATE TABLE IF NOT EXISTS `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  `m_field_id_1` text,
  `m_field_id_2` varchar(100) default NULL,
  `m_field_id_3` varchar(100) default NULL,
  `m_field_id_4` text,
  `m_field_id_5` text,
  `m_field_id_6` varchar(100) default NULL,
  `m_field_id_7` varchar(100) default NULL,
  `m_field_id_8` varchar(100) default NULL,
  `m_field_id_9` text,
  `m_field_id_10` varchar(100) default NULL,
  `m_field_id_11` text,
  PRIMARY KEY  (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`, `m_field_id_1`, `m_field_id_2`, `m_field_id_3`, `m_field_id_4`, `m_field_id_5`, `m_field_id_6`, `m_field_id_7`, `m_field_id_8`, `m_field_id_9`, `m_field_id_10`, `m_field_id_11`) VALUES
(1, 'New Media', 'A really creative project', 'Creative Ltd', 'Drawing, Colouring in... ', 'stuff and more stuff', 'www.facebook.com', '', '', NULL, NULL, ''),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Design', 'my new projects', 'MeWe360', 'My skills', 'My experience', 'www.facebook.com', 'www.twitter.com', 'www.linkedin.com', '1, Golden Square\nLondon W1 123', NULL, 'Develop creative talent'),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_fields`
--

CREATE TABLE IF NOT EXISTS `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL auto_increment,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL default 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) default '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL default 'y',
  `m_field_required` char(1) NOT NULL default 'n',
  `m_field_public` char(1) NOT NULL default 'y',
  `m_field_reg` char(1) NOT NULL default 'n',
  `m_field_cp_reg` char(1) NOT NULL default 'n',
  `m_field_fmt` char(5) NOT NULL default 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`m_field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `exp_member_fields`
--

INSERT INTO `exp_member_fields` (`m_field_id`, `m_field_name`, `m_field_label`, `m_field_description`, `m_field_type`, `m_field_list_items`, `m_field_ta_rows`, `m_field_maxl`, `m_field_width`, `m_field_search`, `m_field_required`, `m_field_public`, `m_field_reg`, `m_field_cp_reg`, `m_field_fmt`, `m_field_order`) VALUES
(1, 'creative_sector', 'What creative sector do you work within?', '', 'select', 'Design\nNew Media\nTelevision\nWriting\nOther', 10, 100, '100%', 'y', 'n', 'y', 'n', 'n', 'none', 1),
(2, 'current_projects', 'What projects are you working on?', 'Current Projects', 'text', '', 10, 100, '100%', 'y', 'n', 'y', 'n', 'n', 'none', 2),
(3, 'company_name', 'What is the name of your company?', 'Company Name', 'text', '', 10, 100, '100%', 'y', 'n', 'y', 'n', 'n', 'none', 3),
(4, 'skills', 'What are your key skills?', '', 'textarea', '', 10, 100, '100%', 'y', 'n', 'y', 'n', 'n', 'none', 4),
(5, 'experience', 'What experience do you have?', '', 'textarea', '', 10, 100, '100%', 'y', 'n', 'y', 'n', 'n', 'none', 5),
(6, 'facebook', 'Your facebook page', '', 'text', '', 10, 100, '100%', 'y', 'n', 'y', 'n', 'n', 'none', 6),
(7, 'twitter', 'Your twitter feed', '', 'text', '', 10, 100, '100%', 'y', 'n', 'y', 'n', 'n', 'none', 7),
(8, 'linkedin', 'Your linkedin profile', '', 'text', '', 10, 100, '100%', 'y', 'n', 'y', 'n', 'n', 'none', 8),
(9, 'company_address', 'Your company''s address', '', 'textarea', '', 3, 100, '100%', 'y', 'n', 'y', 'n', 'n', 'none', 9),
(10, 'company_phone', 'Your company''s phone number', '', 'text', '', 10, 100, '100%', 'y', 'n', 'y', 'n', 'n', 'none', 10),
(11, 'company_description', 'What does your company do?', '', 'textarea', '', 4, 100, '100%', 'y', 'n', 'y', 'n', 'n', 'none', 11);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL default 'y',
  `can_view_offline_system` char(1) NOT NULL default 'n',
  `can_view_online_system` char(1) NOT NULL default 'y',
  `can_access_cp` char(1) NOT NULL default 'y',
  `can_access_content` char(1) NOT NULL default 'n',
  `can_access_publish` char(1) NOT NULL default 'n',
  `can_access_edit` char(1) NOT NULL default 'n',
  `can_access_files` char(1) NOT NULL default 'n',
  `can_access_fieldtypes` char(1) NOT NULL default 'n',
  `can_access_design` char(1) NOT NULL default 'n',
  `can_access_addons` char(1) NOT NULL default 'n',
  `can_access_modules` char(1) NOT NULL default 'n',
  `can_access_extensions` char(1) NOT NULL default 'n',
  `can_access_accessories` char(1) NOT NULL default 'n',
  `can_access_plugins` char(1) NOT NULL default 'n',
  `can_access_members` char(1) NOT NULL default 'n',
  `can_access_admin` char(1) NOT NULL default 'n',
  `can_access_sys_prefs` char(1) NOT NULL default 'n',
  `can_access_content_prefs` char(1) NOT NULL default 'n',
  `can_access_tools` char(1) NOT NULL default 'n',
  `can_access_comm` char(1) NOT NULL default 'n',
  `can_access_utilities` char(1) NOT NULL default 'n',
  `can_access_data` char(1) NOT NULL default 'n',
  `can_access_logs` char(1) NOT NULL default 'n',
  `can_admin_channels` char(1) NOT NULL default 'n',
  `can_admin_upload_prefs` char(1) NOT NULL default 'n',
  `can_admin_design` char(1) NOT NULL default 'n',
  `can_admin_members` char(1) NOT NULL default 'n',
  `can_delete_members` char(1) NOT NULL default 'n',
  `can_admin_mbr_groups` char(1) NOT NULL default 'n',
  `can_admin_mbr_templates` char(1) NOT NULL default 'n',
  `can_ban_users` char(1) NOT NULL default 'n',
  `can_admin_modules` char(1) NOT NULL default 'n',
  `can_admin_templates` char(1) NOT NULL default 'n',
  `can_admin_accessories` char(1) NOT NULL default 'n',
  `can_edit_categories` char(1) NOT NULL default 'n',
  `can_delete_categories` char(1) NOT NULL default 'n',
  `can_view_other_entries` char(1) NOT NULL default 'n',
  `can_edit_other_entries` char(1) NOT NULL default 'n',
  `can_assign_post_authors` char(1) NOT NULL default 'n',
  `can_delete_self_entries` char(1) NOT NULL default 'n',
  `can_delete_all_entries` char(1) NOT NULL default 'n',
  `can_view_other_comments` char(1) NOT NULL default 'n',
  `can_edit_own_comments` char(1) NOT NULL default 'n',
  `can_delete_own_comments` char(1) NOT NULL default 'n',
  `can_edit_all_comments` char(1) NOT NULL default 'n',
  `can_delete_all_comments` char(1) NOT NULL default 'n',
  `can_moderate_comments` char(1) NOT NULL default 'n',
  `can_send_email` char(1) NOT NULL default 'n',
  `can_send_cached_email` char(1) NOT NULL default 'n',
  `can_email_member_groups` char(1) NOT NULL default 'n',
  `can_email_mailinglist` char(1) NOT NULL default 'n',
  `can_email_from_profile` char(1) NOT NULL default 'n',
  `can_view_profiles` char(1) NOT NULL default 'n',
  `can_edit_html_buttons` char(1) NOT NULL default 'n',
  `can_delete_self` char(1) NOT NULL default 'n',
  `mbr_delete_notify_emails` varchar(255) default NULL,
  `can_post_comments` char(1) NOT NULL default 'n',
  `exclude_from_moderation` char(1) NOT NULL default 'n',
  `can_search` char(1) NOT NULL default 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL default 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL default '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL default '60',
  `can_attach_in_private_messages` char(1) NOT NULL default 'n',
  `can_send_bulletins` char(1) NOT NULL default 'n',
  `include_in_authorlist` char(1) NOT NULL default 'n',
  `include_in_memberlist` char(1) NOT NULL default 'y',
  `include_in_mailinglists` char(1) NOT NULL default 'y',
  PRIMARY KEY  (`group_id`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_groups`
--

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_fieldtypes`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_upload_prefs`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_admin_accessories`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES
(1, 1, 'Super Admins', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', 'y'),
(2, 1, 'Banned', '', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '', 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(3, 1, 'Guests', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(4, 1, 'Pending', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(5, 1, 'Members', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', '', 'y', 'n', 'y', 10, 'n', 20, 60, 'y', 'n', 'n', 'y', 'y'),
(6, 1, 'Content and Member Admin', '', 'y', 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'y', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'n', 'y', 'y', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_homepage`
--

CREATE TABLE IF NOT EXISTS `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL default 'l',
  `recent_entries_order` int(3) unsigned NOT NULL default '0',
  `recent_comments` char(1) NOT NULL default 'l',
  `recent_comments_order` int(3) unsigned NOT NULL default '0',
  `recent_members` char(1) NOT NULL default 'n',
  `recent_members_order` int(3) unsigned NOT NULL default '0',
  `site_statistics` char(1) NOT NULL default 'r',
  `site_statistics_order` int(3) unsigned NOT NULL default '0',
  `member_search_form` char(1) NOT NULL default 'n',
  `member_search_form_order` int(3) unsigned NOT NULL default '0',
  `notepad` char(1) NOT NULL default 'r',
  `notepad_order` int(3) unsigned NOT NULL default '0',
  `bulletin_board` char(1) NOT NULL default 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL default '0',
  `pmachine_news_feed` char(1) NOT NULL default 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_homepage`
--

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`) VALUES
(1, 'l', 1, 'l', 2, 'n', 0, 'r', 1, 'n', 0, 'r', 2, 'r', 0, 'l', 0),
(2, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(3, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(4, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(5, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(6, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(7, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0),
(8, 'l', 0, 'l', 0, 'n', 0, 'r', 0, 'n', 0, 'r', 0, 'r', 0, 'n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_search`
--

CREATE TABLE IF NOT EXISTS `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY  (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_attachments`
--

CREATE TABLE IF NOT EXISTS `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL auto_increment,
  `sender_id` int(10) unsigned NOT NULL default '0',
  `message_id` int(10) unsigned NOT NULL default '0',
  `attachment_name` varchar(50) NOT NULL default '',
  `attachment_hash` varchar(40) NOT NULL default '',
  `attachment_extension` varchar(20) NOT NULL default '',
  `attachment_location` varchar(150) NOT NULL default '',
  `attachment_date` int(10) unsigned NOT NULL default '0',
  `attachment_size` int(10) unsigned NOT NULL default '0',
  `is_temp` char(1) NOT NULL default 'y',
  PRIMARY KEY  (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_copies`
--

CREATE TABLE IF NOT EXISTS `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL auto_increment,
  `message_id` int(10) unsigned NOT NULL default '0',
  `sender_id` int(10) unsigned NOT NULL default '0',
  `recipient_id` int(10) unsigned NOT NULL default '0',
  `message_received` char(1) NOT NULL default 'n',
  `message_read` char(1) NOT NULL default 'n',
  `message_time_read` int(10) unsigned NOT NULL default '0',
  `attachment_downloaded` char(1) NOT NULL default 'n',
  `message_folder` int(10) unsigned NOT NULL default '1',
  `message_authcode` varchar(10) NOT NULL default '',
  `message_deleted` char(1) NOT NULL default 'n',
  `message_status` varchar(10) NOT NULL default '',
  PRIMARY KEY  (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_data`
--

CREATE TABLE IF NOT EXISTS `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `sender_id` int(10) unsigned NOT NULL default '0',
  `message_date` int(10) unsigned NOT NULL default '0',
  `message_subject` varchar(255) NOT NULL default '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL default 'y',
  `message_attachments` char(1) NOT NULL default 'n',
  `message_recipients` varchar(200) NOT NULL default '',
  `message_cc` varchar(200) NOT NULL default '',
  `message_hide_cc` char(1) NOT NULL default 'n',
  `message_sent_copy` char(1) NOT NULL default 'n',
  `total_recipients` int(5) unsigned NOT NULL default '0',
  `message_status` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_folders`
--

CREATE TABLE IF NOT EXISTS `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL default '0',
  `folder1_name` varchar(50) NOT NULL default 'InBox',
  `folder2_name` varchar(50) NOT NULL default 'Sent',
  `folder3_name` varchar(50) NOT NULL default '',
  `folder4_name` varchar(50) NOT NULL default '',
  `folder5_name` varchar(50) NOT NULL default '',
  `folder6_name` varchar(50) NOT NULL default '',
  `folder7_name` varchar(50) NOT NULL default '',
  `folder8_name` varchar(50) NOT NULL default '',
  `folder9_name` varchar(50) NOT NULL default '',
  `folder10_name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_message_folders`
--

INSERT INTO `exp_message_folders` (`member_id`, `folder1_name`, `folder2_name`, `folder3_name`, `folder4_name`, `folder5_name`, `folder6_name`, `folder7_name`, `folder8_name`, `folder9_name`, `folder10_name`) VALUES
(1, 'InBox', 'Sent', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_listed`
--

CREATE TABLE IF NOT EXISTS `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL default '0',
  `listed_member` int(10) unsigned NOT NULL default '0',
  `listed_description` varchar(100) NOT NULL default '',
  `listed_type` varchar(10) NOT NULL default 'blocked',
  PRIMARY KEY  (`listed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_modules`
--

CREATE TABLE IF NOT EXISTS `exp_modules` (
  `module_id` int(4) unsigned NOT NULL auto_increment,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL default 'n',
  `has_publish_fields` char(1) NOT NULL default 'n',
  `settings` text,
  PRIMARY KEY  (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`, `settings`) VALUES
(1, 'Comment', '2.2', 'y', 'n', NULL),
(2, 'Email', '2.0', 'n', 'n', NULL),
(3, 'Emoticon', '2.0', 'n', 'n', NULL),
(4, 'File', '1.0.0', 'n', 'n', NULL),
(5, 'Jquery', '1.0', 'n', 'n', NULL),
(7, 'Query', '2.0', 'n', 'n', NULL),
(8, 'Rss', '2.0', 'n', 'n', NULL),
(9, 'Safecracker', '2.1', 'y', 'n', NULL),
(10, 'Search', '2.1', 'n', 'n', NULL),
(11, 'Channel', '2.0.1', 'n', 'n', NULL),
(12, 'Member', '2.1', 'n', 'n', NULL),
(13, 'Stats', '2.0', 'n', 'n', NULL),
(14, 'Backup_proish', '1.0.4', 'y', 'n', NULL),
(15, 'Low_reorder', '1.2.1', 'y', 'n', NULL),
(17, 'Mx_tool_box', '1.2.1', 'y', 'n', NULL),
(18, 'Freeform', '3.1.3', 'y', 'n', NULL),
(19, 'Deeploy_helper', '2.0.3', 'y', 'n', NULL),
(20, 'User', '3.3.9', 'y', 'y', NULL),
(21, 'Code_pack', '1.2.1', 'y', 'n', NULL),
(22, 'Greeny', '1.0.3', 'y', 'n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_module_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_module_member_groups`
--

INSERT INTO `exp_module_member_groups` (`group_id`, `module_id`) VALUES
(6, 14),
(6, 18);

-- --------------------------------------------------------

--
-- Table structure for table `exp_mx_notify_control_lists`
--

CREATE TABLE IF NOT EXISTS `exp_mx_notify_control_lists` (
  `subscribe_id` int(10) unsigned NOT NULL auto_increment,
  `receiver_id` int(10) NOT NULL,
  `list_name` varchar(128) NOT NULL default '',
  `unsubscribe` varchar(128) NOT NULL default '0',
  PRIMARY KEY  (`subscribe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_mx_notify_control_members`
--

CREATE TABLE IF NOT EXISTS `exp_mx_notify_control_members` (
  `recipient_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(128) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `member_id` varchar(50) NOT NULL default '',
  `auth` varchar(2) NOT NULL default '0',
  `unsubscribe` varchar(128) NOT NULL default '0',
  PRIMARY KEY  (`recipient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_online_users`
--

CREATE TABLE IF NOT EXISTS `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) NOT NULL default '0',
  `in_forum` char(1) NOT NULL default 'n',
  `name` varchar(50) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `date` int(10) unsigned NOT NULL default '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY  (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=139 ;

--
-- Dumping data for table `exp_online_users`
--

INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`) VALUES
(135, 1, 0, 'n', '', '127.0.0.1', 1337252055, ''),
(136, 1, 0, 'n', '', '127.0.0.1', 1337252055, ''),
(138, 1, 0, 'n', '', '127.0.0.1', 1337252055, '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_password_lockout`
--

CREATE TABLE IF NOT EXISTS `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL auto_increment,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY  (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_password_lockout`
--

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`) VALUES
(1, 1337771987, '86.13.126.103', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 'mewe360');

-- --------------------------------------------------------

--
-- Table structure for table `exp_ping_servers`
--

CREATE TABLE IF NOT EXISTS `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) NOT NULL default '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL default '80',
  `ping_protocol` varchar(12) NOT NULL default 'xmlrpc',
  `is_default` char(1) NOT NULL default 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_relationships`
--

CREATE TABLE IF NOT EXISTS `exp_relationships` (
  `rel_id` int(6) unsigned NOT NULL auto_increment,
  `rel_parent_id` int(10) NOT NULL default '0',
  `rel_child_id` int(10) NOT NULL default '0',
  `rel_type` varchar(12) NOT NULL,
  `rel_data` mediumtext NOT NULL,
  `reverse_rel_data` mediumtext NOT NULL,
  PRIMARY KEY  (`rel_id`),
  KEY `rel_parent_id` (`rel_parent_id`),
  KEY `rel_child_id` (`rel_child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_remember_me`
--

CREATE TABLE IF NOT EXISTS `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL default '0',
  `member_id` int(10) default '0',
  `ip_address` varchar(16) default '0',
  `user_agent` varchar(120) default '',
  `admin_sess` tinyint(1) default '0',
  `site_id` int(4) default '1',
  `expiration` int(10) default '0',
  `last_refresh` int(10) default '0',
  PRIMARY KEY  (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_reset_password`
--

CREATE TABLE IF NOT EXISTS `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY  (`reset_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_reset_password`
--

INSERT INTO `exp_reset_password` (`reset_id`, `member_id`, `resetcode`, `date`) VALUES
(1, 1, '6qJpKabc', 1334574866);

-- --------------------------------------------------------

--
-- Table structure for table `exp_revision_tracker`
--

CREATE TABLE IF NOT EXISTS `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY  (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=165 ;

--
-- Dumping data for table `exp_revision_tracker`
--

INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES
(3, 2, 'exp_templates', 'template_data', 1332436446, 1, ''),
(4, 4, 'exp_templates', 'template_data', 1333614807, 1, ''),
(5, 4, 'exp_templates', 'template_data', 1333616189, 1, '<!DOCTYPE html>\n\n<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->\n<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->\n<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->\n<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->\n<head>\n	<meta charset="utf-8" />\n\n	<!-- Set the viewport width to device width for mobile -->\n	<meta name="viewport" content="width=device-width" />\n\n	<title>Welcome to MeWe</title>\n  \n	<!-- Included CSS Files -->\n	<!-- Combine and Compress These CSS Files -->\n	<link rel="stylesheet" href="stylesheets/globals.css">\n	<link rel="stylesheet" href="stylesheets/typography.css">\n	<link rel="stylesheet" href="stylesheets/grid.css">\n	<link rel="stylesheet" href="stylesheets/ui.css">\n	<link rel="stylesheet" href="stylesheets/forms.css">\n	<link rel="stylesheet" href="stylesheets/orbit.css">\n	<link rel="stylesheet" href="stylesheets/reveal.css">\n	<link rel="stylesheet" href="stylesheets/mobile.css">\n	\n	<!-- End Combine and Compress These CSS Files -->\n	<link rel="stylesheet" href="stylesheets/app.css">\n\n	<!--[if lt IE 9]>\n		<link rel="stylesheet" href="stylesheets/ie.css">\n	<![endif]-->\n	\n	<!-- Non framework custom CSS -->\n	<link rel="stylesheet" href="stylesheets/custom.css">\n	<link rel="stylesheet" href="stylesheets/about-us.css">\n	\n	<!-- Google Webfonts -->\n	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Candara">\n	\n	<script src="javascripts/modernizr.foundation.js"></script>\n\n\n	<!-- IE Fix for HTML5 Tags -->\n	<!--[if lt IE 9]>\n		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>\n	<![endif]-->\n	\n	<script type=''text/javascript''>\n	(function (d, t) {\n	  var bh = d.createElement(t), s = d.getElementsByTagName(t)[0];\n	  bh.type = ''text/javascript'';\n	  bh.src = ''//www.bugherd.com/sidebarv2.js?apikey=da8da014-e25b-4041-b791-25f3100fa3c8'';\n	  s.parentNode.insertBefore(bh, s);\n	  })(document, ''script'');\n	</script>\n\n</head>\n\n<body>\n		\n		<div id="top-background">\n			<div id="background">\n				<div id="header">\n				\n					<div class="row" id="branding">\n							<div class="twelve columns">\n									<img src="img/Logo.png" alt="Mewe Logo" />\n							</div>\n							\n							<ul class="secondary-nav hide-on-phones shadow">\n								<li><a href="#">Login</a></li>\n								<li><a href="sign-up.html" class="alternate">Join Up</a></li>\n							</ul>\n					</div>\n\n					<div class="row" id="masthead" >\n						<div class="twelve columns" >\n								<ul class="nav-bar hide-on-phones" id="primary-nav">\n									<li><a href="index.html" class="main"><span>Home</span></a></li>\n									<li class="selected"> <a href="about-us.html" class="main">About</a></li>\n									<li> <a href="incubator.html" class="main">Incubator</a></li>\n									<li> <a href="workspace.html" class="main">Workspace</a></li>\n									<li> <a href="events.html" class="main">Events</a></li>\n									<li> <a href="membership.html" class="main">Membership</a></li>\n									<li> <a href="news.html" class="main">News</a></li>\n									<li class="hub has-flyout">\n										<a href="#" class="main">Hub</a>\n										<div class="flyout" style="display: none;">\n											<ul>\n												<li><a href="profile.html" class="main">Profile</a></li>\n												<li><a href="community.html" class="main">Community</a></li>\n												<li><a href="#" class="main">Resources</a></li>\n											</ul>\n										</div>\n									</li>\n								</ul>\n						</div>\n					</div>\n				\n				</div> <!-- #header -->\n\n			\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							<h1>A new development house for ambitious and talented creative entrepreneurs</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">\n							<div class="frame">\n								<img src="http://lorempixel.com/450/250"/>\n							</div>\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">	\n							<p>We are a new type of development house for the arts and creative industries. We identify and develop “untapped” talent from the UK’s arts and creative sector and incubate associated new businesses.</p>  \n							<p>Through our incubator and venture fund we are investing £1 million in our network of entrepreneurs to provide:  finance, business and leadership expertise, wider networks and work space to help them realise their ambitions. Through this work we support creativity, leadership and wider social change. </p>\n							<p>We are based in “Grade A” offices near Piccadilly Circus in central London.</p>\n							<a class="medium black button radius black-gradient" href="#"><span>Join us today</span></a>\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n							<h2>Why MeWe?</h2>\n\n							<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n							<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>\n\n							<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>\n\n							<h2>How we work...</h2>\n\n							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n\n							<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\n\n							<h2>Why join?</h2>\n\n							<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n\n							<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatisaccusantium doloremque laudantium, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,</p>\n				\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n					<div class="row people-section">\n						<div class="twelve columns">\n							<dl class="tabs">\n							  <dd><a href="#simple1" class="active">The Team</a></dd>\n							  <dd><a href="#simple2">The Board</a></dd>\n							  <dd><a href="#simple3">Advisors</a></dd>\n							</dl>\n\n							<ul class="tabs-content">\n								\n								<li class="active" id="simple1Tab">\n									<div class="container">\n										<p>Our team looks after MeWe’s members and keeps our events and workspace running smoothly.</p>\n										<ul class="block-grid four-up">\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n										</ul>\n									</div>\n								</li>\n							  	\n							<li id="simple2Tab">\n									<div class="container">\n										<p>The board creates MeWe’s strategy to ensure that members are offered the most innovative and cutting-edge services for their businesses.</p>\n										<ul class="block-grid four-up">\n											<li>\n												<img src="http://lorempixel.com/200/120/people/6">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src="http://lorempixel.com/200/120/people/9">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src="http://lorempixel.com/200/120/people/6">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src="http://lorempixel.com/200/120/people/9">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n										</ul>\n									</div>\n								\n								</li>\n								<li id="simple3Tab">\n										<div class="container">\n											\n											<p>From heads of leading media organisations to captains of creative industry, our advisors offer members invaluable one-to-one business coaching.</p>\n											\n											<ul class="block-grid four-up">\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n											</ul>\n										</div>\n\n									</li>\n							\n						\n							</ul>\n		\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n				<div class="sponsors">\n					<div class="row">\n						<div class="twelve columns"><img src="img/sponsors.png" alt="Our Sponsors" /></div>\n					</div>\n				</div>\n		\n				<div id="footer">\n			\n					<div class="row">\n						<div class="three columns">\n							<h3>Find Us</h3>\n							<div class="container">\n								<img class="map" src="img/map.png" />\n							</div>\n						</div>\n						<div class="three columns">\n							<h3>Get in touch</h3>\n							<div class="container">\n								<p>MeWe Foundation<br />Golden Square<br />London, W1 123<br /><br />020 7123 4567<br /><a href="mailto:info@mewe.com">info@mewe.com</a></p>\n							</div>\n						</div>\n						\n						<div class="three columns networks">\n							<h3>Networks</h3>\n							<div class="container">\n								<ul>\n									<li><a href="#"><img src="img/twitter.png" />Twitter</a></li>\n									<li><a href="#"><img src="img/facebook.png" />Facebook</a></li>\n									<li><a href="#"><img src="img/linkedin.png" />LinkedIn</a></li>\n								</ul>\n							</div>\n						</div>\n						<div class="three columns feedback">\n							<h3>Feedback</h3>\n							<div class="container">\n								<p>We’re always looking to improve what we do. If you have feedback we''d love to hear from you!</p>\n								<a href="#" class="medium radius button black-gradient">Get in touch</a>\n							</div>\n						</div>\n					</div>	\n				\n				\n				</div> <!-- .footer -->\n				\n				</div> <!-- #background -->\n		</div> <!-- #top-background -->\n\n\n\n	<!-- Included JS Files -->\n	<script src="javascripts/jquery.min.js"></script>\n	<!-- Combine and Compress These JS Files -->\n	<script src="javascripts/jquery.reveal.js"></script>\n	<script src="javascripts/jquery.orbit-1.4.0.js"></script>\n	<script src="javascripts/jquery.customforms.js"></script>\n	<script src="javascripts/jquery.placeholder.min.js"></script>\n	<script src="javascripts/jquery.tooltips.js"></script>\n	<!-- End Combine and Compress These JS Files -->\n	<script src="javascripts/app.js"></script>\n	\n\n	\n	<!-- Live Reload Code -->\n	<script>document.write(''<script src="http://'' + (location.host || ''localhost'').split('':'')[0] + '':35729/livereload.js?snipver=1"></'' + ''script>'')</script>\n\n</body>\n</html>'),
(19, 14, 'exp_templates', 'template_data', 1334136617, 1, ''),
(20, 15, 'exp_templates', 'template_data', 1334138318, 1, ''),
(24, 19, 'exp_templates', 'template_data', 1334573492, 1, ''),
(26, 13, 'exp_templates', 'template_data', 1334596228, 1, '{embed="includes/header" page="{segment_1}"}\n	\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							{exp:channel:entries channel="about"}\n								<h1>{about_headline}</h1>\n							{/exp:channel:entries}\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">\n							<div class="frame">\n								<img src="http://lorempixel.com/450/250"/>\n							</div>\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							{exp:channel:entries channel="about"}\n								<p>{about_main_copy}</p>\n							{/exp:channel:entries}	\n							\n							<a class="medium black button radius black-gradient" href="/sign-up"><span>Join us today</span></a>\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n							{exp:channel:entries channel="about"}\n								<h2>Why MeWe?</h2>\n								<p>{about_why_mewe}</p>\n							\n\n								<h2>How we work</h2>\n								<p>{about_how_we_work}</p>\n\n								<h2>Why join?</h2>\n								<p>{about_why_join}</p>\n				\n							{/exp:channel:entries}\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n					<div class="row people-section">\n						<div class="twelve columns">\n							<dl class="tabs">\n							  <dd><a href="#simple1" class="active">The Team</a></dd>\n							  <dd><a href="#simple2">The Board</a></dd>\n							  <dd><a href="#simple3">Advisors</a></dd>\n							</dl>\n\n							<ul class="tabs-content">\n								\n								<li class="active" id="simple1Tab">\n									<div class="container">\n										<p>Our team looks after MeWe’s members and keeps our events and workspace running smoothly.</p>\n										<ul class="block-grid four-up">\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n										</ul>\n									</div>\n								</li>\n							  	\n							<li id="simple2Tab">\n									<div class="container">\n										<p>The board creates MeWe’s strategy to ensure that members are offered the most innovative and cutting-edge services for their businesses.</p>\n										<ul class="block-grid four-up">\n											<li>\n												<img src="http://lorempixel.com/200/120/people/6">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src="http://lorempixel.com/200/120/people/9">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src="http://lorempixel.com/200/120/people/6">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src="http://lorempixel.com/200/120/people/9">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n										</ul>\n									</div>\n								\n								</li>\n								<li id="simple3Tab">\n										<div class="container">\n											\n											<p>From heads of leading media organisations to captains of creative industry, our advisors offer members invaluable one-to-one business coaching.</p>\n											\n											<ul class="block-grid four-up">\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n											</ul>\n										</div>\n\n									</li>\n							\n						\n							</ul>\n		\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(30, 19, 'exp_templates', 'template_data', 1334596228, 1, '<div class="inset rounded sidebar">\n	<h2>Recent News</h2>\n	{exp:channel:entries channel="news" dynamic="no"}\n	\n		<div class="news-snippet">\n			<a href="{title_permalink=''news/view''}">\n				<h3>{title}</h3>\n			</a>\n			<h4>{entry_date format=''%j %F %Y''}</h4>\n		</div> <!-- .news-snippet -->\n	\n	{/exp:channel:entries}\n\n</div>'),
(31, 14, 'exp_templates', 'template_data', 1334596228, 1, '{embed="includes/header" page="{segment_1}"}\n			\n				<div class="container"> \n				\n				\n					\n					<div class="row">\n						\n						<div class="six columns">\n							<div class="frame">\n								<img src="http://lorempixel.com/450/250"/>\n							</div>\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							{exp:channel:entries channel="incubator"}\n								<h1>{incubator_headline}</h1>\n								<p>{incubator_main_copy}</p>	\n							{/exp:channel:entries}\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n\n						<div class="six columns">\n							<h2>Here''s how it works</h2>\n								<p>We’ll meet you for an initial in-depth one-to-one session so that together we can identify exactly what you need to propel you, your ideas and your creative business to the next level.<br />We then provide you with:</p>\n\n								<h3>Mentoring</h3>\n								<p>one-to-one coaching to guide your leadership development.</p>\n								<hr />\n\n								<h3>Consultancy</h3>\n								<p>Expert advice provided by leading consultancies in key areas of business practice e.g. marketing, planning, finance, human resources.</p>\n								<hr />\n								\n								<h3>Events</h3>\n								<p>A programme of networking and leadership development events designed to inspire, inform and connect our membership including speakers, panel discussions, workshops, expert clinics. More...</p>\n								<hr />\n								\n								<h3>Facilities</h3>\n								<p>Top end cinema, meeting, work and event spaces to present, collaborate and network. More...</p>\n								<hr />\n								\n								<h3>Networks</h3>\n								<p>You will be plugged into the MEWE network as well as other relevant external networks.</p>\n								\n						</div> <!-- columns -->\n\n\n\n						<div class="six columns">	\n							<div class="inset rounded">\n								<h2>Launching a project or product?</h2>\n\n								<h3>We can provide the venue and help make sure the right people are there.</h3>\n								<p>Throughout the programme we will continue to work with you to closely monitor and respond to your changing needs as you, your business or idea develops.</p>\n								<p>What you will get is a tailor made service to enable you to maximise your potential and opportunities.</p>\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/me.png" />\n									</div>\n									<div class="nine columns">	\n										<p>but within a strong, vibrant community of peers.</p>\n									</div>\n								</div>\n								\n								<hr />\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/we.png" />\n									</div>\n									<div class="nine columns">	\n										<p>committed, aspirational and talented creative entrepreneurs like you – offering support and collaboration where ideas can not only ignite but be realised.</p>\n									</div>\n								</div>\n								\n								<hr />\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/360.png" />\n									</div>\n									<div class="nine columns">	\n										<p>support needed to succeed at the highest level together with the opportunity to apply for seed funding of £200K from our investment arm.</p>\n									</div>\n								</div>\n																\n							</div>\n							\n						</div> <!-- columns -->\n\n\n					</div> <!-- .row -->\n					\n					<div class="row cta">\n						<div class="nine columns">\n							If you believe you have a compelling business idea, the ambition for success and want to work with business experts and mentors to grow your business get in touch now.\n							\n						</div>\n						<div class="three columns">\n							<a href="/sign-up" class="medium black button radius black-gradient"><span>Get in touch</span></a>\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(33, 2, 'exp_templates', 'template_data', 1334596228, 1, '{embed="includes/header" page="{segment_1}"}\n\n				<div class="container"> \n				\n					<div class="row">\n					\n						<div class="eight columns">\n							\n							{exp:channel:entries channel="news"}\n							\n								<div class="news-article">\n									<header>\n										<h2>{title}</h2> \n										<p><span class="date">{entry_date format=''%j %F %Y''}</span> by <strong>{author}</strong> <span class="comments">3 comments</span></p>\n									</header>\n									{if news_video_url !=""}\n										{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n											<div class="flex-video">{embed_code}</div>\n										{/exp:antenna}\n									{if:elseif news_image != ""}\n										<div class="frame">\n											<!-- ><img src="http://lorempixel.com/450/250"/> -->\n											<img src="{news_image}" alt="{news_image_description}"/>\n										</div>\n									{/if}\n\n									<p>{news_excerpt}</p>\n								</div> <!-- .news-article -->\n							\n							{/exp:channel:entries}\n							\n						</div> <!-- columns -->\n								\n							\n\n						<div class="four columns">	\n							\n							{embed="includes/sidebar"}\n		\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(37, 15, 'exp_templates', 'template_data', 1334596228, 1, '{embed="includes/header" page="{segment_1}"}\n	{exp:channel:entries channel="workspace"}\n	\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							\n							<h1>{workspace_heading}</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row">\n						\n						<div class="six columns">\n							<div class="frame">\n								<img src="http://lorempixel.com/450/250"/>\n							</div>\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							<p>{workspace_main_copy}	\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row services rooms-section">\n				\n							<div class="quarter columns">\n								<div class="service rounded">\n										<h2>{workspace_room_1_heading}</h2>\n									<img src="http://lorempixel.com/200/115/city/1" alt="MeWe Incubator" />\n									<p>{workspace_room_1_copy}</p>\n								</div> <!-- panel -->\n							</div>				\n				\n							<div class="quarter columns">				\n								<div class="service rounded">\n									<h2>{workspace_room_2_heading}</h2>\n									<img src="http://lorempixel.com/200/115/city/2" alt="MeWe Incubator" />\n									<p>{workspace_room_2_copy}</p>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class="quarter columns">					\n								<div class="service rounded">\n									<h2>{workspace_room_3_heading}</h2>\n									<img src="http://lorempixel.com/200/115/city/3" alt="MeWe Incubator" />\n									<p>{workspace_room_3_copy}</p>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class="quarter columns">				\n								<div class="service rounded">\n									<h2>{workspace_room_4_heading}</h2>\n									<img src="http://lorempixel.com/200/115/city/4" alt="MeWe Incubator" />\n									<p>{workspace_room_4_copy}</p>\n								</div> <!-- panel -->\n							</div>\n					</div><!-- #services-->\n					\n					<div class="row">\n						<div class="twelve columns cta">\n							<a href="/sign-up" class="medium black button radius black-gradient"><span>Sign up today</span></a>\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{/exp:channel:entries}\n\n{embed="includes/footer"}'),
(40, 19, 'exp_templates', 'template_data', 1334660313, 1, '<div class="inset rounded sidebar">\n	<h2>Recent News</h2>\n	{exp:channel:entries channel="news" dynamic="no" limit="5"}\n	\n		<div class="news-snippet">\n			<a href="{title_permalink=''news/view''}">\n				<h3>{title}</h3>\n			</a>\n			<h4>{entry_date format=''%j %F %Y''}</h4>\n		</div> <!-- .news-snippet -->\n	\n	{/exp:channel:entries}\n\n</div>'),
(41, 2, 'exp_templates', 'template_data', 1334660313, 1, '{embed="includes/header" page="{segment_1}"}\n\n				<div class="container"> \n				\n					<div class="row">\n					\n						<div class="eight columns">\n							\n							{exp:channel:entries channel="news"}\n							\n								<div class="news-article">\n									<header>\n										<h2>{title}</h2> \n										<p><span class="date">{entry_date format=''%j %F %Y''}</span> by <strong>{author}</strong> <span class="comments">3 comments</span></p>\n									</header>\n									{if news_video_url !=""}\n										{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n											<div class="flex-video">{embed_code}</div>\n										{/exp:antenna}\n									{if:elseif news_image != ""}\n										<div class="frame">\n											<!-- ><img src="http://lorempixel.com/450/250"/> -->\n											<img src="{news_image}" alt="{news_image_description}"/>\n										</div>\n									{/if}\n\n									<p>\n										{exp:eehive_hacksaw words="15" append="..."}\n												{news_article}\n										{/exp:eehive_hacksaw}\n										<a href="{title_permalink=''news/view''}">Read More</a>\n									</p>\n									\n								</div> <!-- .news-article -->\n							\n							{/exp:channel:entries}\n							\n						</div> <!-- columns -->\n								\n							\n\n						<div class="four columns">	\n							\n							{embed="includes/sidebar"}\n		\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(42, 18, 'exp_templates', 'template_data', 1334660313, 1, '{embed="includes/header" page="{segment_1}"}\n\n				<div class="container"> \n			\n					<div class="row">\n					\n						<div class="eight columns">\n							\n							{exp:channel:entries channel="news" limit=''1''}\n							\n								<div class="news-article">\n									<header>\n										<h2>{title}</h2> \n										<p><span class="date">{entry_date format=''%j %F %Y''}</span> by <strong>{author}</strong> <span class="comments">3 comments</span></p>\n									</header>\n									{if news_video_url !=""}\n										{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n											<div class="flex-video">{embed_code}</div>\n										{/exp:antenna}\n									{if:elseif news_image != ""}\n										<div class="frame">\n											<!-- ><img src="http://lorempixel.com/450/250"/> -->\n											<img src="{news_image}" alt="{news_image_description}"/>\n										</div>\n									{/if}\n\n									<p>{news_article}</p>\n								</div> <!-- .news-article -->\n							\n							{/exp:channel:entries}\n							\n						</div> <!-- columns -->\n								\n							\n\n						<div class="four columns">	\n							{embed="includes/sidebar"}\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(44, 21, 'exp_templates', 'template_data', 1334752030, 1, ''),
(45, 22, 'exp_templates', 'template_data', 1334757987, 1, ''),
(46, 53, 'exp_templates', 'template_data', 1334841364, 1, ''),
(47, 53, 'exp_templates', 'template_data', 1334841371, 1, ''),
(49, 52, 'exp_templates', 'template_data', 1334864328, 1, ''),
(50, 55, 'exp_templates', 'template_data', 1334865089, 1, ''),
(53, 58, 'exp_templates', 'template_data', 1335000593, 1, ''),
(55, 13, 'exp_templates', 'template_data', 1335005233, 1, '{embed="includes/header" page="{segment_1}"}\n	\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							{exp:channel:entries channel="about"}\n								<h1>{about_headline}</h1>\n							{/exp:channel:entries}\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">\n							<div class="frame">\n								<img src="http://lorempixel.com/450/250"/>\n							</div>\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							{exp:channel:entries channel="about"}\n								<p>{about_main_copy}</p>\n							{/exp:channel:entries}	\n							\n							<a class="medium black button radius black-gradient" href="/sign-up"><span>Join us today</span></a>\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n							{exp:channel:entries channel="about"}\n								<h2>Why MeWe?</h2>\n								<p class="small">{about_why_mewe}</p>\n							\n\n								<h2>How we work</h2>\n								<p class="small">{about_how_we_work}</p>\n\n								<h2>Why join?</h2>\n								<p class="small">{about_why_join}</p>\n				\n							{/exp:channel:entries}\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n					<div class="row people-section">\n						<div class="twelve columns">\n							<dl class="tabs">\n							  <dd><a href="#simple1" class="active">The Team</a></dd>\n							  <dd><a href="#simple2">The Board</a></dd>\n							  <dd><a href="#simple3">Advisors</a></dd>\n							</dl>\n\n							<ul class="tabs-content">\n								\n								<li class="active" id="simple1Tab">\n									<div class="container">\n										<p>Our team looks after MeWe’s members and keeps our events and workspace running smoothly.</p>\n										<ul class="block-grid four-up">\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src="http://lorempixel.com/200/120">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n										</ul>\n									</div>\n								</li>\n							  	\n							<li id="simple2Tab">\n									<div class="container">\n										<p>The board creates MeWe’s strategy to ensure that members are offered the most innovative and cutting-edge services for their businesses.</p>\n										<ul class="block-grid four-up">\n											<li>\n												<img src="http://lorempixel.com/200/120/people/6">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src="http://lorempixel.com/200/120/people/9">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src="http://lorempixel.com/200/120/people/6">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src="http://lorempixel.com/200/120/people/9">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n										</ul>\n									</div>\n								\n								</li>\n								<li id="simple3Tab">\n										<div class="container">\n											\n											<p>From heads of leading media organisations to captains of creative industry, our advisors offer members invaluable one-to-one business coaching.</p>\n											\n											<ul class="block-grid four-up">\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src="http://placehold.it/200x120">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n											</ul>\n										</div>\n\n									</li>\n							\n						\n							</ul>\n		\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(56, 22, 'exp_templates', 'template_data', 1335005233, 1, '{embed="includes/header" page="{segment_1}"}\n\n<div class="container">\n	<div class="row">\n		<div class="twelve columns">\n			\n					\n		{exp:freeform:form \n			form:class="nice custom"\n			collection="Contact Us"\n			required="name|email"\n			return="/"\n			notify="info@projoosr.com"\n			template="default_template"\n			send_user_email="yes"\n			}\n							\n			        <h2>Get in touch</h2>\n					<p>We''d love to hear from you !</p>\n							\n							<label for="name">What''s your name?</label>\n			                <input type="text" class="input-text" id="name" name="name" size="40" maxlength="35" />\n\n			                <label for="email">Your Email</label>\n			                <input type="text" class="input-text" id="from" name="email" size="40" maxlength="35" />\n\n\n			                <label for="subject">Subject</label>\n			                <input type="text" class="input-text" id="subject" name="subject" size="40" />\n\n			                <label for="message">Message</label>\n			                <textarea id="message" name="message" rows="18" class="large" >\n\n			                </textarea>\n\n			                <input name="submit" type=''submit'' value=''Submit'' class=''large black button radius black-gradient'' />\n\n			{/exp:freeform:form}\n	\n		</div> <!-- columns -->\n	</div> <!-- row -->\n	\n</div>\n\n{embed="includes/footer"}'),
(59, 14, 'exp_templates', 'template_data', 1335005233, 1, '{embed="includes/header" page="{segment_1}"}\n			\n				<div class="container"> \n				\n				\n					\n					<div class="row">\n						\n						<div class="six columns">\n							<div class="frame">\n								<img src="http://lorempixel.com/450/250"/>\n							</div>\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							{exp:channel:entries channel="incubator"}\n								<h1>{incubator_headline}</h1>\n								<p>{incubator_main_copy}</p>	\n							{/exp:channel:entries}\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n\n						<div class="six columns">\n							<h2>Here''s how it works</h2>\n								<p class="small">We’ll meet you for an initial in-depth one-to-one session so that together we can identify exactly what you need to propel you, your ideas and your creative business to the next level.<br />We then provide you with:</p>\n\n								<h4>Mentoring</h4>\n								<p class="small">one-to-one coaching to guide your leadership development.</p>\n								<hr />\n\n								<h4>Consultancy</h4>\n								<p class="small">Expert advice provided by leading consultancies in key areas of business practice e.g. marketing, planning, finance, human resources.</p>\n								<hr />\n								\n								<h4>Events</h4>\n								<p class="small">A programme of networking and leadership development events designed to inspire, inform and connect our membership including speakers, panel discussions, workshops, expert clinics. More...</p>\n								<hr />\n								\n								<h4>Facilities</h4>\n								<p class="small">Top end cinema, meeting, work and event spaces to present, collaborate and network. More...</p>\n								<hr />\n								\n								<h4>Networks</h4>\n								<p class="small">You will be plugged into the MEWE network as well as other relevant external networks.</p>\n								\n						</div> <!-- columns -->\n\n\n\n						<div class="six columns">	\n							<div class="inset rounded">\n								<h2>Launching a project or product?</h2>\n\n								<h3>We can provide the venue and help make sure the right people are there.</h3>\n								<p>Throughout the programme we will continue to work with you to closely monitor and respond to your changing needs as you, your business or idea develops.</p>\n								<p>What you will get is a tailor made service to enable you to maximise your potential and opportunities.</p>\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/me.png" />\n									</div>\n									<div class="nine columns">	\n										<p>but within a strong, vibrant community of peers.</p>\n									</div>\n								</div>\n								\n								<hr />\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/we.png" />\n									</div>\n									<div class="nine columns">	\n										<p>committed, aspirational and talented creative entrepreneurs like you – offering support and collaboration where ideas can not only ignite but be realised.</p>\n									</div>\n								</div>\n								\n								<hr />\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/360.png" />\n									</div>\n									<div class="nine columns">	\n										<p>support needed to succeed at the highest level together with the opportunity to apply for seed funding of £200K from our investment arm.</p>\n									</div>\n								</div>\n																\n							</div>\n							\n						</div> <!-- columns -->\n\n\n					</div> <!-- .row -->\n					\n					<div class="row cta">\n						<div class="nine columns">\n							If you believe you have a compelling business idea, the ambition for success and want to work with business experts and mentors to grow your business get in touch now.\n							\n						</div>\n						<div class="three columns">\n							<a href="/sign-up" class="medium black button radius black-gradient"><span>Get in touch</span></a>\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(61, 55, 'exp_templates', 'template_data', 1335005233, 1, '{if logged_in}\n\n	{embed="includes/header"}\n\n	<div class="container community"> \n\n			<h1>Community</h1>\n		\n			<ul class="block-grid six-up mobile community-grid">\n		\n				{exp:user:users group_id=''5'' dynamic=''off'' }\n			\n				<li>\n					<!-- link to individual member profile page -->\n					<a href="/members/{member_id}">\n						<div class="frame">\n							{if photo_filename != ""}\n								<img src="{photo_url}{photo_filename}">\n							{if:else}\n								<img src="/img/default_user_photo_small.png">\n							{/if}\n							\n						</div>\n					<p class="orange-header-bar">{screen_name}</p></a>\n				</li>\n			       \n				{/exp:user:users}\n			\n			</ul>\n		\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}'),
(62, 54, 'exp_templates', 'template_data', 1335005233, 1, '\n{if logged_in}\n\n	{embed="includes/header" page="edit_profile"}\n\n		{exp:user:edit form:class="nice custom" form:id="profile-form" dynamic="off"}\n\n	<h1>Edit your profile</h1>\n		\n		<div class="row profile-form">\n\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Contact Details</h4>\n	\n					<p>\n						<label for="email">Email address</label>\n						<em>*</em>	\n						<input type=''text'' class="input-text required email" name=''email'' id="email" value=''{email}'' maxlength=''50''/>	\n						\n\n					<p>\n						<label for="location">Where are you based?</label>\n						<input type=''text'' class="input-text" name=''location'' value=''{location}'' maxlength=''50''/>\n					</p>\n	\n					<p>\n						<label for="url">Your Website</label>\n						<input id="url" name="url" class="input-text" type="text" value=''{url}'' maxlength=''75'' />\n					</p>\n	\n					<p>	\n						<label for="facebook">{lang:facebook:label}</label>\n						<input type=''text'' name=''facebook'' class=''input-text'' value="{facebook}" />\n					</p>	\n	\n					<p>	\n						<label for="twitter">{lang:twitter:label}</label>\n						<input type=''text'' name=''twitter'' class=''input-text'' value="{twitter}" />\n					</p>\n\n					<p>	\n						<label for="linkedin">{lang:linkedin:label}</label>\n						<input type=''text'' name=''linkedin'' class=''input-text'' value="{linkedin}" />\n					</p>\n\n				</div>\n			\n				<div class="profile-section">	\n		\n					<h4>Profile photo</h4>\n\n						<img src="{photo_url}{photo_filename}" width="{photo_width}" height="{photo_height}" />\n	\n						<label for="photo_filename">Upload a New Photo</label>\n						<input type="file" name="photo_filename" />\n\n				</div>\n\n				<div class="profile-section">\n					<h4>Bio</h4>\n					<p>\n						<label for="bio">Tell us a bit about yourself</label>\n						<textarea name=''bio'' class=''textarea large'' rows="10">{bio}</textarea>\n					</p>\n	\n				</div>\n\n\n			\n			\n	\n			</div> <!-- /.columns -->\n	\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Your Company</h4>\n\n					<p>	\n						<label for="company_name">{lang:company_name:label}</label>\n						<input type=''text'' name=''company_name'' class=''input-text'' value="{company_name}" />\n					</p>\n	\n					<p>\n	\n		\n					<label for="avatar_filename">Company Logo</label>\n	\n					<img src="{avatar_url}{avatar_filename}" width="{avatar_width}" height="{avatar_height}" /></p>\n\n					<label for="avatar_filename">Upload a new logo</label>\n					<input type="file" name="avatar_filename" /></p>\n	\n					<p>	\n						<label for="company_description">{lang:company_description:label}</label>\n						<textarea name=''company_description'' class=''textarea large''>{company_description}</textarea>\n					</p>\n	\n	\n					<p>	\n						<label for="current_projects">{lang:current_projects:label}</label>\n						<textarea name=''bio'' class=''textarea large''>{bio}</textarea>\n					</p>\n\n				</div>\n			\n				<div class="profile-section">\n	\n					<h4>Skills and Experience</h4>\n\n					<p>	\n						<label for="creative_sector">{lang:creative_sector:label}</label>\n						<select name="creative_sector"> \n						{select_creative_sector} \n						<option value="{value}" {selected}>{value}</option> \n						{/select_creative_sector} \n						</select>\n					</p>	\n\n					<p>	\n						<label for="skills">{lang:skills:label}</label>\n						<textarea name=''skills'' class=''textarea large''>{skills}</textarea>\n					</p>\n\n					<p>	\n						<label for="expereince">{lang:experience:label}</label>\n						<textarea name=''experience'' class=''textarea large''>{experience}</textarea>\n					</p>	\n\n				</div>\n	\n			</div> <!-- /.columns -->\n		\n		</div> <!-- /.row -->\n\n	<input type="submit" value="Do it !" class="large black button radius black-gradient" name="submit">\n\n	\n	{/exp:user:edit}\n\n\n	</div> <!-- /container -->\n\n\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}'),
(63, 52, 'exp_templates', 'template_data', 1335005233, 1, '{if logged_in}\n\n	{if segment_2 != ""} \n\n		{embed="members/profile" member="{segment_2}"}\n	\n	{if:else}\n\n		{embed="members/community"}\n\n	{/if}\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n	');
INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES
(64, 53, 'exp_templates', 'template_data', 1335005233, 1, '\n{if logged_in}\n\n	{embed="includes/header"}\n\n\n	<div class="container public-profile"> \n\n		<div class="row">\n	\n			<div class="eight columns main-profile">\n		\n			{exp:user:stats}\n			<!-- Get member ID from the url segment -->\n		\n			<!-- Only show profiles for member sin the ''members'' group  (5)-->\n			{if group_id !=5 } \n				{redirect="404"} \n			{/if}\n		\n				<!-- Members profile picture and name -->\n				<div class="row">\n					<div class="six columns">\n						<div class="frame">\n							<!-- if photo -->\n							{if photo_filename != ""}\n									<img src="{photo_url}{photo_filename}"/>\n							{if:else}\n								<img src="/img/default_user_photo_small.png"/>\n							{/if}\n						</div>\n					</div>\n\n				\n					<div class="six columns">\n						<h1>{screen_name}</h1>\n						<p class="creative-sector">{creative_sector}</p>\n					</div>\n				</div> <!-- row -->\n				\n				<!-- About Me and other information -->\n				<div class="row">\n\n					<div class="twelve columns">\n					\n						<!-- network icons -->\n\n							<div class="row">\n									<div class="twelve columns">\n											{if facebook != ""}\n												<a href="{facebook}"><img src="/img/profile-icon-facebook.png" alt="facebook logo"/></a>\n											{/if}\n							\n											{if twitter != ""}\n												<a href="{twitter}"><img src="/img/profile-icon-twitter.png" alt="twitter logo"/>\n											{/if}\n							\n											{if linkedin != ""}\n												<a href="{linkedin}"><img src="/img/profile-icon-linkedin.png" alt="linked in logo"/>\n											{/if}\n									</div> <!-- columns -->\n							</div> <!-- row -->\n\n					\n				\n						<h3>About me</h3>\n						<p>{bio}</p>\n\n						<h3>Current projects</h3>\n						<p>{current_projects}</p>									\n\n					\n					\n					</div> <!-- columns -->\n\n				</div> <!-- row -->\n				\n				\n			</div> <!-- columns -->		\n										\n\n			<div class="four columns">	\n				<div class="inset rounded sidebar">\n					<img src="http://placehold.it/100x100" class="member-logo" />\n					<h3 class="company-name">{company_name}</h3>\n					<p class="contact-details">\n						{if company_address != ""}\n							{company_address}<br />\n						{/if}\n					\n						{email}</br />\n					\n						{if company_phone != ""}\n							{company_phone}<br />\n						{/if}\n					\n						{if url != ""}\n							{url}<br />\n						{/if}\n					</p>\n				\n					{if company_description != ""}\n						<h2>Business description</h2>\n						<p>{company_description}</p>\n					{/if}\n				\n					{if skills != ""}\n						<h2>Skills</h2>\n						<p>{skills}</p>\n					{/if}\n				\n					{if experience != ""}\n						<h2>Experience</h2>\n						<p>{experience}</p>\n					{/if}\n											\n				</div>\n\n			</div> <!-- columns -->\n			\n\n		</div> <!-- .row -->\n	\n\n	{/exp:user:stats}\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n\n\n'),
(65, 16, 'exp_templates', 'template_data', 1335005233, 1, '{embed="includes/header" page="{segment_1}"}\n	\n			\n				<div class="container"> \n				\n					<div class="row centered">\n						<div class="twelve columns">\n							{exp:channel:entries channel="membership"}\n							<h1>{membership_headline}</h1>\n							<div class="banner inset rounded shadow">\n								<h2>{membership_banner}</h2>\n							{/exp:channel:entries}\n							</div> <!-- .banner --> \n						</div>\n					</div> <!-- row -->\n					\n					\n					<div class="row services membership-tiers">\n					\n					{exp:channel:entries channel="membership_tiers" limit="3" status="Tier 1"}\n							<div class="third columns">\n								<div class="service rounded shadow">\n										<h2>{membership_tier_name}</h2>\n										<div class="bubble rounded">\n											<div>\n												<span class="contract-length">{membership_primary_description}</span><br />\n												<span class="price">{membership_primary_price}/</span><span class="payment-period">{membership_primary_period}</span></div>\n\n										</div>\n										<div class="bubble secondary-offer rounded ">\n											<div>\n												<span class="contract-length">{membership_secondary_description}</span><br />\n												<span class="price">{membership_secondary_price}/</span><span class="payment-period">{membership_secondary_period}</span></div>\n\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_1}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_2}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_3}\n										</div>\n										\n										{if membership_differentiator != ""}\n											<div class="bubble differentiator rounded">\n												{membership_differentiator}\n											</div>\n										{/if}\n			\n										<a href="/sign-up" class="large button radius black-gradient"><span>Sign up today</span></a>\n										\n								</div> <!-- panel -->\n								\n							</div>\n					{/exp:channel:entries}	\n					\n\n					{exp:channel:entries channel="membership_tiers" limit="3" status="Tier 2"}\n							<div class="third columns">\n								<div class="service rounded shadow">\n										<h2>{membership_tier_name}</h2>\n										<div class="bubble rounded">\n											<div>\n												<span class="contract-length">{membership_primary_description}</span><br />\n												<span class="price">{membership_primary_price}/</span><span class="payment-period">{membership_primary_period}</span></div>\n\n										</div>\n										<div class="bubble secondary-offer rounded ">\n											<div>\n												<span class="contract-length">{membership_secondary_description}</span><br />\n												<span class="price">{membership_secondary_price}/</span><span class="payment-period">{membership_secondary_period}</span></div>\n\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_1}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_2}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_3}\n										</div>\n										\n										{if membership_differentiator != ""}\n											<div class="bubble differentiator rounded">\n												{membership_differentiator}\n											</div>\n										{/if}\n			\n										<a href="/sign-up" class="large button radius black-gradient"><span>Sign up today</span></a>\n										\n								</div> <!-- panel -->\n								\n							</div>\n					{/exp:channel:entries}\n			\n					{exp:channel:entries channel="membership_tiers" limit="3" status="Tier 3"}\n							<div class="third columns">\n								<div class="service rounded shadow">\n										<h2>{membership_tier_name}</h2>\n										<div class="bubble rounded">\n											<div>\n												<span class="contract-length">{membership_primary_description}</span><br />\n												<span class="price">{membership_primary_price}/</span><span class="payment-period">{membership_primary_period}</span></div>\n\n										</div>\n										<div class="bubble secondary-offer rounded ">\n											<div>\n												<span class="contract-length">{membership_secondary_description}</span><br />\n												<span class="price">{membership_secondary_price}/</span><span class="payment-period">{membership_secondary_period}</span></div>\n\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_1}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_2}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_3}\n										</div>\n										\n										{if membership_differentiator != ""}\n											<div class="bubble differentiator rounded">\n												{membership_differentiator}\n											</div>\n										{/if}\n			\n										<a href="/sign-up" class="large button radius black-gradient"><span>Sign up today</span></a>\n										\n								</div> <!-- panel -->\n								\n							</div>\n					{/exp:channel:entries}\n				\n					</div><!-- #services-->\n					\n					<div class="row">\n						<div class="seven columns faq-section">\n							<h2>Frequently asked questions</h2>\n						\n						{exp:channel:entries channel="membership"}	\n							{faq}\n								<div class="question-and-answer">\n									<p class="question">{question}</p>\n									<p class="answer">{answer}</p>\n								</div>\n							{/faq}\n						{/exp:channel:entries}\n							\n						</div><!-- columns -->\n							\n						<div class="five columns">\n							<div class="service rounded top-ups">\n								<h2>Top-ups and Extras</h2>\n								{exp:channel:entries channel="topups_and_extras" orderby="topups_and_extras_order" show_expired="yes" show_future_entries="yes" sort="asc" backspace="6" }\n									<h3>{title}</h3>\n									{topups_and_extras_copy}\n									<hr />{/exp:channel:entries}\n								\n							</div>\n						</div><!-- columns -->\n						\n					</div> <!-- Row -->\n					\n\n				</div> <!-- container -->\n				\n	\n{embed="includes/footer"}'),
(66, 18, 'exp_templates', 'template_data', 1335005233, 1, '{embed="includes/header" page="{segment_1}"}\n\n				<div class="container"> \n			\n					<div class="row">\n					\n						<div class="eight columns">\n							\n							{exp:channel:entries channel="news" limit=''1''}\n							\n								<div class="news-article">\n									<header>\n										<h2>{title}</h2> \n										<p><span class="date">{entry_date format=''%j %F %Y''}</span> by <strong>{author}</strong> <span class="comments">3 comments</span></p>\n									</header>\n									\n									{if news_video_url !=""}\n										{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n											<div class="flex-video">{embed_code}</div>\n										{/exp:antenna}\n									{if:elseif news_image != ""}\n										<div class="frame">\n											<!-- ><img src="http://lorempixel.com/450/250"/> -->\n											<img src="{news_image}" alt="{news_image_description}"/>\n										</div>\n									{/if}\n									\n									<div class="social-icons">\n					\n										{exp:socialeesta:like href="{title_permalink}" action="like" color="light" layout="standard"}\n									</div> <!-- /social-icons -->\n\n									<p>{news_article}</p>\n								</div> <!-- .news-article -->\n							\n							{/exp:channel:entries}\n							\n						</div> <!-- columns -->\n								\n							\n\n						<div class="four columns">	\n							{embed="includes/sidebar"}\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(67, 20, 'exp_templates', 'template_data', 1335005233, 1, '{embed="includes/header" page="{segment_1}"}\n			\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							<h1>Interested in joining up or finding out about special offers and upcoming events? Fill in your details and we’ll keep you in the loop.</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">	\n						\n							{exp:freeform:form \n								form:class="nice custom"\n								collection="Sign Up"\n								required="name|email"\n								return="/"\n								notify="info@projoosr.com"\n								template="default_template"\n								send_user_email="yes"\n								user_email_template="some_template"\n								}\n							\n								<div class="row">\n									<div class="six columns">	\n										<label for="first_name">Name</label>\n										<input id="first_name" name="first_name" class="input-text" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="last_name">Surname</label>\n										<input id="last_name" name="last_name" class="input-text" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->\n							\n								<div class="row">\n									<div class="twelve columns">\n											<label for="email">Email</label>\n											<input id="email" name="email" class="input-text" type="text">\n									</div>\n								</div>	\n													\n								<div class="row">\n									<div class="six columns">	\n										<label for="phone_number">Phone number</label>\n										<input id="phone_number" name="phone_number" class="input-text" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="postcode">Postcode</label>\n										<input id="postcode" name="postcode" class="input-text" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->		\n						\n								<div class="row">\n									<div class="twelve columns">\n									\n										<label for="creative_insutry">What creative industry are you in?</label>\n										<select style="display:none;" id="creative_insutry" name="creative_industry" class="expand">\n										  	<option>Design</option>\n										  	<option>New Media</option>\n											<option>Television</option>\n										  	<option>Writing</option>\n										</select>\n									\n										<label for="membership_type">What type of membership are you interested in?</label>\n										<select style="display:none;" id="membership_type" name="membership_type" class="expand">\n										  	<option>Hub</option>\n											<option>Club</option>\n										  	<option>Incubator</option>\n										  	<option>Not sure</option>\n										</select>\n									\n									</div>	<!-- columns -->\n								</div> <!-- row -->\n							\n								<div class="row submit-section">\n\n									<div class="six columns">	\n										<input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n										\n									</div><!-- columns -->\n								\n									<div class="six columns terms">\n								            <span id="checkbox"><input id="opt-in" checked="checked" type="checkbox" /></span>\n								            <span id="checkbox-label"><label for="opt-in">Uncheck this box if you don’t want to recieve news about special discounts, upcoming events and more. Don’t worry, we hate spam and we’ll never share your details with anyone else.</label></span>\n									</div><!-- columns -->\n\n								</div><!-- row -->\n							\n							\n							{/exp:freeform:form} <!-- form -->\n										\n						</div> <!-- columns -->\n				\n						\n						<div class="six columns hide-on-phones">\n							<div class="large-image">\n								<img src="/img/membership.png" class="frame" />\n							</div>\n						</div> <!-- columns -->\n								\n							\n	\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n						\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(68, 21, 'exp_templates', 'template_data', 1335005233, 1, '{exp:http_header status="404"}\n{embed="includes/header"}\n<div class="container">\n	<h1>You seem to have lost your way! </h1>\n	<!-- <p>Don''t worry you can head home <a href="{path=''site_index''}">here</a></p> -->\n</div>\n{embed="includes/footer"}\n'),
(69, 1, 'exp_templates', 'template_data', 1335005233, 1, '{embed="includes/header"}\n\n				{exp:channel:entries channel="home"}\n	\n				<div class="container"> \n\n					<div class="row" id=''topSection''>\n\n						<div class="six columns push-six" id="straplineArea">\n								<div class="cta-container">\n									<h1>{strapline}</h1>\n									<a class="huge button black radius black-gradient hide-on-phones" href="/sign-up"><span>Join today</span></a>\n								</div>\n						</div> <!-- #straplineArea -->\n\n						<div class="six columns pull-six" id=''carousel''>\n								\n								<div class="frame">\n									     <img src="/img/carousel/5.jpg"/>\n								</div> <!-- carousel-container -->\n					\n				\n						</div> <!-- #carousel -->\n			\n				\n					</div> <!-- #topSection -->\n			\n					<div class="row services">\n						\n						\n							<div class="quarter columns">\n								<div class="service rounded">\n										<h2>Incubator</h2>\n									<img src="{home_incubator_image}" alt="Incubator" />\n									<p>{home_incubator_copy}</p>\n									<a href="/incubator" class="medium black button radius black-gradient"><span>Fund your business</span></a>\n								</div> <!-- panel -->\n							</div>				\n				\n							<div class="quarter columns">				\n								<div class="service rounded">\n									<h2>Workspace</h2>\n									<img src="{home_workspace_image}" alt="Workspace" />\n									<p>{home_workspace_copy}</p>\n									<a href="/workspace" class="medium black button radius black-gradient"><span>See the workspace</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class="quarter columns">					\n								<div class="service rounded">\n									<h2>Events</h2>\n									<img src="{home_events_image}" alt="Events" />\n									<p>{home_events_copy}</p>\n									<a href="/events" class="medium black button radius black-gradient"><span>Come to an event</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class="quarter columns">				\n								<div class="service rounded">\n									<h2>Membership</h2>\n									<img src="{home_membership_image}" alt="Membership" />\n									<p>{home_membership_copy}</p>\n									<a href="/membership" class="medium black button radius black-gradient"><span>Find out more</span></a>\n								</div> <!-- panel -->\n							</div>\n							\n						{/exp:channel:entries}\n\n					</div><!-- #services-->\n				\n\n					<div class="row" id="news-area">\n					\n						<div class="seven columns">\n						\n							<h2>Latest news</h2>\n								\n								{exp:channel:entries channel="news" limit="1"}\n								<div class="row">\n									<div class="three columns">\n										<a href="{title_permalink=''news/view''}">\n											\n											{if news_video_url !=""}\n												{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n														<img src="{video_thumbnail}" alt="{video_title}" />\n												{/exp:antenna}\n											{if:elseif news_image != ""}\n												<img src="{news_image}" alt="{title}" />\n											{/if}\n										</a>\n									\n									</div> <!-- .six columns -->\n\n									<div class="nine columns">\n										\n										<div class="news-article">\n											<header>\n												<h3 class="news-heading"><a href="{title_permalink=''news/view''}">{title}</a></h3>\n												<p><span class="date">{entry_date format=''%j %F %Y''}</span> by {author} <span class="comments">3 comments</span></p>\n											</header>	\n											<p class="excerpt">\n												{exp:eehive_hacksaw words="15" append="..."}\n													{news_article}\n												{/exp:eehive_hacksaw}\n											</p>\n											\n											\n										</div> <!-- .news-article -->\n									\n										\n									</div>\n								\n								</div> <!-- .row -->\n								{/exp:channel:entries}\n					\n\n\n						</div> <!-- .seven columns-->\n\n						<div class="five columns">	\n							<h2>Upcoming events</h2>\n							<div class="row event">\n							{exp:eventbriteapi:upcomingEvents limit=''1''}\n							\n								<div class="three columns">\n										<a href=''{url}''>\n											<div class="date-box">\n												<p class="month">{month}</p>\n												<p class="day">{day}</p>\n											</div> <!-- date-box -->\n										</a>\n								</div>\n								<div class="nine columns">\n									<div class="event-details">\n										<h3 class="event-heading"><a href=''{url}''>{title}</a></h3>\n										<p class="excerpt">{excerpt}</p>\n									</div> <!-- date- -->	\n								</div>\n							</div>\n							{/exp:eventbriteapi:upcomingEvents}\n						</div> <!-- sidebar -->\n							\n			\n					</div> <!-- #news-area -->\n\n				</div> <!-- container -->\n				\n{embed="includes/footer"}'),
(70, 56, 'exp_templates', 'template_data', 1335257061, 1, ''),
(74, 56, 'exp_templates', 'template_data', 1335258261, 1, '\n{if logged_in}\n\n	{embed="includes/header" page="edit_profile"}\n	\n	<div class="container">\n\n	{exp:user:edit form:class="nice custom validatingForm" return="members/edit_account/success" form:id="profile-form" dynamic="off"}\n\n	{if segment_3 == "success"}\n		<div class="alert-box success">You''ve successfully updated your account!</div>\n	{/if}\n\n	<h1>Edit your account</h1>\n		\n		<div class="row profile-form">\n\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n				\n					<p>\n						<label for="current_password">* Your current password is required to change your account details</label>\n						<input type=''password'' class="input-text required password" name=''current_password'' id="current_password" value='''' type="password"/>	\n					</p>\n				\n				</div>\n	\n				<div class="profile-section">\n				\n					<h4>Change Your Password</h4>\n					\n					<p>\n						<label for="new_password">New Password</label>\n						<input type=''password'' class="input-text password" name=''password'' id="password" value='''' type="password"/>	\n					</p>\n					\n					<p>\n						<label for="password_confirm">Confirm Password</label>\n						<input type=''password'' class="input-text password" name=''password_confirm'' id="password_confirm" value='''' type="password"/>\n					</p>\n				</div> <!-- profile-section -->\n\n	\n			</div> <!-- /.columns -->\n	\n			<div class="six columns">\n\n			</div> <!-- /.columns -->\n		\n		</div> <!-- /.row -->\n\n	<input type="submit" value="Do it !" class="large black button radius black-gradient" name="submit">\n\n	\n	{/exp:user:edit}\n\n\n	</div> <!-- /container -->\n\n\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}'),
(75, 54, 'exp_templates', 'template_data', 1335258261, 1, '\n{if logged_in}\n\n	{embed="includes/header" page="edit_profile"}\n	\n	<div class="container">\n\n	{exp:user:edit form:class="nice custom validatingForm" return="members/edit_profile/success" form:id="profile-form"  dynamic="off"}\n\n	{if segment_3 == "success"}\n		<div class="alert-box success">You''ve successfully updated your profile!</div>\n	{/if}\n\n	<h1>Edit your profile</h1>\n		\n		<div class="row profile-form">\n\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Contact Details</h4>\n	\n					<p>\n						<label for="email">* Email address</label>\n						<input type=''text'' class="input-text required email" name=''email'' id="email" value=''{email}'' type="email" maxlength=''50''/>	\n						\n\n					<p>\n						<label for="location">Where are you based?</label>\n						<input type=''text'' class="input-text required" name=''location'' value=''{location}'' maxlength=''50''/>\n					</p>\n	\n					<p>\n						<label for="url">Your Website</label>\n						<input id="url" name="url" class="input-text" type="url" value=''{url}'' maxlength=''75'' />\n					</p>\n	\n					<p>	\n						<label for="facebook">{lang:facebook:label}</label>\n						<input type=''text'' name=''facebook'' class=''input-text'' value="{facebook}" />\n					</p>	\n	\n					<p>	\n						<label for="twitter">{lang:twitter:label}</label>\n						<input type=''text'' name=''twitter'' class=''input-text'' value="{twitter}" />\n					</p>\n\n					<p>	\n						<label for="linkedin">{lang:linkedin:label}</label>\n						<input type=''text'' name=''linkedin'' class=''input-text'' value="{linkedin}" />\n					</p>\n\n				</div>\n			\n				<div class="profile-section">	\n		\n					<h4>Profile photo</h4>\n\n						<img src="{photo_url}{photo_filename}" width="{photo_width}" height="{photo_height}" />\n	\n						<label for="photo_filename">Upload a New Photo</label>\n						<input type="file" name="photo_filename" />\n\n				</div>\n\n				<div class="profile-section">\n					<h4>Bio</h4>\n					<p>\n						<label for="bio">Tell us a bit about yourself</label>\n						<textarea name=''bio'' class=''textarea large'' type="text" rows="10">{bio}</textarea>\n					</p>\n	\n				</div>\n\n\n			\n			\n	\n			</div> <!-- /.columns -->\n	\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Your Company</h4>\n\n					<p>	\n						<label for="company_name">{lang:company_name:label}</label>\n						<input type=''text'' name=''company_name'' class=''input-text'' value="{company_name}" />\n					</p>\n	\n					<p>\n	\n		\n					<label for="avatar_filename">Company Logo</label>\n	\n					<img src="{avatar_url}{avatar_filename}" width="{avatar_width}" height="{avatar_height}" /></p>\n\n					<label for="avatar_filename">Upload a new logo</label>\n					<input type="file" name="avatar_filename" /></p>\n	\n					<p>	\n						<label for="company_description">{lang:company_description:label}</label>\n						<textarea name=''company_description'' class=''textarea large''>{company_description}</textarea>\n					</p>\n	\n	\n					<p>	\n						<label for="current_projects">{lang:current_projects:label}</label>\n						<textarea name=''bio'' class=''textarea large''>{bio}</textarea>\n					</p>\n\n				</div>\n			\n				<div class="profile-section">\n	\n					<h4>Skills and Experience</h4>\n\n					<p>	\n						<label for="creative_sector">{lang:creative_sector:label}</label>\n						<select name="creative_sector"> \n						{select_creative_sector} \n						<option value="{value}" {selected}>{value}</option> \n						{/select_creative_sector} \n						</select>\n					</p>	\n\n					<p>	\n						<label for="skills">{lang:skills:label}</label>\n						<textarea name=''skills'' class=''textarea large''>{skills}</textarea>\n					</p>\n\n					<p>	\n						<label for="experience">{lang:experience:label}</label>\n						<textarea name=''experience'' class=''textarea large''>{experience}</textarea>\n					</p>	\n\n				</div>\n	\n			</div> <!-- /.columns -->\n		\n		</div> <!-- /.row -->\n\n	<input type="submit" value="Do it !" class="large black button radius black-gradient" name="submit">\n\n	\n	{/exp:user:edit}\n\n\n	</div> <!-- /container -->\n\n\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}'),
(76, 53, 'exp_templates', 'template_data', 1335258261, 1, '\n{if logged_in}\n\n	{embed="includes/header"}\n\n\n	<div class="container public-profile"> \n\n		<div class="row">\n	\n			<div class="eight columns main-profile">\n		\n			{exp:user:stats}\n			<!-- Get member ID from the url segment -->\n		\n			<!-- Only show profiles for member sin the ''members'' group  (5)-->\n			{if group_id !=5 } \n				{redirect="404"} \n			{/if}\n		\n				<!-- Members profile picture and name -->\n				<div class="row">\n					<div class="six columns">\n						<div class="frame">\n							<!-- if photo -->\n							{if photo_filename != ""}\n									<img src="{photo_url}{photo_filename}"/>\n							{if:else}\n								<img src="/img/default_user_photo_small.png"/>\n							{/if}\n						</div>\n					</div>\n\n				\n					<div class="six columns">\n						<h1>{screen_name}</h1>\n						<p class="creative-sector">{creative_sector}</p>\n					</div>\n				</div> <!-- row -->\n				\n				<!-- About Me and other information -->\n				<div class="row">\n\n					<div class="twelve columns">\n					\n						<!-- network icons -->\n\n							<div class="row">\n									<div class="twelve columns">\n											{if facebook != ""}\n												<a href="{facebook}"><img src="/img/profile-icon-facebook.png" alt="facebook logo"/></a>\n											{/if}\n							\n											{if twitter != ""}\n												<a href="{twitter}"><img src="/img/profile-icon-twitter.png" alt="twitter logo"/>\n											{/if}\n							\n											{if linkedin != ""}\n												<a href="{linkedin}"><img src="/img/profile-icon-linkedin.png" alt="linked in logo"/>\n											{/if}\n									</div> <!-- columns -->\n							</div> <!-- row -->\n\n					\n				\n						<h3>About me</h3>\n						<p>{bio}</p>\n\n						<h3>Current projects</h3>\n						<p>{current_projects}</p>									\n\n					\n					\n					</div> <!-- columns -->\n\n				</div> <!-- row -->\n				\n				\n			</div> <!-- columns -->		\n										\n\n			<div class="four columns">	\n				<div class="inset rounded sidebar">\n					{if avatar_filename != "" }\n						<img src="{avatar_url}{avatar_filename}" class="member-logo" />\n					{if:else}\n						<img src="http://placehold.it/100x100" class="member-logo" />\n					{/if}\n					<h3 class="company-name">{company_name}</h3>\n					<p class="contact-details">\n						{if company_address != ""}\n							{company_address}<br />\n						{/if}\n					\n						{email}</br />\n					\n						{if company_phone != ""}\n							{company_phone}<br />\n						{/if}\n					\n						{if url != ""}\n							{url}<br />\n						{/if}\n					</p>\n				\n					{if company_description != ""}\n						<h2>Business description</h2>\n						<p>{company_description}</p>\n					{/if}\n				\n					{if skills != ""}\n						<h2>Skills</h2>\n						<p>{skills}</p>\n					{/if}\n				\n					{if experience != ""}\n						<h2>Experience</h2>\n						<p>{experience}</p>\n					{/if}\n											\n				</div>\n\n			</div> <!-- columns -->\n			\n\n		</div> <!-- .row -->\n	\n\n	{/exp:user:stats}\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n\n\n'),
(77, 18, 'exp_templates', 'template_data', 1335258261, 1, '{embed="includes/header" page="{segment_1}"}\n\n				<div class="container"> \n			\n					<div class="row">\n					\n						<div class="eight columns">\n							\n							{exp:channel:entries channel="news" limit=''1''}\n							\n								<div class="news-article">\n									<header>\n										<h2>{title}</h2> \n										<p><span class="date">{entry_date format=''%j %F %Y''}</span> by <strong>{author}</strong> <span class="comments">3 comments</span></p>\n									</header>\n									\n									{if news_video_url !=""}\n										{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n											<div class="flex-video">{embed_code}</div>\n										{/exp:antenna}\n									{if:elseif news_image != ""}\n										<div class="frame">\n											<!-- ><img src="http://lorempixel.com/450/250"/> -->\n											<img src="{news_image}" alt="{news_image_description}"/>\n										</div>\n									{/if}\n									\n									<div class="social-icons">\n					\n										{exp:socialeesta:like href="{title_permalink}" action="like" color="light" layout="standard"}\n									</div> <!-- /social-icons -->\n\n									<p>{news_article}</p>\n								</div> <!-- .news-article -->\n							\n							{/exp:channel:entries}\n							\n							<div id="comments">\n							\n									\n								\n								{exp:comment:entries}\n								\n									{if count==1}\n										<h5>Comments</h5>\n									{/if}\n								\n								\n													<div class="comment-content {switch odd|even}">\n														<header>\n															<p>\n																<span class="date">{comment_date format="%F %d, %Y"}</span> <span class="posted-by">Posted by</span> <strong>{name}</strong>\n															</p>\n														</header>		\n														{comment}\n													</div>\n\n								{/exp:comment:entries}\n								\n							</div> <!-- #comments -->\n							\n								<div id="comment-form">\n									<h5>Comment on this News Article</h5>\n\n									<fieldset id="comment-form-field">\n\n										{exp:comment:form channel="news" form_class="nice custom validatingForm"}\n										<div class="row">\n											<div class="six columns">\n												<p>\n													<label for="name">Name</label>\n													<input type="text" name="name" value="" class="input-text required" id="name" />\n												</p>\n												<p>\n													<label for="email">Email Address</label>\n													<input type="text" name="email" value="" class="input-text required email" id="email"  />\n												</p>\n											</div>\n											\n											<div class="six columns"> </div>\n										</div> <!-- .row -->\n											<p>\n												<label for="comment">Comment</label>\n												<textarea name="comment" class=''textarea large'' rows="8" cols="35" id="comment"></textarea>\n											</p>\n\n											<p>\n												<input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n											</p>\n											\n											\n										{/exp:comment:form}\n										\n									</fieldset>              \n\n\n\n							</div> <!-- END #comment-form -->\n							\n						</div> <!-- columns -->\n								\n							\n\n						<div class="four columns">	\n							{embed="includes/sidebar"}\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(78, 20, 'exp_templates', 'template_data', 1335258261, 1, '{embed="includes/header" page="{segment_1}"}\n			\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							<h1>Interested in joining up or finding out about special offers and upcoming events? Fill in your details and we’ll keep you in the loop.</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">	\n						\n							{exp:freeform:form \n								form:class="nice custom validatingForm"\n								collection="Sign Up"\n								return="/"\n								notify="info@projoosr.com"\n								send_user_email="yes"\n								}\n							\n								<div class="row">\n									<div class="six columns">	\n										<label for="first_name">Name *</label>\n										<input id="first_name" name="first_name" class="input-text required" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="last_name">Surname *</label>\n										<input id="last_name" name="last_name" class="input-text required" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->\n							\n								<div class="row">\n									<div class="twelve columns">\n											<label for="email">Email *</label>\n											<input id="email" name="email" class="input-text required email" type="text">\n									</div>\n								</div>	\n													\n								<div class="row">\n									<div class="six columns">	\n										<label for="phone_number">Phone number</label>\n										<input id="phone_number" name="phone_number" class="input-text" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="postcode">Postcode</label>\n										<input id="postcode" name="postcode" class="input-text" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->		\n						\n								<div class="row">\n									<div class="twelve columns">\n									\n										<label for="creative_insutry">What creative industry are you in?</label>\n										<select style="display:none;" id="creative_insutry" name="creative_industry" class="expand">\n										  	<option>Design</option>\n										  	<option>New Media</option>\n											<option>Television</option>\n										  	<option>Writing</option>\n										</select>\n									\n										<label for="membership_type">What type of membership are you interested in?</label>\n										<select style="display:none;" id="membership_type" name="membership_type" class="expand">\n										  	<option>Hub</option>\n											<option>Club</option>\n										  	<option>Incubator</option>\n										  	<option>Not sure</option>\n										</select>\n									\n									</div>	<!-- columns -->\n								</div> <!-- row -->\n							\n								<div class="row submit-section">\n\n									<div class="six columns">	\n										<input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n										\n									</div><!-- columns -->\n								\n									<div class="six columns terms">\n								            <span id="checkbox"><input id="opt-in" checked="checked" type="checkbox" /></span>\n								            <span id="checkbox-label"><label for="opt-in">Uncheck this box if you don’t want to recieve news about special discounts, upcoming events and more. Don’t worry, we hate spam and we’ll never share your details with anyone else.</label></span>\n									</div><!-- columns -->\n\n								</div><!-- row -->\n							\n							\n							{/exp:freeform:form} <!-- form -->\n										\n						</div> <!-- columns -->\n				\n						\n						<div class="six columns hide-on-phones">\n							<div class="large-image">\n								<img src="/img/membership.png" class="frame" />\n							</div>\n						</div> <!-- columns -->\n								\n							\n	\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n						\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(79, 1, 'exp_templates', 'template_data', 1335258261, 1, '{embed="includes/header"}\n\n				{exp:channel:entries channel="home"}\n	\n				<div class="container"> \n\n					<div class="row" id=''topSection''>\n\n						<div class="six columns push-six" id="straplineArea">\n								<div class="cta-container">\n									<h1>{strapline}</h1>\n									<a class="huge button black radius black-gradient hide-on-phones" href="/sign-up"><span>Join today</span></a>\n								</div>\n						</div> <!-- #straplineArea -->\n\n						<div class="six columns pull-six" id=''carousel''>\n								\n								<div class="frame">\n									     <img src="/img/carousel/5.jpg"/>\n								</div> <!-- carousel-container -->\n					\n				\n						</div> <!-- #carousel -->\n			\n				\n					</div> <!-- #topSection -->\n			\n					<div class="row services">\n						\n						\n							<div class="quarter columns">\n								<div class="service rounded">\n										<h2>Incubator</h2>\n									<img src="{home_incubator_image}" alt="Incubator" />\n									<p>{home_incubator_copy}</p>\n									<a href="/incubator" class="medium black button radius black-gradient"><span>Fund your business</span></a>\n								</div> <!-- panel -->\n							</div>				\n				\n							<div class="quarter columns">				\n								<div class="service rounded">\n									<h2>Workspace</h2>\n									<img src="{home_workspace_image}" alt="Workspace" />\n									<p>{home_workspace_copy}</p>\n									<a href="/workspace" class="medium black button radius black-gradient"><span>See the workspace</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class="quarter columns">					\n								<div class="service rounded">\n									<h2>Events</h2>\n									<img src="{home_events_image}" alt="Events" />\n									<p>{home_events_copy}</p>\n									<a href="/events" class="medium black button radius black-gradient"><span>Come to an event</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class="quarter columns">				\n								<div class="service rounded">\n									<h2>Membership</h2>\n									<img src="{home_membership_image}" alt="Membership" />\n									<p>{home_membership_copy}</p>\n									<a href="/membership" class="medium black button radius black-gradient"><span>Find out more</span></a>\n								</div> <!-- panel -->\n							</div>\n							\n						{/exp:channel:entries}\n\n					</div><!-- #services-->\n				\n\n					<div class="row" id="news-area">\n					\n						<div class="seven columns">\n						\n							<h2>Latest news</h2>\n								\n								{exp:channel:entries channel="news" limit="1"}\n								<div class="row">\n									<div class="three columns">\n										<a href="{title_permalink=''news/view''}">\n											\n											{if news_video_url !=""}\n												{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n														<img src="{video_thumbnail}" alt="{video_title}" />\n												{/exp:antenna}\n											{if:elseif news_image != ""}\n												<img src="{news_image}" alt="{title}" />\n											{/if}\n										</a>\n									\n									</div> <!-- .six columns -->\n\n									<div class="nine columns">\n										\n										<div class="news-article">\n											<header>\n												<h3 class="news-heading"><a href="{title_permalink=''news/view''}">{title}</a></h3>\n												<p><span class="date">{entry_date format=''%j %F %Y''}</span> by {author} <span class="comments">3 comments</span></p>\n											</header>	\n											<p class="excerpt">\n												{exp:eehive_hacksaw words="15" append="..."}\n													{news_article}\n												{/exp:eehive_hacksaw}\n											</p>\n											\n											\n										</div> <!-- .news-article -->\n									\n										\n									</div>\n								\n								</div> <!-- .row -->\n								{/exp:channel:entries}\n					\n\n\n						</div> <!-- .seven columns-->\n\n						<div class="five columns">	\n							<h2>Upcoming events</h2>\n								{exp:eventbriteapi:upcomingEvents}\n									<div class="row event">\n										<div class="three columns">\n												<a href=''{url}''>\n													<div class="date-box">\n														<p class="month">{month}</p>\n														<p class="day">{day}</p>\n													</div> <!-- date-box -->\n												</a>\n										</div>\n										<div class="nine columns">\n											<div class="event-details">\n												<h3 class="event-heading"><a href=''{url}''>{title}</a></h3>\n												<p class="excerpt">{excerpt}</p>\n											</div> <!-- date- -->	\n										</div>\n									</div>\n								{/exp:eventbriteapi:upcomingEvents}\n						</div> <!-- sidebar -->\n							\n			\n					</div> <!-- #news-area -->\n\n				</div> <!-- container -->\n				\n{embed="includes/footer"}'),
(80, 57, 'exp_templates', 'template_data', 1335258607, 1, ''),
(81, 58, 'exp_templates', 'template_data', 1335259960, 1, ''),
(83, 60, 'exp_templates', 'template_data', 1335272674, 1, ''),
(84, 61, 'exp_templates', 'template_data', 1335273334, 1, ''),
(85, 13, 'exp_templates', 'template_data', 1335276087, 1, '{embed="includes/header" page="{segment_1}"}\n	\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							{exp:channel:entries channel="about"}\n								<h1>{about_headline}</h1>\n							{/exp:channel:entries}\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">\n							<div class="frame">\n								<img src="http://lorempixel.com/450/250"/>\n							</div>\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							{exp:channel:entries channel="about"}\n								<p>{about_main_copy}</p>\n							{/exp:channel:entries}	\n							\n							<a class="medium black button radius black-gradient" href="/sign-up"><span>Join us today</span></a>\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n							{exp:channel:entries channel="about"}\n								<h2>Why MeWe?</h2>\n								<p class="small">{about_why_mewe}</p>\n							\n\n								<h2>How we work</h2>\n								<p class="small">{about_how_we_work}</p>\n\n								<h2>Why join?</h2>\n								<p class="small">{about_why_join}</p>\n				\n							{/exp:channel:entries}\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n					<div class="row people-section">\n						<div class="twelve columns">\n							<dl class="tabs">\n							  <dd><a href="#simple1" class="active">The Team</a></dd>\n							  <dd><a href="#simple2">The Board</a></dd>\n							  <dd><a href="#simple3">Advisors</a></dd>\n							</dl>\n\n							<ul class="tabs-content">\n								\n								<li class="active" id="simple1Tab">\n									<div class="container">\n										<p>Our team looks after MeWe’s members and keeps our events and workspace running smoothly.</p>\n										<ul class="block-grid four-up">\n											\n											{embed="includes/people_gallery" field="team"}\n										\n										</ul>\n									</div>\n								</li>\n							  	\n							<li id="simple2Tab">\n									<div class="container">\n										<p>The board creates MeWe’s strategy to ensure that members are offered the most innovative and cutting-edge services for their businesses.</p>\n										<ul class="block-grid four-up">\n										\n											{embed="includes/people_gallery" field="board"}\n											\n										</ul>\n									</div>\n								\n								</li>\n								<li id="simple3Tab">\n										<div class="container">\n											\n											<p>From heads of leading media organisations to captains of creative industry, our advisors offer members invaluable one-to-one business coaching.</p>\n											\n											<ul class="block-grid four-up">\n												\n												{embed="includes/people_gallery" field="advisors"}\n										\n											</ul>\n										</div>\n\n									</li>\n							\n						\n							</ul>\n		\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(88, 61, 'exp_templates', 'template_data', 1335276087, 1, '{exp:channel:entries channel="about"}\n\n	{{embed:field}}\n		<li> \n			\n			{if video == ""}\n				<a  \n					 href="http://pseudo01.hddn.com/vod/demo.flowplayervod/flowplayer-700.flv"\n					 id="{embed:field}{row_id}" style="display:block;"\n					class="flowplayer flex-video widescreen"> \n				</a> \n\n				<!-- this will install flowplayer inside previous A- tag. -->\n				<script>\n					\n					flowplayer("{embed:field}{row_id}", "/javascripts/flowplayer/flowplayer-3.2.10.swf",\n					{\n						plugins: {controls: null},\n						playlist: [\n						\n\n						    // this first PNG clip works as a splash image\n						    {\n						        url: ''{photo}'', \n						        scaling: ''scale''\n						    },\n\n\n						    // second clip is a video. when autoPlay is set to false the splash screen will be shown\n						    {\n						        url: ''http://pseudo01.hddn.com/vod/demo.flowplayervod/flowplayer-700.flv'', \n						        autoPlay: false, \n\n						        // video will be buffered when splash screen is visible\n						        autoBuffering: true \n						    }\n						]\n\n					});\n					\n				</script>\n\n			{if:else}\n			\n					{if photo != ""}\n						<img src="{photo}">\n					{else:if}\n						<img src="http://lorempixel.com/200/120">\n					{/if}\n			{/if}\n\n			<h3>{name}</h3>\n			<p>{bio}</p>\n		\n		</li>\n		\n	{/{embed:field}}\n	\n{/exp:channel:entries}'),
(89, 58, 'exp_templates', 'template_data', 1335276087, 1, '\n{if logged_in}\n\n	{embed="includes/header" page="edit_profile"}\n	\n	<div class="container">\n\n	{exp:user:edit form:class="nice custom validatingForm" return="members/edit_account/success" error_page="member/error" dynamic="off"}\n\n	{if segment_3 == "success"}\n		<div class="alert-box success">You''ve successfully updated your account!</div>\n	{/if}\n\n	<h1>Edit your account</h1>\n		\n		<div class="row profile-form">\n\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n				\n					<p>\n						<label for="current_password">* Your current password is required to change your account details</label>\n						<input type=''password'' autocomplete="off" class="input-text required password" name=''current_password'' id="current_password" value='''' type="password"/>	\n					</p>\n				\n				</div>\n	\n				<div class="profile-section">\n				\n					<h4>Change Your Password</h4>\n					\n					<p>\n						<label for="new_password">New Password</label>\n						<input type=''password'' class="input-text password" name=''password'' id="password" value='''' type="password"/>	\n					</p>\n					\n					<p>\n						<label for="password_confirm">Confirm Password</label>\n						<input type=''password'' class="input-text password" name=''password_confirm'' id="password_confirm" value='''' type="password"/>\n					</p>\n				</div> <!-- profile-section -->\n\n	\n			</div> <!-- /.columns -->\n	\n			<div class="six columns">\n\n			</div> <!-- /.columns -->\n		\n		</div> <!-- /.row -->\n\n	<input type="submit" value="Do it !" class="large black button radius black-gradient" name="submit">\n\n	\n	{/exp:user:edit}\n\n\n	</div> <!-- /container -->\n\n\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}');
INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES
(90, 54, 'exp_templates', 'template_data', 1335276087, 1, '\n{if logged_in}\n\n	{embed="includes/header" page="edit_profile"}\n	\n	<div class="container">\n\n	{exp:user:edit form:class="nice custom validatingForm" return="members/edit_profile/success" error_page="member/error" dynamic="off"}\n\n	{if segment_3 == "success"}\n		<div class="alert-box success">You''ve successfully updated your profile!</div>\n	{/if}\n\n	<h1>Edit your profile</h1>\n		\n		<div class="row profile-form">\n\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Contact Details</h4>\n	\n					<p>\n						<label for="email">* Email address</label>\n						<input type=''text'' class="input-text required email" name=''email'' id="email" value=''{email}'' type="email" maxlength=''50''/>	\n						\n\n					<p>\n						<label for="location">Where are you based?</label>\n						<input type=''text'' class="input-text required" name=''location'' value=''{location}'' maxlength=''50''/>\n					</p>\n	\n					<p>\n						<label for="url">Your Website</label>\n						<input id="url" name="url" class="input-text" type="url" value=''{url}'' maxlength=''75'' />\n					</p>\n	\n					<p>	\n						<label for="facebook">{lang:facebook:label}</label>\n						<input type=''text'' name=''facebook'' class=''input-text'' value="{facebook}" />\n					</p>	\n	\n					<p>	\n						<label for="twitter">{lang:twitter:label}</label>\n						<input type=''text'' name=''twitter'' class=''input-text'' value="{twitter}" />\n					</p>\n\n					<p>	\n						<label for="linkedin">{lang:linkedin:label}</label>\n						<input type=''text'' name=''linkedin'' class=''input-text'' value="{linkedin}" />\n					</p>\n\n				</div>\n			\n				<div class="profile-section">	\n		\n					<h4>Profile photo</h4>\n					{if photo_filename != ""}\n						<img src="{photo_url}{photo_filename}" width="{photo_width}" height="{photo_height}" />\n					{if:else}\n						<img src="/img/default_user_photo_small.png">\n					{/if}\n\n						<label for="photo_filename">Upload a New Photo</label>\n						<input type="file" name="photo_filename" />\n\n				</div>\n\n				<div class="profile-section">\n					<h4>Bio</h4>\n					<p>\n						<label for="bio">Tell us a bit about yourself</label>\n						<textarea name=''bio'' class=''textarea large'' type="text" rows="10">{bio}</textarea>\n					</p>\n	\n				</div>\n\n\n			\n			\n	\n			</div> <!-- /.columns -->\n	\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Your Company</h4>\n\n					<p>	\n						<label for="company_name">{lang:company_name:label}</label>\n						<input type=''text'' name=''company_name'' class=''input-text'' value="{company_name}" />\n					</p>\n	\n					<p>\n	\n		\n					<label for="avatar_filename">Company Logo</label>\n	\n					<img src="{avatar_url}{avatar_filename}" width="{avatar_width}" height="{avatar_height}" /></p>\n\n					<label for="avatar_filename">Upload a new logo</label>\n					<input type="file" name="avatar_filename" /></p>\n	\n					<p>	\n						<label for="company_description">{lang:company_description:label}</label>\n						<textarea name=''company_description'' class=''textarea large''>{company_description}</textarea>\n					</p>\n	\n	\n					<p>	\n						<label for="current_projects">{lang:current_projects:label}</label>\n						<textarea name=''bio'' class=''textarea large''>{bio}</textarea>\n					</p>\n\n				</div>\n			\n				<div class="profile-section">\n	\n					<h4>Skills and Experience</h4>\n\n					<p>	\n						<label for="creative_sector">{lang:creative_sector:label}</label>\n						<select name="creative_sector"> \n						{select_creative_sector} \n						<option value="{value}" {selected}>{value}</option> \n						{/select_creative_sector} \n						</select>\n					</p>	\n\n					<p>	\n						<label for="skills">{lang:skills:label}</label>\n						<textarea name=''skills'' class=''textarea large''>{skills}</textarea>\n					</p>\n\n					<p>	\n						<label for="experience">{lang:experience:label}</label>\n						<textarea name=''experience'' class=''textarea large''>{experience}</textarea>\n					</p>	\n\n				</div>\n	\n			</div> <!-- /.columns -->\n		\n		</div> <!-- /.row -->\n\n	<input type="submit" value="Do it !" class="large black button radius black-gradient" name="submit">\n\n	\n	{/exp:user:edit}\n\n\n	</div> <!-- /container -->\n\n\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}'),
(91, 57, 'exp_templates', 'template_data', 1335276087, 1, '{embed="includes/header" page="error"}\n\n	<div class="content">\n		<h2>{title}</h2>\n		<h3>{heading}</h3>\n		<p>{content}</p>\n		<p>{link}</p>\n	</div>\n	\n{embed="includes/footer"}'),
(92, 62, 'exp_templates', 'template_data', 1335282831, 1, '\n{if logged_in}\n\n	{embed="includes/header"}\n\n\n	<div class="container public-profile"> \n\n		<div class="row">\n	\n			<div class="eight columns main-profile">\n		\n			{exp:user:stats}\n			<!-- Get member ID from the url segment -->\n		\n			<!-- Only show profiles for member sin the ''members'' group  (5)-->\n			{if group_id !=5 } \n				{redirect="404"} \n			{/if}\n		\n				<!-- Members profile picture and name -->\n				<div class="row">\n					<div class="six columns">\n						<div class="frame">\n							<!-- if photo -->\n							{if photo_filename != ""}\n									<img src="{photo_url}{photo_filename}"/>\n							{if:else}\n								<img src="/img/default_user_photo_small.png"/>\n							{/if}\n						</div>\n					</div>\n\n				\n					<div class="six columns">\n						<h1>{screen_name}</h1>\n						<p class="creative-sector">{creative_sector}</p>\n					</div>\n				</div> <!-- row -->\n				\n				<!-- About Me and other information -->\n				<div class="row">\n\n					<div class="twelve columns">\n					\n						<!-- network icons -->\n\n							<div class="row">\n									<div class="twelve columns">\n											{if facebook != ""}\n												<a href="{facebook}"><img src="/img/profile-icon-facebook.png" alt="facebook logo"/></a>\n											{/if}\n							\n											{if twitter != ""}\n												<a href="{twitter}"><img src="/img/profile-icon-twitter.png" alt="twitter logo"/>\n											{/if}\n							\n											{if linkedin != ""}\n												<a href="{linkedin}"><img src="/img/profile-icon-linkedin.png" alt="linked in logo"/>\n											{/if}\n									</div> <!-- columns -->\n							</div> <!-- row -->\n\n					\n				\n						<h3>About me</h3>\n						<p>{bio}</p>\n\n						<h3>Current projects</h3>\n						<p>{current_projects}</p>									\n\n					\n					\n					</div> <!-- columns -->\n\n				</div> <!-- row -->\n				\n				\n			</div> <!-- columns -->		\n										\n\n			<div class="four columns">	\n				<div class="inset rounded sidebar">\n					{if avatar_filename != "" }\n						<img src="{avatar_url}{avatar_filename}" class="member-logo" />\n					{if:else}\n						<img src="http://placehold.it/100x100" class="member-logo" />\n					{/if}\n					<h3 class="company-name">{company_name}</h3>\n					<p class="contact-details">\n						{if company_address != ""}\n							{company_address}<br />\n						{/if}\n					\n						{email}</br />\n					\n						{if company_phone != ""}\n							{company_phone}<br />\n						{/if}\n					\n						{if url != ""}\n							{url}<br />\n						{/if}\n					</p>\n				\n					{if company_description != ""}\n						<h2>Business description</h2>\n						<p>{company_description}</p>\n					{/if}\n				\n					{if skills != ""}\n						<h2>Skills</h2>\n						<p>{skills}</p>\n					{/if}\n				\n					{if experience != ""}\n						<h2>Experience</h2>\n						<p>{experience}</p>\n					{/if}\n											\n				</div>\n\n			</div> <!-- columns -->\n			\n\n		</div> <!-- .row -->\n	\n\n	{/exp:user:stats}\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n\n\n'),
(93, 63, 'exp_templates', 'template_data', 1335604721, 1, ''),
(94, 64, 'exp_templates', 'template_data', 1335802700, 1, ''),
(95, 65, 'exp_templates', 'template_data', 1335861045, 1, ''),
(96, 13, 'exp_templates', 'template_data', 1335955097, 1, '{embed="includes/header" page="{segment_1}" page_title="About Us - {company_name}"}\n	\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							{exp:channel:entries channel="about"}\n								<h1>{about_headline}</h1>\n							{/exp:channel:entries}\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">\n							<div class="frame">\n								<img src="http://lorempixel.com/450/250"/>\n							</div>\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							{exp:channel:entries channel="about"}\n								<p>{about_main_copy}</p>\n							{/exp:channel:entries}	\n							\n							<a class="medium black button radius black-gradient" href="/sign-up"><span>Join us today</span></a>\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n							{exp:channel:entries channel="about"}\n								<h2>Why MeWe?</h2>\n								<p class="small">{about_why_mewe}</p>\n							\n\n								<h2>How we work</h2>\n								<p class="small">{about_how_we_work}</p>\n\n								<h2>Why join?</h2>\n								<p class="small">{about_why_join}</p>\n				\n							{/exp:channel:entries}\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n					<div class="row people-section">\n						<div class="twelve columns">\n							<dl class="tabs">\n							  <dd><a href="#simple1" class="active">The Team</a></dd>\n							  <dd><a href="#simple2">The Board</a></dd>\n							  <dd><a href="#simple3">Advisors</a></dd>\n							</dl>\n\n							<ul class="tabs-content">\n								\n								<li class="active" id="simple1Tab">\n									<div class="container">\n										<p>Our team looks after MeWe’s members and keeps our events and workspace running smoothly.</p>\n										<ul class="block-grid four-up">\n											\n											{embed="includes/people_gallery" field="team"}\n										\n										</ul>\n									</div>\n								</li>\n							  	\n							<li id="simple2Tab">\n									<div class="container">\n										<p>The board creates MeWe’s strategy to ensure that members are offered the most innovative and cutting-edge services for their businesses.</p>\n										<ul class="block-grid four-up">\n										\n											{embed="includes/people_gallery" field="board"}\n											\n										</ul>\n									</div>\n								\n								</li>\n								<li id="simple3Tab">\n										<div class="container">\n											\n											<p>From heads of leading media organisations to captains of creative industry, our advisors offer members invaluable one-to-one business coaching.</p>\n											\n											<ul class="block-grid four-up">\n												\n												{embed="includes/people_gallery" field="advisors"}\n										\n											</ul>\n										</div>\n\n									</li>\n							\n						\n							</ul>\n		\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(97, 22, 'exp_templates', 'template_data', 1335955097, 1, '{embed="includes/header" page="{segment_1} page_title="Contact Us - {company_name}"}\n\n<div class="container">\n	<div class="row">\n		<div class="twelve columns">\n			\n					\n		{exp:freeform:form \n			form:class="nice custom"\n			collection="Contact Us"\n			required="name|email"\n			return="/"\n			notify="info@projoosr.com"\n			template="default_template"\n			send_user_email="yes"\n			}\n							\n			        <h2>Get in touch</h2>\n					<p>We''d love to hear from you !</p>\n							\n							<label for="name">What''s your name?</label>\n			                <input type="text" class="input-text" id="name" name="name" size="40" maxlength="35" />\n\n			                <label for="email">Your Email</label>\n			                <input type="text" class="input-text" id="from" name="email" size="40" maxlength="35" />\n\n\n			                <label for="subject">Subject</label>\n			                <input type="text" class="input-text" id="subject" name="subject" size="40" />\n\n			                <label for="message">Message</label>\n			                <textarea id="message" name="message" rows="18" class="large" >\n\n			                </textarea>\n\n			                <input name="submit" type=''submit'' value=''Submit'' class=''large black button radius black-gradient'' />\n\n			{/exp:freeform:form}\n	\n		</div> <!-- columns -->\n	</div> <!-- row -->\n	\n</div>\n\n{embed="includes/footer"}'),
(101, 65, 'exp_templates', 'template_data', 1335955097, 1, '<script>    \n\n$(document).ready(function() {\n	\n	// init the progress bar\n	$("#{embed:type}-progressbar").progressbar({ value: 0 });\n	\n	// set some styles on it\n	$("#{embed:type}-progressbar").css({ ''height'':''10px'' });\n	$("#{embed:type}-progressbar").css({ ''display'':''none'' });\n	$(".ui-progressbar-value").css({ ''background-image'' : ''url(/img/uploader/progress-bar.gif)'' }); \n});\n\n\nfunction create{embed:type}Uploader(){            \n    var {embed:type}_uploader = new qq.FileUploaderBasic({\n        button: document.getElementById(''{embed:type}-uploader''),\n        action: ''/uploader/{embed:type}'',\n        debug: true,\n\n		onSubmit: function(id, filename) {\n			$("#{embed:type}-progressbar").show(''slide'',''slow'');\n			$("#{embed:type}-progressbar").progressbar( "option", "value", 5 ); },\n			\n       	onProgress: function(id, filename, loaded, total) {\n            			console.log( ''Progress for file: %s, ID: %s, loaded: %s, total: %s'', \n									  id, filename, loaded, total);\n						var progress = Math.round((loaded / total) * 100)*0.95;\n						$("#{embed:type}-progressbar").progressbar("option", "value", progress+5 );	},\n						\n		onComplete: function(id, filename, responseJSON) {\n		                    console.log(''File upload for file %s, id %s done with status %s'', filename, id, responseJSON);\n		                    $("#{embed:type}-progressbar").hide(''highlight'',''slow'');\n							d = new Date();\n							\n							if (''{embed:type}'' == "photo")\n								path="/images/member_photos";\n							else if (''{embed:type}'' == "avatar")\n								path="/images/avatars"\n						\n							// $("#{embed:type}").attr("src", path + "/" + responseJSON[''full_filename''] + "?"+d.getTime());\n							 $("#{embed:type}").attr("src", responseJSON[''thumbnail''] + "?"+d.getTime());  \n							}\n							\n							\n		\n     });    \n}\n\n    create{embed:type}Uploader();     \n\n\n</script>'),
(102, 14, 'exp_templates', 'template_data', 1335955097, 1, '{embed="includes/header" page="{segment_1}" page_title="Business Incubator - {company_name}"}\n			\n				<div class="container"> \n				\n				\n					\n					<div class="row">\n						\n						<div class="six columns">\n							<div class="frame">\n								<img src="http://lorempixel.com/450/250"/>\n							</div>\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							{exp:channel:entries channel="incubator"}\n								<h1>{incubator_headline}</h1>\n								<p>{incubator_main_copy}</p>	\n							{/exp:channel:entries}\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n\n						<div class="six columns">\n							<h2>Here''s how it works</h2>\n								<p class="small">We’ll meet you for an initial in-depth one-to-one session so that together we\n								can identify exactly what you need to propel you, your ideas and your creative\n								business to the next level. Throughout the programme we will continue to work\n								with you to closely monitor and respond to your changing needs as you, your\n								business or idea develops.</p>\n								<p class="small">What you will get is a bespoke package of support to\n								ensure you meet the goals you have set. Packages include:</p>\n\n								<h4>Mentoring and Consultancy</h4>\n								<p class="small">One-to-one coaching to guide your leadership development as well as expert\n								advice in key areas of business practice such as marketing, planning, finance, human resources</p>\n								<hr />\n								\n								<h4>Events</h4>\n								<p class="small">A programme of networking and leadership development events designed\n								to inspire, inform and connect our membership including speakers, panel\n								discussions, workshops, expert clinics.</p>\n								<hr />\n								\n								<h4>Facilities</h4>\n								<p class="small">Professional cinema, meeting, work and event spaces to present, collaborate and network.</p>\n								<hr />\n								\n								<h4>Networks</h4>\n								<p class="small">You will be plugged into the MeWe network as well as other relevant external networks.</p>\n								<hr />\n								\n								<h4>Finance</h4>\n								<p class="small">Opportunity to pitch for investment from MeWe’s investment arm, MeWe Money. More information is available <a href="#">here</a>.</p>\n								\n						</div> <!-- columns -->\n\n\n\n						<div class="six columns">	\n							<div class="inset rounded">\n								<h2>Launching a project or product?</h2>\n\n								<h3>We can provide the venue and help make sure the right people are there.</h3>\n								<p>Throughout the programme we will continue to work with you to closely monitor and respond to your changing needs as you, your business or idea develops.</p>\n								<p>What you will get is a tailor made service to enable you to maximise your potential and opportunities.</p>\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/me.png" />\n									</div>\n									<div class="nine columns">	\n										<p>but within a strong, vibrant community of peers.</p>\n									</div>\n								</div>\n								\n								<hr />\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/we.png" />\n									</div>\n									<div class="nine columns">	\n										<p>committed, aspirational and talented creative entrepreneurs like you – offering support and collaboration where ideas can not only ignite but be realised.</p>\n									</div>\n								</div>\n								\n								<hr />\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/360.png" />\n									</div>\n									<div class="nine columns">	\n										<p>support needed to succeed at the highest level together with the opportunity to apply for seed funding of £200K from our investment arm.</p>\n									</div>\n								</div>\n																\n							</div>\n							\n						</div> <!-- columns -->\n\n\n					</div> <!-- .row -->\n					\n					<div class="row cta">\n						<div class="nine columns">\n							If you believe you have a compelling business idea, the ambition for success and want to work with business experts and mentors to grow your business get in touch now.\n							\n						</div>\n						<div class="three columns">\n							<a href="/sign-up" class="medium black button radius black-gradient"><span>Get in touch</span></a>\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(103, 55, 'exp_templates', 'template_data', 1335955097, 1, '{if logged_in}\n\n	{embed="includes/header" page_title="The Community - {company_name}}\n\n	<div class="container community"> \n\n			<h1>Community</h1>\n		\n			<ul class="block-grid six-up mobile community-grid">\n		\n				{exp:user:users group_id=''5'' dynamic=''off'' }\n			\n				<li>\n					<!-- link to individual member profile page -->\n					<a href="/members/{member_id}">\n						<div class="frame">\n							{if photo_filename != ""}\n								\n									<img src="{photo_url}{photo_filename}" />\n\n							{if:else}\n								<img src="/img/default_user_photo_small.png">\n							{/if}\n							\n						</div>\n					<p class="orange-header-bar">{screen_name}</p></a>\n				</li>\n			       \n				{/exp:user:users}\n			\n			</ul>\n		\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}'),
(104, 58, 'exp_templates', 'template_data', 1335955097, 1, '\n{if logged_in}\n\n	{embed="includes/header" page="edit_profile" page_title="Edit your account - {company_name}}\n	\n	<div class="container">\n\n	{exp:user:edit form:class="nice custom validatingForm" return="members/edit_account/success" error_page="member/error" dynamic="off"}\n\n	{if segment_3 == "success"}\n		<div class="alert-box success">You''ve successfully updated your account!</div>\n	{/if}\n\n	<h1>Edit your account</h1>\n		\n		<div class="row profile-form">\n\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n				\n					<p>\n						<label for="current_password">* Your current password is required to change your account details</label>\n						<input type=''password'' autocomplete="off" class="input-text required password" name=''current_password'' id="current_password" value='''' type="password"/>	\n					</p>\n				\n				</div>\n	\n				<div class="profile-section">\n					\n					<h4>Email address</h4>\n					\n					<p>\n						<label for="email">* Email address</label>\n						<input type=''text'' class="input-text required email" name=''email'' id="email" value=''{email}'' type="email" maxlength=''50''/>	\n					</p>\n				\n					<h4>Change Your Password</h4>\n					\n					<p>\n						<label for="new_password">New Password</label>\n						<input type=''password'' class="input-text password" name=''password'' id="password" value='''' type="password"/>	\n					</p>\n					\n					<p>\n						<label for="password_confirm">Confirm Password</label>\n						<input type=''password'' class="input-text password" name=''password_confirm'' id="password_confirm" value='''' type="password"/>\n					</p>\n				</div> <!-- profile-section -->\n\n	\n			</div> <!-- /.columns -->\n	\n			<div class="six columns">\n\n			</div> <!-- /.columns -->\n		\n		</div> <!-- /.row -->\n\n	<input type="submit" value="Do it !" class="large black button radius black-gradient" name="submit">\n\n	\n	{/exp:user:edit}\n\n\n	</div> <!-- /container -->\n\n\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}'),
(105, 54, 'exp_templates', 'template_data', 1335955097, 1, '\n{if logged_in}\n\n	{embed="includes/header" page="edit_profile" page_title="Edit your profile"}\n	\n	<div class="container">\n\n	{exp:user:edit form:class="nice custom validatingForm" return="members/edit_profile/success" error_page="member/error" dynamic="off"}\n\n	{if segment_3 == "success"}\n		<div class="alert-box success">You''ve successfully updated your profile!</div>\n	{/if}\n\n	<h1>Edit your profile</h1>\n		\n		<div class="row profile-form">\n\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Contact Details</h4>\n\n					<p>\n						<label for="location">Where are you based?</label>\n						<input type=''text'' class="input-text required" name=''location'' value=''{location}'' maxlength=''50''/>\n					</p>\n	\n					<p>\n						<label for="url">Your Website</label>\n						<input id="url" name="url" class="input-text" type="url" value=''{url}'' maxlength=''75'' />\n					</p>\n	\n					<p>	\n						<label for="facebook">{lang:facebook:label}</label>\n						<input type=''text'' name=''facebook'' class=''input-text'' value="{facebook}" />\n					</p>	\n	\n					<p>	\n						<label for="twitter">{lang:twitter:label}</label>\n						<input type=''text'' name=''twitter'' class=''input-text'' value="{twitter}" />\n					</p>\n\n					<p>	\n						<label for="linkedin">{lang:linkedin:label}</label>\n						<input type=''text'' name=''linkedin'' class=''input-text'' value="{linkedin}" />\n					</p>\n\n				</div>\n				\n\n			\n				<div class="profile-section">	\n		\n					<h4>Profile photo</h4>\n					{if photo_filename != ""}\n\n							<img src="{photo_url}{photo_filename}" id="photo" />\n\n					{if:else}\n						<img id="photo"src="/img/default_user_photo_small.png">\n					{/if}\n					\n			\n		            <p>\n						<span id=''photo-uploader''>\n		              		<input type="button" name="upload" id="upload" value="Upload a new photo" />\n		            	</span>\n					</p>\n\n					<script src="/javascripts/fileuploader.js" type="text/javascript"></script>\n				\n					<!-- This div will be replaced by Jquery with the animated progress bar -->\n					<div id="photo-progressbar"></div>\n				\n				\n					<!-- file upload script -->\n					{embed="includes/upload_script" type="photo"}\n				\n				</div>\n\n				<div class="profile-section">\n					<h4>Bio</h4>\n					<p>\n						<label for="bio">Tell us a bit about yourself</label>\n						<textarea name=''bio'' class=''textarea large'' type="text" rows="10">{bio}</textarea>\n					</p>\n	\n				</div>\n\n\n			\n			\n	\n			</div> <!-- /.columns -->\n	\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Your Company</h4>\n\n					<p>	\n						<label for="company_name">{lang:company_name:label}</label>\n						<input type=''text'' name=''company_name'' class=''input-text'' value="{company_name}" />\n					</p>\n	\n					<p>\n	\n					\n					<!-- \n						Because ExpressionEngine only has fields for Member Photo and Avatar, \n						We are using Avatar to store the company logo.\n					-->\n		\n					<label for="avatar_filename">Company Logo</label>\n					\n					{exp:ce_img:pair:avatar src="{avatar_url}{avatar_filename}" max="100" allow_scale_larger="yes" crop="yes"}\n						<img src="{avatar:made}" id="avatar"/>\n					{/exp:ce_img:pair:avatar}\n					\n					<p>\n						<span id=''avatar-uploader''>\n		              		<input type="button" name="avatar-upload" id="avatar-upload" value="Upload a new logo" />\n		            	</span>\n					</p>\n				\n					<!-- This div will be replaced by Jquery with the animated progress bar -->\n					<div id="avatar-progressbar"></div>\n				\n				\n					<!-- file upload script -->\n					{embed="includes/upload_script" type="avatar"}\n					\n	\n					<p>	\n						<label for="company_address">{lang:company_address:label}</label>\n						<textarea name=''company_address'' class=''textarea large'' rows=''2'' maxlength=''200''>{company_address}</textarea>\n					</p>	\n	\n					<p>	\n						<label for="company_description">{lang:company_description:label}</label>\n						<textarea name=''company_description'' class=''textarea large''>{company_description}</textarea>\n					</p>\n	\n	\n					<p>	\n						<label for="current_projects">{lang:current_projects:label}</label>\n						<textarea name=''current_projects'' class=''textarea large''>{current_projects}</textarea>\n					</p>\n\n				</div>\n			\n				<div class="profile-section">\n	\n					<h4>Skills and Experience</h4>\n\n					<p>	\n						<label for="creative_sector">{lang:creative_sector:label}</label>\n						<select name="creative_sector"> \n						{select_creative_sector} \n						<option value="{value}" {selected}>{value}</option> \n						{/select_creative_sector} \n						</select>\n					</p>	\n\n					<p>	\n						<label for="skills">{lang:skills:label}</label>\n						<textarea name=''skills'' class=''textarea large''>{skills}</textarea>\n					</p>\n\n					<p>	\n						<label for="experience">{lang:experience:label}</label>\n						<textarea name=''experience'' class=''textarea large''>{experience}</textarea>\n					</p>	\n\n				</div>\n	\n			</div> <!-- /.columns -->\n		\n		</div> <!-- /.row -->\n\n	<input type="submit" value="Do it !" class="large black button radius black-gradient" name="submit">\n\n	\n	{/exp:user:edit}\n\n\n	</div> <!-- /container -->\n\n\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}'),
(106, 57, 'exp_templates', 'template_data', 1335955097, 1, '{embed="includes/header" page="error" page_title="Error - {company_name}}\n\n	<div class="content">\n		<h2>{title}</h2>\n		<h3>{heading}</h3>\n		<p>{content}</p>\n		<p>{link}</p>\n	</div>\n	\n{embed="includes/footer"}'),
(107, 52, 'exp_templates', 'template_data', 1335955097, 1, '{if logged_in}\n\n	{if segment_2 != ""} \n\n		{embed="members/profile" member="{segment_2}"}\n	\n	{if:else}\n\n		{embed="members/community"}\n\n	{/if}\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n	'),
(108, 62, 'exp_templates', 'template_data', 1335955097, 1, '\n{if logged_in}\n\n	{embed="includes/header" page_title="{exp:user:stats}{screen_name}{/exp:user:stats}"}\n\n\n	<div class="container public-profile"> \n\n		<div class="row">\n	\n			<div class="eight columns main-profile">\n		\n			{exp:user:stats}\n			<!-- Get member ID from the url segment -->\n		\n			<!-- Only show profiles for member sin the ''members'' group  (5)-->\n			{if group_id !=5 } \n				{redirect="404"} \n			{/if}\n		\n				<!-- Members profile picture and name -->\n				<div class="row">\n					<div class="six columns">\n						<div class="frame">\n							<!-- if photo -->\n							{if photo_filename != ""}\n\n									<img src="{photo_url}{photo_filename}" />\n\n							{if:else}\n								<img src="/img/default_user_photo_small.png"/>\n							{/if}\n						</div>\n					</div>\n\n				\n					<div class="six columns">\n						<h1>{screen_name}</h1>\n						<p class="creative-sector">{creative_sector}</p>\n					</div>\n				</div> <!-- row -->\n				\n				<!-- About Me and other information -->\n				<div class="row">\n\n					<div class="twelve columns">\n					\n						<!-- network icons -->\n\n							<div class="row">\n									<div class="twelve columns">\n											{if facebook != ""}\n												<a href="{facebook}"><img src="/img/profile-icon-facebook.png" alt="facebook logo"/></a>\n											{/if}\n							\n											{if twitter != ""}\n												<a href="{twitter}"><img src="/img/profile-icon-twitter.png" alt="twitter logo"/>\n											{/if}\n							\n											{if linkedin != ""}\n												<a href="{linkedin}"><img src="/img/profile-icon-linkedin.png" alt="linked in logo"/>\n											{/if}\n									</div> <!-- columns -->\n							</div> <!-- row -->\n\n					\n				\n						<h3>About me</h3>\n						<p>{bio}</p>\n\n						<h3>Current projects</h3>\n						<p>{current_projects}</p>									\n\n					\n					\n					</div> <!-- columns -->\n\n				</div> <!-- row -->\n				\n				\n			</div> <!-- columns -->		\n										\n\n			<div class="four columns">	\n				<div class="inset rounded sidebar">\n					{if avatar_filename != "" }\n\n						<img src="{avatar_url}{avatar_filename}" class="member-logo"/>\n	\n\n					{if:else}\n						<img src="http://placehold.it/100x100" class="member-logo" />\n					{/if}\n					<h3 class="company-name">{company_name}</h3>\n					<p class="contact-details">\n						{if company_address != ""}\n							{company_address}<br />\n						{/if}\n					\n						{email}</br />\n					\n						{if company_phone != ""}\n							{company_phone}<br />\n						{/if}\n					\n						{if url != ""}\n							{url}<br />\n						{/if}\n					</p>\n				\n					{if company_description != ""}\n						<h2>Business description</h2>\n						<p>{company_description}</p>\n					{/if}\n				\n					{if skills != ""}\n						<h2>Skills</h2>\n						<p>{skills}</p>\n					{/if}\n				\n					{if experience != ""}\n						<h2>Experience</h2>\n						<p>{experience}</p>\n					{/if}\n											\n				</div>\n\n			</div> <!-- columns -->\n			\n\n		</div> <!-- .row -->\n	\n\n	{/exp:user:stats}\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n	\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n\n'),
(109, 16, 'exp_templates', 'template_data', 1335955097, 1, '{embed="includes/header" page="{segment_1}" page_title="Membership tiers, pricing and FAQ - {company_name}"}\n	\n			\n				<div class="container"> \n				\n					<div class="row centered">\n						<div class="twelve columns">\n							{exp:channel:entries channel="membership"}\n							<h1>{membership_headline}</h1>\n							<div class="banner inset rounded shadow">\n								<h2>{membership_banner}</h2>\n							{/exp:channel:entries}\n							</div> <!-- .banner --> \n						</div>\n					</div> <!-- row -->\n					\n					\n					<div class="row services membership-tiers">\n					\n					{exp:channel:entries channel="membership" limit="3"}\n						{membership_tiers}\n							<div class="third columns">\n								<div class="service rounded shadow">\n										<h2>{membership_tier_name}</h2>\n										<div class="bubble rounded">\n											<div>\n												<span class="contract-length">{membership_primary_description}</span><br />\n												<span class="price">{membership_primary_price}/</span><span class="payment-period">{membership_primary_period}</span></div>\n\n										</div>\n										<div class="bubble secondary-offer rounded ">\n											<div>\n												<span class="contract-length">{membership_secondary_description}</span><br />\n												{if membership_secondary_price !=""}\n													<span class="price">{membership_secondary_price}/</span><span class="payment-period">{membership_secondary_period}</span></div>\n												{if:else}\n													<span class="payment-period">N/A</span></div>\n												{/if}\n\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_1}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_2}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_3}\n										</div>\n										\n										{if membership_differentiator != ""}\n											<div class="bubble differentiator rounded">\n												{membership_differentiator}\n											</div>\n										{/if}\n			\n										<a href="/sign-up" class="large button radius black-gradient"><span>Sign up today</span></a>\n										\n								</div> <!-- panel -->\n								\n							</div>\n						{/membership_tiers}\n					{/exp:channel:entries}	\n					\n				\n					</div><!-- #services-->\n					\n					<div class="row">\n						<div class="seven columns faq-section">\n							<h2>Frequently asked questions</h2>\n						\n						{exp:channel:entries channel="membership"}	\n							{faq}\n								<div class="question-and-answer">\n									<p class="question">{question}</p>\n									<p class="answer">{answer}</p>\n								</div>\n							{/faq}\n						{/exp:channel:entries}\n							\n						</div><!-- columns -->\n							\n						<div class="five columns">\n							<div class="service rounded top-ups">\n								<h2>Top-ups and Extras</h2>\n								{exp:channel:entries channel="topups_and_extras" orderby="topups_and_extras_order" show_expired="yes" show_future_entries="yes" sort="asc" backspace="6" }\n									<h3>{title}</h3>\n									{topups_and_extras_copy}\n									<hr />{/exp:channel:entries}\n								\n							</div>\n						</div><!-- columns -->\n						\n					</div> <!-- Row -->\n					\n\n				</div> <!-- container -->\n				\n	\n{embed="includes/footer"}'),
(110, 2, 'exp_templates', 'template_data', 1335955097, 1, '{embed="includes/header" page="{segment_1}" page_title="News stories - {company_name}"}\n\n				<div class="container"> \n				\n					<div class="row">\n					\n						<div class="eight columns">\n							\n							{exp:channel:entries channel="news"}\n							\n								<div class="news-article">\n									<header>\n										<h2><a href="{title_permalink=''news/view''}">{title}</a></h2> \n										<p><span class="date">{entry_date format=''%j %F %Y''}</span> by <strong>{author}</strong> <span class="comments">3 comments</span></p>\n									</header>\n									{if news_video_url !=""}\n										{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n											<div class="flex-video">{embed_code}</div>\n										{/exp:antenna}\n									{if:elseif news_image != ""}\n										<div class="frame">\n											<!-- ><img src="http://lorempixel.com/450/250"/> -->\n											<img src="{news_image}" alt="{news_image_description}"/>\n										</div>\n									{/if}\n\n									<p>\n										{exp:eehive_hacksaw words="15" append="..."}\n												{news_article}\n										{/exp:eehive_hacksaw}\n										<a href="{title_permalink=''news/view''}">Read More</a>\n									</p>\n									\n								</div> <!-- .news-article -->\n							\n							{/exp:channel:entries}\n							\n						</div> <!-- columns -->\n								\n							\n\n						<div class="four columns">	\n							\n							{embed="includes/sidebar"}\n		\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(111, 18, 'exp_templates', 'template_data', 1335955097, 1, '{embed="includes/header" page="{segment_1}" page_title="{exp:channel:entries channel="news" limit="1"}{title}{/exp:channel:entries}"}\n\n				<div class="container"> \n			\n					<div class="row">\n					\n						<div class="eight columns">\n							\n							{exp:channel:entries channel="news" limit=''1''}\n							\n								<div class="news-article">\n									<header>\n										<h2>{title}</h2> \n										<p><span class="date">{entry_date format=''%j %F %Y''}</span> by <strong>{author}</strong> <span class="comments">3 comments</span></p>\n									</header>\n									\n									{if news_video_url !=""}\n										{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n											<div class="flex-video">{embed_code}</div>\n										{/exp:antenna}\n									{if:elseif news_image != ""}\n										<div class="frame">\n											<!-- ><img src="http://lorempixel.com/450/250"/> -->\n											<img src="{news_image}" alt="{news_image_description}"/>\n										</div>\n									{/if}\n									\n									<div class="social-icons">\n					\n										{exp:socialeesta:like href="{title_permalink}" action="like" color="light" layout="standard"}\n									</div> <!-- /social-icons -->\n\n									<p>{news_article}</p>\n								</div> <!-- .news-article -->\n							\n							{/exp:channel:entries}\n							\n							<div id="comments">\n							\n									\n								\n								{exp:comment:entries}\n								\n									{if count==1}\n										<h5>Comments</h5>\n									{/if}\n								\n								\n													<div class="comment-content {switch odd|even}">\n														<header>\n															<p>\n																<span class="date">{comment_date format="%F %d, %Y"}</span> <span class="posted-by">Posted by</span> <strong>{name}</strong>\n															</p>\n														</header>		\n														{comment}\n													</div>\n\n								{/exp:comment:entries}\n								\n							</div> <!-- #comments -->\n							\n								<div id="comment-form">\n									<h5>Comment on this News Article</h5>\n\n									<fieldset id="comment-form-field">\n\n										{exp:comment:form channel="news" form_class="nice custom validatingForm"}\n										<div class="row">\n											<div class="six columns">\n												<p>\n													<label for="name">Name</label>\n													<input type="text" name="name" value="" class="input-text required" id="name" />\n												</p>\n												<p>\n													<label for="email">Email Address</label>\n													<input type="text" name="email" value="" class="input-text required email" id="email"  />\n												</p>\n											</div>\n											\n											<div class="six columns"> </div>\n										</div> <!-- .row -->\n											<p>\n												<label for="comment">Comment</label>\n												<textarea name="comment" class=''textarea large'' rows="8" cols="35" id="comment"></textarea>\n											</p>\n\n											<p>\n												<input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n											</p>\n											\n											\n										{/exp:comment:form}\n										\n									</fieldset>              \n\n\n\n							</div> <!-- END #comment-form -->\n							\n						</div> <!-- columns -->\n								\n							\n\n						<div class="four columns">	\n							{embed="includes/sidebar"}\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(112, 20, 'exp_templates', 'template_data', 1335955097, 1, '{embed="includes/header" page="{segment_1}" page_title="Sign up or find out more - {company_name}}\n			\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							<h1>Interested in joining up or finding out about special offers and upcoming events? Fill in your details and we’ll keep you in the loop.</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">	\n						\n							{exp:freeform:form \n								form:class="nice custom validatingForm"\n								collection="Sign Up"\n								return="/"\n								notify="info@projoosr.com"\n								send_user_email="yes"\n								}\n							\n								<div class="row">\n									<div class="six columns">	\n										<label for="first_name">Name *</label>\n										<input id="first_name" name="first_name" class="input-text required" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="last_name">Surname *</label>\n										<input id="last_name" name="last_name" class="input-text required" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->\n							\n								<div class="row">\n									<div class="twelve columns">\n											<label for="email">Email *</label>\n											<input id="email" name="email" class="input-text required email" type="text">\n									</div>\n								</div>	\n													\n								<div class="row">\n									<div class="six columns">	\n										<label for="phone_number">Phone number</label>\n										<input id="phone_number" name="phone_number" class="input-text" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="postcode">Postcode</label>\n										<input id="postcode" name="postcode" class="input-text" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->		\n						\n								<div class="row">\n									<div class="twelve columns">\n									\n										<label for="creative_insutry">What creative industry are you in?</label>\n										<select style="display:none;" id="creative_insutry" name="creative_industry" class="expand">\n										  	<option>Design</option>\n										  	<option>New Media</option>\n											<option>Television</option>\n										  	<option>Writing</option>\n										</select>\n										\n										\n									\n										<label for="membership_type">What type of membership are you interested in?</label>\n										<select style="display:none;" id="membership_type" name="membership_type" class="expand">\n										  	<option>Network</option>\n											<option>Hub</option>\n										  	<option>Incubator</option>\n											<option>Just events</option>\n										  	<option>Not sure</option>	\n										</select>\n										\n										<label for="business_stage">What stage of development is your business/project at?</label>\n										<select style="display:none;" id="business_stage" name="business_stage" class="expand">\n											<option>Pre start-up / concept development</option>\n											<option>Start-up</option>\n										  	<option>Established over 1 year</option>\n										</select>										\n									\n									</div>	<!-- columns -->\n								</div> <!-- row -->\n							\n								<div class="row submit-section">\n\n									<div class="six columns">	\n										<input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n										\n									</div><!-- columns -->\n								\n									<div class="six columns terms">\n								            <span id="checkbox"><input id="opt-in" checked="checked" type="checkbox" /></span>\n								            <span id="checkbox-label"><label for="opt-in">Uncheck this box if you don’t want to recieve news about special discounts, upcoming events and more. Don’t worry, we hate spam and we’ll never share your details with anyone else.</label></span>\n									</div><!-- columns -->\n\n								</div><!-- row -->\n							\n							\n							{/exp:freeform:form} <!-- form -->\n										\n						</div> <!-- columns -->\n				\n						\n						<div class="six columns hide-on-phones">\n							<div class="large-image">\n								<img src="/img/membership.png" class="frame" />\n							</div>\n						</div> <!-- columns -->\n								\n							\n	\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n						\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(113, 1, 'exp_templates', 'template_data', 1335955097, 1, '{embed="includes/header" page_title="Funding, Mentoring and Development for Creative Entrepreneurs - {company_name}"}\n\n				{exp:channel:entries channel="home"}\n	\n				<div class="container"> \n\n					<div class="row" id=''topSection''>\n\n						<div class="six columns push-six" id="straplineArea">\n								<div class="cta-container">\n									<h1>{strapline}</h1>\n									<a class="huge button black radius black-gradient hide-on-phones" href="/sign-up"><span>Join today</span></a>\n								</div>\n						</div> <!-- #straplineArea -->\n\n						<div class="six columns pull-six" id=''carousel''>\n								\n								<div class="frame">\n									     <img src="/img/carousel/5.jpg"/>\n								</div> <!-- carousel-container -->\n					\n				\n						</div> <!-- #carousel -->\n			\n				\n					</div> <!-- #topSection -->\n			\n					<div class="row services">\n						\n						\n							<div class="quarter columns">\n								<div class="service rounded">\n										<h2>Incubator</h2>\n									<img src="{home_incubator_image}" alt="Incubator" />\n									<p>{home_incubator_copy}</p>\n									<a href="/incubator" class="medium black button radius black-gradient"><span>Fund your business</span></a>\n								</div> <!-- panel -->\n							</div>				\n				\n							<div class="quarter columns">				\n								<div class="service rounded">\n									<h2>Workspace</h2>\n									<img src="{home_workspace_image}" alt="Workspace" />\n									<p>{home_workspace_copy}</p>\n									<a href="/workspace" class="medium black button radius black-gradient"><span>See the workspace</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class="quarter columns">					\n								<div class="service rounded">\n									<h2>Events</h2>\n									<img src="{home_events_image}" alt="Events" />\n									<p>{home_events_copy}</p>\n									<a href="/events" class="medium black button radius black-gradient"><span>Come to an event</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class="quarter columns">				\n								<div class="service rounded">\n									<h2>Membership</h2>\n									<img src="{home_membership_image}" alt="Membership" />\n									<p>{home_membership_copy}</p>\n									<a href="/membership" class="medium black button radius black-gradient"><span>Find out more</span></a>\n								</div> <!-- panel -->\n							</div>\n							\n						{/exp:channel:entries}\n\n					</div><!-- #services-->\n				\n\n					<div class="row" id="news-area">\n					\n						<div class="seven columns">\n						\n							<h2>Latest news</h2>\n								\n								{exp:channel:entries channel="news" limit="1"}\n								<div class="row">\n									<div class="three columns">\n										<a href="{title_permalink=''news/view''}">\n											\n											{if news_video_url !=""}\n												{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n														<img src="{video_thumbnail}" alt="{video_title}" />\n												{/exp:antenna}\n											{if:elseif news_image != ""}\n												<img src="{news_image}" alt="{title}" />\n											{/if}\n										</a>\n									\n									</div> <!-- .six columns -->\n\n									<div class="nine columns">\n										\n										<div class="news-article">\n											<header>\n												<h3 class="news-heading"><a href="{title_permalink=''news/view''}">{title}</a></h3>\n												<p><span class="date">{entry_date format=''%j %F %Y''}</span> by {author} <span class="comments">3 comments</span></p>\n											</header>	\n											<p class="excerpt">\n												{exp:eehive_hacksaw words="15" append="..."}\n													{news_article}\n												{/exp:eehive_hacksaw}\n											</p>\n											\n											\n										</div> <!-- .news-article -->\n									\n										\n									</div>\n								\n								</div> <!-- .row -->\n								{/exp:channel:entries}\n					\n\n\n						</div> <!-- .seven columns-->\n\n						<div class="five columns">	\n							<h2>Next Event</h2>\n								{exp:eventbriteapi:upcomingEvents limit="1"}\n									<div class="row event">\n										<div class="three columns">\n												<a href=''{url}''>\n													<div class="date-box">\n														<p class="month">{month}</p>\n														<p class="day">{day}</p>\n													</div> <!-- date-box -->\n												</a>\n										</div>\n										<div class="nine columns">\n											<div class="event-details">\n												<h3 class="event-heading"><a href=''{url}''>{title}</a></h3>\n												<p class="excerpt">{excerpt}</p>\n											</div> <!-- date- -->	\n										</div>\n									</div>\n								{/exp:eventbriteapi:upcomingEvents}\n						</div> <!-- sidebar -->\n							\n			\n					</div> <!-- #news-area -->\n\n				</div> <!-- container -->\n				\n{embed="includes/footer"}'),
(114, 63, 'exp_templates', 'template_data', 1335955097, 1, '{embed="includes/header" page_title="{heading}" meta="{meta_refresh}"}\n\n<div class="container">\n\n	<!-- <h1>{heading}</h1> -->\n\n	{content}\n\n	<p>{link}</p>\n\n</div>\n\n{embed="includes/footer"}');
INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES
(115, 64, 'exp_templates', 'template_data', 1335955097, 1, '<?php\n\n// Include the CE image class to create thumbnails \nif ( ! class_exists( ''CE_image'' ) )\n{\n	require ''/Applications/MAMP/htdocs/MeWe_CMS/mewemin/expressionengine/third_party/ce_img/libraries/Ce_image.php'';\n}\n\n/**\n * Handle file uploads via XMLHttpRequest\n */\nclass qqUploadedFileXhr {\n    /**\n     * Save the file to the specified path\n     * @return boolean TRUE on success\n     */\n    function save($path) {    \n        $input = fopen("php://input", "r");\n        $temp = tmpfile();\n        $realSize = stream_copy_to_stream($input, $temp);\n        fclose($input);\n        \n        if ($realSize != $this->getSize()){            \n            return false;\n        }\n        \n        $target = fopen($path, "w");        \n        fseek($temp, 0, SEEK_SET);\n        stream_copy_to_stream($temp, $target);\n        fclose($target);\n        \n        return true;\n    }\n    function getName() {\n        return $_GET[''qqfile''];\n    }\n    function getSize() {\n        if (isset($_SERVER["CONTENT_LENGTH"])){\n            return (int)$_SERVER["CONTENT_LENGTH"];            \n        } else {\n            throw new Exception(''Getting content length is not supported.'');\n        }      \n    }   \n}\n\n/**\n * Handle file uploads via regular form post (uses the $_FILES array)\n */\nclass qqUploadedFileForm {  \n    /**\n     * Save the file to the specified path\n     * @return boolean TRUE on success\n     */\n    function save($path) {\n        if(!move_uploaded_file($_FILES[''qqfile''][''tmp_name''], $path)){\n            return false;\n        }\n        return true;\n    }\n    function getName() {\n        return $_FILES[''qqfile''][''name''];\n    }\n    function getSize() {\n        return $_FILES[''qqfile''][''size''];\n    }\n}\n\nclass qqFileUploader {\n    private $allowedExtensions = array();\n    private $sizeLimit = 10485760;\n    private $file;\n\n    function __construct(array $allowedExtensions = array(), $sizeLimit = 10485760){        \n        $allowedExtensions = array_map("strtolower", $allowedExtensions);\n            \n        $this->allowedExtensions = $allowedExtensions;        \n        $this->sizeLimit = $sizeLimit;\n        \n        $this->checkServerSettings();       \n\n        if (isset($_GET[''qqfile''])) {\n            $this->file = new qqUploadedFileXhr();\n        } elseif (isset($_FILES[''qqfile''])) {\n            $this->file = new qqUploadedFileForm();\n        } else {\n            $this->file = false; \n        }\n    }\n    \n    private function checkServerSettings(){        \n        $postSize = $this->toBytes(ini_get(''post_max_size''));\n        $uploadSize = $this->toBytes(ini_get(''upload_max_filesize''));        \n        \n        if ($postSize < $this->sizeLimit || $uploadSize < $this->sizeLimit){\n            $size = max(1, $this->sizeLimit / 1024 / 1024) . ''M'';             \n            die("{''error'':''increase post_max_size and upload_max_filesize to $size''}");    \n        }        \n    }\n    \n    private function toBytes($str){\n        $val = trim($str);\n        $last = strtolower($str[strlen($str)-1]);\n        switch($last) {\n            case ''g'': $val *= 1024;\n            case ''m'': $val *= 1024;\n            case ''k'': $val *= 1024;        \n        }\n        return $val;\n    }\n    \n    /**\n     * Returns array(''success''=>true) or array(''error''=>''error message'')\n     */\n    function handleUpload($uploadDirectory, $replaceOldFile = TRUE){\n        if (!is_writable($uploadDirectory)){\n            return array(''error'' => "Server error. Upload directory isn''t writable.");\n        }\n        \n        if (!$this->file){\n            return array(''error'' => ''No files were uploaded.'');\n        }\n        \n        $size = $this->file->getSize();\n        \n        if ($size == 0) {\n            return array(''error'' => ''File is empty'');\n        }\n        \n        if ($size > $this->sizeLimit) {\n            return array(''error'' => ''File is too large'');\n        }\n        \n        $pathinfo = pathinfo($this->file->getName());\n        $filename = "{segment_2}_{exp:user:stats}{member_id}{/exp:user:stats}";\n        //$filename = md5(uniqid());\n        $ext = $pathinfo[''extension''];\n\n		\n\n        if($this->allowedExtensions && !in_array(strtolower($ext), $this->allowedExtensions)){\n            $these = implode('', '', $this->allowedExtensions);\n            return array(''error'' => ''File has an invalid extension, it should be one of ''. $these . ''.'');\n        }\n        \n        if(!$replaceOldFile){\n            /// don''t overwrite previous files that were uploaded\n            while (file_exists($uploadDirectory . $filename . ''.'' . $ext)) {\n                $filename .= rand(10, 99);\n            }\n        }\n        \n        if ($this->file->save($uploadDirectory . $filename . ''.'' . $ext)){\n            return array(''success''=>true, ''full_filename'' => $filename . ''.'' . $ext, ''upload_directory'' => $uploadDirectory );\n        } else {\n            return array(''error''=> ''Could not save uploaded file.'' .\n                ''The upload was cancelled, or server error encountered'');\n        }\n        \n    }    \n}\n\n// list of valid extensions, ex. array("jpeg", "xml", "bmp")\n$allowedExtensions = array();\n// max file size in bytes\n$sizeLimit = 10 * 1024 * 1024;\n\n$uploader = new qqFileUploader($allowedExtensions, $sizeLimit);\n\n// Check to see if the second url segment is photo or avatar and handle the upload accordingly. \n// Return an error if the segment is neither of these values.\nswitch ("{segment_2}") {\n	\n	case "photo":\n		$result = $uploader->handleUpload(''/Applications/MAMP/htdocs/MeWe_CMS/images/member_photos/'');\n	break;\n	\n	case "avatar":\n		$result = $uploader->handleUpload(''/Applications/MAMP/htdocs/MeWe_CMS/images/avatars/'');\n	break;\n	\n	default:\n		$result = array(''error''=> ''Could not save uploaded file.'');\n	\n}\n\n\n// If the file uploaded okay, then we update the user''s record in the expressionengine database \n// to point to the new file.\nif ($result[''success'']) {\n	file_put_contents(''php://stderr'', "\\n\\nUpdating database...\\n\\n", TRUE);\n	\n	/* create thumbnail */\n	\n	//instantiate the class with the default settings\n	$ce_image = new Ce_image(\n	        array(\n	                ''width'' => 100\n	        )\n	);\n	\n	//create the thumbnail\n	$ce_image->make( $result[''upload_directory''] . $result[''full_filename'']  );\n	\n	//get the location of the thumbnail\n 	$ce_image->create_tag();\n	$result[''thumbnail''] = $ce_image->get_relative_path();\n\n\n	//close the image (free up memory)\n	$ce_image->close();\n	\n	/* Update the ee database */\n	\n	$data = array(''{segment_2}_filename'' => $result[''full_filename'']);\n\n	$sql = $this->EE->db->update_string(''exp_members'', $data, "member_id = ''{exp:user:stats}{member_id}{/exp:user:stats}''");\n\n	$this->EE->db->query($sql);\n	\n}\nelse {\n	file_put_contents(''php://stderr'', "\\n\\nFailed\\n", TRUE);\n}\n\n// to pass data through iframe you will need to encode all html tags\necho htmlspecialchars(json_encode($result), ENT_NOQUOTES);\n\n?>'),
(116, 15, 'exp_templates', 'template_data', 1335955097, 1, '{embed="includes/header" page="{segment_1}" page_title="Our workspace - {company_name}"}\n	{exp:channel:entries channel="workspace"}\n	\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							\n							<h1>{workspace_heading}</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row">\n						\n						<div class="six columns">\n							<div class="frame">\n								<img src="http://lorempixel.com/450/250"/>\n							</div>\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							<p>{workspace_main_copy}	\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row services rooms-section">\n				\n							<div class="quarter columns">\n								<div class="service rounded">\n										<h2>{workspace_room_1_heading}</h2>\n									<img src="{workspace_room_1_image}" alt="{workspace_room_1_heading}" />\n									<p>{workspace_room_1_copy}</p>\n								</div> <!-- panel -->\n							</div>				\n				\n							<div class="quarter columns">				\n								<div class="service rounded">\n									<h2>{workspace_room_2_heading}</h2>\n									<img src="{workspace_room_2_image}" alt="{workspace_room_2_heading}" />\n									<p>{workspace_room_2_copy}</p>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class="quarter columns">					\n								<div class="service rounded">\n									<h2>{workspace_room_3_heading}</h2>\n									<img src="{workspace_room_3_image}" alt="{workspace_room_3_heading}" />\n									<p>{workspace_room_3_copy}</p>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class="quarter columns">				\n								<div class="service rounded">\n									<h2>{workspace_room_4_heading}</h2>\n									<img src="{workspace_room_4_image}" alt="{workspace_room_4_heading}" />\n									<p>{workspace_room_4_copy}</p>\n								</div> <!-- panel -->\n							</div>\n					</div><!-- #services-->\n					\n					<div class="row">\n						<div class="twelve columns cta">\n							<a href="/sign-up" class="medium black button radius black-gradient"><span>Sign up today</span></a>\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{/exp:channel:entries}\n\n{embed="includes/footer"}'),
(117, 66, 'exp_templates', 'template_data', 1336470631, 1, ''),
(118, 67, 'exp_templates', 'template_data', 1336499736, 1, ''),
(119, 13, 'exp_templates', 'template_data', 1336506599, 1, '{embed="includes/header" page="{segment_1}" page_title="About Us - {company_name}"}\n	\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							{exp:channel:entries channel="about"}\n								<h1>{about_headline}</h1>\n							{/exp:channel:entries}\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">\n						\n							<div class="frame">\n							{exp:channel:entries channel="about"}\n									{if about_video !=""}\n										{exp:antenna url=''{about_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false''}\n											<div class="flex-video vimeo widescreen">{embed_code}</div>\n										{/exp:antenna}\n									{if:else}									\n								     	<img src="{about_main_image}"/>\n									{/if}\n								{/exp:channel:entries}\n							</div> <!-- frame -->\n						\n						</div> <!-- columns -->\n						\n								\n							\n\n						<div class="six columns">\n							{exp:channel:entries channel="about"}\n								<p>{about_main_copy}</p>\n							{/exp:channel:entries}	\n							\n							<a class="medium black button radius black-gradient" href="/sign-up"><span>Join us today</span></a>\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n						\n							{exp:channel:entries channel="about"}\n							\n								<h2>Why MeWe?</h2>\n								<p class="small">{about_why_mewe}</p>\n							\n\n								<h2>How we work</h2>\n								<p class="small">{about_how_we_work}</p>\n\n								<h2>Why join?</h2>\n								<p class="small">{about_why_join}</p>\n				\n							{/exp:channel:entries}\n							\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n					<div class="row people-section">\n						<div class="twelve columns">\n							<dl class="tabs">\n								<dd><a href="#simple1" class="active">The Team</a></dd>\n							 	<dd><a href="#simple2">The Board</a></dd>\n								\n								{exp:channel:entries channel="about"}\n							  		<dd {if about_show_advisors == ""} style="display: none;" {/if}><a href="#simple3">Advisors</a></dd>\n								{/exp:channel:entries}\n								\n							</dl>\n\n							<ul class="tabs-content">\n								\n								<li class="active" id="simple1Tab">\n									<div class="container">\n										<p>Our team looks after MeWe’s members and keeps our events and workspace running smoothly.</p>\n										<ul class="block-grid four-up mobile">\n											\n											{embed="includes/people_gallery" field="team"}\n										\n										</ul>\n									</div>\n								</li>\n							  	\n							<li id="simple2Tab">\n									<div class="container">\n										<p>The board creates MeWe’s strategy to ensure that members are offered the most innovative and cutting-edge services for their businesses.</p>\n										<ul class="block-grid four-up mobile">\n										\n											{embed="includes/people_gallery" field="board"}\n											\n										</ul>\n									</div>\n								\n								</li>\n								<li id="simple3Tab">\n										<div class="container">\n											\n											<p>From heads of leading media organisations to captains of creative industry, our advisors offer members invaluable one-to-one business coaching.</p>\n											\n											<ul class="block-grid four-up mobile">\n												\n												{embed="includes/people_gallery" field="advisors"}\n										\n											</ul>\n										</div>\n\n									</li>\n							\n						\n							</ul>\n		\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(120, 17, 'exp_templates', 'template_data', 1336506599, 1, '{embed="includes/header" page="{segment_1}" page_title="Events - {company_name}"}\n\n			\n				<div class="container"> \n					\n					<div class="row">\n								\n							\n						{exp:channel:entries channel="events"}\n						\n						<div class="eight columns push-four">\n							<h1>We''d love to see you at one of our events!</h1>\n							<p>MEWE360º hosts a programme of networking and leadership development events designed to inspire, inform and connect our membership. As a member you have access to all events (free or discounted depending on your type of membership). We want to provide a programme that genuinely meets your needs and so are always open to member’s requests and will adapt our programme where necessary.</p>\n							<p>We run \n									{if events_file !=""}\n										<a href="{events_file}">6 different types of events</a>\n									{if:else}\n										6 different types of events\n									{/if}\n									- <strong>Networking Events</strong>, <strong>Networking Plus - The Lab</strong>, <strong>How I did it</strong>, <strong>Pick my brains</strong>, <strong>Workshop/Masterclass</strong> and <strong>Panel Discussions</strong>.\n								\n							<div class="row cta">\n								\n								<div class="eight columns">\n									Become a member to receive free tickets, special discounts and priority access.\n								</div>\n									\n								<div class="four columns">\n									<a href="/sign-up" class="medium black button radius black-gradient"><span>Sign up today</span></a>\n								</div>\n							</div>\n							\n							{/exp:channel:entries}\n		\n							\n						</div> <!-- columns -->\n					\n						<div class="four columns pull-eight">\n						{if "{exp:eventbriteapi:isUpcomingEvent}" == "true"}\n							{exp:eventbriteapi:upcomingEvents limit=''1''}\n								<div class="next-event inset">\n									<div class="date">\n										<span class="month">{month}</span>\n										<span class="day">{day}</span>\n									</div>\n									<h2>Next Event</h2>\n									<div class="container">\n										<h3>{title}</h3>\n										<!-- ><img src="http://lorempixel.com/230/100"> -->\n										{if logoURL != ""}\n											<img src="{logoURL}" />\n										{/if}\n										<p class="time"></p>\n										<p class="event-description">{excerpt}</p>\n										<a href="{url}" class="medium black button radius black-gradient"><span>Find out more</span></a>\n									</div>\n								</div>\n							{/exp:eventbriteapi:upcomingEvents}\n						{/if}\n							\n									\n						</div> <!-- columns -->		\n			\n					</div> <!-- .row -->\n					\n					<div class="row">\n						\n						<div class="eight columns push-four">\n							\n							<div class="past-events">\n								<h2 class="black-header-bar">Past Events</h2>\n								<ul>\n									{exp:channel:entries channel="past_events" orderby="past_event_date"}\n\n										<li class="event-summary accordionButton">\n										<div class="date-box">\n											<p class="month">{past_event_date format="%M"}</p>\n											<p class="day">{past_event_date format="%d"}</p>\n										</div> <!-- date-box -->\n\n										<h3 class="event-title">{title}</h3>\n										<p class="event-description">{past_event_description}</p>\n										<div class="clear"></div>\n									</li>\n\n										<li class="event-content inset accordionContent">\n										<div class="row">\n										\n										<!-- If there isnt a video we want the picture gallery to fill the full space -->	\n										{if past_event_video != ""}\n\n											<div class="seven columns">\n										\n										{if:else}\n												\n											<div class="twelve columns">\n												\n										{/if}\n											\n												<ul class="block-grid eight-up gallery">\n													\n												{past_event_photo_gallery}\n													<li>\n														<a href="{image}">{exp:ed_imageresizer image="{image}" forceWidth="yes" forceHeight="yes" maxWidth="200" maxHeight="200" cropratio="100:100" alt="pap"}</a>\n													</li>\n												{/past_event_photo_gallery}\n												\n												<!-- Create placeholder images to fill in any remaining blanks in the gallery grid -->\n												{exp:for_loop start="{past_event_photo_gallery:total_rows}" end="31" increment="1"}\n												\n												<li>\n													<img src="/img/default_user_photo_small.png" /> \n												</li>\n												\n												{/exp:for_loop}\n												\n\n												</ul>									\n\n											</div><!-- columns -->\n										\n										{if past_event_video != ""}\n										\n											<div class="five columns">\n												<div class="video">\n													{if past_event_video !=""}\n														{exp:antenna url=''{past_event_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false'' max-width="220" max_height="123"}\n															<div class="flex-video widescreen">{embed_code}</div>\n														{/exp:antenna}\n													{if:else}\n														<img src="http://placehold.it/220x123">\n													{/if}\n\n												</div>\n											</div> <!-- columns -->\n										{/if}\n											\n										</div> <!-- row -->\n\n										<div class="row">\n											<div class="twelve columns">\n													<h4>Review</h4>\n													<p>{past_event_review}</p>\n											</div><!-- columns -->\n										</div> <!-- row -->\n\n									</li>\n\n									{/exp:channel:entries}\n\n								</ul>\n\n							</div><!-- past events -->	\n							\n						</div>\n						\n						<div class="four columns pull-eight">\n							\n								<div class="future-events">\n									<h2 class="black-header-bar">Future events</h2>\n									<ul>\n										{exp:eventbriteapi:upcomingEvents}\n											<li class="future-event container">	\n												<h3><a href="{url}">{title}</a></h3>\n												<p class="date">{date}</p>\n												<!-- <p>bumhole</p> -->\n											</li> <!-- container -->\n										{/exp:eventbriteapi:upcomingEvents}\n									</ul>\n\n								</div> <!-- future-events -->\n							\n						</div>\n						\n					</div> <!-- row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(121, 8, 'exp_templates', 'template_data', 1336506599, 1, '			{exp:channel:entries channel="footer_content" dynamic="no"}\n			\n				<div class="sponsors">\n					<div class="row">\n						<!-- <div class="twelve columns"><img src="/img/sponsors.png" alt="Our Sponsors" /></div> -->\n						\n						<div class="twelve columns">\n							{sponsors}\n								<a href="{url}">\n									<img src="{logo}" alt="{name}" />\n								</a>\n							{/sponsors}\n						</div>\n							\n						\n					</div>\n				</div>\n		\n				<div id="footer">\n			\n					<div class="row">\n						<div class="three columns">\n							<h3>Find Us</h3>\n							<div class="container">\n								<img class="map" src="/img/map.png" />\n							</div>\n						</div>\n						<div class="three columns">\n							<h3>Get in touch</h3>\n							<div class="container">\n								<p>{footer_address}</p><p>{footer_phone_number}<br /><a href="mailto:{footer_email}">{footer_email}</a></p>\n							</div>\n						</div>\n						\n						<div class="three columns networks">\n							<h3>Networks</h3>\n							<div class="container">\n								<ul>\n									{if footer_twitter != ""}\n										<li><a href="{footer_twitter}"><img src="/img/twitter.png" />Twitter</a></li>\n									{/if}\n									\n									{if footer_facebook != ""}\n										<li><a href="{footer_facebook}"><img src="/img/facebook.png" />Facebook</a></li>\n									{/if}\n									\n									{if footer_linkedin != ""}\n										<li><a href="{footer_linkedin}"><img src="/img/linkedin.png" />LinkedIn</a></li>\n									{/if}\n									\n								</ul>\n							</div>\n						</div>\n						<div class="three columns feedback">\n							<h3>Feedback</h3>\n							<div class="container">\n								<p>We’re always looking to improve what we do. If you have feedback we''d love to hear from you!</p>\n								<a href="{path=''contact-us''}" class="medium radius black button black-gradient">Get in touch</a>\n							</div>\n						</div>\n					</div>	\n				\n				\n				</div> <!-- .footer -->\n				\n				</div> <!-- #background -->\n		</div> <!-- #top-background -->\n\n{/exp:channel:entries}\n\n	<!-- Included JS Files -->\n\n	<!-- Combine and Compress These JS Files -->\n	<script src="/javascripts/jquery.reveal.js"></script>\n	<script src="/javascripts/jquery.orbit-1.4.0.js"></script>\n	<script src="/javascripts/jquery.customforms.js"></script>\n	<script src="/javascripts/jquery.placeholder.min.js"></script>\n	<script src="/javascripts/jquery.tooltips.js"></script>\n	<!-- End Combine and Compress These JS Files -->\n	\n	<!-- Form validation -->\n	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js"></script>	\n	\n	<script type="text/javascript">\n		$().ready(function() {\n			// validate the comment form when it is submitted\n			$(".validatingForm").validate();\n		});\n	</script>\n	\n	<script src="/javascripts/app.js"></script>\n	<script type="text/javascript" src="/javascripts/jquery.lightbox-0.5.js"></script>\n	\n	<!-- MeWe Custom JS -->\n\n	<!-- JQuery Lightbox -->\n	<script type="text/javascript">\n	$(function() {\n		$(''.gallery a'').lightBox(); // Select all links in object with gallery ID\n	});\n	</script>\n\n	\n	<!-- Social sharing javascript -->\n	{exp:socialeesta:scripts scripts="twitter|facebook" fb_app_id="390128307694751"}\n	\n	\n	<!-- Live Reload Code -->\n	<script>document.write(''<script src="http://'' + (location.host || ''localhost'').split('':'')[0] + '':35729/livereload.js?snipver=1"></'' + ''script>'')</script>\n\n</body>\n</html>'),
(122, 7, 'exp_templates', 'template_data', 1336506599, 1, '<!DOCTYPE html>\n\n<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->\n<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->\n<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->\n<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->\n<head>\n	<meta charset="utf-8" />\n\n	<!-- Set the viewport width to device width for mobile -->\n	<meta name="viewport" content="width=device-width" />\n\n	{embed:meta}\n\n	<title>{embed:page_title}</title>\n  \n	<!-- Included CSS Files -->\n	<!-- Combine and Compress These CSS Files -->\n	<link rel="stylesheet" href="/stylesheets/globals.css">\n	<link rel="stylesheet" href="/stylesheets/typography.css">\n	<link rel="stylesheet" href="/stylesheets/grid.css">\n	<link rel="stylesheet" href="/stylesheets/ui.css">\n	<link rel="stylesheet" href="/stylesheets/forms.css">\n	<link rel="stylesheet" href="/stylesheets/orbit.css">\n	<link rel="stylesheet" href="/stylesheets/reveal.css">\n	<link rel="stylesheet" href="/stylesheets/mobile.css">\n	\n	<!-- favicon -->\n	<link rel="shortcut icon" href="/favicon.ico" />\n\n\n	<!-- JQuery -->\n	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.19/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css"/>\n	<link rel="stylesheet" type="text/css" href="/stylesheets/jquery.lightbox-0.5.css"/>\n		\n	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	\n  	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>\n\n\n\n	<!--[if lt IE 9]>\n		<link rel="stylesheet" href="stylesheets/ie.css">\n	<![endif]-->\n	\n	<!-- Non framework custom CSS -->\n	<link rel="stylesheet" href="/stylesheets/custom.css">\n	<link rel="stylesheet" href="/stylesheets/thumbnails.css">\n	<link rel="stylesheet" href="/stylesheets/{embed:page}.css">\n	\n	<!-- Google Webfonts -->\n	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Candara">\n	\n	<script src="/javascripts/modernizr.foundation.js"></script>\n	\n	<!-- Flowplayer -->\n	<script type="text/javascript" src="/javascripts/flowplayer/flowplayer-3.2.9.min.js"></script>\n\n\n	<!-- IE Fix for HTML5 Tags -->\n	<!--[if lt IE 9]>\n		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>\n	<![endif]-->\n	\n	<script type=''text/javascript''>\n	(function (d, t) {\n	  var bh = d.createElement(t), s = d.getElementsByTagName(t)[0];\n	  bh.type = ''text/javascript'';\n	  bh.src = ''//www.bugherd.com/sidebarv2.js?apikey=da8da014-e25b-4041-b791-25f3100fa3c8'';\n	  s.parentNode.insertBefore(bh, s);\n	  })(document, ''script'');\n	</script>\n\n</head>\n\n<body>\n		\n		<div id="top-background">\n			<div id="background">\n				<div id="header">\n\n					<div class="row" id="branding">\n							<div class="twelve columns">\n									<img src="/img/Logo.png" alt="Mewe Logo" />\n							</div>\n							\n							<ul class="secondary-nav hide-on-phones shadow">\n								{if logged_out}\n									<li><a href="{path=''member/login''}">Login</a></li>\n									<li><a href="/sign-up" class="alternate">Join Up</a></li>\n								{/if}\n								{if logged_in}\n									<li><a href="{path=''logout''}">Logout</a></li>\n								{/if}\n								\n								\n							</ul>\n					</div>\n\n					<div class="row" id="masthead" >\n						<div class="twelve columns" >\n								<ul class="nav-bar hide-on-phones" id="primary-nav">\n									<li {if segment_1 == ''''}class="selected"{if:else}class="main"{/if}><a href="/" class="main"><span>Home</span></a></li>\n									<li {if segment_1 == ''about''}class="selected"{if:else}class="main"{/if}> <a href="about" class="main">About</a></li>\n									<li {if segment_1 == ''incubator''}class="selected"{if:else}class="main"{/if}> <a href="/incubator" class="main">Incubator</a></li>\n									<li {if segment_1 == ''workspace''}class="selected"{if:else}class="main"{/if}> <a href="/workspace" class="main">Workspace</a></li>\n									<li {if segment_1 == ''events''}class="selected"{if:else}class="main"{/if}>  <a href="/events" class="main">Events</a></li>\n									<li {if segment_1 == ''membership''}class="selected"{if:else}class="main"{/if}> <a href="/membership" class="main">Membership</a></li>\n									<li {if segment_1 == ''news'' AND segment_2 == ''''}class="selected"{if:else}class="main"{/if}> <a href="/news" class="main">News</a></li>\n								{if logged_in}\n									<li class="hub has-flyout">\n										<a href="#" class="main">Members</a>\n										<div class="flyout" style="display: none;">\n											<ul>\n												<li><a href="{path=''members''}" class="main">Community</a></li>\n												<li><a href="{path=''members/resources''}" class="main">Resources</a></li>\n												<li><a href="{path=''members/profile''}"class="main">View Profile</a></li>\n												<li><a href="{path=''members/edit_profile''}"class="main">Edit Profile</a></li>\n												<li><a href="{path=''members/edit_account''}"class="main">Account Details</a></li>\n												\n											</ul>\n										</div>\n									</li>\n								{/if}\n								</ul>\n						</div>\n					</div>\n				\n				</div> <!-- #header -->\n\n'),
(123, 61, 'exp_templates', 'template_data', 1336506599, 1, '{exp:channel:entries channel="about"}\n\n	{{embed:field}}\n		<li> \n			{if video != ""}\n			\n				<a  \n					 href="{video}"\n					 id="{embed:field}{row_id}" style="display:block;"\n					class="flowplayer flex-video widescreen"> \n				</a> \n\n				<!-- this will install flowplayer inside previous A- tag. -->\n				<script>\n					\n					flowplayer("{embed:field}{row_id}", "/javascripts/flowplayer/flowplayer-3.2.10.swf",\n					{\n						plugins: {controls: null},\n						playlist: [\n						\n\n						    // this first PNG clip works as a splash image\n						    {\n						        url: ''{photo}'', \n						        scaling: ''scale''\n						    },\n\n\n						    // second clip is a video. when autoPlay is set to false the splash screen will be shown\n						    {\n						        // url: ''http://pseudo01.hddn.com/vod/demo.flowplayervod/flowplayer-700.flv'', \n								url: ''{video}'', \n						        autoPlay: false, \n\n						        // video will be buffered when splash screen is visible\n						        autoBuffering: true \n						    }\n						]\n\n					});\n					\n				</script>\n\n			{if:else}\n			\n					{if photo != ""}\n						<img src="{photo}">\n					{if:else}\n						<img src="http://lorempixel.com/200/120">\n					{/if}\n			{/if}\n\n			<h3>{name}</h3>\n			<p>{bio}</p>\n		\n		</li>\n		\n	{/{embed:field}}\n	\n{/exp:channel:entries}'),
(124, 65, 'exp_templates', 'template_data', 1336506599, 1, '<script>    \n\n$(document).ready(function() {\n	\n	// init the progress bar\n	$("#{embed:type}-progressbar").progressbar({ value: 0 });\n	\n	// set some styles on it\n	$("#{embed:type}-progressbar").css({ ''height'':''10px'' });\n	$("#{embed:type}-progressbar").css({ ''display'':''none'' });\n	$(".ui-progressbar-value").css({ ''background-image'' : ''url(/img/uploader/progress-bar.gif)'' }); \n});\n\n\nfunction create{embed:type}Uploader(){            \n    var {embed:type}_uploader = new qq.FileUploaderBasic({\n        button: document.getElementById(''{embed:type}-uploader''),\n        action: ''/uploader/{embed:type}'',\n        debug: true,\n\n		onSubmit: function(id, filename) {\n			$("#{embed:type}-progressbar").show(''slide'',''slow'');\n			$("#{embed:type}-progressbar").progressbar( "option", "value", 5 ); },\n			\n       	onProgress: function(id, filename, loaded, total) {\n            			console.log( ''Progress for file: %s, ID: %s, loaded: %s, total: %s'', \n									  id, filename, loaded, total);\n						var progress = Math.round((loaded / total) * 100)*0.95;\n						$("#{embed:type}-progressbar").progressbar("option", "value", progress+5 );	},\n						\n		onComplete: function(id, filename, responseJSON) {\n		                    console.log(''File upload for file %s, id %s done with status %s'', filename, id, responseJSON);\n		                    $("#{embed:type}-progressbar").hide(''highlight'',''slow'');\n							d = new Date();\n							\n							if (''{embed:type}'' == "photo")\n								path="/images/member_photos";\n							else if (''{embed:type}'' == "avatar")\n								path="/images/avatars"\n							\n							// $("#{embed:type}").attr("src", path + "/" + responseJSON[''full_filename''] + "?"+d.getTime());\n							 $("#{embed:type}").attr("src", responseJSON[''thumbnail''] + "?"+d.getTime());  \n							}\n							\n							\n		\n     });    \n}\n\n    create{embed:type}Uploader();     \n\n\n</script>'),
(125, 14, 'exp_templates', 'template_data', 1336506599, 1, '{embed="includes/header" page="{segment_1}" page_title="Business Incubator - {company_name}"}\n			\n				<div class="container"> \n				\n				\n					\n					<div class="row">\n						\n						<div class="six columns">\n							<div class="frame">\n							{exp:channel:entries channel="incubator"}\n									{if incubator_video !=""}\n										{exp:antenna url=''{incubator_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false''}\n											<div class="flex-video vimeo widescreen">{embed_code}</div>\n										{/exp:antenna}\n									{if:else}									\n								     	<img src="{incubator_main_image}"/>\n									{/if}\n								{/exp:channel:entries}\n							</div> <!-- frame -->\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							{exp:channel:entries channel="incubator"}\n								<h1>{incubator_headline}</h1>\n								<p>{incubator_main_copy}</p>	\n							{/exp:channel:entries}\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n\n						<div class="six columns">\n							<h2>Here''s how it works</h2>\n								<p class="small">We’ll meet you for an initial in-depth one-to-one session so that together we\n								can identify exactly what you need to propel you, your ideas and your creative\n								business to the next level. Throughout the programme we will continue to work\n								with you to closely monitor and respond to your changing needs as you, your\n								business or idea develops.</p>\n								<p class="small">What you will get is a bespoke package of support to\n								ensure you meet the goals you have set. Packages include:</p>\n\n								<h4>Mentoring and Consultancy</h4>\n								<p class="small">One-to-one coaching to guide your leadership development as well as expert\n								advice in key areas of business practice such as marketing, planning, finance, human resources</p>\n								<hr />\n								\n								<h4>Events</h4>\n								<p class="small">A programme of networking and leadership development events designed\n								to inspire, inform and connect our membership including speakers, panel\n								discussions, workshops, expert clinics.</p>\n								<hr />\n								\n								<h4>Facilities</h4>\n								<p class="small">Professional cinema, meeting, work and event spaces to present, collaborate and network.</p>\n								<hr />\n								\n								<h4>Networks</h4>\n								<p class="small">You will be plugged into the MeWe network as well as other relevant external networks.</p>\n								<hr />\n								\n								<h4>Finance</h4>\n								<p class="small">Opportunity to pitch for investment from MeWe’s investment arm, MeWe Money. More information is available <a href="#">here</a>.</p>\n								\n						</div> <!-- columns -->\n\n\n\n						<div class="six columns">	\n							<div class="inset rounded">\n								<h2>Launching a project or product?</h2>\n\n								<h3>We can provide the venue and help make sure the right people are there.</h3>\n								<p>Throughout the programme we will continue to work with you to closely monitor and respond to your changing needs as you, your business or idea develops.</p>\n								<p>What you will get is a tailor made service to enable you to maximise your potential and opportunities.</p>\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/me.png" />\n									</div>\n									<div class="nine columns">	\n										<p>but within a strong, vibrant community of peers.</p>\n									</div>\n								</div>\n								\n								<hr />\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/we.png" />\n									</div>\n									<div class="nine columns">	\n										<p>committed, aspirational and talented creative entrepreneurs like you – offering support and collaboration where ideas can not only ignite but be realised.</p>\n									</div>\n								</div>\n								\n								<hr />\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/360.png" />\n									</div>\n									<div class="nine columns">	\n										<p>support needed to succeed at the highest level together with the opportunity to apply for seed funding of £200K from our investment arm.</p>\n									</div>\n								</div>\n																\n							</div>\n							\n						</div> <!-- columns -->\n\n\n					</div> <!-- .row -->\n					\n					<div class="row cta">\n						<div class="nine columns">\n							If you believe you have a compelling business idea, the ambition for success and want to work with business experts and mentors to grow your business get in touch now.\n							\n						</div>\n						<div class="three columns">\n							<a href="/sign-up" class="medium black button radius black-gradient"><span>Get in touch</span></a>\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(126, 55, 'exp_templates', 'template_data', 1336506599, 1, '{if logged_in}\n\n	{embed="includes/header" page_title="The Community - {company_name}}\n\n	<div class="container community"> \n\n			<h1>Community</h1>\n		\n			<ul class="block-grid six-up mobile community-grid">\n		\n				{exp:user:users group_id=''5'' dynamic=''off'' }\n			\n				<li>\n					<!-- link to individual member profile page -->\n					<a href="/members/{member_id}">\n						<div class="frame">\n							{if photo_filename != ""}\n								{exp:ce_img:pair:tiger src="{photo_url}{photo_filename}" max="250" crop="yes" allow_scale_larger="yes"}\n									<img src="{tiger:made}" />\n								{/exp:ce_img:pair:tiger}	\n\n							{if:else}\n								<img src="/img/default_user_photo_small.png">\n							{/if}\n							\n						</div>\n					<p class="orange-header-bar">{screen_name}</p></a>\n				</li>\n			       \n				{/exp:user:users}\n			\n			</ul>\n		\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}'),
(127, 54, 'exp_templates', 'template_data', 1336506599, 1, '\n{if logged_in}\n\n	{embed="includes/header" page="edit_profile" page_title="Edit your profile"}\n	\n	<div class="container">\n\n	{exp:user:edit form:class="nice custom validatingForm" return="members/edit_profile/success" error_page="member/error" dynamic="off"}\n\n	{if segment_3 == "success"}\n		<div class="alert-box success">You''ve successfully updated your profile!</div>\n	{/if}\n\n	<h1>Edit your profile</h1>\n		\n		<div class="row profile-form">\n\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Contact Details</h4>\n\n					<p>\n						<label for="location">Where are you based?</label>\n						<input type=''text'' class="input-text required" name=''location'' value=''{location}'' maxlength=''50''/>\n					</p>\n	\n					<p>\n						<label for="url">Your Website</label>\n						<input id="url" name="url" class="input-text" type="url" value=''{url}'' maxlength=''75'' />\n					</p>\n	\n					<p>	\n						<label for="facebook">{lang:facebook:label}</label>\n						<input type=''text'' name=''facebook'' class=''input-text'' value="{facebook}" />\n					</p>	\n	\n					<p>	\n						<label for="twitter">{lang:twitter:label}</label>\n						<input type=''text'' name=''twitter'' class=''input-text'' value="{twitter}" />\n					</p>\n\n					<p>	\n						<label for="linkedin">{lang:linkedin:label}</label>\n						<input type=''text'' name=''linkedin'' class=''input-text'' value="{linkedin}" />\n					</p>\n\n				</div>\n				\n\n			\n				<div class="profile-section">	\n		\n					<h4>Profile photo</h4>\n					\n					{if photo_filename != ""}\n						{exp:ce_img:pair:member-photo src="{photo_url}{photo_filename}" max="250" crop="yes" allow_scale_larger="yes"}\n							<img src="{member-photo:made}" id="photo"/>\n						{/exp:ce_img:pair:member-photo}\n\n					{if:else}\n						<img id="photo"src="/img/default_user_photo_small.png">\n					{/if}\n					\n					\n		            <p>\n						<span id=''photo-uploader''>\n		              		<input type="button" name="upload" id="upload" value="Upload a new photo" />\n		            	</span>\n					</p>\n					\n					<div class="alert-box success">For best results upload a square photo of at least 250x250 pixels.</div>\n					\n\n					<script src="/javascripts/fileuploader.js" type="text/javascript"></script>\n				\n					<!-- This div will be replaced by Jquery with the animated progress bar -->\n					<div id="photo-progressbar"></div>\n				\n				\n					<!-- file upload script -->\n					{embed="includes/upload_script" type="photo"}\n				\n				</div>\n\n				<div class="profile-section">\n					<h4>Bio</h4>\n					<p>\n						<label for="bio">Tell us a bit about yourself</label>\n						<textarea name=''bio'' class=''textarea large'' type="text" rows="10">{bio}</textarea>\n					</p>\n	\n				</div>\n\n\n			\n			\n	\n			</div> <!-- /.columns -->\n	\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Your Company</h4>\n\n					<p>	\n						<label for="company_name">{lang:company_name:label}</label>\n						<input type=''text'' name=''company_name'' class=''input-text'' value="{company_name}" />\n					</p>\n	\n					<p>\n	\n					\n					<!-- \n						Because ExpressionEngine only has fields for Member Photo and Avatar, \n						We are using Avatar to store the company logo.\n					-->\n		\n					<label for="avatar_filename">Company Logo</label>\n					\n					{exp:ce_img:pair:avatar src="{avatar_url}{avatar_filename}" max="100" allow_scale_larger="yes" crop="yes"}\n						<img src="{avatar:made}" id="avatar"/>\n					{/exp:ce_img:pair:avatar}\n					\n					<p>\n						<span id=''avatar-uploader''>\n		              		<input type="button" name="avatar-upload" id="avatar-upload" value="Upload a new logo" />\n		            	</span>\n					</p>\n				\n					<!-- This div will be replaced by Jquery with the animated progress bar -->\n					<div id="avatar-progressbar"></div>\n					\n					<div class="alert-box success">For best results upload a square logo of at least 100x100 pixels.</div>\n				\n					<!-- file upload script -->\n					{embed="includes/upload_script" type="avatar"}\n					\n	\n					<p>	\n						<label for="company_address">{lang:company_address:label}</label>\n						<textarea name=''company_address'' class=''textarea large'' rows=''2'' maxlength=''200''>{company_address}</textarea>\n					</p>	\n	\n					<p>	\n						<label for="company_description">{lang:company_description:label}</label>\n						<textarea name=''company_description'' class=''textarea large''>{company_description}</textarea>\n					</p>\n	\n	\n					<p>	\n						<label for="current_projects">{lang:current_projects:label}</label>\n						<textarea name=''current_projects'' class=''textarea large''>{current_projects}</textarea>\n					</p>\n\n				</div>\n			\n				<div class="profile-section">\n	\n					<h4>Skills and Experience</h4>\n\n					<p>	\n						<label for="creative_sector">{lang:creative_sector:label}</label>\n						<select name="creative_sector"> \n						{select_creative_sector} \n						<option value="{value}" {selected}>{value}</option> \n						{/select_creative_sector} \n						</select>\n					</p>	\n\n					<p>	\n						<label for="skills">{lang:skills:label}</label>\n						<textarea name=''skills'' class=''textarea large''>{skills}</textarea>\n					</p>\n\n					<p>	\n						<label for="experience">{lang:experience:label}</label>\n						<textarea name=''experience'' class=''textarea large''>{experience}</textarea>\n					</p>	\n\n				</div>\n	\n			</div> <!-- /.columns -->\n		\n		</div> <!-- /.row -->\n\n	<input type="submit" value="Do it !" class="large black button radius black-gradient" name="submit">\n\n	\n	{/exp:user:edit}\n\n\n	</div> <!-- /container -->\n\n\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}'),
(128, 62, 'exp_templates', 'template_data', 1336506599, 1, '\n{if logged_in}\n\n	{embed="includes/header" page_title="{exp:user:stats}{screen_name}{/exp:user:stats}"}\n\n\n	<div class="container public-profile"> \n\n		<div class="row">\n	\n			<div class="eight columns main-profile">\n		\n			{exp:user:stats}\n			<!-- Get member ID from the url segment -->\n		\n			<!-- Only show profiles for member sin the ''members'' group  (5)-->\n			{if group_id !=5 } \n				{redirect="404"} \n			{/if}\n		\n				<!-- Members profile picture and name -->\n				<div class="row">\n					<div class="six columns">\n						<div class="frame">\n							<!-- if photo -->\n							{if photo_filename != ""}\n									\n									{exp:ce_img:pair:member-photo src="{photo_url}{photo_filename}" max="250" crop="yes" allow_scale_larger="yes"}\n										<img src="{member-photo:made}" id="photo"/>\n									{/exp:ce_img:pair:member-photo}\n\n							{if:else}\n								<img src="/img/default_user_photo_small.png"/>\n							{/if}\n						</div>\n					</div>\n\n				\n					<div class="six columns">\n						<h1>{screen_name}</h1>\n						<p class="creative-sector">{creative_sector}</p>\n					</div>\n				</div> <!-- row -->\n				\n				<!-- About Me and other information -->\n				<div class="row">\n\n					<div class="twelve columns">\n					\n						<!-- network icons -->\n\n							<div class="row">\n									<div class="twelve columns">\n											{if facebook != ""}\n												<a href="{facebook}"><img src="/img/profile-icon-facebook.png" alt="facebook logo"/></a>\n											{/if}\n							\n											{if twitter != ""}\n												<a href="{twitter}"><img src="/img/profile-icon-twitter.png" alt="twitter logo"/>\n											{/if}\n							\n											{if linkedin != ""}\n												<a href="{linkedin}"><img src="/img/profile-icon-linkedin.png" alt="linked in logo"/>\n											{/if}\n									</div> <!-- columns -->\n							</div> <!-- row -->\n\n					\n				\n						<h3>About me</h3>\n						<p>{bio}</p>\n\n						<h3>Current projects</h3>\n						<p>{current_projects}</p>									\n\n					\n					\n					</div> <!-- columns -->\n\n				</div> <!-- row -->\n				\n				\n			</div> <!-- columns -->		\n										\n\n			<div class="four columns">	\n				<div class="inset rounded sidebar">\n					{if avatar_filename != "" }\n\n					{exp:ce_img:pair:avatar src="{avatar_url}{avatar_filename}" max="100" allow_scale_larger="yes" crop="yes"}\n						<img src="{avatar:made}" class="member-logo"/>\n					{/exp:ce_img:pair:avatar}\n	\n\n					{if:else}\n						<img src="http://placehold.it/100x100" class="member-logo" />\n					{/if}\n					<h3 class="company-name">{company_name}</h3>\n					<p class="contact-details">\n						{if company_address != ""}\n							{company_address}<br />\n						{/if}\n					\n						{email}</br />\n					\n						{if company_phone != ""}\n							{company_phone}<br />\n						{/if}\n					\n						{if url != ""}\n							{url}<br />\n						{/if}\n					</p>\n				\n					{if company_description != ""}\n						<h2>Business description</h2>\n						<p>{company_description}</p>\n					{/if}\n				\n					{if skills != ""}\n						<h2>Skills</h2>\n						<p>{skills}</p>\n					{/if}\n				\n					{if experience != ""}\n						<h2>Experience</h2>\n						<p>{experience}</p>\n					{/if}\n											\n				</div>\n\n			</div> <!-- columns -->\n			\n\n		</div> <!-- .row -->\n	\n\n	{/exp:user:stats}\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n	\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n\n'),
(129, 66, 'exp_templates', 'template_data', 1336506599, 1, '{if logged_in}\n\n	{embed="includes/header"}\n\n	<div class="container"> \n		\n		<div class="row">\n	\n			{exp:channel:entries channel="resources"}\n			\n				<table>\n					\n					{resources_list}\n						<tr>\n							<td>\n								<h3>{name}</h3>\n								<p>{description}</p>\n								<p><a href="{url}">{url}</a></p>\n							</td>\n							<td>\n								{if file != ""}\n									<a href="{file}"><img src="/img/file-icon.png" style="max-width:50%"/></a>\n								{/if}\n							</td>\n						</tr>\n					{/resources_list}\n				\n				</table>\n			\n			{/exp:channel:entries}\n\n		</div> <!-- .row -->\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n	\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n\n');
INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES
(130, 16, 'exp_templates', 'template_data', 1336506599, 1, '{embed="includes/header" page="{segment_1}" page_title="Membership tiers, pricing and FAQ - {company_name}"}\n	\n			\n				<div class="container"> \n				\n					<div class="row centered">\n						<div class="twelve columns">\n							{exp:channel:entries channel="membership"}\\\n							\n							 	<h1>{membership_headline}</h1>\n							\n								{if special_offer_visible != ""}			\n									<div class="banner inset rounded shadow">\n										<h2>{membership_banner}</h2>\n									</div> <!-- .banner --> \n								{/if}\n								\n							{/exp:channel:entries}\n							\n						</div>\n					</div> <!-- row -->\n					\n					\n					<div class="row services membership-tiers">\n					\n					{exp:channel:entries channel="membership" limit="3"}\n						{membership_tiers}\n							<div class="third columns">\n								<div class="service rounded inset">\n										<h2>{membership_tier_name}</h2>\n										<div class="bubble rounded">\n											<div>\n												<span class="contract-length">{membership_primary_description}</span><br />\n												<span class="price">{membership_primary_price}/</span><span class="payment-period">{membership_primary_period}</span></div>\n\n										</div>\n										<div class="bubble secondary-offer rounded ">\n											<div>\n												<span class="contract-length">{membership_secondary_description}</span><br />\n												{if membership_secondary_price !=""}\n													<span class="price">{membership_secondary_price}/</span><span class="payment-period">{membership_secondary_period}</span></div>\n												{if:else}\n													<span class="payment-period">N/A</span></div>\n												{/if}\n\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_1}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_2}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_3}\n										</div>\n										\n										{if membership_differentiator != ""}\n											<div class="bubble differentiator rounded">\n												{membership_differentiator}\n											</div>\n										{/if}\n			\n										<a href="/sign-up" class="large button radius black-gradient"><span>Sign up today</span></a>\n										\n								</div> <!-- panel -->\n								\n							</div>\n						{/membership_tiers}\n					{/exp:channel:entries}	\n					\n				\n					</div><!-- #services-->\n					\n					<hr class="divider"/>\n					\n					<div class="row">\n						<div class="eight columns faq-section">\n							<h2>Frequently asked questions</h2>\n						\n						{exp:channel:entries channel="membership"}	\n							{faq}\n								<div class="question-and-answer">\n									<p class="question">{question}</p>\n									<p class="answer">{answer}</p>\n								</div>\n							{/faq}\n						{/exp:channel:entries}\n							\n						</div><!-- columns -->\n							\n						<div class="four columns">\n							<div class="service rounded top-ups">\n								<h2>Top-ups and Extras</h2>\n								{exp:channel:entries channel="membership" backspace="6"}\n									{topups_and_extras}\n										<h3>{title}</h3>\n										{copy}\n										<hr />{/topups_and_extras}{/exp:channel:entries}\n								\n							</div>\n						</div><!-- columns -->\n						\n					</div> <!-- Row -->\n					\n\n				</div> <!-- container -->\n				\n	\n{embed="includes/footer"}'),
(131, 2, 'exp_templates', 'template_data', 1336506599, 1, '{embed="includes/header" page="{segment_1}" page_title="News stories - {company_name}"}\n\n				<div class="container"> \n				\n					<div class="row">\n					\n						<div class="eight columns">\n							\n							{exp:channel:entries channel="news"}\n							\n								<div class="news-article">\n									<header>\n										<h2><a href="{title_permalink=''news/view''}">{title}</a></h2> \n										<p><span class="date">{entry_date format=''%j %F %Y''}</span> by <strong>{author}</strong> <span class="comments"><a href="{title_permalink=''news/view''}#comments">{comment_total} comments</a></span></p>\n									</header>\n									{if news_video_url !=""}\n										{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n											<div class="flex-video">{embed_code}</div>\n										{/exp:antenna}\n									{if:elseif news_image != ""}\n										<div class="frame">\n											<!-- ><img src="http://lorempixel.com/450/250"/> -->\n											<img class="main-image" src="{news_image}" alt="{news_image_description}"/>\n										</div>\n									{/if}\n\n									<p>\n										{exp:eehive_hacksaw words="15" append="..."}\n												{news_article}\n										{/exp:eehive_hacksaw}\n										<a href="{title_permalink=''news/view''}">Read More</a>\n									</p>\n									\n								</div> <!-- .news-article -->\n							\n							{/exp:channel:entries}\n							\n						</div> <!-- columns -->\n								\n							\n\n						<div class="four columns">	\n							\n							{embed="includes/sidebar"}\n		\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(132, 18, 'exp_templates', 'template_data', 1336506599, 1, '{embed="includes/header" page="{segment_1}" page_title="{exp:channel:entries channel="news" limit="1"}{title}{/exp:channel:entries}"}\n\n				<div class="container"> \n			\n					<div class="row">\n					\n						<div class="eight columns">\n							\n							{exp:channel:entries channel="news" limit=''1''}\n							\n								<div class="news-article">\n									<header>\n										<h2>{title}</h2> \n										<p><span class="date">{entry_date format=''%j %F %Y''}</span> by {author} <span class="comments"><a href="#comments">{comment_total} comments</a></span></p>\n									</header>\n									\n									{if news_video_url !=""}\n										{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false'' youtube_rel="0"}\n											<div class="flex-video widescreen">{embed_code}</div>\n										{/exp:antenna}\n									{if:elseif news_image != ""}\n										<div class="frame">\n											<!-- ><img src="http://lorempixel.com/450/250"/> -->\n											<img src="{news_image}" alt="{news_image_description}"/>\n										</div>\n									{/if}\n									\n									\n									<!-- AddThis Button BEGIN -->\n									<div class="addthis_toolbox addthis_default_style addthis_32x32_style">\n									<a class="addthis_button_preferred_1"></a>\n									<a class="addthis_button_preferred_2"></a>\n									<a class="addthis_button_linkedin"></a>\n									</div>\n									<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4fa160b51a7f8321"></script>\n									<!-- AddThis Button END -->\n\n\n									<p>{news_article}</p>\n								</div> <!-- .news-article -->\n							\n							{/exp:channel:entries}\n							\n							<div id="comments">\n							\n									\n								\n								{exp:comment:entries}\n								\n									{if count==1}\n										<h5>Comments</h5>\n									{/if}\n								\n								\n													<div class="comment-content {switch odd|even}">\n														<header>\n															<p>\n																<span class="date">{comment_date format="%F %d, %Y"}</span> <span class="posted-by">Posted by</span> <strong>{name}</strong>\n															</p>\n														</header>		\n														{comment}\n													</div>\n\n								{/exp:comment:entries}\n								\n							</div> <!-- #comments -->\n							\n								<div id="comment-form">\n									<h5>Comment on this News Article</h5>\n\n									<fieldset id="comment-form-field">\n\n										{exp:comment:form channel="news" form_class="nice custom validatingForm"}\n										<div class="row">\n											<div class="six columns">\n												<p>\n													<label for="name">Name</label>\n													<input type="text" name="name" value="" class="input-text required" id="name" />\n												</p>\n												<p>\n													<label for="email">Email Address</label>\n													<input type="text" name="email" value="" class="input-text required email" id="email"  />\n												</p>\n											</div>\n											\n											<div class="six columns"> </div>\n										</div> <!-- .row -->\n											<p>\n												<label for="comment">Comment</label>\n												<textarea name="comment" class=''textarea large'' rows="8" cols="35" id="comment"></textarea>\n											</p>\n\n											<p>\n												<input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n											</p>\n											\n											\n										{/exp:comment:form}\n										\n									</fieldset>              \n\n\n\n							</div> <!-- END #comment-form -->\n							\n						</div> <!-- columns -->\n								\n							\n\n						<div class="four columns">	\n							{embed="includes/sidebar"}\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(133, 1, 'exp_templates', 'template_data', 1336506599, 1, '{embed="includes/header" page_title="Funding, Mentoring and Development for Creative Entrepreneurs - {company_name}"}\n\n				{exp:channel:entries channel="home"}\n	\n				<div class="container"> \n\n					<div class="row" id=''topSection''>\n\n						<div class="six columns push-six" id="straplineArea">\n								<div class="cta-container">\n									<h1>{strapline}</h1>\n									<a class="huge button black radius black-gradient hide-on-phones" href="/sign-up"><span>Join today</span></a>\n								</div>\n						</div> <!-- #straplineArea -->\n\n						<div class="six columns pull-six" id=''carousel''>\n\n								<div class="frame">\n									\n										{if home_video !=""}\n											{exp:antenna url=''{home_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false''}\n												<div class="flex-video vimeo widescreen">{embed_code}</div>\n											{/exp:antenna}\n										{if:else}									\n									     	<img src="{home_main_image}" />\n										{/if}\n								</div> <!-- frame-->\n					\n				\n						</div> <!-- #carousel -->\n			\n				\n					</div> <!-- #topSection -->\n			\n					<div class="row services">\n						\n						{home_four_columns}\n						\n							<div class="quarter columns">\n								<div class="service rounded">\n										<h2>{title}</h2>\n									<img src="{image}" alt="{title}" />\n									<p>{copy}</p>\n									<a href="{url}" class="medium black button radius black-gradient"><span>{button_copy}</span></a>\n								</div> <!-- panel -->\n							</div>				\n							\n						{/home_four_columns}\n						\n						{/exp:channel:entries}\n\n					</div><!-- #services-->\n				\n\n					<div class="row" id="news-area">\n					\n						<div class="seven columns">\n						\n							<h2>Latest news</h2>\n								\n								{exp:channel:entries channel="news" limit="1"}\n								<div class="row">\n									<div class="three columns">\n										<a href="{title_permalink=''news/view''}">\n											\n											{if news_video_url !=""}\n												{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n														<img src="{video_thumbnail}" alt="{video_title}" />\n												{/exp:antenna}\n											{if:elseif news_image != ""}\n												<img src="{news_image}" alt="{title}" />\n											{/if}\n										</a>\n									\n									</div> <!-- .six columns -->\n\n									<div class="nine columns">\n										\n										<div class="news-article">\n											<header>\n												<h3 class="news-heading"><a href="{title_permalink=''news/view''}">{title}</a></h3>\n												<p><span class="date">{entry_date format=''%j %F %Y''}</span> by {author} <span class="comments"><a href="{title_permalink=''news/view''}#comments">{comment_total} comments</a></span></p>\n											</header>	\n											<p class="excerpt">\n												{exp:eehive_hacksaw words="15" append="..."}\n													{news_article}\n												{/exp:eehive_hacksaw}\n											</p>\n											\n											\n										</div> <!-- .news-article -->\n									\n										\n									</div>\n								\n								</div> <!-- .row -->\n								{/exp:channel:entries}\n					\n\n\n						</div> <!-- .seven columns-->\n\n						<div class="five columns">	\n							<h2>Next Event</h2>\n								{exp:eventbriteapi:upcomingEvents limit="1"}\n									<div class="row event">\n										<div class="three columns">\n												<a href=''{url}''>\n													<div class="date-box">\n														<p class="month">{month}</p>\n														<p class="day">{day}</p>\n													</div> <!-- date-box -->\n												</a>\n										</div>\n										<div class="nine columns">\n											<div class="event-details">\n												<h3 class="event-heading"><a href=''{url}''>{title}</a></h3>\n												<p class="excerpt">{excerpt}</p>\n											</div> <!-- date- -->	\n										</div>\n									</div>\n								{/exp:eventbriteapi:upcomingEvents}\n						</div> <!-- sidebar -->\n							\n			\n					</div> <!-- #news-area -->\n\n				</div> <!-- container -->\n				\n{embed="includes/footer"}'),
(134, 64, 'exp_templates', 'template_data', 1336506599, 1, '<?php\n\n// Include the CE image class to create thumbnails \nif ( ! class_exists( ''CE_image'' ) )\n{\n	require ''/Applications/MAMP/htdocs/MeWe_CMS/mewemin/expressionengine/third_party/ce_img/libraries/Ce_image.php'';\n}\n\n/**\n * Handle file uploads via XMLHttpRequest\n */\nclass qqUploadedFileXhr {\n    /**\n     * Save the file to the specified path\n     * @return boolean TRUE on success\n     */\n    function save($path) {    \n        $input = fopen("php://input", "r");\n        $temp = tmpfile();\n        $realSize = stream_copy_to_stream($input, $temp);\n        fclose($input);\n        \n        if ($realSize != $this->getSize()){            \n            return false;\n        }\n        \n        $target = fopen($path, "w");        \n        fseek($temp, 0, SEEK_SET);\n        stream_copy_to_stream($temp, $target);\n        fclose($target);\n        \n        return true;\n    }\n    function getName() {\n        return $_GET[''qqfile''];\n    }\n    function getSize() {\n        if (isset($_SERVER["CONTENT_LENGTH"])){\n            return (int)$_SERVER["CONTENT_LENGTH"];            \n        } else {\n            throw new Exception(''Getting content length is not supported.'');\n        }      \n    }   \n}\n\n/**\n * Handle file uploads via regular form post (uses the $_FILES array)\n */\nclass qqUploadedFileForm {  \n    /**\n     * Save the file to the specified path\n     * @return boolean TRUE on success\n     */\n    function save($path) {\n        if(!move_uploaded_file($_FILES[''qqfile''][''tmp_name''], $path)){\n            return false;\n        }\n        return true;\n    }\n    function getName() {\n        return $_FILES[''qqfile''][''name''];\n    }\n    function getSize() {\n        return $_FILES[''qqfile''][''size''];\n    }\n}\n\nclass qqFileUploader {\n    private $allowedExtensions = array();\n    private $sizeLimit = 10485760;\n    private $file;\n\n    function __construct(array $allowedExtensions = array(), $sizeLimit = 10485760){        \n        $allowedExtensions = array_map("strtolower", $allowedExtensions);\n            \n        $this->allowedExtensions = $allowedExtensions;        \n        $this->sizeLimit = $sizeLimit;\n        \n        $this->checkServerSettings();       \n\n        if (isset($_GET[''qqfile''])) {\n            $this->file = new qqUploadedFileXhr();\n        } elseif (isset($_FILES[''qqfile''])) {\n            $this->file = new qqUploadedFileForm();\n        } else {\n            $this->file = false; \n        }\n    }\n    \n    private function checkServerSettings(){        \n        $postSize = $this->toBytes(ini_get(''post_max_size''));\n        $uploadSize = $this->toBytes(ini_get(''upload_max_filesize''));        \n        \n        if ($postSize < $this->sizeLimit || $uploadSize < $this->sizeLimit){\n            $size = max(1, $this->sizeLimit / 1024 / 1024) . ''M'';             \n            die("{''error'':''increase post_max_size and upload_max_filesize to $size''}");    \n        }        \n    }\n    \n    private function toBytes($str){\n        $val = trim($str);\n        $last = strtolower($str[strlen($str)-1]);\n        switch($last) {\n            case ''g'': $val *= 1024;\n            case ''m'': $val *= 1024;\n            case ''k'': $val *= 1024;        \n        }\n        return $val;\n    }\n    \n    /**\n     * Returns array(''success''=>true) or array(''error''=>''error message'')\n     */\n    function handleUpload($uploadDirectory, $replaceOldFile = TRUE){\n        if (!is_writable($uploadDirectory)){\n            return array(''error'' => "Server error. Upload directory isn''t writable.");\n        }\n        \n        if (!$this->file){\n            return array(''error'' => ''No files were uploaded.'');\n        }\n        \n        $size = $this->file->getSize();\n        \n        if ($size == 0) {\n            return array(''error'' => ''File is empty'');\n        }\n        \n        if ($size > $this->sizeLimit) {\n            return array(''error'' => ''File is too large'');\n        }\n        \n        $pathinfo = pathinfo($this->file->getName());\n        $filename = "{segment_2}_{exp:user:stats}{member_id}{/exp:user:stats}";\n        //$filename = md5(uniqid());\n        $ext = $pathinfo[''extension''];\n\n		\n\n        if($this->allowedExtensions && !in_array(strtolower($ext), $this->allowedExtensions)){\n            $these = implode('', '', $this->allowedExtensions);\n            return array(''error'' => ''File has an invalid extension, it should be one of ''. $these . ''.'');\n        }\n        \n        if(!$replaceOldFile){\n            /// don''t overwrite previous files that were uploaded\n            while (file_exists($uploadDirectory . $filename . ''.'' . $ext)) {\n                $filename .= rand(10, 99);\n            }\n        }\n        \n        if ($this->file->save($uploadDirectory . $filename . ''.'' . $ext)){\n            return array(''success''=>true, ''full_filename'' => $filename . ''.'' . $ext, ''upload_directory'' => $uploadDirectory );\n        } else {\n            return array(''error''=> ''Could not save uploaded file.'' .\n                ''The upload was cancelled, or server error encountered'');\n        }\n        \n    }    \n}\n\n// list of valid extensions, ex. array("jpeg", "xml", "bmp")\n$allowedExtensions = array();\n// max file size in bytes\n$sizeLimit = 10 * 1024 * 1024;\n\n$uploader = new qqFileUploader($allowedExtensions, $sizeLimit);\n\n// Check to see if the second url segment is photo or avatar and handle the upload accordingly. \n// Return an error if the segment is neither of these values.\nswitch ("{segment_2}") {\n	\n	case "photo":\n		$result = $uploader->handleUpload(''/Applications/MAMP/htdocs/MeWe_CMS/images/member_photos/'');\n	break;\n	\n	case "avatar":\n		$result = $uploader->handleUpload(''/Applications/MAMP/htdocs/MeWe_CMS/images/avatars/'');\n	break;\n	\n	default:\n		$result = array(''error''=> ''Could not save uploaded file.'');\n	\n}\n\n\n// If the file uploaded okay, then we update the user''s record in the expressionengine database \n// to point to the new file.\nif ($result[''success'']) {\n	file_put_contents(''php://stderr'', "\\n\\nUpdating database...\\n\\n", TRUE);\n	\n	/* create thumbnail */\n	\n	$settings = array();\n	\n	// Use different thumbnail settings for user photos or avatar (company logo)\n	\n	if ("{segment_2}" == "photo") {\n		$settings = array(''max'' => 250, ''crop'' => TRUE, ''allow_scale_larger'' => TRUE);\n	}\n	else if ("{segment_2}" == "avatar")	{\n		$settings = array(''max'' => 100, ''crop'' => TRUE, ''allow_scale_larger'' => TRUE);\n	} \n	\n	\n	//instantiate the class with the defined settings\n	$ce_image = new Ce_image($settings);\n	\n	//create the thumbnail\n	$ce_image->make( $result[''upload_directory''] . $result[''full_filename'']  );\n	\n	//get the location of the thumbnail\n 	$ce_image->create_tag();\n	$result[''thumbnail''] = $ce_image->get_relative_path();\n	\n	// Remove the upload directory from the response\n	$result[''upload_directory''] = "";\n\n	//close the image (free up memory)\n	$ce_image->close();\n	\n	/* Update the ee database */\n	\n	$data = array(''{segment_2}_filename'' => $result[''full_filename'']);\n\n	$sql = $this->EE->db->update_string(''exp_members'', $data, "member_id = ''{exp:user:stats}{member_id}{/exp:user:stats}''");\n\n	$this->EE->db->query($sql);\n	\n}\nelse {\n	file_put_contents(''php://stderr'', "\\n\\nFailed\\n", TRUE);\n}\n\n// to pass data through iframe you will need to encode all html tags\necho htmlspecialchars(json_encode($result), ENT_NOQUOTES);\n\n?>'),
(135, 15, 'exp_templates', 'template_data', 1336506599, 1, '{embed="includes/header" page="{segment_1}" page_title="Our workspace - {company_name}"}\n	{exp:channel:entries channel="workspace"}\n	\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							\n							<h1>{workspace_heading}</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row">\n						\n						<div class="six columns">\n							<div class="frame">\n									{if workspace_video !=""}\n										{exp:antenna url=''{workspace_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false''}\n											<div class="flex-video vimeo widescreen">{embed_code}</div>\n										{/exp:antenna}\n									{if:else}									\n								     	<img src="{workspace_main_image}"/>\n									{/if}\n							</div> <!-- frame -->\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							<p>{workspace_main_copy}	\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row services rooms-section">\n					\n					{workspace_four_columns}\n				\n							<div class="quarter columns">\n								<div class="service rounded">\n										<h2>{title}</h2>\n									<img src="{image}" alt="{title}" />\n									<p>{copy}</p>\n								</div> <!-- panel -->\n							</div>				\n				\n					{/workspace_four_columns}\n\n					</div><!-- #services-->\n					\n					<div class="row">\n						<div class="twelve columns cta">\n							<a href="/sign-up" class="medium black button radius black-gradient"><span>Sign up today</span></a>\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{/exp:channel:entries}\n\n{embed="includes/footer"}'),
(136, 17, 'exp_templates', 'template_data', 1336752939, 1, '{embed="includes/header" page="{segment_1}" page_title="Events - {company_name}"}\n\n			\n				<div class="container"> \n					\n					<div class="row">\n								\n							\n						{exp:channel:entries channel="events"}\n						\n						<div class="eight columns push-four">\n							<h1>We''d love to see you at one of our events!</h1>\n							<p>MEWE360º hosts a programme of networking and leadership development events designed to inspire, inform and connect our membership. As a member you have access to all events (free or discounted depending on your type of membership). We want to provide a programme that genuinely meets your needs and so are always open to member’s requests and will adapt our programme where necessary.</p>\n							<p>We run \n									{if events_file !=""}\n										<a href="{events_file}">6 different types of events</a>\n									{if:else}\n										6 different types of events\n									{/if}\n									- <strong>Networking Events</strong>, <strong>Networking Plus - The Lab</strong>, <strong>How I did it</strong>, <strong>Pick my brains</strong>, <strong>Workshop/Masterclass</strong> and <strong>Panel Discussions</strong>.\n								\n							<div class="row cta">\n								\n								<div class="eight columns">\n									Become a member to receive free tickets, special discounts and priority access.\n								</div>\n									\n								<div class="four columns">\n									<a href="/sign-up" class="medium black button radius black-gradient"><span>Sign up today</span></a>\n								</div>\n							</div>\n							\n							{/exp:channel:entries}\n		\n							\n						</div> <!-- columns -->\n					\n						<div class="four columns pull-eight">\n						{if "{exp:eventbriteapi:isUpcomingEvent}" == "true"}\n							{exp:eventbriteapi:upcomingEvents limit=''1''}\n								<div class="next-event inset">\n									<div class="date">\n										<span class="month">{month}</span>\n										<span class="day">{day}</span>\n									</div>\n									<h2>Next Event</h2>\n									<div class="container">\n										<h3>{title}</h3>\n										<!-- ><img src="http://lorempixel.com/230/100"> -->\n										{if logoURL != ""}\n											<img src="{logoURL}" />\n										{/if}\n										<p class="time"></p>\n										<p class="event-description">{excerpt}</p>\n										<a href="{url}" class="medium black button radius black-gradient"><span>Find out more</span></a>\n									</div>\n								</div>\n							{/exp:eventbriteapi:upcomingEvents}\n						{/if}\n							\n									\n						</div> <!-- columns -->		\n			\n					</div> <!-- .row -->\n					\n					<div class="row">\n						\n						<div class="eight columns push-four">\n							\n							<div class="past-events">\n								<h2 class="black-header-bar">Past Events</h2>\n								<ul>\n									{exp:channel:entries channel="past_events" orderby="past_event_date" sort="desc"}\n\n										<li class="event-summary accordionButton">\n										<div class="date-box">\n											<p class="month">{past_event_date format="%M"}</p>\n											<p class="day">{past_event_date format="%d"}</p>\n										</div> <!-- date-box -->\n\n										<h3 class="event-title">{title}</h3>\n										<p class="event-description">{past_event_description}</p>\n										<div class="clear"></div>\n									</li>\n\n										<li class="event-content inset accordionContent">\n										<div class="row">\n										\n										<!-- If there isnt a video we want the picture gallery to fill the full space -->	\n										{if past_event_video != "" OR past_event_photo_gallery != ""}\n\n											<div class="seven columns">\n										\n										{if:else}\n												\n											<div class="twelve columns">\n												\n										{/if}\n											\n										{if past_event_photo_gallery != ""}\n											\n												<ul class="block-grid eight-up gallery">\n													\n												{past_event_photo_gallery}\n													<li>\n														<a href="{image}">{exp:ed_imageresizer image="{image}" forceWidth="yes" forceHeight="yes" maxWidth="200" maxHeight="200" cropratio="100:100" alt="pap"}</a>\n													</li>\n												{/past_event_photo_gallery}\n												\n												<!-- Create placeholder images to fill in any remaining blanks in the gallery grid -->\n												{exp:for_loop start="{past_event_photo_gallery:total_rows}" end="31" increment="1"}\n												\n												<li>\n													<img src="/img/default_user_photo_small.png" /> \n												</li>\n												\n												{/exp:for_loop}\n												\n\n												</ul>									\n\n											</div><!-- columns -->\n											\n										{/if}\n										\n										{if past_event_video != ""}\n										\n											<div class="five columns">\n												<div class="video">\n													{if past_event_video !=""}\n														{exp:antenna url=''{past_event_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false'' max-width="220" max_height="123"}\n															<div class="flex-video widescreen">{embed_code}</div>\n														{/exp:antenna}\n													{if:else}\n														<img src="http://placehold.it/220x123">\n													{/if}\n\n												</div>\n											</div> <!-- columns -->\n										{/if}\n											\n										</div> <!-- row -->\n\n										<div class="row">\n											<div class="twelve columns">\n													<h4>Review</h4>\n													<p>{past_event_review}</p>\n											</div><!-- columns -->\n										</div> <!-- row -->\n\n									</li>\n\n									{/exp:channel:entries}\n\n								</ul>\n\n							</div><!-- past events -->	\n							\n						</div>\n						\n						<div class="four columns pull-eight">\n							\n								<div class="future-events">\n									<h2 class="black-header-bar">Future events</h2>\n									<ul>\n										{exp:eventbriteapi:upcomingEvents}\n											<li class="future-event container">	\n												<h3><a href="{url}">{title}</a></h3>\n												<p class="date">{date}</p>\n												<!-- <p>bumhole</p> -->\n											</li> <!-- container -->\n										{/exp:eventbriteapi:upcomingEvents}\n									</ul>\n\n								</div> <!-- future-events -->\n							\n						</div>\n						\n					</div> <!-- row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(137, 8, 'exp_templates', 'template_data', 1336752939, 1, '			{exp:channel:entries channel="footer_content" dynamic="no"}\n			\n				<div class="sponsors">\n					<div class="row">\n						<!-- <div class="twelve columns"><img src="/img/sponsors.png" alt="Our Sponsors" /></div> -->\n						\n						<div class="twelve columns">\n							{sponsors}\n								<a href="{url}">\n									<img src="{logo}" alt="{name}" />\n								</a>\n							{/sponsors}\n						</div>\n							\n						\n					</div>\n				</div>\n		\n				<div id="footer">\n			\n					<div class="row">\n						<div class="three columns">\n							<h3>Find Us</h3>\n							<div class="container">\n								<img class="map" src="/img/map.png" />\n							</div>\n						</div>\n						<div class="three columns">\n							<h3>Get in touch</h3>\n							<div class="container">\n								<p>{footer_address}</p><p>{footer_phone_number}<br /><a href="mailto:{footer_email}">{footer_email}</a></p>\n							</div>\n						</div>\n						\n						<div class="three columns networks">\n							<h3>Networks</h3>\n							<div class="container">\n								<ul>\n									{if footer_twitter != ""}\n										<li><a href="{footer_twitter}"><img src="/img/twitter.png" />Twitter</a></li>\n									{/if}\n									\n									{if footer_facebook != ""}\n										<li><a href="{footer_facebook}"><img src="/img/facebook.png" />Facebook</a></li>\n									{/if}\n									\n									{if footer_linkedin != ""}\n										<li><a href="{footer_linkedin}"><img src="/img/linkedin.png" />LinkedIn</a></li>\n									{/if}\n									\n								</ul>\n							</div>\n						</div>\n						<div class="three columns feedback">\n							<h3>Feedback</h3>\n							<div class="container">\n								<p>We’re always looking to improve what we do. If you have feedback we''d love to hear from you!</p>\n								<a href="{path=''contact-us''}" class="medium radius black button black-gradient">Get in touch</a>\n							</div>\n						</div>\n					</div>	\n				\n				\n				</div> <!-- .footer -->\n				\n				</div> <!-- #background -->\n		</div> <!-- #top-background -->\n\n{/exp:channel:entries}\n\n	<!-- Included JS Files -->\n\n	<!-- Combine and Compress These JS Files -->\n	<script src="/javascripts/jquery.reveal.js"></script>\n	<!-- <script src="/javascripts/jquery.orbit-1.4.0.js"></script> -->\n	<script src="/javascripts/jquery.customforms.js"></script>\n	<script src="/javascripts/jquery.placeholder.min.js"></script>\n	<script src="/javascripts/jquery.tooltips.js"></script>\n	<!-- End Combine and Compress These JS Files -->\n	\n	<!-- Form validation -->\n	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js"></script>	\n	\n	<script type="text/javascript">\n		$().ready(function() {\n			// validate the comment form when it is submitted\n			$(".validatingForm").validate();\n		});\n	</script>\n	\n	<script src="/javascripts/app.js"></script>\n	<script type="text/javascript" src="/javascripts/jquery.lightbox-0.5.js"></script>\n	\n	<!-- MeWe Custom JS -->\n\n	<!-- JQuery Lightbox -->\n	<script type="text/javascript">\n	$(function() {\n		$(''.gallery a'').lightBox(); // Select all links in object with gallery ID\n	});\n	</script>\n\n	\n	<!-- Social sharing javascript -->\n	{exp:socialeesta:scripts scripts="twitter|facebook" fb_app_id="390128307694751"}\n	\n	\n	<!-- Live Reload Code -->\n	<script>document.write(''<script src="http://'' + (location.host || ''localhost'').split('':'')[0] + '':35729/livereload.js?snipver=1"></'' + ''script>'')</script>\n\n</body>\n</html>'),
(138, 7, 'exp_templates', 'template_data', 1336752939, 1, '<!DOCTYPE html>\n\n<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->\n<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->\n<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->\n<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->\n<head>\n	<meta charset="utf-8" />\n\n	<!-- Set the viewport width to device width for mobile -->\n	<meta name="viewport" content="width=device-width" />\n\n	{embed:meta}\n\n	<title>{embed:page_title}</title>\n  \n	<!-- Included CSS Files -->\n	<!-- Combine and Compress These CSS Files -->\n	<link rel="stylesheet" href="/stylesheets/globals.css">\n	<link rel="stylesheet" href="/stylesheets/typography.css">\n	<link rel="stylesheet" href="/stylesheets/grid.css">\n	<link rel="stylesheet" href="/stylesheets/ui.css">\n	<link rel="stylesheet" href="/stylesheets/forms.css">\n	<!-- <link rel="stylesheet" href="/stylesheets/orbit.css"> -->\n	<link rel="stylesheet" href="/stylesheets/reveal.css">\n	<link rel="stylesheet" href="/stylesheets/mobile.css">\n	\n	<!-- favicon -->\n	<link rel="shortcut icon" href="/favicon.ico" />\n\n\n	<!-- JQuery -->\n	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.19/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css"/>\n	<link rel="stylesheet" type="text/css" href="/stylesheets/jquery.lightbox-0.5.css"/>\n		\n	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	\n  	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>\n\n\n\n	<!--[if lt IE 9]>\n		<link rel="stylesheet" href="stylesheets/ie.css">\n	<![endif]-->\n	\n	<!-- Non framework custom CSS -->\n	<link rel="stylesheet" href="/stylesheets/custom.css">\n	<link rel="stylesheet" href="/stylesheets/thumbnails.css">\n	<link rel="stylesheet" href="/stylesheets/{embed:page}.css">\n	\n	<!-- Google Webfonts -->\n	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Candara">\n	\n	<script src="/javascripts/modernizr.foundation.js"></script>\n	\n	<!-- Flowplayer -->\n	<script type="text/javascript" src="/javascripts/flowplayer/flowplayer-3.2.9.min.js"></script>\n\n\n	<!-- IE Fix for HTML5 Tags -->\n	<!--[if lt IE 9]>\n		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>\n	<![endif]-->\n	\n	<script type=''text/javascript''>\n	(function (d, t) {\n	  var bh = d.createElement(t), s = d.getElementsByTagName(t)[0];\n	  bh.type = ''text/javascript'';\n	  bh.src = ''//www.bugherd.com/sidebarv2.js?apikey=da8da014-e25b-4041-b791-25f3100fa3c8'';\n	  s.parentNode.insertBefore(bh, s);\n	  })(document, ''script'');\n	</script>\n\n</head>\n\n<body>\n		\n		<div id="top-background">\n			<div id="background">\n				<div id="header">\n\n					<div class="row" id="branding">\n							<div class="twelve columns">\n									<img src="/img/Logo.png" alt="Mewe Logo" />\n							</div>\n							\n							<ul class="secondary-nav hide-on-phones shadow">\n								{if logged_out}\n									<li><a href="{path=''member/login''}">Login</a></li>\n									<li><a href="/sign-up" class="alternate">Join Up</a></li>\n								{/if}\n								{if logged_in}\n									<li><a href="{path=''logout''}">Logout</a></li>\n								{/if}\n								\n								\n							</ul>\n					</div>\n\n					<div class="row" id="masthead" >\n						<div class="twelve columns" >\n								<ul class="nav-bar hide-on-phones" id="primary-nav">\n									<li {if segment_1 == ''''}class="selected"{if:else}class="main"{/if}><a href="/" class="main"><span>Home</span></a></li>\n									<li {if segment_1 == ''about''}class="selected"{if:else}class="main"{/if}> <a href="about" class="main">About</a></li>\n									<li {if segment_1 == ''incubator''}class="selected"{if:else}class="main"{/if}> <a href="/incubator" class="main">Incubator</a></li>\n									<li {if segment_1 == ''workspace''}class="selected"{if:else}class="main"{/if}> <a href="/workspace" class="main">Workspace</a></li>\n									<li {if segment_1 == ''events''}class="selected"{if:else}class="main"{/if}>  <a href="/events" class="main">Events</a></li>\n									<li {if segment_1 == ''membership''}class="selected"{if:else}class="main"{/if}> <a href="/membership" class="main">Membership</a></li>\n									<li {if segment_1 == ''news'' AND segment_2 == ''''}class="selected"{if:else}class="main"{/if}> <a href="/news" class="main">News</a></li>\n								{if logged_in}\n									<li class="hub has-flyout">\n										<a href="#" class="main">Members</a>\n										<div class="flyout" style="display: none;">\n											<ul>\n												<li><a href="{path=''members''}" class="main">Community</a></li>\n												<li><a href="{path=''members/resources''}" class="main">Resources</a></li>\n												<li><a href="{path=''members/profile''}"class="main">View Profile</a></li>\n												<li><a href="{path=''members/edit_profile''}"class="main">Edit Profile</a></li>\n												<li><a href="{path=''members/edit_account''}"class="main">Account Details</a></li>\n												\n											</ul>\n										</div>\n									</li>\n								{/if}\n								</ul>\n						</div>\n					</div>\n				\n				</div> <!-- #header -->\n\n'),
(139, 65, 'exp_templates', 'template_data', 1336752939, 1, '<script>    \n\n$(document).ready(function() {\n	\n	// init the progress bar\n	$("#{embed:type}-progressbar").progressbar({ value: 0 });\n	\n	// set some styles on it\n	$("#{embed:type}-progressbar").css({ ''height'':''10px'' });\n	$("#{embed:type}-progressbar").css({ ''display'':''none'' });\n	$(".ui-progressbar-value").css({ ''background-image'' : ''url(/img/uploader/progress-bar.gif)'' }); \n});\n\n\nfunction create{embed:type}Uploader(){            \n    var {embed:type}_uploader = new qq.FileUploaderBasic({\n        button: document.getElementById(''{embed:type}-uploader''),\n        action: ''/uploader/{embed:type}'',\n        debug: true,\n\n		onSubmit: function(id, filename) {\n			$("#{embed:type}-progressbar").show(''slide'',''slow'');\n			$("#{embed:type}-progressbar").progressbar( "option", "value", 5 ); },\n			\n       	onProgress: function(id, filename, loaded, total) {\n            			console.log( ''Progress for file: %s, ID: %s, loaded: %s, total: %s'', \n									  id, filename, loaded, total);\n						var progress = Math.round((loaded / total) * 100)*0.95;\n						$("#{embed:type}-progressbar").progressbar("option", "value", progress+5 );	},\n						\n		onComplete: function(id, filename, responseJSON) {\n		                    console.log(''File upload for file %s, id %s done with status %s'', filename, id, responseJSON);\n		                    $("#{embed:type}-progressbar").hide(''highlight'',''slow'');\n							d = new Date();\n							if (''{embed:type}'' == "photo")\n								path="/images/member_photos";\n							else if (''{embed:type}'' == "avatar")\n								path="/images/avatars"\n\n							// Refresh the image using the newly created thumbnail\n							\n							 $("#{embed:type}").attr("src", responseJSON[''thumbnail''] + "?"+d.getTime());  \n							}\n							\n							\n		\n     });    \n}\n\n    create{embed:type}Uploader();     \n\n\n</script>'),
(140, 16, 'exp_templates', 'template_data', 1336752939, 1, '{embed="includes/header" page="{segment_1}" page_title="Membership tiers, pricing and FAQ - {company_name}"}\n	\n			\n				<div class="container"> \n				\n					<div class="row centered">\n						<div class="twelve columns">\n							{exp:channel:entries channel="membership"}\\\n							\n							 	<h1>{membership_headline}</h1>\n							\n								{if special_offer_visible != ""}			\n									<div class="banner inset rounded shadow">\n										<h2>{membership_banner}</h2>\n									</div> <!-- .banner --> \n								{/if}\n								\n							{/exp:channel:entries}\n							\n						</div>\n					</div> <!-- row -->\n					\n					\n					<div class="row services membership-tiers">\n					\n					{exp:channel:entries channel="membership" limit="3"}\n						{membership_tiers}\n							<div class="third columns">\n								<div class="service rounded inset">\n										<h2>{membership_tier_name}</h2>\n										<div class="bubble rounded">\n											<div>\n												<span class="contract-length">{membership_primary_description}</span><br />\n												<span class="price">{membership_primary_price}/</span><span class="payment-period">{membership_primary_period}</span></div>\n\n										</div>\n										<div class="bubble secondary-offer rounded ">\n											<div>\n												<span class="contract-length">{membership_secondary_description}</span><br />\n												{if membership_secondary_price !=""}\n													<span class="price">{membership_secondary_price}/</span><span class="payment-period">{membership_secondary_period}</span></div>\n												{if:else}\n													<span class="payment-period">N/A</span></div>\n												{/if}\n\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_1}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_2}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_3}\n										</div>\n										\n										{if membership_differentiator != ""}\n											<div class="bubble differentiator rounded">\n												{membership_differentiator}\n											</div>\n										{/if}\n			\n										<a href="/sign-up" class="large button radius black-gradient"><span>Sign up today</span></a>\n										\n								</div> <!-- panel -->\n								\n							</div>\n						{/membership_tiers}\n					{/exp:channel:entries}	\n					\n				\n					</div><!-- #services-->\n					\n					<hr class="divider"/>\n					\n					<div class="row">\n						<div class="eight columns faq-section">\n							<h2>Frequently asked questions</h2>\n						\n						{exp:channel:entries channel="membership"}	\n							{faq}\n								<div class="question-and-answer">\n									<p class="question">{question}</p>\n									<p class="answer">{answer} {if file != ""}<a href="{file}" class="file-icon"><img src="/img/file-icon-small.png" /></a>{/if}</p>\n								</div>\n							{/faq}\n						{/exp:channel:entries}\n							\n						</div><!-- columns -->\n							\n						<div class="four columns">\n							<div class="service rounded top-ups">\n								<h2>Top-ups and Extras</h2>\n								{exp:channel:entries channel="membership" backspace="6"}\n									{topups_and_extras}\n										<h3>{title}</h3>\n										{copy}\n										<hr />{/topups_and_extras}{/exp:channel:entries}\n								\n							</div>\n						</div><!-- columns -->\n						\n					</div> <!-- Row -->\n					\n\n				</div> <!-- container -->\n				\n	\n{embed="includes/footer"}');
INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES
(141, 64, 'exp_templates', 'template_data', 1336752939, 1, '<?php\n\nerror_log("Started upload script", 0);\n\n$rootdir_staging = ''/var/www/vhosts/projoosr.com/subdomains/mewe-staging/httpdocs'';\n$rootdir_dev = ''/Applications/MAMP/htdocs/MeWe_CMS'';\n\n$rootdir = $rootdir_dev;\n\n// Include the CE image class to create thumbnails \nif ( ! class_exists( ''CE_image'' ) )\n{\n	require $rootdir.''/mewemin/expressionengine/third_party/ce_img/libraries/Ce_image.php'';\n}\n\n/**\n * Handle file uploads via XMLHttpRequest\n */\nclass qqUploadedFileXhr {\n    /**\n     * Save the file to the specified path\n     * @return boolean TRUE on success\n     */\n    function save($path) {    \n        $input = fopen("php://input", "r");\n        $temp = tmpfile();\n        $realSize = stream_copy_to_stream($input, $temp);\n        fclose($input);\n        \n        if ($realSize != $this->getSize()){            \n            return false;\n        }\n        \n        $target = fopen($path, "w");        \n        fseek($temp, 0, SEEK_SET);\n        stream_copy_to_stream($temp, $target);\n        fclose($target);\n        \n        return true;\n    }\n    function getName() {\n        return $_GET[''qqfile''];\n    }\n    function getSize() {\n        if (isset($_SERVER["CONTENT_LENGTH"])){\n            return (int)$_SERVER["CONTENT_LENGTH"];            \n        } else {\n            throw new Exception(''Getting content length is not supported.'');\n        }      \n    }   \n}\n\n/**\n * Handle file uploads via regular form post (uses the $_FILES array)\n */\nclass qqUploadedFileForm {  \n    /**\n     * Save the file to the specified path\n     * @return boolean TRUE on success\n     */\n    function save($path) {\n        if(!move_uploaded_file($_FILES[''qqfile''][''tmp_name''], $path)){\n            return false;\n        }\n        return true;\n    }\n    function getName() {\n        return $_FILES[''qqfile''][''name''];\n    }\n    function getSize() {\n        return $_FILES[''qqfile''][''size''];\n    }\n}\n\nclass qqFileUploader {\n    private $allowedExtensions = array();\n    private $sizeLimit = 10485760;\n    private $file;\n\n    function __construct(array $allowedExtensions = array(), $sizeLimit = 10485760){        \n        $allowedExtensions = array_map("strtolower", $allowedExtensions);\n            \n        $this->allowedExtensions = $allowedExtensions;        \n        $this->sizeLimit = $sizeLimit;\n        \n        $this->checkServerSettings();       \n\n        if (isset($_GET[''qqfile''])) {\n            $this->file = new qqUploadedFileXhr();\n        } elseif (isset($_FILES[''qqfile''])) {\n            $this->file = new qqUploadedFileForm();\n        } else {\n            $this->file = false; \n        }\n    }\n    \n    private function checkServerSettings(){        \n        $postSize = $this->toBytes(ini_get(''post_max_size''));\n        $uploadSize = $this->toBytes(ini_get(''upload_max_filesize''));        \n        \n        if ($postSize < $this->sizeLimit || $uploadSize < $this->sizeLimit){\n            $size = max(1, $this->sizeLimit / 1024 / 1024) . ''M'';             \n            die("{''error'':''increase post_max_size and upload_max_filesize to $size''}");    \n        }        \n    }\n    \n    private function toBytes($str){\n        $val = trim($str);\n        $last = strtolower($str[strlen($str)-1]);\n        switch($last) {\n            case ''g'': $val *= 1024;\n            case ''m'': $val *= 1024;\n            case ''k'': $val *= 1024;        \n        }\n        return $val;\n    }\n    \n    /**\n     * Returns array(''success''=>true) or array(''error''=>''error message'')\n     */\n    function handleUpload($uploadDirectory, $replaceOldFile = TRUE){\n        if (!is_writable($uploadDirectory)){\n            return array(''error'' => "Server error. Upload directory isn''t writable.");\n        }\n        \n        if (!$this->file){\n            return array(''error'' => ''No files were uploaded.'');\n        }\n        \n        $size = $this->file->getSize();\n        \n        if ($size == 0) {\n            return array(''error'' => ''File is empty'');\n        }\n        \n        if ($size > $this->sizeLimit) {\n            return array(''error'' => ''File is too large'');\n        }\n        \n        $pathinfo = pathinfo($this->file->getName());\n        $filename = "{segment_2}_{exp:user:stats}{member_id}{/exp:user:stats}";\n        //$filename = md5(uniqid());\n        $ext = $pathinfo[''extension''];\n\n		\n\n        if($this->allowedExtensions && !in_array(strtolower($ext), $this->allowedExtensions)){\n            $these = implode('', '', $this->allowedExtensions);\n            return array(''error'' => ''File has an invalid extension, it should be one of ''. $these . ''.'');\n        }\n        \n        if(!$replaceOldFile){\n            /// don''t overwrite previous files that were uploaded\n            while (file_exists($uploadDirectory . $filename . ''.'' . $ext)) {\n                $filename .= rand(10, 99);\n            }\n        }\n        \n        if ($this->file->save($uploadDirectory . $filename . ''.'' . $ext)){\n            return array(''success''=>true, ''full_filename'' => $filename . ''.'' . $ext, ''upload_directory'' => $uploadDirectory );\n        } else {\n            return array(''error''=> ''Could not save uploaded file.'' .\n                ''The upload was cancelled, or server error encountered'');\n        }\n        \n    }    \n}\n\n// list of valid extensions, ex. array("jpeg", "xml", "bmp")\n$allowedExtensions = array();\n// max file size in bytes\n$sizeLimit = 10 * 1024 * 1024;\n\n$uploader = new qqFileUploader($allowedExtensions, $sizeLimit);\n\n// Check to see if the second url segment is photo or avatar and handle the upload accordingly. \n// Return an error if the segment is neither of these values.\nswitch ("{segment_2}") {\n\n	case "photo":		\n		error_log(''its a photo...''.$rootdir, 0);\n		file_put_contents(''php://stderr'',''its a photo...''.$rootdir, TRUE);\n		$result = $uploader->handleUpload($rootdir.''/images/member_photos/'');\n	break;\n	\n	case "avatar":\n		$result = $uploader->handleUpload($rootdir.''/images/avatars/'');\n	break;\n	\n	default:\n		$result = array(''error''=> ''Could not save uploaded file.'');\n	\n}\n\n\n\n// If the file uploaded okay, then we update the user''s record in the expressionengine database \n// to point to the new file.\nif ($result[''success'']) {\n	error_log(''Success, updating DB...'', 0);\n	file_put_contents(''php://stderr'', "\\n\\nUpdating database...\\n\\n", TRUE);\n	\n	/* create thumbnail */\n	\n	$settings = array();\n	\n	// Use different thumbnail settings for user photos or avatar (company logo)\n	\n	if ("{segment_2}" == "photo") {\n		$settings = array(''max'' => 250, ''crop'' => TRUE, ''allow_scale_larger'' => TRUE);\n	}\n	else if ("{segment_2}" == "avatar")	{\n		$settings = array(''max'' => 100, ''crop'' => TRUE, ''allow_scale_larger'' => TRUE);\n	} \n	\n	\n	//instantiate the class with the defined settings\n	$ce_image = new Ce_image($settings);\n	\n	//create the thumbnail\n	$ce_image->make( $result[''upload_directory''] . $result[''full_filename'']  );\n	\n	//get the location of the thumbnail\n 	$ce_image->create_tag();\n	$result["thumbnail"] = $ce_image->get_relative_path();\n	\n	// Remove the upload directory from the response\n	//$result[''upload_directory''] = "";\n\n	//close the image (free up memory)\n	$ce_image->close();\n	\n	/* Update the ee database */\n	\n	$data = array(''{segment_2}_filename'' => $result[''full_filename'']);\n\n	$sql = $this->EE->db->update_string(''exp_members'', $data, "member_id = ''{exp:user:stats}{member_id}{/exp:user:stats}''");\n\n	$this->EE->db->query($sql);\n	\n}\nelse {\n	unset($result["full_filename"]);\n	unset($result["upload_directory"]);\n	file_put_contents(''php://stderr'', "\\n\\nFailed\\n", TRUE);\n	error_log(''Failed uploading/converting image '', 0);\n	echo htmlspecialchars(json_encode($result), ENT_NOQUOTES);\n	\n}\n\n// to pass data through iframe you will need to encode all html tags\n\n// Remove unnecessary items from the reponse\nunset($result["full_filename"]);\nunset($result["upload_directory"]);\n\nerror_log(''result is''.print_r($result,true), 0);\nfile_put_contents(''php://stderr'', ''result is ''. print_r($result,true), TRUE);\necho htmlspecialchars(json_encode($result), ENT_NOQUOTES);\n\n?>'),
(142, 67, 'exp_templates', 'template_data', 1337073971, 1, ''),
(143, 68, 'exp_templates', 'template_data', 1337094310, 1, ''),
(144, 69, 'exp_templates', 'template_data', 1337271005, 1, ''),
(145, 22, 'exp_templates', 'template_data', 1337280163, 1, '{embed="includes/header" page="{segment_1}" page_title="Contact Us - {company_name}"}\n\n<div class="container">\n	<div class="row">\n		<div class="twelve columns">\n			<h2>We''d love to hear from you !</h2>\n		</div>\n	</div>\n	\n	<div class="row">\n		<div class="six columns">\n		\n			\n			 	\n					\n				{exp:freeform:form \n					form:class="nice custom validatingForm"\n					collection="Contact Us"\n					required="name|email"\n					return="/thankyou"\n					notify="{global:contact_email}"\n					template="mewe_notification_template"\n					send_user_email="yes"\n					user_email_template="mewe_template"  \n					}\n							\n			       \n							\n							\n							<label for="name">What''s your name?</label>\n			                <input type="text" class="input-text required" id="name" name="name" size="40" maxlength="35" />\n\n			                <label for="email">Your Email</label>\n			                <input type="text" class="input-text required email" id="email" name="email" size="40" maxlength="35" />\n\n			                <label for="subject">Subject</label>\n			                <input type="text" class="input-text required" id="subject" name="subject" size="40" />\n\n			                <label for="message">Message</label>\n			                <textarea id="message" name="message" rows="18" class="large required" >\n\n			                </textarea>\n\n			                <input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n\n				{/exp:freeform:form}\n	\n		</div> <!-- columns -->\n		<div class="six columns"></div>\n		\n	</div> <!-- row -->\n	\n</div>\n\n{embed="includes/footer"}'),
(146, 17, 'exp_templates', 'template_data', 1337280163, 1, '{embed="includes/header" page="{segment_1}" page_title="Events - {company_name}"}\n\n			\n				<div class="container"> \n					\n					<div class="row">\n								\n							\n						{exp:channel:entries channel="events"}\n						\n						<div class="eight columns push-four">\n							<h1>We''d love to see you at one of our events!</h1>\n							<p>MEWE360º hosts a programme of networking and leadership development events designed to inspire, inform and connect our membership. As a member you have access to all events (free or discounted depending on your type of membership). We want to provide a programme that genuinely meets your needs and so are always open to member’s requests and will adapt our programme where necessary.</p>\n							<p>We run \n									{if events_file !=""}\n										<a href="{events_file}">6 different types of events</a>\n									{if:else}\n										6 different types of events\n									{/if}\n									- <strong>Networking Events</strong>, <strong>Networking Plus - The Lab</strong>, <strong>How I did it</strong>, <strong>Pick my brains</strong>, <strong>Workshop/Masterclass</strong> and <strong>Panel Discussions</strong>.\n								\n							<div class="row cta">\n								\n								<div class="eight columns">\n									Become a member to receive free tickets, special discounts and priority access.\n								</div>\n									\n								<div class="four columns">\n									<a href="/sign-up" class="medium black button radius black-gradient"><span>Sign up today</span></a>\n								</div>\n							</div>\n							\n							{/exp:channel:entries}\n		\n							\n						</div> <!-- columns -->\n					\n						<div class="four columns pull-eight">\n						{if "{exp:eventbriteapi:isUpcomingEvent}" == "true"}\n							{exp:eventbriteapi:upcomingEvents limit=''1''}\n								<div class="next-event inset">\n									<div class="date">\n										<span class="month">{month}</span>\n										<span class="day">{day}</span>\n									</div>\n									<h2>Next Event</h2>\n									<div class="container">\n										<h3>{title}</h3>\n										<!-- ><img src="http://lorempixel.com/230/100"> -->\n										{if logoURL != ""}\n											<img src="{logoURL}" />\n										{/if}\n										<p class="time"></p>\n										<p class="event-description">{excerpt}</p>\n										<a href="{url}" class="medium black button radius black-gradient"><span>Find out more</span></a>\n									</div>\n								</div>\n							{/exp:eventbriteapi:upcomingEvents}\n						{/if}\n							\n									\n						</div> <!-- columns -->		\n			\n					</div> <!-- .row -->\n					\n					<div class="row">\n						\n						<div class="eight columns push-four">\n							\n							<div class="past-events">\n								<h2 class="black-header-bar">Past Events</h2>\n								<ul>\n									{exp:channel:entries channel="past_events" orderby="past_event_date" sort="desc"}\n\n										<li class="event-summary accordionButton">\n										<div class="date-box">\n											<p class="month">{past_event_date format="%M"}</p>\n											<p class="day">{past_event_date format="%d"}</p>\n										</div> <!-- date-box -->\n\n										<h3 class="event-title">{title}</h3>\n										<p class="event-description">{past_event_description}</p>\n										<div class="clear"></div>\n									</li>\n\n										<li class="event-content inset accordionContent">\n										<div class="row">\n										\n										<!-- If there isnt a video we want the picture gallery to fill the full space -->	\n										{if past_event_video != "" OR past_event_photo_gallery != ""}\n\n											<div class="seven columns">\n										\n										{if:else}\n												\n											<div class="twelve columns">\n												\n										{/if}\n											\n										{if past_event_photo_gallery != ""}\n											\n												<ul class="block-grid eight-up gallery">\n													\n												{past_event_photo_gallery}\n													<li>														\n															{exp:ce_img:pair:photo src="{image}" max="200" crop="yes" allow_scale_larger="yes"}\n																<a href="{image}"><img src="{photo:made}" alt="Photo of {title}" /></a>\n															{/exp:ce_img:pair:photo}	\n													</li>\n												{/past_event_photo_gallery}\n												\n												<!-- Create placeholder images to fill in any remaining blanks in the gallery grid -->\n												{exp:for_loop start="{past_event_photo_gallery:total_rows}" end="31" increment="1"}\n												\n												<li>\n													<img src="/img/default_user_photo_small.png" /> \n												</li>\n												\n												{/exp:for_loop}\n												\n\n												</ul>									\n\n											</div><!-- columns -->\n											\n										{/if}\n										\n										{if past_event_video != ""}\n										\n											<div class="five columns">\n												<div class="video">\n													{if past_event_video !=""}\n														{exp:antenna url=''{past_event_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false'' max-width="220" max_height="123"}\n															<div class="flex-video widescreen">{embed_code}</div>\n														{/exp:antenna}\n													{if:else}\n														<img src="http://placehold.it/220x123">\n													{/if}\n\n												</div>\n											</div> <!-- columns -->\n										{/if}\n											\n										</div> <!-- row -->\n\n										<div class="row">\n											<div class="twelve columns">\n													<h4>Review</h4>\n													<p>{past_event_review}</p>\n											</div><!-- columns -->\n										</div> <!-- row -->\n\n									</li>\n\n									{/exp:channel:entries}\n\n								</ul>\n\n							</div><!-- past events -->	\n							\n						</div>\n						\n						<div class="four columns pull-eight">\n							\n								<div class="future-events">\n									<h2 class="black-header-bar">Future events</h2>\n									<ul>\n										{exp:eventbriteapi:upcomingEvents}\n											<li class="future-event container">	\n												<h3><a href="{url}">{title}</a></h3>\n												<p class="date">{date}</p>\n												<!-- <p>bumhole</p> -->\n											</li> <!-- container -->\n										{/exp:eventbriteapi:upcomingEvents}\n									</ul>\n\n								</div> <!-- future-events -->\n							\n						</div>\n						\n					</div> <!-- row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(147, 7, 'exp_templates', 'template_data', 1337280163, 1, '<!DOCTYPE html>\n\n<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->\n<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->\n<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->\n<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->\n<head>\n	<meta charset="utf-8" />\n\n	<!-- Set the viewport width to device width for mobile -->\n	<meta name="viewport" content="width=device-width" />\n\n	{embed:meta}\n\n	<title>{embed:page_title}</title>\n  \n	<!-- Included CSS Files -->\n	<!-- Combine and Compress These CSS Files -->\n	<link rel="stylesheet" href="/stylesheets/globals.css">\n	<link rel="stylesheet" href="/stylesheets/typography.css">\n	<link rel="stylesheet" href="/stylesheets/grid.css">\n	<link rel="stylesheet" href="/stylesheets/ui.css">\n	<link rel="stylesheet" href="/stylesheets/forms.css">\n	<!-- <link rel="stylesheet" href="/stylesheets/orbit.css"> -->\n	<link rel="stylesheet" href="/stylesheets/reveal.css">\n	<link rel="stylesheet" href="/stylesheets/mobile.css">\n	\n	<!-- favicon -->\n	<link rel="shortcut icon" href="/favicon.ico" />\n\n\n	<!-- JQuery -->\n	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.19/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css"/>\n	<link rel="stylesheet" type="text/css" href="/stylesheets/jquery.lightbox-0.5.css"/>\n		\n	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	\n  	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>\n\n\n\n	<!--[if lt IE 9]>\n		<link rel="stylesheet" href="stylesheets/ie.css">\n	<![endif]-->\n	\n	<!-- Non framework custom CSS -->\n	<link rel="stylesheet" href="/stylesheets/custom.css">\n	<link rel="stylesheet" href="/stylesheets/thumbnails.css">\n	<link rel="stylesheet" href="/stylesheets/{embed:page}.css">\n	\n	<!-- Google Webfonts -->\n	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Candara">\n	\n	<script src="/javascripts/modernizr.foundation.js"></script>\n	\n	<!-- IE Fix for HTML5 Tags -->\n	<!--[if lt IE 9]>\n		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>\n	<![endif]-->\n	\n	<script type=''text/javascript''>\n	(function (d, t) {\n	  var bh = d.createElement(t), s = d.getElementsByTagName(t)[0];\n	  bh.type = ''text/javascript'';\n	  bh.src = ''//www.bugherd.com/sidebarv2.js?apikey=da8da014-e25b-4041-b791-25f3100fa3c8'';\n	  s.parentNode.insertBefore(bh, s);\n	  })(document, ''script'');\n	</script>\n\n</head>\n\n<body>\n		\n		<div id="top-background">\n			<div id="background">\n				<div id="header">\n\n					<div class="row" id="branding">\n							<div class="twelve columns">\n									<img src="/img/Logo.png" alt="Mewe Logo" />\n							</div>\n							\n							<ul class="secondary-nav hide-on-phones shadow">\n								{if logged_out}\n									<li><a href="{path=''member/login''}">Login</a></li>\n									<li><a href="/sign-up" class="alternate">Join Up</a></li>\n								{/if}\n								{if logged_in}\n									<li><a href="{path=''logout''}">Logout</a></li>\n								{/if}\n								\n								\n							</ul>\n					</div>\n\n					<div class="row" id="masthead" >\n						<div class="twelve columns" >\n								<ul class="nav-bar hide-on-phones" id="primary-nav">\n									<li {if segment_1 == ''''}class="selected"{if:else}class="main"{/if}><a href="/" class="main"><span>Home</span></a></li>\n									<li {if segment_1 == ''about''}class="selected"{if:else}class="main"{/if}> <a href="about" class="main">About</a></li>\n									<li {if segment_1 == ''incubator''}class="selected"{if:else}class="main"{/if}> <a href="/incubator" class="main">Incubator</a></li>\n									<li {if segment_1 == ''workspace''}class="selected"{if:else}class="main"{/if}> <a href="/workspace" class="main">Workspace</a></li>\n									<li {if segment_1 == ''events''}class="selected"{if:else}class="main"{/if}>  <a href="/events" class="main">Events</a></li>\n									<li {if segment_1 == ''membership''}class="selected"{if:else}class="main"{/if}> <a href="/membership" class="main">Membership</a></li>\n									<li {if segment_1 == ''news'' AND segment_2 == ''''}class="selected"{if:else}class="main"{/if}> <a href="/news" class="main">News</a></li>\n								{if logged_in}\n									<li class="hub has-flyout">\n										<a href="#" class="main">Members</a>\n										<div class="flyout" style="display: none;">\n											<ul>\n												<li><a href="{path=''members''}" class="main">Community</a></li>\n												<li><a href="{path=''members/resources''}" class="main">Resources</a></li>\n												<li><a href="{path=''members/profile''}"class="main">View Profile</a></li>\n												<li><a href="{path=''members/edit_profile''}"class="main">Edit Profile</a></li>\n												<li><a href="{path=''members/edit_account''}"class="main">Account Details</a></li>\n												\n											</ul>\n										</div>\n									</li>\n								{/if}\n								</ul>\n						</div>\n					</div>\n				\n				</div> <!-- #header -->\n\n'),
(148, 61, 'exp_templates', 'template_data', 1337280163, 1, '{exp:channel:entries channel="about"}\n\n	{{embed:field}}\n		<li> \n			{if video != ""}\n				\n				{exp:antenna url=''{video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false''}\n					<div class="flex-video vimeo widescreen">{embed_code}</div>\n				{/exp:antenna}	\n\n			{if:else}\n			\n					{if photo != ""}\n					\n						{exp:ce_img:pair:mugshot src="{photo}" height="184" width="320" crop="yes" allow_scale_larger="yes"}\n							<img src="{mugshot:made}" />\n						{/exp:ce_img:pair:mugshot}\n					\n					{if:else}\n						<img src="http://lorempixel.com/200/120">\n					{/if}\n			{/if}\n\n			<!-- If the heading is below a video embed it''s given a separate class to ensure its aligned -->\n			<h3 {if video !="" }class="video_heading"{/if}>{name}</h3>\n			<p>{bio}</p>\n		\n		</li>\n		\n	{/{embed:field}}\n	\n{/exp:channel:entries}'),
(149, 68, 'exp_templates', 'template_data', 1337280163, 1, 'Welcome aboard !\n\nYou''ve now been registered as a member of the MeWe360 online community ! Your username and password are :\n\nusername: {mbr_username}\npassword: {password}\n\nWhy not login and update your online profile : \n\nhttp://www.mewe360.com/member/login\n\nThis enables you to show other members what skills and experience you have to offer. You should also change your password to something to something you can easily remember. If you have any difficulties logging or queries about your account then please drop us a line.\n\n'),
(150, 20, 'exp_templates', 'template_data', 1337280163, 1, '{embed="includes/header" page="{segment_1}" page_title="Sign up or find out more - {company_name}}\n			\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							<h1>Interested in joining up or finding out about special offers and upcoming events? Fill in your details and we’ll keep you in the loop.</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">	\n						\n							{exp:freeform:form \n								form:class="nice custom validatingForm"\n								collection="Sign Up"\n								return="/thankyou"\n								notify="{global:contact_email}"\n								send_user_email="yes"\n								template="mewe_notification_template" \n								user_email_template="mewe_template"\n								}\n							\n								<div class="row">\n									<div class="six columns">	\n										<label for="first_name">Name *</label>\n										<input id="first_name" name="first_name" class="input-text required" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="last_name">Surname *</label>\n										<input id="last_name" name="last_name" class="input-text required" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->\n							\n								<div class="row">\n									<div class="twelve columns">\n											<label for="email">Email *</label>\n											<input id="email" name="email" class="input-text required email" type="text">\n									</div>\n								</div>	\n													\n								<div class="row">\n									<div class="six columns">	\n										<label for="phone_number">Phone number</label>\n										<input id="phone_number" name="phone_number" class="input-text" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="postcode">Postcode</label>\n										<input id="postcode" name="postcode" class="input-text" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->		\n						\n								<div class="row">\n									<div class="twelve columns">\n									\n										<label for="creative_insutry">What creative industry are you in?</label>\n										<select style="display:none;" id="creative_insutry" name="creative_industry" class="expand">\n										  	<option>Design</option>\n										  	<option>New Media</option>\n											<option>Television</option>\n										  	<option>Writing</option>\n										</select>\n										\n										\n									\n										<label for="membership_type">What type of membership are you interested in?</label>\n										<select style="display:none;" id="membership_type" name="membership_type" class="expand">\n										  	<option>Network</option>\n											<option>Hub</option>\n										  	<option>Incubator</option>\n											<option>Just events</option>\n										  	<option>Not sure</option>	\n										</select>\n										\n										<label for="business_stage">What stage of development is your business/project at?</label>\n										<select style="display:none;" id="business_stage" name="business_stage" class="expand">\n											<option>Pre start-up / concept development</option>\n											<option>Start-up</option>\n										  	<option>Established over 1 year</option>\n										</select>										\n									\n									</div>	<!-- columns -->\n								</div> <!-- row -->\n							\n								<div class="row submit-section">\n\n									<div class="six columns">	\n										<input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n										\n									</div><!-- columns -->\n								\n									<div class="six columns terms">\n								            <span id="checkbox"><input id="opt-in" checked="checked" type="checkbox" /></span>\n								            <span id="checkbox-label"><label for="opt-in">Uncheck this box if you don’t want to recieve news about special discounts, upcoming events and more. Don’t worry, we hate spam and we’ll never share your details with anyone else.</label></span>\n									</div><!-- columns -->\n\n								</div><!-- row -->\n							\n							\n							{/exp:freeform:form} <!-- form -->\n										\n						</div> <!-- columns -->\n				\n						\n						<div class="six columns hide-on-phones">\n							<div class="large-image">\n								<img src="/img/membership.png" class="frame" />\n							</div>\n						</div> <!-- columns -->\n								\n							\n	\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n						\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(151, 1, 'exp_templates', 'template_data', 1337280163, 1, '{embed="includes/header" page_title="Funding, Mentoring and Development for Creative Entrepreneurs - {company_name}"}\n\n				{exp:channel:entries channel="home"}\n	\n				<div class="container"> \n\n					<div class="row" id=''topSection''>\n\n						<div class="six columns push-six" id="straplineArea">\n								<div class="cta-container">\n									<h1>{strapline}</h1>\n									<a href="/sign-up" class="huge black button black radius black-gradient hide-on-phones" ><span>Join today</span></a>\n								</div>\n						</div> <!-- #straplineArea -->\n\n						<div class="six columns pull-six" id=''carousel''>\n\n								<div class="frame">\n									\n										{if home_video !=""}\n											{exp:antenna url=''{home_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false'' wmode=''transparent''}\n												<div class="flex-video vimeo widescreen">{embed_code}</div>\n											{/exp:antenna}\n										{if:else}									\n									     	<img src="{home_main_image}" />\n										{/if}\n								</div> <!-- frame-->\n					\n				\n						</div> <!-- #carousel -->\n			\n				\n					</div> <!-- #topSection -->\n			\n					<div class="row services">\n						\n						{home_four_columns}\n						\n							<div class="quarter columns">\n								<div class="service rounded">\n										<h2>{title}</h2>\n									<img src="{image}" alt="{title}" />\n									<p>{copy}</p>\n									<a href="{url}" class="medium black button radius black-gradient"><span>{button_copy}</span></a>\n								</div> <!-- panel -->\n							</div>				\n							\n						{/home_four_columns}\n						\n						{/exp:channel:entries}\n\n					</div><!-- #services-->\n				\n\n					<div class="row" id="news-area">\n					\n						<div class="seven columns">\n						\n							<h2>Latest news</h2>\n								\n								{exp:channel:entries channel="news" limit="1"}\n								<div class="row">\n									<div class="three columns">\n										<a href="{title_permalink=''news/view''}">\n											\n											{if news_video_url !=""}\n												{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n														<img src="{video_thumbnail}" alt="{video_title}" />\n												{/exp:antenna}\n											{if:elseif news_image != ""}\n												<img src="{news_image}" alt="{title}" />\n											{/if}\n										</a>\n									\n									</div> <!-- .six columns -->\n\n									<div class="nine columns">\n										\n										<div class="news-article">\n											<header>\n												<h3 class="news-heading"><a href="{title_permalink=''news/view''}">{title}</a></h3>\n												<p><span class="date">{entry_date format=''%j %F %Y''}</span> by {author} <span class="comments"><a href="{title_permalink=''news/view''}#comments">{comment_total} comments</a></span></p>\n											</header>	\n											<p class="excerpt">\n												{exp:eehive_hacksaw words="15" append="..."}\n													{news_article}\n												{/exp:eehive_hacksaw}\n											</p>\n											\n											\n										</div> <!-- .news-article -->\n									\n										\n									</div>\n								\n								</div> <!-- .row -->\n								{/exp:channel:entries}\n					\n\n\n						</div> <!-- .seven columns-->\n\n						<div class="five columns">	\n							<h2>Next Event</h2>\n								{exp:eventbriteapi:upcomingEvents limit="1"}\n									<div class="row event">\n										<div class="three columns">\n												<a href=''{url}''>\n													<div class="date-box">\n														<p class="month">{month}</p>\n														<p class="day">{day}</p>\n													</div> <!-- date-box -->\n												</a>\n										</div>\n										<div class="nine columns">\n											<div class="event-details">\n												<h3 class="event-heading"><a href=''{url}''>{title}</a></h3>\n												<p class="excerpt">{excerpt}</p>\n											</div> <!-- date- -->	\n										</div>\n									</div>\n								{/exp:eventbriteapi:upcomingEvents}\n						</div> <!-- sidebar -->\n							\n			\n					</div> <!-- #news-area -->\n\n				</div> <!-- container -->\n				\n{embed="includes/footer"}'),
(152, 67, 'exp_templates', 'template_data', 1337280163, 1, '{embed="includes/header" page="thankyou"}\n<div class="container">\n	\n	<div class="row">\n		<div class="six columns">\n			<h1>Thanks for getting in touch!</h1>\n			<p>We love to hear about new businesses and projects and respond to all enquiries personally.</p>\n			<p>Please expect an email from one of our team within the next few days!</p>\n				\n				<div class="row">\n					<div class="six columns">\n							<a class="medium black button radius black-gradient" href="/"><span>Return to the site</span></a>\n					</div>\n					<div class="six columns"></div>\n				</div>\n			\n		</div>\n		\n		<div class="six columns">\n			<img src="/img/thanks.png" class="large" />\n		</div>\n		\n	</div>\n	\n	\n\n		\n</div>\n{embed="includes/footer"}'),
(153, 64, 'exp_templates', 'template_data', 1337280163, 1, '<?php\n\nerror_log("Started upload script", 0);\n\n// $rootdir_staging = ''/var/www/vhosts/projoosr.com/subdomains/mewe-staging/httpdocs'';\n// $rootdir_dev = ''/Applications/MAMP/htdocs/MeWe_CMS'';\n\n$rootdir = ''{global:base_path}'';\n\n// Include the CE image class to create thumbnails \nif ( ! class_exists( ''CE_image'' ) )\n{\n	require $rootdir.''/mewemin/expressionengine/third_party/ce_img/libraries/Ce_image.php'';\n}\n\n/**\n * Handle file uploads via XMLHttpRequest\n */\nclass qqUploadedFileXhr {\n    /**\n     * Save the file to the specified path\n     * @return boolean TRUE on success\n     */\n    function save($path) {    \n        $input = fopen("php://input", "r");\n        $temp = tmpfile();\n        $realSize = stream_copy_to_stream($input, $temp);\n        fclose($input);\n        \n        if ($realSize != $this->getSize()){            \n            return false;\n        }\n        \n        $target = fopen($path, "w");        \n        fseek($temp, 0, SEEK_SET);\n        stream_copy_to_stream($temp, $target);\n        fclose($target);\n        \n        return true;\n    }\n    function getName() {\n        return $_GET[''qqfile''];\n    }\n    function getSize() {\n        if (isset($_SERVER["CONTENT_LENGTH"])){\n            return (int)$_SERVER["CONTENT_LENGTH"];            \n        } else {\n            throw new Exception(''Getting content length is not supported.'');\n        }      \n    }   \n}\n\n/**\n * Handle file uploads via regular form post (uses the $_FILES array)\n */\nclass qqUploadedFileForm {  \n    /**\n     * Save the file to the specified path\n     * @return boolean TRUE on success\n     */\n    function save($path) {\n        if(!move_uploaded_file($_FILES[''qqfile''][''tmp_name''], $path)){\n            return false;\n        }\n        return true;\n    }\n    function getName() {\n        return $_FILES[''qqfile''][''name''];\n    }\n    function getSize() {\n        return $_FILES[''qqfile''][''size''];\n    }\n}\n\nclass qqFileUploader {\n    private $allowedExtensions = array();\n    private $sizeLimit = 10485760;\n    private $file;\n\n    function __construct(array $allowedExtensions = array(), $sizeLimit = 10485760){        \n        $allowedExtensions = array_map("strtolower", $allowedExtensions);\n            \n        $this->allowedExtensions = $allowedExtensions;        \n        $this->sizeLimit = $sizeLimit;\n        \n        $this->checkServerSettings();       \n\n        if (isset($_GET[''qqfile''])) {\n            $this->file = new qqUploadedFileXhr();\n        } elseif (isset($_FILES[''qqfile''])) {\n            $this->file = new qqUploadedFileForm();\n        } else {\n            $this->file = false; \n        }\n    }\n    \n    private function checkServerSettings(){        \n        $postSize = $this->toBytes(ini_get(''post_max_size''));\n        $uploadSize = $this->toBytes(ini_get(''upload_max_filesize''));        \n        \n        if ($postSize < $this->sizeLimit || $uploadSize < $this->sizeLimit){\n            $size = max(1, $this->sizeLimit / 1024 / 1024) . ''M'';             \n            die("{''error'':''increase post_max_size and upload_max_filesize to $size''}");    \n        }        \n    }\n    \n    private function toBytes($str){\n        $val = trim($str);\n        $last = strtolower($str[strlen($str)-1]);\n        switch($last) {\n            case ''g'': $val *= 1024;\n            case ''m'': $val *= 1024;\n            case ''k'': $val *= 1024;        \n        }\n        return $val;\n    }\n    \n    /**\n     * Returns array(''success''=>true) or array(''error''=>''error message'')\n     */\n    function handleUpload($uploadDirectory, $replaceOldFile = TRUE){\n        if (!is_writable($uploadDirectory)){\n            return array(''error'' => "Server error. Upload directory isn''t writable.");\n        }\n        \n        if (!$this->file){\n            return array(''error'' => ''No files were uploaded.'');\n        }\n        \n        $size = $this->file->getSize();\n        \n        if ($size == 0) {\n            return array(''error'' => ''File is empty'');\n        }\n        \n        if ($size > $this->sizeLimit) {\n            return array(''error'' => ''File is too large'');\n        }\n        \n        $pathinfo = pathinfo($this->file->getName());\n        $filename = "{segment_2}_{exp:user:stats}{member_id}{/exp:user:stats}";\n        //$filename = md5(uniqid());\n        $ext = $pathinfo[''extension''];\n\n		\n\n        if($this->allowedExtensions && !in_array(strtolower($ext), $this->allowedExtensions)){\n            $these = implode('', '', $this->allowedExtensions);\n            return array(''error'' => ''File has an invalid extension, it should be one of ''. $these . ''.'');\n        }\n        \n        if(!$replaceOldFile){\n            /// don''t overwrite previous files that were uploaded\n            while (file_exists($uploadDirectory . $filename . ''.'' . $ext)) {\n                $filename .= rand(10, 99);\n            }\n        }\n        \n        if ($this->file->save($uploadDirectory . $filename . ''.'' . $ext)){\n            return array(''success''=>true, ''full_filename'' => $filename . ''.'' . $ext, ''upload_directory'' => $uploadDirectory );\n        } else {\n            return array(''error''=> ''Could not save uploaded file.'' .\n                ''The upload was cancelled, or server error encountered'');\n        }\n        \n    }    \n}\n\n// list of valid extensions, ex. array("jpeg", "xml", "bmp")\n$allowedExtensions = array();\n// max file size in bytes\n$sizeLimit = 10 * 1024 * 1024;\n\n$uploader = new qqFileUploader($allowedExtensions, $sizeLimit);\n\n// Check to see if the second url segment is photo or avatar and handle the upload accordingly. \n// Return an error if the segment is neither of these values.\nswitch ("{segment_2}") {\n\n	case "photo":		\n		error_log(''its a photo...''.$rootdir, 0);\n		file_put_contents(''php://stderr'',''its a photo...''.$rootdir, TRUE);\n		$result = $uploader->handleUpload($rootdir.''/images/member_photos/'');\n	break;\n	\n	case "avatar":\n		$result = $uploader->handleUpload($rootdir.''/images/avatars/'');\n	break;\n	\n	default:\n		$result = array(''error''=> ''Could not save uploaded file.'');\n	\n}\n\n\n\n// If the file uploaded okay, then we update the user''s record in the expressionengine database \n// to point to the new file.\nif ($result[''success'']) {\n	error_log(''Success, updating DB...'', 0);\n	file_put_contents(''php://stderr'', "\\n\\nUpdating database...\\n\\n", TRUE);\n	\n	/* create thumbnail */\n	\n	$settings = array();\n	\n	// Use different thumbnail settings for user photos or avatar (company logo)\n	\n	if ("{segment_2}" == "photo") {\n		$settings = array(''max'' => 250, ''crop'' => TRUE, ''allow_scale_larger'' => TRUE);\n	}\n	else if ("{segment_2}" == "avatar")	{\n		$settings = array(''max'' => 100, ''crop'' => TRUE, ''allow_scale_larger'' => TRUE);\n	} \n	\n	\n	//instantiate the class with the defined settings\n	$ce_image = new Ce_image($settings);\n	\n	//create the thumbnail\n	$ce_image->make( $result[''upload_directory''] . $result[''full_filename'']  );\n	\n	//get the location of the thumbnail\n 	$ce_image->create_tag();\n	$result["thumbnail"] = $ce_image->get_relative_path();\n	\n	// Remove the upload directory from the response\n	//$result[''upload_directory''] = "";\n\n	//close the image (free up memory)\n	$ce_image->close();\n	\n	/* Update the ee database */\n	\n	$data = array(''{segment_2}_filename'' => $result[''full_filename'']);\n\n	$sql = $this->EE->db->update_string(''exp_members'', $data, "member_id = ''{exp:user:stats}{member_id}{/exp:user:stats}''");\n\n	$this->EE->db->query($sql);\n	\n}\nelse {\n	unset($result["full_filename"]);\n	unset($result["upload_directory"]);\n	file_put_contents(''php://stderr'', "\\n\\nFailed\\n", TRUE);\n	error_log(''Failed uploading/converting image '', 0);\n	echo htmlspecialchars(json_encode($result), ENT_NOQUOTES);\n	\n}\n\n// to pass data through iframe you will need to encode all html tags\n\n// Remove unnecessary items from the reponse\nunset($result["full_filename"]);\nunset($result["upload_directory"]);\n\nerror_log(''result is''.print_r($result,true), 0);\nfile_put_contents(''php://stderr'', ''result is ''. print_r($result,true), TRUE);\necho htmlspecialchars(json_encode($result), ENT_NOQUOTES);\n\n?>'),
(154, 17, 'exp_templates', 'template_data', 1337366314, 1, '{embed="includes/header" page="{segment_1}" page_title="Events - {company_name}"}\n\n			\n				<div class="container"> \n					\n					<div class="row">\n								\n							\n						{exp:channel:entries channel="events"}\n						\n						<div class="eight columns push-four">\n							<h1>We''d love to see you at one of our events!</h1>\n							<p>MEWE360º hosts a programme of networking and leadership development events designed to inspire, inform and connect our membership. As a member you have access to all events (free or discounted depending on your type of membership). We want to provide a programme that genuinely meets your needs and so are always open to member’s requests and will adapt our programme where necessary.</p>\n							<p>We run \n									{if events_file !=""}\n										<a href="{events_file}" target="_blank">6 different types of events</a>\n									{if:else}\n										6 different types of events\n									{/if}\n									- <strong>Networking Events</strong>, <strong>Networking Plus - The Lab</strong>, <strong>How I did it</strong>, <strong>Pick my brains</strong>, <strong>Workshop/Masterclass</strong> and <strong>Panel Discussions</strong>.\n								\n							<div class="row cta">\n								\n								<div class="eight columns">\n									Become a member to receive free tickets, special discounts and priority access.\n								</div>\n									\n								<div class="four columns">\n									<a href="/sign-up" class="medium black button radius black-gradient"><span>Sign up today</span></a>\n								</div>\n							</div>\n							\n							{/exp:channel:entries}\n		\n							\n						</div> <!-- columns -->\n					\n						<div class="four columns pull-eight">\n						{if "{exp:eventbriteapi:isUpcomingEvent}" == "true"}\n							{exp:eventbriteapi:upcomingEvents limit=''1''}\n								<div class="next-event inset">\n									<div class="date">\n										<span class="month">{month}</span>\n										<span class="day">{day}</span>\n									</div>\n									<h2>Next Event</h2>\n									<div class="container">\n										<h3>{title}</h3>\n										<!-- ><img src="http://lorempixel.com/230/100"> -->\n										{if logoURL != ""}\n											<img src="{logoURL}" />\n										{/if}\n										<p class="time"></p>\n										<p class="event-description">{excerpt}</p>\n										<a href="{url}" class="medium black button radius black-gradient"><span>Find out more</span></a>\n									</div>\n								</div>\n							{/exp:eventbriteapi:upcomingEvents}\n						{/if}\n							\n									\n						</div> <!-- columns -->		\n			\n					</div> <!-- .row -->\n					\n					<div class="row">\n						\n						<div class="eight columns push-four">\n							\n							<div class="past-events">\n								<h2 class="black-header-bar">Past Events</h2>\n								<ul>\n									{exp:channel:entries channel="past_events" orderby="past_event_date" sort="desc"}\n\n										<li class="event-summary accordionButton">\n										<div class="date-box">\n											<p class="month">{past_event_date format="%M"}</p>\n											<p class="day">{past_event_date format="%d"}</p>\n										</div> <!-- date-box -->\n\n										<h3 class="event-title">{title}</h3>\n										<p class="event-description">{past_event_description}</p>\n										<div class="clear"></div>\n									</li>\n\n										<li class="event-content inset accordionContent">\n										<div class="row">\n										\n										<!-- If there isnt a video we want the picture gallery to fill the full space -->	\n										{if past_event_video != "" OR past_event_photo_gallery != ""}\n\n											<div class="seven columns">\n										\n										{if:else}\n												\n											<div class="twelve columns">\n												\n										{/if}\n											\n										{if past_event_photo_gallery != ""}\n											\n												<ul class="block-grid eight-up gallery">\n													\n												{past_event_photo_gallery}\n													<li>														\n															{exp:ce_img:pair:photo src="{image}" max="200" crop="yes" allow_scale_larger="yes"}\n																<a href="{image}"><img src="{photo:made}" alt="Photo of {title}" /></a>\n															{/exp:ce_img:pair:photo}	\n													</li>\n												{/past_event_photo_gallery}\n												\n												<!-- Create placeholder images to fill in any remaining blanks in the gallery grid -->\n												{exp:for_loop start="{past_event_photo_gallery:total_rows}" end="31" increment="1"}\n												\n												<li>\n													<img src="/img/default_user_photo_small.png" /> \n												</li>\n												\n												{/exp:for_loop}\n												\n\n												</ul>									\n\n											</div><!-- columns -->\n											\n										{/if}\n										\n										{if past_event_video != ""}\n										\n											<div class="five columns">\n												<div class="video">\n													{if past_event_video !=""}\n														{exp:antenna url=''{past_event_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false'' max-width="220" max_height="123"}\n															<div class="flex-video widescreen">{embed_code}</div>\n														{/exp:antenna}\n													{if:else}\n														<img src="http://placehold.it/220x123">\n													{/if}\n\n												</div>\n											</div> <!-- columns -->\n										{/if}\n											\n										</div> <!-- row -->\n\n										<div class="row">\n											<div class="twelve columns">\n													<h4>Review</h4>\n													<p>{past_event_review}</p>\n											</div><!-- columns -->\n										</div> <!-- row -->\n\n									</li>\n\n									{/exp:channel:entries}\n\n								</ul>\n\n							</div><!-- past events -->	\n							\n						</div>\n						\n						<div class="four columns pull-eight">\n							\n								<div class="future-events">\n									<h2 class="black-header-bar">Future events</h2>\n									<ul>\n										{exp:eventbriteapi:upcomingEvents}\n											<li class="future-event container">	\n												<h3><a href="{url}">{title}</a></h3>\n												<p class="date">{date}</p>\n												<!-- <p>bumhole</p> -->\n											</li> <!-- container -->\n										{/exp:eventbriteapi:upcomingEvents}\n									</ul>\n\n								</div> <!-- future-events -->\n							\n						</div>\n						\n					</div> <!-- row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}');
INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES
(155, 8, 'exp_templates', 'template_data', 1337366314, 1, '			{exp:channel:entries channel="footer_content" dynamic="no"}\n			\n				<div class="sponsors">\n					<div class="row">\n						<!-- <div class="twelve columns"><img src="/img/sponsors.png" alt="Our Sponsors" /></div> -->\n						\n						<div class="twelve columns">\n							{sponsors}\n								<a href="{exp:valid_url}{url}{/exp:valid_url}" target="_blank" >\n									<img src="{logo}" alt="{name}" />\n								</a>\n							{/sponsors}\n						</div>\n							\n						\n					</div>\n				</div>\n		\n				<div id="footer">\n			\n					<div class="row">\n						<div class="three columns">\n							<h3>Find Us</h3>\n							<div class="container">\n								<img class="map" src="/img/map.png" />\n							</div>\n						</div>\n						<div class="three columns">\n							<h3>Get in touch</h3>\n							<div class="container">\n								<p>{footer_address}</p><p>{footer_phone_number}<br /><a href="mailto:{footer_email}">{footer_email}</a></p>\n							</div>\n						</div>\n						\n						<div class="three columns networks">\n							<h3>Networks</h3>\n							<div class="container">\n								<ul>\n									{if footer_twitter != ""}\n										<li><a href="{exp:valid_url}{footer_twitter}{/exp:valid_url}" target="_blank" ><img src="/img/twitter.png" />Twitter</a></li>\n									{/if}\n									\n									{if footer_facebook != ""}\n										<li><a href="{exp:valid_url}{footer_facebook}{/exp:valid_url}" target="_blank" ><img src="/img/facebook.png" />Facebook</a></li>\n									{/if}\n									\n									{if footer_linkedin != ""}\n										<li><a href="{exp:valid_url}{footer_linkedin}{/exp:valid_url}" target="_blank" ><img src="/img/linkedin.png" />LinkedIn</a></li>\n									{/if}\n									\n								</ul>\n							</div>\n						</div>\n						<div class="three columns feedback">\n							<h3>Feedback</h3>\n							<div class="container">\n								<p>We’re always looking to improve what we do. If you have feedback we''d love to hear from you!</p>\n								<a href="{path=''contact-us''}" class="medium radius black button black-gradient">Get in touch</a>\n							</div>\n						</div>\n					</div>	\n				\n				\n				</div> <!-- .footer -->\n				\n				</div> <!-- #background -->\n		</div> <!-- #top-background -->\n\n{/exp:channel:entries}\n\n	<!-- Included JS Files -->\n	\n	<!-- JQuery -->\n	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	\n  	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>\n\n	<script src="/javascripts/jquery.customforms.js"></script>\n	<script src="/javascripts/jquery.placeholder.min.js"></script>\n\n	<!-- End Combine and Compress These JS Files -->\n	\n	<!-- Form validation -->\n	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js"></script>	\n	\n	<script type="text/javascript">\n		$().ready(function() {\n			// validate the comment form when it is submitted\n			$(".validatingForm").validate();\n		});\n	</script>\n	\n	<script src="/javascripts/app.js"></script>\n	\n	<!-- JQuery Lightbox -->\n	<script type="text/javascript" src="/javascripts/jquery.lightbox-0.5.js"></script>\n	<script type="text/javascript">\n		$(function() {\n			$(''.gallery a'').lightBox(); // Select all links in object with gallery ID\n		});\n	</script>\n	\n	<!-- Live Reload -->	\n	{if global:env != "prod"}\n		<script>document.write(''<script src="http://'' + (location.host || ''localhost'').split('':'')[0] + '':35729/livereload.js?snipver=1"></'' + ''script>'')</script>\n	{/if}\n\n	\n</body>\n</html>'),
(156, 7, 'exp_templates', 'template_data', 1337366314, 1, '<!DOCTYPE html>\n\n<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->\n<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->\n<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->\n<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->\n<head>\n	<meta charset="utf-8" />\n\n	<!-- Set the viewport width to device width for mobile -->\n	<meta name="viewport" content="width=device-width" />\n\n	{embed:meta}\n\n	<title>{embed:page_title}</title>\n  \n	<!-- Included CSS Files -->\n	<!-- Combine and Compress These CSS Files -->\n	\n	<link rel="dns-prefetch" href="//ajax.googleapis.com">\n	\n	<link rel="stylesheet" href="/stylesheets/globals.css">\n	<link rel="stylesheet" href="/stylesheets/typography.css">\n	<link rel="stylesheet" href="/stylesheets/grid.css">\n	<link rel="stylesheet" href="/stylesheets/ui.css">\n	<link rel="stylesheet" href="/stylesheets/forms.css">\n	<link rel="stylesheet" href="/stylesheets/reveal.css">\n	<link rel="stylesheet" href="/stylesheets/mobile.css">\n	\n	<!-- favicon -->\n	<link rel="shortcut icon" href="/favicon.ico" />\n\n\n	<!--[if lt IE 9]>\n		<link rel="stylesheet" href="/stylesheets/ie.css">\n	<![endif]-->\n	\n	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.19/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css"/>\n	<link rel="stylesheet" type="text/css" href="/stylesheets/jquery.lightbox-0.5.css"/>\n	<!-- Non framework custom CSS -->\n	<link rel="stylesheet" href="/stylesheets/custom.css">\n	<link rel="stylesheet" href="/stylesheets/thumbnails.css">\n	<link rel="stylesheet" href="/stylesheets/{embed:page}.css">\n	\n	<!-- Google Webfonts -->\n	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Candara">\n	\n	<script src="/javascripts/modernizr.foundation.js"></script>\n		\n	\n	<!-- IE Fix for HTML5 Tags -->\n	<!--[if lt IE 9]>\n		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>\n	<![endif]-->\n	\n\n</head>\n\n<body>\n		\n		<div id="top-background">\n			<div id="background">\n				<div id="header">\n\n					<div class="row" id="branding">\n							<div class="twelve columns">\n									<img src="/img/Logo.png" alt="Mewe Logo" />\n							</div>\n							\n							<ul class="secondary-nav hide-on-phones shadow">\n								{if logged_out}\n									<li><a href="{path=''member/login''}">Login</a></li>\n									<li><a href="/sign-up" class="alternate">Join Up</a></li>\n								{/if}\n								{if logged_in}\n									<li><a href="{path=''logout''}">Logout</a></li>\n								{/if}\n								\n								\n							</ul>\n					</div>\n\n					<div class="row" id="masthead" >\n						<div class="twelve columns" >\n								<ul class="nav-bar hide-on-phones" id="primary-nav">\n									<li {if segment_1 == ''''}class="selected"{if:else}class="main"{/if}><a href="/" class="main"><span>Home</span></a></li>\n									<li {if segment_1 == ''about''}class="selected"{if:else}class="main"{/if}> <a href="about" class="main">About</a></li>\n									<li {if segment_1 == ''incubator''}class="selected"{if:else}class="main"{/if}> <a href="/incubator" class="main">Incubator</a></li>\n									<li {if segment_1 == ''workspace''}class="selected"{if:else}class="main"{/if}> <a href="/workspace" class="main">Workspace</a></li>\n									<li {if segment_1 == ''events''}class="selected"{if:else}class="main"{/if}>  <a href="/events" class="main">Events</a></li>\n									<li {if segment_1 == ''membership''}class="selected"{if:else}class="main"{/if}> <a href="/membership" class="main">Membership</a></li>\n									<li {if segment_1 == ''news'' AND segment_2 == ''''}class="selected"{if:else}class="main"{/if}> <a href="/news" class="main">News</a></li>\n								{if logged_in}\n									<li class="hub has-flyout">\n										<a href="#" class="main">Members</a>\n										<div class="flyout" style="display: none;">\n											<ul>\n												<li><a href="{path=''members''}" class="main">Community</a></li>\n												<li><a href="{path=''members/resources''}" class="main">Resources</a></li>\n												<li><a href="{path=''members/profile''}"class="main">View Profile</a></li>\n												<li><a href="{path=''members/edit_profile''}"class="main">Edit Profile</a></li>\n												<li><a href="{path=''members/edit_account''}"class="main">Account Details</a></li>\n												\n											</ul>\n										</div>\n									</li>\n								{/if}\n								</ul>\n						</div>\n					</div>\n				\n				</div> <!-- #header -->\n\n'),
(157, 62, 'exp_templates', 'template_data', 1337366314, 1, '\n{if logged_in}\n\n	{embed="includes/header" page_title="{exp:user:stats}{screen_name}{/exp:user:stats}"}\n\n\n	<div class="container public-profile"> \n\n		<div class="row">\n	\n			<div class="eight columns main-profile">\n		\n			{exp:user:stats}\n			<!-- Get member ID from the url segment -->\n		\n			<!-- Only show profiles for member sin the ''members'' group  (5)-->\n			{if group_id !=5 } \n				{redirect="404"} \n			{/if}\n		\n				<!-- Members profile picture and name -->\n				<div class="row">\n					<div class="six columns">\n						<div class="frame">\n							<!-- if photo -->\n							{if photo_filename != ""}\n									\n									{exp:ce_img:pair:member-photo src="{photo_url}{photo_filename}" max="250" crop="yes" allow_scale_larger="yes"}\n										<img src="{member-photo:made}" id="photo"/>\n									{/exp:ce_img:pair:member-photo}\n\n							{if:else}\n								<img src="/img/default_user_photo_small.png"/>\n							{/if}\n						</div>\n					</div>\n\n				\n					<div class="six columns">\n						<h1>{screen_name}</h1>\n						<p class="creative-sector">{creative_sector}</p>\n					</div>\n				</div> <!-- row -->\n				\n				<!-- About Me and other information -->\n				<div class="row">\n\n					<div class="twelve columns">\n					\n						<!-- network icons -->\n\n							<div class="row">\n									<div class="twelve columns">\n											{if facebook != ""}\n												<a href="{exp:valid_url}{facebook}{/exp:valid_url}" target="_blank" ><img src="/img/facebook.png" alt="facebook logo"/></a>\n											{/if}\n							\n											{if twitter != ""}\n												<a href="{exp:valid_url}{twitter}{/exp:valid_url}" target="_blank" ><img src="/img/twitter.png" alt="twitter logo"/></a>\n											{/if}\n							\n											{if linkedin != ""}\n												<a href="{exp:valid_url}{linkedin}{/exp:valid_url}" target="_blank" ><img src="/img/linkedin.png" alt="linked in logo"/></a>\n											{/if}\n									</div> <!-- columns -->\n							</div> <!-- row -->\n\n					\n				\n						<h3>About me</h3>\n						<p>{bio}</p>\n\n						<h3>Current projects</h3>\n						<p>{current_projects}</p>									\n\n					\n					\n					</div> <!-- columns -->\n\n				</div> <!-- row -->\n				\n				\n			</div> <!-- columns -->		\n										\n\n			<div class="four columns">	\n				<div class="inset rounded sidebar">\n					{if avatar_filename != "" }\n\n					{exp:ce_img:pair:avatar src="{avatar_url}{avatar_filename}" max="100" allow_scale_larger="yes" crop="yes"}\n						<img src="{avatar:made}" class="member-logo"/>\n					{/exp:ce_img:pair:avatar}\n	\n\n					{if:else}\n						<img src="http://placehold.it/100x100" class="member-logo" />\n					{/if}\n					<h3 class="company-name">{company_name}</h3>\n					<p class="contact-details">\n						{if company_address != ""}\n							{company_address}<br />\n						{/if}\n					\n						{email}</br />\n					\n						{if company_phone != ""}\n							{company_phone}<br />\n						{/if}\n					\n						{if url != ""}\n							<a href="{exp:valid_url}{url}{/exp:valid_url}" target="_blank" >{url}</a><br />\n						{/if}\n					</p>\n				\n					{if company_description != ""}\n						<h2>Business description</h2>\n						<p>{company_description}</p>\n					{/if}\n				\n					{if skills != ""}\n						<h2>Skills</h2>\n						<p>{skills}</p>\n					{/if}\n				\n					{if experience != ""}\n						<h2>Experience</h2>\n						<p>{experience}</p>\n					{/if}\n											\n				</div>\n\n			</div> <!-- columns -->\n			\n\n		</div> <!-- .row -->\n	\n\n	{/exp:user:stats}\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n	\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n\n'),
(158, 66, 'exp_templates', 'template_data', 1337366314, 1, '{if logged_in}\n\n	{embed="includes/header"}\n\n	<div class="container"> \n		\n		<div class="row">\n	\n			{exp:channel:entries channel="resources"}\n			\n				<table>\n					\n					{resources_list}\n						<tr>\n							<td>\n								<h3>{name}</h3>\n								<p>{description}</p>\n								<p><a href="{url}" target="_blank">{exp:valid_url}{url}{/exp:valid_url}</a></p>\n							</td>\n							<td>\n								{if file != ""}\n									<a href="{file}" target="_blank"><img src="/img/file-icon.png" style="max-width:50%"/></a>\n								{/if}\n							</td>\n						</tr>\n					{/resources_list}\n				\n				</table>\n			\n			{/exp:channel:entries}\n\n		</div> <!-- .row -->\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n	\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n\n'),
(159, 16, 'exp_templates', 'template_data', 1337366314, 1, '{embed="includes/header" page="{segment_1}" page_title="Membership tiers, pricing and FAQ - {company_name}"}\n	\n			\n				<div class="container"> \n				\n					<div class="row centered">\n						<div class="twelve columns">\n							{exp:channel:entries channel="membership"}\n							\n							 	<h1>{membership_headline}</h1>\n							\n								{if special_offer_visible != ""}			\n									<div class="banner inset rounded shadow">\n										<h2>{membership_banner}</h2>\n									</div> <!-- .banner --> \n								{/if}\n								\n							{/exp:channel:entries}\n							\n						</div>\n					</div> <!-- row -->\n					\n					\n					<div class="row services membership-tiers">\n					\n					{exp:channel:entries channel="membership" limit="3"}\n						{membership_tiers}\n							<div class="third columns">\n								<div class="service rounded inset">\n										<h2>{membership_tier_name}</h2>\n										<div class="bubble rounded">\n											<div>\n												<span class="contract-length">{membership_primary_description}</span><br />\n												<span class="price">{membership_primary_price}/</span><span class="payment-period">{membership_primary_period}</span></div>\n\n										</div>\n										<div class="bubble secondary-offer rounded ">\n											<div>\n												<span class="contract-length">{membership_secondary_description}</span><br />\n												{if membership_secondary_price !=""}\n													<span class="price">{membership_secondary_price}/</span><span class="payment-period">{membership_secondary_period}</span></div>\n												{if:else}\n													<span class="payment-period">N/A</span></div>\n												{/if}\n\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_1}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_2}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_3}\n										</div>\n										\n										{if membership_differentiator != ""}\n											<div class="bubble differentiator rounded">\n												{membership_differentiator}\n											</div>\n										{/if}\n			\n										<a href="/sign-up" class="large button radius black-gradient"><span>Sign up today</span></a>\n										\n								</div> <!-- panel -->\n								\n							</div>\n						{/membership_tiers}\n					{/exp:channel:entries}	\n					\n				\n					</div><!-- #services-->\n					\n					<hr class="divider"/>\n					\n					<div class="row">\n						<div class="eight columns faq-section">\n							<h2>Frequently asked questions</h2>\n						\n						{exp:channel:entries channel="membership"}	\n							{faq}\n								<div class="question-and-answer">\n									<p class="question">{question}</p>\n									<p class="answer">{answer} {if file != ""}<a href="{file}" class="file-icon" target="_blank"><img src="/img/file-icon-small.png" /></a>{/if}</p>\n								</div>\n							{/faq}\n						{/exp:channel:entries}\n							\n						</div><!-- columns -->\n							\n						<div class="four columns">\n							<div class="service rounded top-ups">\n								<h2>Top-ups and Extras</h2>\n								{exp:channel:entries channel="membership" backspace="6"}\n									{topups_and_extras}\n										<h3>{title}</h3>\n										{copy}\n										<hr />{/topups_and_extras}{/exp:channel:entries}\n								\n							</div>\n						</div><!-- columns -->\n						\n					</div> <!-- Row -->\n					\n\n				</div> <!-- container -->\n				\n	\n{embed="includes/footer"}'),
(160, 8, 'exp_templates', 'template_data', 1337601146, 1, '			{exp:channel:entries channel="footer_content" dynamic="no"}\n			\n				<div class="sponsors">\n					<div class="row">\n						<!-- <div class="twelve columns"><img src="/img/sponsors.png" alt="Our Sponsors" /></div> -->\n						\n						<div class="twelve columns">\n							{sponsors}\n								<a href="{exp:valid_url}{url}{/exp:valid_url}" target="_blank" >\n									<img src="{logo}" alt="{name}" />\n								</a>\n							{/sponsors}\n						</div>\n							\n						\n					</div>\n				</div>\n		\n				<div id="footer">\n			\n					<div class="row">\n						<div class="three columns">\n							<h3>Find Us</h3>\n							<div class="container">\n								{footer_map_image}\n									<a href="{exp:valid_url}{map_link}{/exp:valid_url}" _target="blank" ><img class="map" src="{image}" alt="Map showing MeWe location" /></a>\n								{/footer_map_image}\n							</div>\n						</div>\n						<div class="three columns">\n							<h3>Get in touch</h3>\n							<div class="container">\n								<p>{footer_address}</p><p>{footer_phone_number}<br /><a href="mailto:{footer_email}">{footer_email}</a></p>\n							</div>\n						</div>\n						\n						<div class="three columns networks">\n							<h3>Networks</h3>\n							<div class="container">\n								<ul>\n									{if footer_twitter != ""}\n										<li><a href="{exp:valid_url}{footer_twitter}{/exp:valid_url}" target="_blank" ><img src="/img/twitter.png" />Twitter</a></li>\n									{/if}\n									\n									{if footer_facebook != ""}\n										<li><a href="{exp:valid_url}{footer_facebook}{/exp:valid_url}" target="_blank" ><img src="/img/facebook.png" />Facebook</a></li>\n									{/if}\n									\n									{if footer_linkedin != ""}\n										<li><a href="{exp:valid_url}{footer_linkedin}{/exp:valid_url}" target="_blank" ><img src="/img/linkedin.png" />LinkedIn</a></li>\n									{/if}\n									\n								</ul>\n							</div>\n						</div>\n						<div class="three columns feedback">\n							<h3>Feedback</h3>\n							<div class="container">\n								<p>We’re always looking to improve what we do. If you have feedback we''d love to hear from you!</p>\n								<a href="{path=''contact-us''}" class="medium radius black button black-gradient">Get in touch</a>\n							</div>\n						</div>\n					</div>\n						\n					<div class="row"> <!-- Company registration info -->\n						<div class="twelve">\n							<p class="company-info">{company_info}</p>\n						</div>\n					</div> <!-- /row -->\n				\n				\n				</div> <!-- .footer -->\n				\n				</div> <!-- #background -->\n		</div> <!-- #top-background -->\n\n{/exp:channel:entries}\n\n	<!-- Included JS Files -->\n	\n	<!-- JQuery -->\n	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	\n  	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>\n\n	<script src="/javascripts/jquery.customforms.js"></script>\n	<script src="/javascripts/jquery.placeholder.min.js"></script>\n\n	<!-- End Combine and Compress These JS Files -->\n	\n	<!-- Form validation -->\n	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js"></script>	\n	\n	<script type="text/javascript">\n		$().ready(function() {\n			// validate the comment form when it is submitted\n			$(".validatingForm").validate();\n		});\n	</script>\n	\n	<script src="/javascripts/app.js"></script>\n	\n	<!-- JQuery Lightbox -->\n	<script type="text/javascript" src="/javascripts/jquery.lightbox-0.5.js"></script>\n	<script type="text/javascript">\n		$(function() {\n			$(''.gallery a'').lightBox(); // Select all links in object with gallery ID\n		});\n	</script>\n	\n	<!-- Live Reload -->	\n	{if global:env != "prod"}\n		<script>document.write(''<script src="http://'' + (location.host || ''localhost'').split('':'')[0] + '':35729/livereload.js?snipver=1"></'' + ''script>'')</script>\n	{/if}\n\n	\n</body>\n</html>'),
(161, 7, 'exp_templates', 'template_data', 1337601146, 1, '<!DOCTYPE html>\n\n<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->\n<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->\n<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->\n<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->\n<head>\n	<meta charset="utf-8" />\n\n	<!-- Set the viewport width to device width for mobile -->\n	<meta name="viewport" content="width=device-width" />\n\n	{embed:meta}\n\n	<title>{embed:page_title}</title>\n  \n	<!-- Included CSS Files -->\n	<!-- Combine and Compress These CSS Files -->\n	\n	<link rel="dns-prefetch" href="//ajax.googleapis.com">\n	\n	<link rel="stylesheet" href="/stylesheets/globals.css">\n	<link rel="stylesheet" href="/stylesheets/typography.css">\n	<link rel="stylesheet" href="/stylesheets/grid.css">\n	<link rel="stylesheet" href="/stylesheets/ui.css">\n	<link rel="stylesheet" href="/stylesheets/forms.css">\n	<link rel="stylesheet" href="/stylesheets/reveal.css">\n	<link rel="stylesheet" href="/stylesheets/mobile.css">\n	\n	<!-- favicon -->\n	<link rel="shortcut icon" href="/favicon.ico" />\n\n\n	<!--[if lt IE 9]>\n		<link rel="stylesheet" href="/stylesheets/ie.css">\n	<![endif]-->\n	\n	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.19/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css"/>\n	<link rel="stylesheet" type="text/css" href="/stylesheets/jquery.lightbox-0.5.css"/>\n	<!-- Non framework custom CSS -->\n	<link rel="stylesheet" href="/stylesheets/custom.css">\n	<link rel="stylesheet" href="/stylesheets/thumbnails.css">\n	<link rel="stylesheet" href="/stylesheets/{embed:page}.css">\n	\n	<!-- Google Webfonts -->\n	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Candara">\n	\n	<script src="/javascripts/modernizr.foundation.js"></script>\n		\n	\n	<!-- IE Fix for HTML5 Tags -->\n	<!--[if lt IE 9]>\n		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>\n	<![endif]-->\n	\n	<!-- Google Analyitcs Code -->\n	\n	<script type="text/javascript">\n\n	  var _gaq = _gaq || [];\n	  _gaq.push([''_setAccount'', ''UA-31926599-1'']);\n	  _gaq.push([''_trackPageview'']);\n\n	  (function() {\n	    var ga = document.createElement(''script''); ga.type = ''text/javascript''; ga.async = true;\n	    ga.src = (''https:'' == document.location.protocol ? ''https://ssl'' : ''http://www'') + ''.google-analytics.com/ga.js'';\n	    var s = document.getElementsByTagName(''script'')[0]; s.parentNode.insertBefore(ga, s);\n	  })();\n\n	</script>\n\n</head>\n\n<body>\n		\n		<div id="top-background">\n			<div id="background">\n				<div id="header">\n\n					<div class="row" id="branding">\n							<div class="twelve columns">\n									<img src="/img/Logo.png" alt="Mewe Logo" />\n							</div>\n							\n							<ul class="secondary-nav hide-on-phones shadow">\n								{if logged_out}\n									<li><a href="{path=''member/login''}">Login</a></li>\n									<li><a href="/sign-up" class="alternate">Join Up</a></li>\n								{/if}\n								{if logged_in}\n									<li><a href="{path=''logout''}">Logout</a></li>\n								{/if}\n								\n								\n							</ul>\n					</div>\n\n					<div class="row" id="masthead" >\n						<div class="twelve columns" >\n								<ul class="nav-bar hide-on-phones" id="primary-nav">\n									<li {if segment_1 == ''''}class="selected"{if:else}class="main"{/if}><a href="/" class="main"><span>Home</span></a></li>\n									<li {if segment_1 == ''about''}class="selected"{if:else}class="main"{/if}> <a href="about" class="main">About</a></li>\n									<li {if segment_1 == ''incubator''}class="selected"{if:else}class="main"{/if}> <a href="/incubator" class="main">Incubator</a></li>\n									<li {if segment_1 == ''workspace''}class="selected"{if:else}class="main"{/if}> <a href="/workspace" class="main">Workspace</a></li>\n									<li {if segment_1 == ''events''}class="selected"{if:else}class="main"{/if}>  <a href="/events" class="main">Events</a></li>\n									<li {if segment_1 == ''membership''}class="selected"{if:else}class="main"{/if}> <a href="/membership" class="main">Membership</a></li>\n									<li {if segment_1 == ''news'' AND segment_2 == ''''}class="selected"{if:else}class="main"{/if}> <a href="/news" class="main">News</a></li>\n								{if logged_in}\n									<li class="hub has-flyout">\n										<a href="#" class="main">Members</a>\n										<div class="flyout" style="display: none;">\n											<ul>\n												<li><a href="{path=''members''}" class="main">Community</a></li>\n												<li><a href="{path=''members/resources''}" class="main">Resources</a></li>\n												<li><a href="{path=''members/profile''}"class="main">View Profile</a></li>\n												<li><a href="{path=''members/edit_profile''}"class="main">Edit Profile</a></li>\n												<li><a href="{path=''members/edit_account''}"class="main">Account Details</a></li>\n												\n											</ul>\n										</div>\n									</li>\n								{/if}\n								</ul>\n						</div>\n					</div>\n				\n				</div> <!-- #header -->\n\n'),
(162, 20, 'exp_templates', 'template_data', 1337601146, 1, '{embed="includes/header" page="{segment_1}" page_title="Sign up or find out more - {company_name}}\n			\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							<h1>Interested in joining up or finding out about special offers and upcoming events? Fill in your details and we’ll keep you in the loop.</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">	\n						\n							{exp:freeform:form \n								form:class="nice custom validatingForm"\n								collection="Sign Up"\n								return="/thankyou"\n								notify="{global:contact_email}"\n								send_user_email="yes"\n								template="mewe_notification_template" \n								user_email_template="mewe_template"\n								}\n							\n								<div class="row">\n									<div class="six columns">	\n										<label for="first_name">Name *</label>\n										<input id="first_name" name="first_name" class="input-text required" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="last_name">Surname *</label>\n										<input id="last_name" name="last_name" class="input-text required" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->\n							\n								<div class="row">\n									<div class="twelve columns">\n											<label for="email">Email *</label>\n											<input id="email" name="email" class="input-text required email" type="text">\n									</div>\n								</div>	\n													\n								<div class="row">\n									<div class="six columns">	\n										<label for="phone_number">Phone number</label>\n										<input id="phone_number" name="phone_number" class="input-text" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="postcode">Postcode</label>\n										<input id="postcode" name="postcode" class="input-text" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->		\n						\n								<div class="row">\n									<div class="twelve columns">\n									\n										<label for="creative_insutry">What creative industry are you in?</label>\n										<select style="display:none;" id="creative_insutry" name="creative_industry" class="expand">\n										  	<option>Design</option>\n										  	<option>New Media</option>\n											<option>Television</option>\n										  	<option>Writing</option>\n											<option>Music</option>\n											<option>Other\n												</option>\n										</select>\n										\n										\n									\n										<label for="membership_type">What type of membership are you interested in?</label>\n										<select style="display:none;" id="membership_type" name="membership_type" class="expand">\n										  	<option>Network</option>\n											<option>Hub</option>\n										  	<option>Incubator</option>\n											<option>Just events</option>\n										  	<option>Not sure</option>	\n										</select>\n										\n										<label for="business_stage">What stage of development is your business/project at?</label>\n										<select style="display:none;" id="business_stage" name="business_stage" class="expand">\n											<option>Pre start-up / concept development</option>\n											<option>Start-up</option>\n										  	<option>Established over 1 year</option>\n										</select>										\n									\n									</div>	<!-- columns -->\n								</div> <!-- row -->\n							\n								<div class="row submit-section">\n\n									<div class="six columns">	\n										<input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n										\n									</div><!-- columns -->\n								\n									<div class="six columns terms">\n								            <span id="checkbox"><input id="opt-in" checked="checked" type="checkbox" /></span>\n								            <span id="checkbox-label"><label for="opt-in">Uncheck this box if you don’t want to recieve news about special discounts, upcoming events and more. Don’t worry, we hate spam and we’ll never share your details with anyone else.</label></span>\n									</div><!-- columns -->\n\n								</div><!-- row -->\n							\n							\n							{/exp:freeform:form} <!-- form -->\n										\n						</div> <!-- columns -->\n				\n						\n						<div class="six columns hide-on-phones">\n							<div class="large-image">\n								<img src="/img/membership.png" class="frame" />\n							</div>\n						</div> <!-- columns -->\n								\n							\n	\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n						\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}'),
(163, 8, 'exp_templates', 'template_data', 1337602028, 1, '			{exp:channel:entries channel="footer_content" dynamic="no"}\n			\n				<div class="sponsors">\n					<div class="row">\n						<!-- <div class="twelve columns"><img src="/img/sponsors.png" alt="Our Sponsors" /></div> -->\n						\n						<div class="twelve columns">\n							{sponsors}\n								<a href="{exp:valid_url}{url}{/exp:valid_url}" target="_blank" >\n									<img src="{logo}" alt="{name}" />\n								</a>\n							{/sponsors}\n						</div>\n							\n						\n					</div>\n				</div>\n		\n				<div id="footer">\n			\n					<div class="row">\n						<div class="three columns">\n							<h3>Find Us</h3>\n							<div class="container">\n								{footer_map_image}\n									<a href="{exp:valid_url}{map_link}{/exp:valid_url}" _target="blank" ><img class="map" src="{image}" alt="Map showing MeWe location" /></a>\n								{/footer_map_image}\n							</div>\n						</div>\n						<div class="three columns">\n							<h3>Get in touch</h3>\n							<div class="container">\n								<p>{footer_address}</p><p>{footer_phone_number}<br /><a href="mailto:{footer_email}">{footer_email}</a></p>\n							</div>\n						</div>\n						\n						<div class="three columns networks">\n							<h3>Networks</h3>\n							<div class="container">\n								<ul>\n									{if footer_twitter != ""}\n										<li><a href="{exp:valid_url}{footer_twitter}{/exp:valid_url}" target="_blank" ><img src="/img/twitter.png" />Twitter</a></li>\n									{/if}\n									\n									{if footer_facebook != ""}\n										<li><a href="{exp:valid_url}{footer_facebook}{/exp:valid_url}" target="_blank" ><img src="/img/facebook.png" />Facebook</a></li>\n									{/if}\n									\n									{if footer_linkedin != ""}\n										<li><a href="{exp:valid_url}{footer_linkedin}{/exp:valid_url}" target="_blank" ><img src="/img/linkedin.png" />LinkedIn</a></li>\n									{/if}\n									\n								</ul>\n							</div>\n						</div>\n						<div class="three columns feedback">\n							<h3>Feedback</h3>\n							<div class="container">\n								<p>We’re always looking to improve what we do. If you have feedback we''d love to hear from you!</p>\n								<a href="{path=''contact-us''}" class="medium radius black button black-gradient"><span>Get in touch</span></a>\n							</div>\n						</div>\n					</div>\n						\n					<div class="row"> <!-- Company registration info -->\n						<div class="twelve">\n							<p class="company-info">{company_info}</p>\n						</div>\n					</div> <!-- /row -->\n				\n				\n				</div> <!-- .footer -->\n				\n				</div> <!-- #background -->\n		</div> <!-- #top-background -->\n\n{/exp:channel:entries}\n\n	<!-- Included JS Files -->\n	\n	<!-- JQuery -->\n	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	\n  	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>\n\n	<script src="/javascripts/jquery.customforms.js"></script>\n	<script src="/javascripts/jquery.placeholder.min.js"></script>\n\n	<!-- End Combine and Compress These JS Files -->\n	\n	<!-- Form validation -->\n	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js"></script>	\n	\n	<script type="text/javascript">\n		$().ready(function() {\n			// validate the comment form when it is submitted\n			$(".validatingForm").validate();\n		});\n	</script>\n	\n	<script src="/javascripts/app.js"></script>\n	\n	<!-- JQuery Lightbox -->\n	<script type="text/javascript" src="/javascripts/jquery.lightbox-0.5.js"></script>\n	<script type="text/javascript">\n		$(function() {\n			$(''.gallery a'').lightBox(); // Select all links in object with gallery ID\n		});\n	</script>\n	\n	<!-- Live Reload -->	\n	{if global:env != "prod"}\n		<script>document.write(''<script src="http://'' + (location.host || ''localhost'').split('':'')[0] + '':35729/livereload.js?snipver=1"></'' + ''script>'')</script>\n	{/if}\n\n	\n</body>\n</html>'),
(164, 17, 'exp_templates', 'template_data', 1337784569, 1, '{embed="includes/header" page="{segment_1}" page_title="Events - {company_name}"}\n\n			\n				<div class="container"> \n					\n					<div class="row">\n								\n							\n						{exp:channel:entries channel="events"}\n						\n						<div class="eight columns push-four">\n							<h1>We''d love to see you at one of our events!</h1>\n							<p>MEWE360º hosts a programme of networking and leadership development events designed to inspire, inform and connect our membership. As a member you have access to all events (free or discounted depending on your type of membership). We want to provide a programme that genuinely meets your needs and so are always open to member’s requests and will adapt our programme where necessary.</p>\n							<p>We run \n									{if events_file !=""}\n										<a href="{events_file}" target="_blank">6 different types of events</a>\n									{if:else}\n										6 different types of events\n									{/if}\n									- <strong>Networking Events</strong>, <strong>Networking Plus - The Lab</strong>, <strong>How I did it</strong>, <strong>Pick my brains</strong>, <strong>Workshop/Masterclass</strong> and <strong>Panel Discussions</strong>.\n								\n							<div class="row cta">\n								\n								<div class="eight columns">\n									Become a member to receive free tickets, special discounts and priority access.\n								</div>\n									\n								<div class="four columns">\n									<a href="/sign-up" class="medium black button radius black-gradient"><span>Sign up today</span></a>\n								</div>\n							</div>\n							\n							{/exp:channel:entries}\n		\n							\n						</div> <!-- columns -->\n					\n						<div class="four columns pull-eight">\n						{if "{exp:eventbriteapi:isUpcomingEvent}" == "true"}\n							{exp:eventbriteapi:upcomingEvents limit=''1''}\n								<div class="next-event inset">\n									<div class="date">\n										<span class="month">{month}</span>\n										<span class="day">{day}</span>\n									</div>\n									<h2>Next Event</h2>\n									<div class="container">\n										<h3>{title}</h3>\n										<!-- ><img src="http://lorempixel.com/230/100"> -->\n										{if logoURL != ""}\n											<img src="{logoURL}" />\n										{/if}\n										<p class="time"></p>\n										<p class="event-description">{excerpt}</p>\n										<a href="{url}" class="medium black button radius black-gradient"><span>Find out more</span></a>\n									</div>\n								</div>\n							{/exp:eventbriteapi:upcomingEvents}\n						{/if}\n							\n									\n						</div> <!-- columns -->		\n			\n					</div> <!-- .row -->\n					\n					<div class="row">\n						\n						<div class="eight columns push-four">\n							\n							<div class="past-events">\n								<h2 class="black-header-bar">Past Events</h2>\n								<ul>\n									{exp:channel:entries channel="past_events" orderby="past_event_date" sort="desc"}\n\n										<li class="event-summary accordionButton">\n										<div class="date-box">\n											<p class="month">{past_event_date format="%M"}</p>\n											<p class="day">{past_event_date format="%d"}</p>\n										</div> <!-- date-box -->\n\n										<h3 class="event-title">{title}</h3>\n										<p class="event-description">{past_event_description}</p>\n										<div class="clear"></div>\n									</li>\n\n										<li class="event-content inset accordionContent">\n										<div class="row">\n										\n										<!-- If there isnt a video we want the picture gallery to fill the full space -->	\n										{if past_event_video != "" OR past_event_photo_gallery != ""}\n\n											<div class="seven columns">\n										\n										{if:else}\n												\n											<div class="twelve columns">\n												\n										{/if}\n											\n										{if past_event_photo_gallery != ""}\n											\n												<ul class="block-grid eight-up gallery">\n													\n												{past_event_photo_gallery}\n													<li>														\n															{exp:ce_img:pair:photo src="{image}" max="200" crop="yes" allow_scale_larger="yes"}\n																<a href="{image}"><img src="{photo:made}" alt="Photo of {title}" /></a>\n															{/exp:ce_img:pair:photo}	\n													</li>\n												{/past_event_photo_gallery}\n												\n												<!-- Create placeholder images to fill in any remaining blanks in the gallery grid -->\n												{exp:for_loop start="{past_event_photo_gallery:total_rows}" end="31" increment="1"}\n												\n												<li>\n													<img src="/img/blank-gallery-placeholder.png" /> \n												</li>\n												\n												{/exp:for_loop}\n												\n\n												</ul>									\n\n											</div><!-- columns -->\n											\n										{/if}\n										\n										{if past_event_video != ""}\n										\n											<div class="five columns">\n												<div class="video">\n													{if past_event_video !=""}\n														{exp:antenna url=''{past_event_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false'' max-width="220" max_height="123"}\n															<div class="flex-video widescreen">{embed_code}</div>\n														{/exp:antenna}\n													{if:else}\n														<img src="http://placehold.it/220x123">\n													{/if}\n\n												</div>\n											</div> <!-- columns -->\n										{/if}\n											\n										</div> <!-- row -->\n\n										<div class="row">\n											<div class="twelve columns">\n													<h4>Review</h4>\n													<p>{past_event_review}</p>\n											</div><!-- columns -->\n										</div> <!-- row -->\n\n									</li>\n\n									{/exp:channel:entries}\n\n								</ul>\n\n							</div><!-- past events -->	\n							\n						</div>\n						\n						<div class="four columns pull-eight">\n							\n								<div class="future-events">\n									<h2 class="black-header-bar">Future events</h2>\n									<ul>\n										{exp:eventbriteapi:upcomingEvents}\n											<li class="future-event container">	\n												<h3><a href="{url}">{title}</a></h3>\n												<p class="date">{date}</p>\n												<!-- <p>bumhole</p> -->\n											</li> <!-- container -->\n										{/exp:eventbriteapi:upcomingEvents}\n									</ul>\n\n								</div> <!-- future-events -->\n							\n						</div>\n						\n					</div> <!-- row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_search`
--

CREATE TABLE IF NOT EXISTS `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL default '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY  (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_search_log`
--

CREATE TABLE IF NOT EXISTS `exp_search_log` (
  `id` int(10) NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_security_hashes`
--

CREATE TABLE IF NOT EXISTS `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL auto_increment,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL default '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY  (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8908 ;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES
(8408, 1337597298, '127.0.0.1', '879073141a6d64db92ebe908f4a5b564f94d85ea'),
(8409, 1337597304, '127.0.0.1', 'ead57b40120e8efaf7e2f5834c213f491b74500f'),
(8410, 1337597304, '127.0.0.1', '04027f995e2a9d3bea869de06dc891637aad8d2a'),
(8411, 1337597311, '127.0.0.1', '2388ac5b9f7e5ec5b2dbcccb3fc01e2887f8ce09'),
(8412, 1337597313, '127.0.0.1', '9adf5ccb689d2c0ddd9019e3b623ea0091f95276'),
(8413, 1337597405, '127.0.0.1', 'ea418c23c5eb1262720a7ec063abfe0757af7d79'),
(8414, 1337597873, '127.0.0.1', 'c2ac7b51241e8ebac8ba3f6532d1e1d1d33947ce'),
(8415, 1337597873, '127.0.0.1', '5b1a0e0e943d278f86521b857f9dc50dbb2fd7f0'),
(8416, 1337597879, '127.0.0.1', '1f9acbfd228b476cf0f027b99a8cf9e69b95fe00'),
(8417, 1337597879, '127.0.0.1', '2ec0ff38edbc6ba34ea6014f3ea6808437b1d0cf'),
(8418, 1337598436, '127.0.0.1', '3ab7d32d5b9c474890cd688e1c9166a060556607'),
(8419, 1337599098, '127.0.0.1', '526afb92c9af1001670da945afd1d7502cf09bf6'),
(8420, 1337599103, '127.0.0.1', 'c09e48d5c3a2744e9234f15155a227aef650566a'),
(8421, 1337599108, '127.0.0.1', 'a252d5fcb234876bb70fd91638c18077a93635e7'),
(8422, 1337599228, '127.0.0.1', '7ddf37cc30f2471a7eb1f03cbeb6c3198a1eef85'),
(8423, 1337599229, '127.0.0.1', '5b0c84d228d8980e07974697e801369b94155b51'),
(8424, 1337599235, '127.0.0.1', 'd49b772760307bc122a7b769f82af707fbad1db0'),
(8425, 1337599238, '127.0.0.1', 'af8c3b48ab5ac0b03f5f0cddf0fc2de85642118c'),
(8426, 1337599241, '127.0.0.1', '11f132ea2a84e1d708aaa233f59b9c2537bc3990'),
(8427, 1337599242, '127.0.0.1', 'ecf2f29ce8248c21d4a8c35f8718431bd8bf6986'),
(8428, 1337599243, '127.0.0.1', '615ef8b72d1140c328bea828663ce40ca84f46ef'),
(8429, 1337599280, '127.0.0.1', '7ceccda1e948e02a130922997ce837b03bab1cc7'),
(8430, 1337599281, '127.0.0.1', 'd51a10d578961fa468a030bdffd9658fc282cbc4'),
(8431, 1337599320, '127.0.0.1', '373706e3294a9ae07f4547a5ba35d172afcb7faa'),
(8432, 1337599323, '127.0.0.1', '7f42c486ddf9693f19b2f7e6d73e6a8057f8407d'),
(8433, 1337599331, '127.0.0.1', '7486453b63e4727a65da5f9b6e974a20ac87ed8e'),
(8434, 1337599442, '127.0.0.1', 'eaf073d59dd228b6a72b3c75532b8d0bde5f5baa'),
(8435, 1337599447, '127.0.0.1', '36baf71f80b9d012b4a0763d568e447884fc253c'),
(8436, 1337599449, '127.0.0.1', 'e056715b3e76e60665b41d4474525d33c2c628a7'),
(8437, 1337599450, '127.0.0.1', 'e9f16af697bb0c0ed29940878ba5b4ea3283213e'),
(8438, 1337599450, '127.0.0.1', '1ff40a967f2d99d7a2584f7dcd3facb8f5d7d1c7'),
(8439, 1337599627, '127.0.0.1', '5fce1fdc01a5f8324058092fb52a81fa616d926d'),
(8440, 1337599630, '127.0.0.1', 'ff4c5c1ca53efb076875e858bd5372aa4d43d7f1'),
(8441, 1337599633, '127.0.0.1', '0560630f25e37ee59e7922bedaa0ad4b3f27c88b'),
(8442, 1337599647, '127.0.0.1', '04bc28c381836ff9041a952a374cb9f564831e47'),
(8443, 1337599652, '127.0.0.1', 'f7713dae841916a0ecbb3801bcdbc1a3ec3c0c49'),
(8444, 1337599655, '127.0.0.1', '6ebbad2b481b375ae6a7916e82774daca87aa2dd'),
(8445, 1337599670, '127.0.0.1', '47a58e5c8f209ed80332d11ebf6d3da19fc90714'),
(8446, 1337599670, '127.0.0.1', '53a58acba169b2596ec9e43d2082b42a6332191e'),
(8447, 1337599826, '127.0.0.1', '27463fb4085defba716a66e0c88c39cc848a981a'),
(8448, 1337599829, '127.0.0.1', '8a882907122919f4b16482b3c708d30f7deca5de'),
(8449, 1337599832, '127.0.0.1', '849198d446134024d86f7668396f152771276e15'),
(8450, 1337599875, '127.0.0.1', '0f61aec8b756f6ba2eced9ca713176203e12033d'),
(8451, 1337599876, '127.0.0.1', 'df3db9f17392d5710671afb27780f6e0a5be28d8'),
(8452, 1337599884, '127.0.0.1', 'af571f0cf00bda5b3d40b306932019f92ecdd08b'),
(8453, 1337599887, '127.0.0.1', '8be0fb04d44b1b607a54671382df23bd36a4098e'),
(8454, 1337599888, '127.0.0.1', '1447362b408934aabd44df9ee4b55192320373f0'),
(8455, 1337599889, '127.0.0.1', 'dccbc75f31ac4970d3ea3a00a5b1d2b1cf26940b'),
(8456, 1337599890, '127.0.0.1', '754d1637fa39add6855e514662f268c9e6349c38'),
(8457, 1337600009, '127.0.0.1', '33f1bc8734b4f528583457a778400304fb8b6a7e'),
(8458, 1337600010, '127.0.0.1', '5e04b707c9235c821228ac277d0fac2d390198da'),
(8459, 1337600761, '127.0.0.1', 'b468228d5268f7612692e9c9b92c5a600738fc55'),
(8460, 1337600770, '127.0.0.1', 'c99fab51156614bc47d4d0694d37e502a5c9f9ec'),
(8461, 1337600778, '127.0.0.1', 'eab4132a19c268eefa357ee42ab3484d6eb1f9dd'),
(8462, 1337600792, '127.0.0.1', '2554a01e5c93fac5f82edb3bf6707b516d594b58'),
(8463, 1337600792, '127.0.0.1', '71ab644f15b48785374de41c0ca7ac7bc680cb22'),
(8464, 1337600795, '127.0.0.1', '8afc43e5e0ac5cf47040e502bc6423bf64b085e8'),
(8465, 1337600795, '127.0.0.1', '09e7b3df600ac5cf51e1395da29155733067483b'),
(8466, 1337600798, '127.0.0.1', '7abca79e9e4be6f0fb91628c05a56494b36ccb28'),
(8467, 1337600799, '127.0.0.1', '4a4352bafeda974094838deee8793f0bb643aa74'),
(8468, 1337600851, '127.0.0.1', '64eeee1881b52cc92b80c6174d454a1b024b9e87'),
(8469, 1337600857, '127.0.0.1', '3015bb4ef9b41bd997f94e386ca8c202cadf1955'),
(8470, 1337600883, '127.0.0.1', '0a911f79e8e92700571183d8d3565217f664b3fa'),
(8471, 1337600888, '127.0.0.1', 'b586650aa3b247b2dcffa7a08389e96eb4bff52e'),
(8472, 1337600889, '127.0.0.1', '870d1aa5f32729802cad19cdaa92d984b6d65ee6'),
(8473, 1337600968, '127.0.0.1', '3a14ba4efc9e4982bafa599e203e307298ac8bbc'),
(8474, 1337600973, '127.0.0.1', 'cc3f2585e65b87aa583395badf7cba8b260a9ede'),
(8475, 1337600978, '127.0.0.1', 'dc1e9df8756c4598729f5facc9536b057a1476a5'),
(8476, 1337600978, '127.0.0.1', 'd385b6a64aee21d0fe07a779cf3e31f7d7d8aa5f'),
(8477, 1337600981, '127.0.0.1', 'acf3368fdf33b78a984b84f3fd2153bbbe0de373'),
(8478, 1337600981, '127.0.0.1', 'd24cb96613d08df32fddce373278efc01fe08b12'),
(8479, 1337601133, '127.0.0.1', 'c30e9671c68625059c69030b76d8a3d5526a315a'),
(8480, 1337601138, '127.0.0.1', '0c8bcd7544d597dbbfde4bf569f2b426e0b9272d'),
(8481, 1337601142, '127.0.0.1', '6ea9a4921a7bb6dff4b5b0cdec4709f9adc8a24a'),
(8482, 1337601146, '127.0.0.1', '06c0cb4d82edc16bcce87171a8be7db2f56c44cc'),
(8483, 1337601147, '127.0.0.1', '98ad4dcce233712fa493a8088d5ae5f10461d632'),
(8484, 1337601152, '127.0.0.1', '89dd7251468c3b6e067441581ae55d6eb9ac518e'),
(8485, 1337601153, '127.0.0.1', 'a0cee04f7d6773c13291926af442e26f163325f4'),
(8486, 1337601156, '127.0.0.1', 'f415c43d68d181121ca688ac0bb0aac754cc2011'),
(8487, 1337601158, '127.0.0.1', 'ec378e15f7862da9e43eb503e58faa717338beae'),
(8488, 1337601163, '127.0.0.1', '44b317ee8cdfbe7f5905db260f8e2a558a641566'),
(8489, 1337601164, '127.0.0.1', '5b042136db82c59e61581aaae847b6f12b230034'),
(8490, 1337601168, '127.0.0.1', '87759258aed9d4929c3241dc6be34529aa4bc7cd'),
(8814, 1337774635, '86.13.126.103', 'e4db27e3feff846ffa2bc9d100cd2dfe60a9c2d3'),
(8815, 1337774637, '86.13.126.103', 'a4502a4bef944305d975e409d6c1eae7f8461450'),
(8816, 1337774638, '86.13.126.103', '46292a93b82d5f745ac2cd4e0692db4f92c020fe'),
(8817, 1337774642, '86.13.126.103', '2062a487c6aee2a4f24bc17f58a9699d43669912'),
(8818, 1337774644, '86.13.126.103', 'd975362dec877042207a150862aa34cacb7e16a8'),
(8819, 1337774645, '86.13.126.103', '044ff1521012ccc6be7b7478a13eca7f621a240b'),
(8820, 1337774648, '86.13.126.103', 'cdc9a9878b8bc8d71106905087201abb822843c7'),
(8821, 1337775020, '86.13.126.103', '59216c978583f085a3a70c9513b6acb56271540e'),
(8822, 1337775313, '86.13.126.103', 'ef0c605fea0394f51bbae720ef5830c587fd4ab1'),
(8823, 1337775523, '86.13.126.103', '738a4fb3f41558eeec3b496889689c01f0e77e30'),
(8824, 1337775524, '86.13.126.103', 'b6553ebbf2d633ba4737ffcaedf52df9428274a0'),
(8825, 1337775560, '88.97.10.145', '6d0196e29f02398fd9d8b52d26ff40ca49b3069a'),
(8826, 1337775566, '86.13.126.103', 'e981191e90cda821070e9a8038327b854c3df69c'),
(8827, 1337775568, '92.234.35.3', 'f192e87ffb3cfa613b1d1a8fdcc4da1455d26e28'),
(8828, 1337775569, '86.13.126.103', '9cf0c2a2d5765b738d01a0ac8facd2d8dd823697'),
(8829, 1337775578, '86.13.126.103', '76147ab688f2cbe04bb1e3943078929dfb5185f6'),
(8830, 1337775588, '86.13.126.103', '647b0b661135af7c65f281760c03d903d41273f9'),
(8831, 1337775630, '86.13.126.103', 'e17845d3177234e3047f296061dc94e6c7b15769'),
(8832, 1337775630, '86.13.126.103', '8d677b61c416d7470c73a0bc5e89a9c61a9da77e'),
(8833, 1337775644, '86.13.126.103', '43e4a0bfa2b5d72578cdb2a4fb45b0468d36bc8c'),
(8834, 1337775646, '86.13.126.103', '42f79f9203c79448ae6ad10cb85524b3f9acd692'),
(8835, 1337775654, '86.13.126.103', '685c2f8f550f8342f8420b568297bbe8ba8953f7'),
(8836, 1337776374, '92.234.35.3', '1ecbb4d7c001c717b11340454e10b4c98593ae47'),
(8837, 1337776443, '86.13.126.103', 'e282344d31bd0a00a6b6b7360887f446143ceeaa'),
(8838, 1337776448, '86.13.126.103', '15f8a227547b1700cee3dced2374ef0888e7f9c4'),
(8839, 1337776461, '86.13.126.103', '57b86abeed56dda99010ea9b85eb73f679a9db6b'),
(8840, 1337776464, '86.13.126.103', 'f611c1116c282d5898bb80442d15691a6c589aea'),
(8841, 1337781511, '86.13.126.103', 'cf59135f615cb00a77785839ce22590509fc709d'),
(8842, 1337781513, '86.13.126.103', 'a2531cce8dc1f6dcca79b0b69188df38eabf63a0'),
(8843, 1337781796, '86.13.126.103', 'df05a991ea3af11f00dcdf498a7e3f532016b534'),
(8844, 1337781826, '86.13.126.103', '81cbee824eec675b312322b76d1f023cd46b31cf'),
(8845, 1337782091, '86.13.126.103', '82ed13603367eb0539669fd8207635213abc1e92'),
(8846, 1337782092, '86.13.126.103', '85c10789cf9b6e49e47250d3ee49c2f07f1a7f36'),
(8847, 1337782092, '86.13.126.103', 'ab5237001868fced5ac95efdc063c00e8fd47c78'),
(8848, 1337782092, '86.13.126.103', '115c3cf4bef7099c1750b91ddf2280b20d497354'),
(8849, 1337782093, '86.13.126.103', 'a59f74e49017be0b44d6aab81f6ae5e73249d47b'),
(8850, 1337782097, '86.13.126.103', 'af4cdc13c3213f5cffc7fc75a1043c7c62d3e974'),
(8851, 1337782098, '86.13.126.103', '2a330b796c1774e56063342cc6463ddc754de55a'),
(8852, 1337782102, '86.13.126.103', '8bc44762a8d34bf092123fe6cf073b76bc03bd44'),
(8853, 1337782104, '86.13.126.103', 'b224b708314c53261f3d1e3840421d5f6b366d03'),
(8854, 1337782138, '86.13.126.103', 'e35b36399f11bcf8fb64041dae831c610bef7c02'),
(8855, 1337782156, '86.13.126.103', 'f2a9a1134c5c8f6548f4f40dac75d261916ff011'),
(8856, 1337782156, '86.13.126.103', 'ac5d969565dd9ac9068f89c4feb874922cca2e05'),
(8857, 1337782162, '86.13.126.103', '2406b288ea5de22d8f00fe2c8a8dc160214a9588'),
(8858, 1337782169, '86.13.126.103', '272bf3e0c23cf8721ce5f1f7b4df41ae0ebd528f'),
(8859, 1337782172, '86.13.126.103', 'eac7667a4c28adabd3ec796e1519ca6a8e8a5adc'),
(8860, 1337782173, '86.13.126.103', 'c8408acd002f1eb00471c39dcbec87d31d8b991b'),
(8861, 1337783081, '86.13.126.103', '8f073dc70eea0d51268ba767175802ce2db4c0c8'),
(8862, 1337783084, '86.13.126.103', 'e86808832618b727ac3a30fefadbaf4830552bde'),
(8863, 1337784552, '86.13.126.103', '8dbf9443cb73bb312cd12252bd9ca8f7eb04c6e2'),
(8864, 1337784557, '86.13.126.103', 'c7be8d0b6e5fe2f42ed34e968c02469fb9043d30'),
(8865, 1337784563, '86.13.126.103', '914646ae60a55efdf776ab7abe98784fc54a4a0b'),
(8866, 1337784569, '86.13.126.103', '4f4740e63f65f2e7dddef53185071f4c39150190'),
(8867, 1337784569, '86.13.126.103', 'a119068963f6e9091611a6e82f013f9ff195f412'),
(8868, 1337784577, '86.13.126.103', 'e99a76327dd0a1244b37c0cba1d3f1f22bea8099'),
(8869, 1337784580, '86.13.126.103', 'b4414dfd14de850e93de4ae1ab8ff7bb55e0594c'),
(8870, 1337784583, '86.13.126.103', 'b951c4ec99df51e95eaa90579b98eda6dc546977'),
(8871, 1337784583, '86.13.126.103', 'e26cc2f7773607a265f57307792aa09134ff7bfe'),
(8872, 1337786151, '86.13.126.103', '853d319f52314b6bd7217c285712fb680b2cd860'),
(8873, 1337786156, '86.13.126.103', '140b251e3cd07b2fd5c0999a9fd95ac2b9778fc1'),
(8874, 1337787467, '88.97.10.145', '6d6e00d20db740eeaa2b4148b3ae75fd0c2f1b2c'),
(8875, 1337787469, '88.97.10.145', '158fd8146b7fc1b3dd39a96cbc4cc9db23206677'),
(8876, 1337787470, '88.97.10.145', 'f83a63131f646988dcf1e665f634e67fb9cf00e9'),
(8877, 1337787476, '88.97.10.145', '174d5d1e931aff7f3438be0d56ff760c9b1b0592'),
(8878, 1337787478, '88.97.10.145', 'a601a3ea5202ce511a27dca833a51d988fb58d15'),
(8879, 1337787478, '88.97.10.145', '050f2aba0bd8fc0a600e4b8958617ca3ad84c3b8'),
(8880, 1337787521, '88.97.10.145', 'e4955ae83e0818936892d8aea2001156e865a2c2'),
(8881, 1337787524, '88.97.10.145', '08a1a66f30ba8eabba73fc2dc9b8d00ad80ff3c1'),
(8882, 1337787534, '88.97.10.145', 'e593701541cdaa10e438ccbb0bf38a1d98bf6a17'),
(8883, 1337787538, '88.97.10.145', '9a2dc967e4c885f12bff467fa2e55a680aae700c'),
(8884, 1337787538, '88.97.10.145', '92b621d9c8838f0cf342d82239809025efc788d7'),
(8885, 1337787540, '88.97.10.145', '4448d1b92845c46a5dd3a5fc2bb2d7b9b85f0c26'),
(8886, 1337787540, '88.97.10.145', '1172890dfe831b940b821360edb59b08a81d7d80'),
(8887, 1337787581, '88.97.10.145', '59abca4030cabc0ec48c72fc652d1154ac74552c'),
(8888, 1337788893, '86.13.126.103', '02ec509825427e7760274f3a33c590a85ce15a49'),
(8889, 1337788896, '86.13.126.103', 'ef760526797f1254c22e96c7903a77a226855552'),
(8890, 1337788907, '86.13.126.103', '08331c7ce5896cfc2874006cd49795c1a43e23c7'),
(8891, 1337788935, '86.13.126.103', '323e67e73f29e8ad0f782a86daa19336d0a55e85'),
(8892, 1337788936, '86.13.126.103', '319e1226a6af849798f336c2d9fed9c865fe3692'),
(8893, 1337788940, '86.13.126.103', '0c360e1a370a6d4a32dc45446db60d8833d8fa01'),
(8894, 1337788992, '86.13.126.103', 'a274e25eaa104f7ba3bc0e5d14101d42c97b6360'),
(8895, 1337788993, '86.13.126.103', '2f8b8393bb013d301d0e834f194941c827ae042d'),
(8896, 1337789012, '86.13.126.103', '0579c149a7d10c801288185b7d853b94c6cf87f3'),
(8897, 1337789017, '86.13.126.103', '96d6f9e84e36bf867918aa08dc2a816e3315f46e'),
(8898, 1337789019, '86.13.126.103', 'bfe30f164cb70f772d55b37fe3c5878240355ef4'),
(8899, 1337789020, '86.13.126.103', 'd729624ed88d858c597c3f385b103ac5e04524f6'),
(8900, 1337789020, '86.13.126.103', 'b207e3e840a608acc0762fa1e418c63fcfd8366a'),
(8901, 1337789020, '86.13.126.103', '4c82a2d5659c4217b693950f09d1c2a55c344a47'),
(8902, 1337789024, '86.13.126.103', '74500b4f2e5330e1d15aa18087449e73eb3ccb57'),
(8903, 1337789026, '86.13.126.103', 'af261a656132e0da8e2d0301788c8b7319623b12'),
(8904, 1337789026, '86.13.126.103', '21eeddca33ba7166b589c56ddafa3823496c54dd'),
(8905, 1337789029, '86.13.126.103', '959f60e8f1e2ae388ca4cc50cd979083f5f84cc8'),
(8906, 1337789030, '86.13.126.103', 'c9cafa8b75d4ccd8d7b924c74a3ec4ca155119cf'),
(8907, 1337789118, '86.13.126.103', '25fb9dd2fa360ccce8e240551672f0b598dc6561');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sessions`
--

CREATE TABLE IF NOT EXISTS `exp_sessions` (
  `session_id` varchar(40) NOT NULL default '0',
  `member_id` int(10) NOT NULL default '0',
  `admin_sess` tinyint(1) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `last_activity`) VALUES
('7a780ffb5d61b3c0ff09647fbcb421ff0f050d7f', 3, 1, '88.97.10.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.5; rv:12.0) Gecko/20100101 Firefox/12.0', 1337787581),
('f8e1b9c6f7bccc7fcd0a01fb0b52463119ade718', 1, 1, '86.13.126.103', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:12.0) Gecko/20100101 Firefox/12.0', 1337789489);

-- --------------------------------------------------------

--
-- Table structure for table `exp_sites`
--

CREATE TABLE IF NOT EXISTS `exp_sites` (
  `site_id` int(5) unsigned NOT NULL auto_increment,
  `site_label` varchar(100) NOT NULL default '',
  `site_name` varchar(50) NOT NULL default '',
  `site_description` text,
  `site_system_preferences` text NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  PRIMARY KEY  (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_mailinglist_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`) VALUES
(1, 'MeWe 360', 'default_site', NULL, 'YTo5MDp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6MzA6Imh0dHA6Ly93d3cubWV3ZWZvdW5kYXRpb24uY29tLyI7czoxNjoidGhlbWVfZm9sZGVyX3VybCI7czozNzoiaHR0cDovL3d3dy5tZXdlZm91bmRhdGlvbi5jb20vdGhlbWVzLyI7czoxNToid2VibWFzdGVyX2VtYWlsIjtzOjE3OiJtYXJjQGxhbmdzbWFuLmNvbSI7czoxNDoid2VibWFzdGVyX25hbWUiO3M6MDoiIjtzOjIwOiJjaGFubmVsX25vbWVuY2xhdHVyZSI7czo3OiJjaGFubmVsIjtzOjEwOiJtYXhfY2FjaGVzIjtzOjM6IjE1MCI7czoxMToiY2FwdGNoYV91cmwiO3M6MTc6Ii9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX3BhdGgiO3M6NTE6Ii9BcHBsaWNhdGlvbnMvTUFNUC9odGRvY3MvTWVXZV9DTVMvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9mb250IjtzOjE6InkiO3M6MTI6ImNhcHRjaGFfcmFuZCI7czoxOiJ5IjtzOjIzOiJjYXB0Y2hhX3JlcXVpcmVfbWVtYmVycyI7czoxOiJuIjtzOjE3OiJlbmFibGVfZGJfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJlbmFibGVfc3FsX2NhY2hpbmciO3M6MToibiI7czoxODoiZm9yY2VfcXVlcnlfc3RyaW5nIjtzOjE6Im4iO3M6MTM6InNob3dfcHJvZmlsZXIiO3M6MToibiI7czoxODoidGVtcGxhdGVfZGVidWdnaW5nIjtzOjE6Im4iO3M6MTU6ImluY2x1ZGVfc2Vjb25kcyI7czoxOiJuIjtzOjEzOiJjb29raWVfZG9tYWluIjtzOjA6IiI7czoxMToiY29va2llX3BhdGgiO3M6MDoiIjtzOjE3OiJ1c2VyX3Nlc3Npb25fdHlwZSI7czoxOiJjIjtzOjE4OiJhZG1pbl9zZXNzaW9uX3R5cGUiO3M6MjoiY3MiO3M6MjE6ImFsbG93X3VzZXJuYW1lX2NoYW5nZSI7czoxOiJ5IjtzOjE4OiJhbGxvd19tdWx0aV9sb2dpbnMiO3M6MToieSI7czoxNjoicGFzc3dvcmRfbG9ja291dCI7czoxOiJ5IjtzOjI1OiJwYXNzd29yZF9sb2Nrb3V0X2ludGVydmFsIjtzOjE6IjEiO3M6MjA6InJlcXVpcmVfaXBfZm9yX2xvZ2luIjtzOjE6InkiO3M6MjI6InJlcXVpcmVfaXBfZm9yX3Bvc3RpbmciO3M6MToieSI7czoyNDoicmVxdWlyZV9zZWN1cmVfcGFzc3dvcmRzIjtzOjE6Im4iO3M6MTk6ImFsbG93X2RpY3Rpb25hcnlfcHciO3M6MToieSI7czoyMzoibmFtZV9vZl9kaWN0aW9uYXJ5X2ZpbGUiO3M6MDoiIjtzOjE3OiJ4c3NfY2xlYW5fdXBsb2FkcyI7czoxOiJ5IjtzOjE1OiJyZWRpcmVjdF9tZXRob2QiO3M6ODoicmVkaXJlY3QiO3M6OToiZGVmdF9sYW5nIjtzOjc6ImVuZ2xpc2giO3M6ODoieG1sX2xhbmciO3M6MjoiZW4iO3M6MTI6InNlbmRfaGVhZGVycyI7czoxOiJ5IjtzOjExOiJnemlwX291dHB1dCI7czoxOiJuIjtzOjEzOiJsb2dfcmVmZXJyZXJzIjtzOjE6Im4iO3M6MTM6Im1heF9yZWZlcnJlcnMiO3M6MzoiNTAwIjtzOjExOiJ0aW1lX2Zvcm1hdCI7czoyOiJ1cyI7czoxNToic2VydmVyX3RpbWV6b25lIjtzOjM6IlVUQyI7czoxMzoic2VydmVyX29mZnNldCI7czowOiIiO3M6MTY6ImRheWxpZ2h0X3NhdmluZ3MiO3M6MToieSI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjM6IlVUQyI7czoxNjoiZGVmYXVsdF9zaXRlX2RzdCI7czoxOiJ5IjtzOjE1OiJob25vcl9lbnRyeV9kc3QiO3M6MToieSI7czoxMzoibWFpbF9wcm90b2NvbCI7czo0OiJtYWlsIjtzOjExOiJzbXRwX3NlcnZlciI7czowOiIiO3M6MTM6InNtdHBfdXNlcm5hbWUiO3M6MDoiIjtzOjEzOiJzbXRwX3Bhc3N3b3JkIjtzOjA6IiI7czoxMToiZW1haWxfZGVidWciO3M6MToibiI7czoxMzoiZW1haWxfY2hhcnNldCI7czo1OiJ1dGYtOCI7czoxNToiZW1haWxfYmF0Y2htb2RlIjtzOjE6Im4iO3M6MTY6ImVtYWlsX2JhdGNoX3NpemUiO3M6MDoiIjtzOjExOiJtYWlsX2Zvcm1hdCI7czo1OiJwbGFpbiI7czo5OiJ3b3JkX3dyYXAiO3M6MToieSI7czoyMjoiZW1haWxfY29uc29sZV90aW1lbG9jayI7czoxOiI1IjtzOjIyOiJsb2dfZW1haWxfY29uc29sZV9tc2dzIjtzOjE6InkiO3M6ODoiY3BfdGhlbWUiO3M6NzoiZGVmYXVsdCI7czoyMToiZW1haWxfbW9kdWxlX2NhcHRjaGFzIjtzOjE6Im4iO3M6MTY6ImxvZ19zZWFyY2hfdGVybXMiO3M6MToieSI7czoxMjoic2VjdXJlX2Zvcm1zIjtzOjE6InkiO3M6MTk6ImRlbnlfZHVwbGljYXRlX2RhdGEiO3M6MToieSI7czoyNDoicmVkaXJlY3Rfc3VibWl0dGVkX2xpbmtzIjtzOjE6Im4iO3M6MTY6ImVuYWJsZV9jZW5zb3JpbmciO3M6MToibiI7czoxNDoiY2Vuc29yZWRfd29yZHMiO3M6MDoiIjtzOjE4OiJjZW5zb3JfcmVwbGFjZW1lbnQiO3M6MDoiIjtzOjEwOiJiYW5uZWRfaXBzIjtzOjA6IiI7czoxMzoiYmFubmVkX2VtYWlscyI7czowOiIiO3M6MTY6ImJhbm5lZF91c2VybmFtZXMiO3M6MDoiIjtzOjE5OiJiYW5uZWRfc2NyZWVuX25hbWVzIjtzOjA6IiI7czoxMDoiYmFuX2FjdGlvbiI7czo4OiJyZXN0cmljdCI7czoxMToiYmFuX21lc3NhZ2UiO3M6MzQ6IlRoaXMgc2l0ZSBpcyBjdXJyZW50bHkgdW5hdmFpbGFibGUiO3M6MTU6ImJhbl9kZXN0aW5hdGlvbiI7czoyMToiaHR0cDovL3d3dy55YWhvby5jb20vIjtzOjE2OiJlbmFibGVfZW1vdGljb25zIjtzOjE6InkiO3M6MTI6ImVtb3RpY29uX3VybCI7czo0MToiaHR0cDovL2xvY2FsaG9zdC9NZVdlX0NNUy9pbWFnZXMvc21pbGV5cy8iO3M6MTk6InJlY291bnRfYmF0Y2hfdG90YWwiO3M6NDoiMTAwMCI7czoxNzoibmV3X3ZlcnNpb25fY2hlY2siO3M6MToibiI7czoxNzoiZW5hYmxlX3Rocm90dGxpbmciO3M6MToibiI7czoxNzoiYmFuaXNoX21hc2tlZF9pcHMiO3M6MToieSI7czoxNDoibWF4X3BhZ2VfbG9hZHMiO3M6MjoiMTAiO3M6MTM6InRpbWVfaW50ZXJ2YWwiO3M6MToiOCI7czoxMjoibG9ja291dF90aW1lIjtzOjI6IjMwIjtzOjE1OiJiYW5pc2htZW50X3R5cGUiO3M6NzoibWVzc2FnZSI7czoxNDoiYmFuaXNobWVudF91cmwiO3M6MDoiIjtzOjE4OiJiYW5pc2htZW50X21lc3NhZ2UiO3M6NTA6IllvdSBoYXZlIGV4Y2VlZGVkIHRoZSBhbGxvd2VkIHBhZ2UgbG9hZCBmcmVxdWVuY3kuIjtzOjE3OiJlbmFibGVfc2VhcmNoX2xvZyI7czoxOiJ5IjtzOjE5OiJtYXhfbG9nZ2VkX3NlYXJjaGVzIjtzOjM6IjUwMCI7czoxNzoidGhlbWVfZm9sZGVyX3BhdGgiO3M6MzM6Ii9ob21lL21ld2UzNjAvcHVibGljX2h0bWwvdGhlbWVzLyI7czoxMDoiaXNfc2l0ZV9vbiI7czoxOiJ5Ijt9', 'YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==', 'YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NDoibm9uZSI7czoyMzoibmV3X21lbWJlcl9ub3RpZmljYXRpb24iO3M6MToieSI7czoyMzoibWJyX25vdGlmaWNhdGlvbl9lbWFpbHMiO3M6MDoiIjtzOjI0OiJyZXF1aXJlX3Rlcm1zX29mX3NlcnZpY2UiO3M6MToieSI7czoyMjoidXNlX21lbWJlcnNoaXBfY2FwdGNoYSI7czoxOiJuIjtzOjIwOiJkZWZhdWx0X21lbWJlcl9ncm91cCI7czoxOiI1IjtzOjE1OiJwcm9maWxlX3RyaWdnZXIiO3M6NjoibWVtYmVyIjtzOjEyOiJtZW1iZXJfdGhlbWUiO3M6NDoibWV3ZSI7czoxNDoiZW5hYmxlX2F2YXRhcnMiO3M6MToieSI7czoyMDoiYWxsb3dfYXZhdGFyX3VwbG9hZHMiO3M6MToieSI7czoxMDoiYXZhdGFyX3VybCI7czo0NToiaHR0cDovL3d3dy5tZXdlZm91bmRhdGlvbi5jb20vaW1hZ2VzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czo0MToiL2hvbWUvbWV3ZTM2MC9wdWJsaWNfaHRtbC9pbWFnZXMvYXZhdGFycy8iO3M6MTY6ImF2YXRhcl9tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE3OiJhdmF0YXJfbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTM6ImF2YXRhcl9tYXhfa2IiO3M6NDoiNTAwMCI7czoxMzoiZW5hYmxlX3Bob3RvcyI7czoxOiJ5IjtzOjk6InBob3RvX3VybCI7czo1MToiaHR0cDovL3d3dy5tZXdlZm91bmRhdGlvbi5jb20vaW1hZ2VzL21lbWJlcl9waG90b3MvIjtzOjEwOiJwaG90b19wYXRoIjtzOjQ3OiIvaG9tZS9tZXdlMzYwL3B1YmxpY19odG1sL2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxNToicGhvdG9fbWF4X3dpZHRoIjtzOjM6IjUwMCI7czoxNjoicGhvdG9fbWF4X2hlaWdodCI7czozOiI1MDAiO3M6MTI6InBob3RvX21heF9rYiI7czo0OiI1MDAwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6Im4iO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6NTk6Imh0dHA6Ly93d3cubWV3ZWZvdW5kYXRpb24uY29tL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjEyOiJzaWdfaW1nX3BhdGgiO3M6NTU6Ii9ob21lL21ld2UzNjAvcHVibGljX2h0bWwvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czo0ODoiL2hvbWUvbWV3ZTM2MC9wdWJsaWNfaHRtbC9pbWFnZXMvcG1fYXR0YWNobWVudHMvIjtzOjIzOiJwcnZfbXNnX21heF9hdHRhY2htZW50cyI7czoxOiIzIjtzOjIyOiJwcnZfbXNnX2F0dGFjaF9tYXhzaXplIjtzOjM6IjI1MCI7czoyMDoicHJ2X21zZ19hdHRhY2hfdG90YWwiO3M6MzoiMTAwIjtzOjE5OiJwcnZfbXNnX2h0bWxfZm9ybWF0IjtzOjQ6Im5vbmUiO3M6MTg6InBydl9tc2dfYXV0b19saW5rcyI7czoxOiJ5IjtzOjE3OiJwcnZfbXNnX21heF9jaGFycyI7czo0OiI2MDAwIjtzOjE5OiJtZW1iZXJsaXN0X29yZGVyX2J5IjtzOjExOiJzY3JlZW5fbmFtZSI7czoyMToibWVtYmVybGlzdF9zb3J0X29yZGVyIjtzOjQ6ImRlc2MiO3M6MjA6Im1lbWJlcmxpc3Rfcm93X2xpbWl0IjtzOjI6IjIwIjt9', 'YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJuIjtzOjg6InNpdGVfNDA0IjtzOjg6InNpdGUvNDA0IjtzOjE5OiJzYXZlX3RtcGxfcmV2aXNpb25zIjtzOjE6InkiO3M6MTg6Im1heF90bXBsX3JldmlzaW9ucyI7czoxOiI1IjtzOjE1OiJzYXZlX3RtcGxfZmlsZXMiO3M6MToieSI7czoxODoidG1wbF9maWxlX2Jhc2VwYXRoIjtzOjcwOiIvQXBwbGljYXRpb25zL01BTVAvaHRkb2NzL01lV2VfQ01TL21ld2VtaW4vZXhwcmVzc2lvbmVuZ2luZS90ZW1wbGF0ZXMvIjt9', 'YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=', 'YToyOntzOjc6ImVtYWlsZWQiO2E6MDp7fXM6MzU6Ii9ob21lL21ld2UzNjAvcHVibGljX2h0bWwvaW5kZXgucGhwIjtzOjMyOiJkMjc5NGQ4MGUyNjQzYmE4M2NjOGJiY2E0ZGQ4OTYyYiI7fQ==');

-- --------------------------------------------------------

--
-- Table structure for table `exp_snippets`
--

CREATE TABLE IF NOT EXISTS `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY  (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_snippets`
--

INSERT INTO `exp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`) VALUES
(1, 1, 'company_name', 'MeWe360');

-- --------------------------------------------------------

--
-- Table structure for table `exp_specialty_templates`
--

CREATE TABLE IF NOT EXISTS `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `enable_template` char(1) NOT NULL default 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY  (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES
(1, 1, 'y', 'offline_template', '', '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type="text/css">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),
(2, 1, 'y', 'message_template', '', '<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=''content-type'' content=''text/html; charset={charset}'' />\n\n{meta_refresh}\n\n<style type="text/css">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),
(4, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),
(5, 1, 'y', 'admin_notify_mailinglist', 'Someone has subscribed to your mailing list', 'A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),
(6, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),
(7, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),
(8, 1, 'y', 'forgot_password_instructions', 'Login information', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),
(9, 1, 'y', 'reset_password_notification', 'New Login Information', '{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),
(10, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),
(11, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', '{name},\n\nWe''re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),
(12, 1, 'y', 'mailinglist_activation_instructions', 'Email Confirmation', 'Thank you for joining the "{mailing_list}" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),
(13, 1, 'y', 'comment_notification', 'Someone just responded to your comment', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
(14, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),
(15, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),
(16, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_stats`
--

CREATE TABLE IF NOT EXISTS `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `total_members` mediumint(7) NOT NULL default '0',
  `recent_member_id` int(10) NOT NULL default '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL default '0',
  `total_forum_topics` mediumint(8) NOT NULL default '0',
  `total_forum_posts` mediumint(8) NOT NULL default '0',
  `total_comments` mediumint(8) NOT NULL default '0',
  `last_entry_date` int(10) unsigned NOT NULL default '0',
  `last_forum_post_date` int(10) unsigned NOT NULL default '0',
  `last_comment_date` int(10) unsigned NOT NULL default '0',
  `last_visitor_date` int(10) unsigned NOT NULL default '0',
  `most_visitors` mediumint(7) NOT NULL default '0',
  `most_visitor_date` int(10) unsigned NOT NULL default '0',
  `last_cache_clear` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 8, 8, 'marc.langsman', 13, 0, 0, 3, 1337272756, 0, 1335205982, 1337252055, 16, 1334121944, 1337678880);

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses`
--

CREATE TABLE IF NOT EXISTS `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY  (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`) VALUES
(1, 1, 1, 'open', 1, '009933'),
(2, 1, 1, 'closed', 2, '990000');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_groups`
--

CREATE TABLE IF NOT EXISTS `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_status_groups`
--

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'published');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY  (`status_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_status_no_access`
--

INSERT INTO `exp_status_no_access` (`status_id`, `member_group`) VALUES
(2, 5),
(4, 5),
(4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `exp_templates`
--

CREATE TABLE IF NOT EXISTS `exp_templates` (
  `template_id` int(10) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL default 'n',
  `template_type` varchar(16) NOT NULL default 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL default '0',
  `last_author_id` int(10) unsigned NOT NULL default '0',
  `cache` char(1) NOT NULL default 'n',
  `refresh` int(6) unsigned NOT NULL default '0',
  `no_auth_bounce` varchar(50) NOT NULL default '',
  `enable_http_auth` char(1) NOT NULL default 'n',
  `allow_php` char(1) NOT NULL default 'n',
  `php_parse_location` char(1) NOT NULL default 'o',
  `hits` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`) VALUES
(1, 1, 1, 'index', 'y', 'webpage', '{embed="includes/header" page_title="Funding, Mentoring and Development for Creative Entrepreneurs - {company_name}"}\n\n				{exp:channel:entries channel="home"}\n	\n				<div class="container"> \n\n					<div class="row" id=''topSection''>\n\n						<div class="six columns push-six" id="straplineArea">\n								<div class="cta-container">\n									<h1>{strapline}</h1>\n									<a href="/sign-up" class="huge black button black radius black-gradient hide-on-phones" ><span>Join today</span></a>\n								</div>\n						</div> <!-- #straplineArea -->\n\n						<div class="six columns pull-six" id=''carousel''>\n\n								<div class="frame">\n									\n										{if home_video !=""}\n											{exp:antenna url=''{home_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false'' wmode=''transparent''}\n												<div class="flex-video vimeo widescreen">{embed_code}</div>\n											{/exp:antenna}\n										{if:else}									\n									     	<img src="{home_main_image}" />\n										{/if}\n								</div> <!-- frame-->\n					\n				\n						</div> <!-- #carousel -->\n			\n				\n					</div> <!-- #topSection -->\n			\n					<div class="row services">\n						\n						{home_four_columns}\n						\n							<div class="quarter columns">\n								<div class="service rounded">\n										<h2>{title}</h2>\n									<img src="{image}" alt="{title}" />\n									<p>{copy}</p>\n									<a href="{url}" class="medium black button radius black-gradient"><span>{button_copy}</span></a>\n								</div> <!-- panel -->\n							</div>				\n							\n						{/home_four_columns}\n						\n						{/exp:channel:entries}\n\n					</div><!-- #services-->\n				\n\n					<div class="row" id="news-area">\n					\n						<div class="seven columns">\n						\n							<h2>Latest news</h2>\n								\n								{exp:channel:entries channel="news" limit="1"}\n								<div class="row">\n									<div class="three columns">\n										<a href="{title_permalink=''news/view''}">\n											\n											{if news_video_url !=""}\n												{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n														<img src="{video_thumbnail}" alt="{video_title}" />\n												{/exp:antenna}\n											{if:elseif news_image != ""}\n												<img src="{news_image}" alt="{title}" />\n											{/if}\n										</a>\n									\n									</div> <!-- .six columns -->\n\n									<div class="nine columns">\n										\n										<div class="news-article">\n											<header>\n												<h3 class="news-heading"><a href="{title_permalink=''news/view''}">{title}</a></h3>\n												<p><span class="date">{entry_date format=''%j %F %Y''}</span> by {author} <span class="comments"><a href="{title_permalink=''news/view''}#comments">{comment_total} comments</a></span></p>\n											</header>	\n											<p class="excerpt">\n												{exp:eehive_hacksaw words="15" append="..."}\n													{news_article}\n												{/exp:eehive_hacksaw}\n											</p>\n											\n											\n										</div> <!-- .news-article -->\n									\n										\n									</div>\n								\n								</div> <!-- .row -->\n								{/exp:channel:entries}\n					\n\n\n						</div> <!-- .seven columns-->\n\n						<div class="five columns">	\n							<h2>Next Event</h2>\n								{exp:eventbriteapi:upcomingEvents limit="1"}\n									<div class="row event">\n										<div class="three columns">\n												<a href=''{url}''>\n													<div class="date-box">\n														<p class="month">{month}</p>\n														<p class="day">{day}</p>\n													</div> <!-- date-box -->\n												</a>\n										</div>\n										<div class="nine columns">\n											<div class="event-details">\n												<h3 class="event-heading"><a href=''{url}''>{title}</a></h3>\n												<p class="excerpt">{excerpt}</p>\n											</div> <!-- date- -->	\n										</div>\n									</div>\n								{/exp:eventbriteapi:upcomingEvents}\n						</div> <!-- sidebar -->\n							\n			\n					</div> <!-- #news-area -->\n\n				</div> <!-- container -->\n				\n{embed="includes/footer"}', '', 1337280163, 1, 'n', 0, '', 'n', 'n', 'o', 1999),
(2, 1, 2, 'index', 'y', 'webpage', '{embed="includes/header" page="{segment_1}" page_title="News stories - {company_name}"}\n\n				<div class="container"> \n				\n					<div class="row">\n					\n						<div class="eight columns">\n							\n							{exp:channel:entries channel="news"}\n							\n								<div class="news-article">\n									<header>\n										<h2><a href="{title_permalink=''news/view''}">{title}</a></h2> \n										<p><span class="date">{entry_date format=''%j %F %Y''}</span> by <strong>{author}</strong> <span class="comments"><a href="{title_permalink=''news/view''}#comments">{comment_total} comments</a></span></p>\n									</header>\n									{if news_video_url !=""}\n										{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false''}\n											<div class="flex-video">{embed_code}</div>\n										{/exp:antenna}\n									{if:elseif news_image != ""}\n										<div class="frame">\n											<!-- ><img src="http://lorempixel.com/450/250"/> -->\n											<img class="main-image" src="{news_image}" alt="{news_image_description}"/>\n										</div>\n									{/if}\n\n									<p>\n										{exp:eehive_hacksaw words="15" append="..."}\n												{news_article}\n										{/exp:eehive_hacksaw}\n										<a href="{title_permalink=''news/view''}">Read More</a>\n									</p>\n									\n								</div> <!-- .news-article -->\n							\n							{/exp:channel:entries}\n							\n						</div> <!-- columns -->\n								\n							\n\n						<div class="four columns">	\n							\n							{embed="includes/sidebar"}\n		\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}', '', 1336506599, 1, 'n', 0, '', 'n', 'n', 'o', 163),
(6, 1, 4, 'index', 'n', 'webpage', '', NULL, 1333623226, 0, 'n', 0, '', 'n', 'n', 'o', 0),
(7, 1, 4, 'header', 'y', 'webpage', '<!DOCTYPE html>\n\n<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->\n<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->\n<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->\n<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->\n<head>\n	<meta charset="utf-8" />\n\n	<!-- Set the viewport width to device width for mobile -->\n	<meta name="viewport" content="width=device-width" />\n\n	{embed:meta}\n\n	<title>{embed:page_title}</title>\n  \n	<!-- Included CSS Files -->\n	<!-- Combine and Compress These CSS Files -->\n	\n	<link rel="dns-prefetch" href="//ajax.googleapis.com">\n	\n	<link rel="stylesheet" href="/stylesheets/globals.css">\n	<link rel="stylesheet" href="/stylesheets/typography.css">\n	<link rel="stylesheet" href="/stylesheets/grid.css">\n	<link rel="stylesheet" href="/stylesheets/ui.css">\n	<link rel="stylesheet" href="/stylesheets/forms.css">\n	<link rel="stylesheet" href="/stylesheets/reveal.css">\n	<link rel="stylesheet" href="/stylesheets/mobile.css">\n	\n	<!-- favicon -->\n	<link rel="shortcut icon" href="/favicon.ico" />\n\n\n	<!--[if lt IE 9]>\n		<link rel="stylesheet" href="/stylesheets/ie.css">\n	<![endif]-->\n	\n	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.19/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css"/>\n	<link rel="stylesheet" type="text/css" href="/stylesheets/jquery.lightbox-0.5.css"/>\n	<!-- Non framework custom CSS -->\n	<link rel="stylesheet" href="/stylesheets/custom.css">\n	<link rel="stylesheet" href="/stylesheets/thumbnails.css">\n	<link rel="stylesheet" href="/stylesheets/{embed:page}.css">\n	\n	<!-- Google Webfonts -->\n	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Candara">\n	\n	<script src="/javascripts/modernizr.foundation.js"></script>\n		\n	\n	<!-- IE Fix for HTML5 Tags -->\n	<!--[if lt IE 9]>\n		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>\n	<![endif]-->\n	\n	<!-- Google Analyitcs Code -->\n	\n	<script type="text/javascript">\n\n	  var _gaq = _gaq || [];\n	  _gaq.push([''_setAccount'', ''UA-31926599-1'']);\n	  _gaq.push([''_trackPageview'']);\n\n	  (function() {\n	    var ga = document.createElement(''script''); ga.type = ''text/javascript''; ga.async = true;\n	    ga.src = (''https:'' == document.location.protocol ? ''https://ssl'' : ''http://www'') + ''.google-analytics.com/ga.js'';\n	    var s = document.getElementsByTagName(''script'')[0]; s.parentNode.insertBefore(ga, s);\n	  })();\n\n	</script>\n\n</head>\n\n<body>\n		\n		<div id="top-background">\n			<div id="background">\n				<div id="header">\n\n					<div class="row" id="branding">\n							<div class="twelve columns">\n									<img src="/img/Logo.png" alt="Mewe Logo" />\n							</div>\n							\n							<ul class="secondary-nav hide-on-phones shadow">\n								{if logged_out}\n									<li><a href="{path=''member/login''}">Login</a></li>\n									<li><a href="/sign-up" class="alternate">Join Up</a></li>\n								{/if}\n								{if logged_in}\n									<li><a href="{path=''logout''}">Logout</a></li>\n								{/if}\n								\n								\n							</ul>\n					</div>\n\n					<div class="row" id="masthead" >\n						<div class="twelve columns" >\n								<ul class="nav-bar hide-on-phones" id="primary-nav">\n									<li {if segment_1 == ''''}class="selected"{if:else}class="main"{/if}><a href="/" class="main"><span>Home</span></a></li>\n									<li {if segment_1 == ''about''}class="selected"{if:else}class="main"{/if}> <a href="about" class="main">About</a></li>\n									<li {if segment_1 == ''incubator''}class="selected"{if:else}class="main"{/if}> <a href="/incubator" class="main">Incubator</a></li>\n									<li {if segment_1 == ''workspace''}class="selected"{if:else}class="main"{/if}> <a href="/workspace" class="main">Workspace</a></li>\n									<li {if segment_1 == ''events''}class="selected"{if:else}class="main"{/if}>  <a href="/events" class="main">Events</a></li>\n									<li {if segment_1 == ''membership''}class="selected"{if:else}class="main"{/if}> <a href="/membership" class="main">Membership</a></li>\n									<li {if segment_1 == ''news'' AND segment_2 == ''''}class="selected"{if:else}class="main"{/if}> <a href="/news" class="main">News</a></li>\n								{if logged_in}\n									<li class="hub has-flyout">\n										<a href="#" class="main">Members</a>\n										<div class="flyout" style="display: none;">\n											<ul>\n												<li><a href="{path=''members''}" class="main">Community</a></li>\n												<li><a href="{path=''members/resources''}" class="main">Resources</a></li>\n												<li><a href="{path=''members/profile''}"class="main">View Profile</a></li>\n												<li><a href="{path=''members/edit_profile''}"class="main">Edit Profile</a></li>\n												<li><a href="{path=''members/edit_account''}"class="main">Account Details</a></li>\n												\n											</ul>\n										</div>\n									</li>\n								{/if}\n								</ul>\n						</div>\n					</div>\n				\n				</div> <!-- #header -->\n\n', '', 1337601146, 1, 'n', 0, '', 'n', 'n', 'o', 371),
(8, 1, 4, 'footer', 'y', 'webpage', '			{exp:channel:entries channel="footer_content" dynamic="no"}\n			\n				<div class="sponsors">\n					<div class="row">\n						<!-- <div class="twelve columns"><img src="/img/sponsors.png" alt="Our Sponsors" /></div> -->\n						\n						<div class="twelve columns">\n							{sponsors}\n								<a href="{exp:valid_url}{url}{/exp:valid_url}" target="_blank" >\n									<img src="{logo}" alt="{name}" />\n								</a>\n							{/sponsors}\n						</div>\n							\n						\n					</div>\n				</div>\n		\n				<div id="footer">\n			\n					<div class="row">\n						<div class="three columns">\n							<h3>Find Us</h3>\n							<div class="container">\n								{footer_map_image}\n									<a href="{exp:valid_url}{map_link}{/exp:valid_url}" _target="blank" ><img class="map" src="{image}" alt="Map showing MeWe location" /></a>\n								{/footer_map_image}\n							</div>\n						</div>\n						<div class="three columns">\n							<h3>Get in touch</h3>\n							<div class="container">\n								<p>{footer_address}</p><p>{footer_phone_number}<br /><a href="mailto:{footer_email}">{footer_email}</a></p>\n							</div>\n						</div>\n						\n						<div class="three columns networks">\n							<h3>Networks</h3>\n							<div class="container">\n								<ul>\n									{if footer_twitter != ""}\n										<li><a href="{exp:valid_url}{footer_twitter}{/exp:valid_url}" target="_blank" ><img src="/img/twitter.png" />Twitter</a></li>\n									{/if}\n									\n									{if footer_facebook != ""}\n										<li><a href="{exp:valid_url}{footer_facebook}{/exp:valid_url}" target="_blank" ><img src="/img/facebook.png" />Facebook</a></li>\n									{/if}\n									\n									{if footer_linkedin != ""}\n										<li><a href="{exp:valid_url}{footer_linkedin}{/exp:valid_url}" target="_blank" ><img src="/img/linkedin.png" />LinkedIn</a></li>\n									{/if}\n									\n								</ul>\n							</div>\n						</div>\n						<div class="three columns feedback">\n							<h3>Feedback</h3>\n							<div class="container">\n								<p>We’re always looking to improve what we do. If you have feedback we''d love to hear from you!</p>\n								<a href="{path=''contact-us''}" class="medium radius black button black-gradient"><span>Get in touch</span></a>\n							</div>\n						</div>\n					</div>\n						\n					<div class="row"> <!-- Company registration info -->\n						<div class="twelve">\n							<p class="company-info">{company_info}</p>\n						</div>\n					</div> <!-- /row -->\n				\n				\n				</div> <!-- .footer -->\n				\n				</div> <!-- #background -->\n		</div> <!-- #top-background -->\n\n{/exp:channel:entries}\n\n	<!-- Included JS Files -->\n	\n	<!-- JQuery -->\n	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	\n  	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>\n\n	<script src="/javascripts/jquery.customforms.js"></script>\n	<script src="/javascripts/jquery.placeholder.min.js"></script>\n\n	<!-- End Combine and Compress These JS Files -->\n	\n	<!-- Form validation -->\n	<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js"></script>	\n	\n	<script type="text/javascript">\n		$().ready(function() {\n			// validate the comment form when it is submitted\n			$(".validatingForm").validate();\n		});\n	</script>\n	\n	<script src="/javascripts/app.js"></script>\n	\n	<!-- JQuery Lightbox -->\n	<script type="text/javascript" src="/javascripts/jquery.lightbox-0.5.js"></script>\n	<script type="text/javascript">\n		$(function() {\n			$(''.gallery a'').lightBox(); // Select all links in object with gallery ID\n		});\n	</script>\n	\n	<!-- Live Reload -->	\n	{if global:env != "prod"}\n		<script>document.write(''<script src="http://'' + (location.host || ''localhost'').split('':'')[0] + '':35729/livereload.js?snipver=1"></'' + ''script>'')</script>\n	{/if}\n\n	\n</body>\n</html>', '', 1337602028, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(13, 1, 5, 'index', 'y', 'webpage', '{embed="includes/header" page="{segment_1}" page_title="About Us - {company_name}"}\n	\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							{exp:channel:entries channel="about"}\n								<h1>{about_headline}</h1>\n							{/exp:channel:entries}\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">\n						\n							<div class="frame">\n							{exp:channel:entries channel="about"}\n									{if about_video !=""}\n										{exp:antenna url=''{about_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false''}\n											<div class="flex-video vimeo widescreen">{embed_code}</div>\n										{/exp:antenna}\n									{if:else}									\n								     	<img src="{about_main_image}"/>\n									{/if}\n								{/exp:channel:entries}\n							</div> <!-- frame -->\n						\n						</div> <!-- columns -->\n						\n								\n							\n\n						<div class="six columns">\n							{exp:channel:entries channel="about"}\n								<p>{about_main_copy}</p>\n							{/exp:channel:entries}	\n							\n							<a class="medium black button radius black-gradient" href="/sign-up"><span>Join us today</span></a>\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n						\n							{exp:channel:entries channel="about"}\n							\n								<h2>Why MeWe?</h2>\n								<p class="small">{about_why_mewe}</p>\n							\n\n								<h2>How we work</h2>\n								<p class="small">{about_how_we_work}</p>\n\n								<h2>Why join?</h2>\n								<p class="small">{about_why_join}</p>\n				\n							{/exp:channel:entries}\n							\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n					<div class="row people-section">\n						<div class="twelve columns">\n							<dl class="tabs">\n								<dd><a href="#simple1" class="active">The Team</a></dd>\n							 	<dd><a href="#simple2">The Board</a></dd>\n								\n								{exp:channel:entries channel="about"}\n							  		<dd {if about_show_advisors == ""} style="display: none;" {/if}><a href="#simple3">Advisors</a></dd>\n								{/exp:channel:entries}\n								\n							</dl>\n\n							<ul class="tabs-content">\n								\n								<li class="active" id="simple1Tab">\n									<div class="container">\n										<p>Our team looks after MeWe’s members and keeps our events and workspace running smoothly.</p>\n										<ul class="block-grid four-up mobile">\n											\n											{embed="includes/people_gallery" field="team"}\n										\n										</ul>\n									</div>\n								</li>\n							  	\n							<li id="simple2Tab">\n									<div class="container">\n										<p>The board creates MeWe’s strategy to ensure that members are offered the most innovative and cutting-edge services for their businesses.</p>\n										<ul class="block-grid four-up mobile">\n										\n											{embed="includes/people_gallery" field="board"}\n											\n										</ul>\n									</div>\n								\n								</li>\n								<li id="simple3Tab">\n										<div class="container">\n											\n											<p>From heads of leading media organisations to captains of creative industry, our advisors offer members invaluable one-to-one business coaching.</p>\n											\n											<ul class="block-grid four-up mobile">\n												\n												{embed="includes/people_gallery" field="advisors"}\n										\n											</ul>\n										</div>\n\n									</li>\n							\n						\n							</ul>\n		\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}', '', 1336506599, 1, 'n', 0, '', 'n', 'n', 'o', 217),
(14, 1, 6, 'index', 'y', 'webpage', '{embed="includes/header" page="{segment_1}" page_title="Business Incubator - {company_name}"}\n			\n				<div class="container"> \n				\n				\n					\n					<div class="row">\n						\n						<div class="six columns">\n							<div class="frame">\n							{exp:channel:entries channel="incubator"}\n									{if incubator_video !=""}\n										{exp:antenna url=''{incubator_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false''}\n											<div class="flex-video vimeo widescreen">{embed_code}</div>\n										{/exp:antenna}\n									{if:else}									\n								     	<img src="{incubator_main_image}"/>\n									{/if}\n								{/exp:channel:entries}\n							</div> <!-- frame -->\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							{exp:channel:entries channel="incubator"}\n								<h1>{incubator_headline}</h1>\n								<p>{incubator_main_copy}</p>	\n							{/exp:channel:entries}\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n\n						<div class="six columns">\n							<h2>Here''s how it works</h2>\n								<p class="small">We’ll meet you for an initial in-depth one-to-one session so that together we\n								can identify exactly what you need to propel you, your ideas and your creative\n								business to the next level. Throughout the programme we will continue to work\n								with you to closely monitor and respond to your changing needs as you, your\n								business or idea develops.</p>\n								<p class="small">What you will get is a bespoke package of support to\n								ensure you meet the goals you have set. Packages include:</p>\n\n								<h4>Mentoring and Consultancy</h4>\n								<p class="small">One-to-one coaching to guide your leadership development as well as expert\n								advice in key areas of business practice such as marketing, planning, finance, human resources</p>\n								<hr />\n								\n								<h4>Events</h4>\n								<p class="small">A programme of networking and leadership development events designed\n								to inspire, inform and connect our membership including speakers, panel\n								discussions, workshops, expert clinics.</p>\n								<hr />\n								\n								<h4>Facilities</h4>\n								<p class="small">Professional cinema, meeting, work and event spaces to present, collaborate and network.</p>\n								<hr />\n								\n								<h4>Networks</h4>\n								<p class="small">You will be plugged into the MeWe network as well as other relevant external networks.</p>\n								<hr />\n								\n								<h4>Finance</h4>\n								<p class="small">Opportunity to pitch for investment from MeWe’s investment arm, MeWe Money. More information is available <a href="#">here</a>.</p>\n								\n						</div> <!-- columns -->\n\n\n\n						<div class="six columns">	\n							<div class="inset rounded">\n								<h2>Launching a project or product?</h2>\n\n								<h3>We can provide the venue and help make sure the right people are there.</h3>\n								<p>Throughout the programme we will continue to work with you to closely monitor and respond to your changing needs as you, your business or idea develops.</p>\n								<p>What you will get is a tailor made service to enable you to maximise your potential and opportunities.</p>\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/me.png" />\n									</div>\n									<div class="nine columns">	\n										<p>but within a strong, vibrant community of peers.</p>\n									</div>\n								</div>\n								\n								<hr />\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/we.png" />\n									</div>\n									<div class="nine columns">	\n										<p>committed, aspirational and talented creative entrepreneurs like you – offering support and collaboration where ideas can not only ignite but be realised.</p>\n									</div>\n								</div>\n								\n								<hr />\n								\n								<div class="row ethos">\n									<div class="three columns">\n										<img src="/img/360.png" />\n									</div>\n									<div class="nine columns">	\n										<p>support needed to succeed at the highest level together with the opportunity to apply for seed funding of £200K from our investment arm.</p>\n									</div>\n								</div>\n																\n							</div>\n							\n						</div> <!-- columns -->\n\n\n					</div> <!-- .row -->\n					\n					<div class="row cta">\n						<div class="nine columns">\n							If you believe you have a compelling business idea, the ambition for success and want to work with business experts and mentors to grow your business get in touch now.\n							\n						</div>\n						<div class="three columns">\n							<a href="/sign-up" class="medium black button radius black-gradient"><span>Get in touch</span></a>\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}', '', 1336506599, 1, 'n', 0, '', 'n', 'n', 'o', 84),
(15, 1, 7, 'index', 'y', 'webpage', '{embed="includes/header" page="{segment_1}" page_title="Our workspace - {company_name}"}\n	{exp:channel:entries channel="workspace"}\n	\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							\n							<h1>{workspace_heading}</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row">\n						\n						<div class="six columns">\n							<div class="frame">\n									{if workspace_video !=""}\n										{exp:antenna url=''{workspace_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false''}\n											<div class="flex-video vimeo widescreen">{embed_code}</div>\n										{/exp:antenna}\n									{if:else}									\n								     	<img src="{workspace_main_image}"/>\n									{/if}\n							</div> <!-- frame -->\n						</div> <!-- columns -->\n								\n							\n\n						<div class="six columns">\n							<p>{workspace_main_copy}	\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row services rooms-section">\n					\n					{workspace_four_columns}\n				\n							<div class="quarter columns">\n								<div class="service rounded">\n										<h2>{title}</h2>\n									<img src="{image}" alt="{title}" />\n									<p>{copy}</p>\n								</div> <!-- panel -->\n							</div>				\n				\n					{/workspace_four_columns}\n\n					</div><!-- #services-->\n					\n					<div class="row">\n						<div class="twelve columns cta">\n							<a href="/sign-up" class="medium black button radius black-gradient"><span>Sign up today</span></a>\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n{/exp:channel:entries}\n\n{embed="includes/footer"}', '', 1336506599, 1, 'n', 0, '', 'n', 'n', 'o', 65),
(16, 1, 8, 'index', 'y', 'webpage', '{embed="includes/header" page="{segment_1}" page_title="Membership tiers, pricing and FAQ - {company_name}"}\n	\n			\n				<div class="container"> \n				\n					<div class="row centered">\n						<div class="twelve columns">\n							{exp:channel:entries channel="membership"}\n							\n							 	<h1>{membership_headline}</h1>\n							\n								{if special_offer_visible != ""}			\n									<div class="banner inset rounded shadow">\n										<h2>{membership_banner}</h2>\n									</div> <!-- .banner --> \n								{/if}\n								\n							{/exp:channel:entries}\n							\n						</div>\n					</div> <!-- row -->\n					\n					\n					<div class="row services membership-tiers">\n					\n					{exp:channel:entries channel="membership" limit="3"}\n						{membership_tiers}\n							<div class="third columns">\n								<div class="service rounded inset">\n										<h2>{membership_tier_name}</h2>\n										<div class="bubble rounded">\n											<div>\n												<span class="contract-length">{membership_primary_description}</span><br />\n												<span class="price">{membership_primary_price}/</span><span class="payment-period">{membership_primary_period}</span></div>\n\n										</div>\n										<div class="bubble secondary-offer rounded ">\n											<div>\n												<span class="contract-length">{membership_secondary_description}</span><br />\n												{if membership_secondary_price !=""}\n													<span class="price">{membership_secondary_price}/</span><span class="payment-period">{membership_secondary_period}</span></div>\n												{if:else}\n													<span class="payment-period">N/A</span></div>\n												{/if}\n\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_1}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_2}\n										</div>\n										<div class="bubble feature rounded">\n											{membership_feature_3}\n										</div>\n										\n										{if membership_differentiator != ""}\n											<div class="bubble differentiator rounded">\n												{membership_differentiator}\n											</div>\n										{/if}\n			\n										<a href="/sign-up" class="large button radius black-gradient"><span>Sign up today</span></a>\n										\n								</div> <!-- panel -->\n								\n							</div>\n						{/membership_tiers}\n					{/exp:channel:entries}	\n					\n				\n					</div><!-- #services-->\n					\n					<hr class="divider"/>\n					\n					<div class="row">\n						<div class="eight columns faq-section">\n							<h2>Frequently asked questions</h2>\n						\n						{exp:channel:entries channel="membership"}	\n							{faq}\n								<div class="question-and-answer">\n									<p class="question">{question}</p>\n									<p class="answer">{answer} {if file != ""}<a href="{file}" class="file-icon" target="_blank"><img src="/img/file-icon-small.png" /></a>{/if}</p>\n								</div>\n							{/faq}\n						{/exp:channel:entries}\n							\n						</div><!-- columns -->\n							\n						<div class="four columns">\n							<div class="service rounded top-ups">\n								<h2>Top-ups and Extras</h2>\n								{exp:channel:entries channel="membership" backspace="6"}\n									{topups_and_extras}\n										<h3>{title}</h3>\n										{copy}\n										<hr />{/topups_and_extras}{/exp:channel:entries}\n								\n							</div>\n						</div><!-- columns -->\n						\n					</div> <!-- Row -->\n					\n\n				</div> <!-- container -->\n				\n	\n{embed="includes/footer"}', '', 1337366314, 1, 'n', 0, '', 'n', 'n', 'o', 137),
(17, 1, 9, 'index', 'y', 'webpage', '{embed="includes/header" page="{segment_1}" page_title="Events - {company_name}"}\n\n			\n				<div class="container"> \n					\n					<div class="row">\n								\n							\n						{exp:channel:entries channel="events"}\n						\n						<div class="eight columns push-four">\n							<h1>We''d love to see you at one of our events!</h1>\n							<p>MEWE360º hosts a programme of networking and leadership development events designed to inspire, inform and connect our membership. As a member you have access to all events (free or discounted depending on your type of membership). We want to provide a programme that genuinely meets your needs and so are always open to member’s requests and will adapt our programme where necessary.</p>\n							<p>We run \n									{if events_file !=""}\n										<a href="{events_file}" target="_blank">6 different types of events</a>\n									{if:else}\n										6 different types of events\n									{/if}\n									- <strong>Networking Events</strong>, <strong>Networking Plus - The Lab</strong>, <strong>How I did it</strong>, <strong>Pick my brains</strong>, <strong>Workshop/Masterclass</strong> and <strong>Panel Discussions</strong>.\n								\n							<div class="row cta">\n								\n								<div class="eight columns">\n									Become a member to receive free tickets, special discounts and priority access.\n								</div>\n									\n								<div class="four columns">\n									<a href="/sign-up" class="medium black button radius black-gradient"><span>Sign up today</span></a>\n								</div>\n							</div>\n							\n							{/exp:channel:entries}\n		\n							\n						</div> <!-- columns -->\n					\n						<div class="four columns pull-eight">\n						{if "{exp:eventbriteapi:isUpcomingEvent}" == "true"}\n							{exp:eventbriteapi:upcomingEvents limit=''1''}\n								<div class="next-event inset">\n									<div class="date">\n										<span class="month">{month}</span>\n										<span class="day">{day}</span>\n									</div>\n									<h2>Next Event</h2>\n									<div class="container">\n										<h3>{title}</h3>\n										<!-- ><img src="http://lorempixel.com/230/100"> -->\n										{if logoURL != ""}\n											<img src="{logoURL}" />\n										{/if}\n										<p class="time"></p>\n										<p class="event-description">{excerpt}</p>\n										<a href="{url}" class="medium black button radius black-gradient"><span>Find out more</span></a>\n									</div>\n								</div>\n							{/exp:eventbriteapi:upcomingEvents}\n						{/if}\n							\n									\n						</div> <!-- columns -->		\n			\n					</div> <!-- .row -->\n					\n					<div class="row">\n						\n						<div class="eight columns push-four">\n							\n							<div class="past-events">\n								<h2 class="black-header-bar">Past Events</h2>\n								<ul>\n									{exp:channel:entries channel="past_events" orderby="past_event_date" sort="desc"}\n\n										<li class="event-summary accordionButton">\n										<div class="date-box">\n											<p class="month">{past_event_date format="%M"}</p>\n											<p class="day">{past_event_date format="%d"}</p>\n										</div> <!-- date-box -->\n\n										<h3 class="event-title">{title}</h3>\n										<p class="event-description">{past_event_description}</p>\n										<div class="clear"></div>\n									</li>\n\n										<li class="event-content inset accordionContent">\n										<div class="row">\n										\n										<!-- If there isnt a video we want the picture gallery to fill the full space -->	\n										{if past_event_video != "" OR past_event_photo_gallery != ""}\n\n											<div class="seven columns">\n										\n										{if:else}\n												\n											<div class="twelve columns">\n												\n										{/if}\n											\n										{if past_event_photo_gallery != ""}\n											\n												<ul class="block-grid eight-up gallery">\n													\n												{past_event_photo_gallery}\n													<li>														\n															{exp:ce_img:pair:photo src="{image}" max="200" crop="yes" allow_scale_larger="yes"}\n																<a href="{image}"><img src="{photo:made}" alt="Photo of {title}" /></a>\n															{/exp:ce_img:pair:photo}	\n													</li>\n												{/past_event_photo_gallery}\n												\n												<!-- Create placeholder images to fill in any remaining blanks in the gallery grid -->\n												{exp:for_loop start="{past_event_photo_gallery:total_rows}" end="31" increment="1"}\n												\n												<li>\n													<img src="/img/blank-gallery-placeholder.png" /> \n												</li>\n												\n												{/exp:for_loop}\n												\n\n												</ul>									\n\n											</div><!-- columns -->\n											\n										{/if}\n										\n										{if past_event_video != ""}\n										\n											<div class="five columns">\n												<div class="video">\n													{if past_event_video !=""}\n														{exp:antenna url=''{past_event_video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false'' max-width="220" max_height="123"}\n															<div class="flex-video widescreen">{embed_code}</div>\n														{/exp:antenna}\n													{if:else}\n														<img src="http://placehold.it/220x123">\n													{/if}\n\n												</div>\n											</div> <!-- columns -->\n										{/if}\n											\n										</div> <!-- row -->\n\n										<div class="row">\n											<div class="twelve columns">\n													<h4>Review</h4>\n													<p>{past_event_review}</p>\n											</div><!-- columns -->\n										</div> <!-- row -->\n\n									</li>\n\n									{/exp:channel:entries}\n\n								</ul>\n\n							</div><!-- past events -->	\n							\n						</div>\n						\n						<div class="four columns pull-eight">\n							\n								<div class="future-events">\n									<h2 class="black-header-bar">Future events</h2>\n									<ul>\n										{exp:eventbriteapi:upcomingEvents}\n											<li class="future-event container">	\n												<h3><a href="{url}">{title}</a></h3>\n												<p class="date">{date}</p>\n												<!-- <p>bumhole</p> -->\n											</li> <!-- container -->\n										{/exp:eventbriteapi:upcomingEvents}\n									</ul>\n\n								</div> <!-- future-events -->\n							\n						</div>\n						\n					</div> <!-- row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}', '', 1337784569, 1, 'n', 0, '', 'n', 'n', 'o', 446),
(18, 1, 2, 'view', 'y', 'webpage', '{embed="includes/header" page="{segment_1}" page_title="{exp:channel:entries channel="news" limit="1"}{title}{/exp:channel:entries}"}\n\n				<div class="container"> \n			\n					<div class="row">\n					\n						<div class="eight columns">\n							\n							{exp:channel:entries channel="news" limit=''1''}\n							\n								<div class="news-article">\n									<header>\n										<h2>{title}</h2> \n										<p><span class="date">{entry_date format=''%j %F %Y''}</span> by {author} <span class="comments"><a href="#comments">{comment_total} comments</a></span></p>\n									</header>\n									\n									{if news_video_url !=""}\n										{exp:antenna url=''{news_video_url}'' vimeo_portrait=''false'' vimeo_title=''false'' youtube_rel="0"}\n											<div class="flex-video widescreen">{embed_code}</div>\n										{/exp:antenna}\n									{if:elseif news_image != ""}\n										<div class="frame">\n											<!-- ><img src="http://lorempixel.com/450/250"/> -->\n											<img src="{news_image}" alt="{news_image_description}"/>\n										</div>\n									{/if}\n									\n									\n									<!-- AddThis Button BEGIN -->\n									<div class="addthis_toolbox addthis_default_style addthis_32x32_style">\n									<a class="addthis_button_preferred_1"></a>\n									<a class="addthis_button_preferred_2"></a>\n									<a class="addthis_button_linkedin"></a>\n									</div>\n									<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4fa160b51a7f8321"></script>\n									<!-- AddThis Button END -->\n\n\n									<p>{news_article}</p>\n								</div> <!-- .news-article -->\n							\n							{/exp:channel:entries}\n							\n							<div id="comments">\n							\n									\n								\n								{exp:comment:entries}\n								\n									{if count==1}\n										<h5>Comments</h5>\n									{/if}\n								\n								\n													<div class="comment-content {switch odd|even}">\n														<header>\n															<p>\n																<span class="date">{comment_date format="%F %d, %Y"}</span> <span class="posted-by">Posted by</span> <strong>{name}</strong>\n															</p>\n														</header>		\n														{comment}\n													</div>\n\n								{/exp:comment:entries}\n								\n							</div> <!-- #comments -->\n							\n								<div id="comment-form">\n									<h5>Comment on this News Article</h5>\n\n									<fieldset id="comment-form-field">\n\n										{exp:comment:form channel="news" form_class="nice custom validatingForm"}\n										<div class="row">\n											<div class="six columns">\n												<p>\n													<label for="name">Name</label>\n													<input type="text" name="name" value="" class="input-text required" id="name" />\n												</p>\n												<p>\n													<label for="email">Email Address</label>\n													<input type="text" name="email" value="" class="input-text required email" id="email"  />\n												</p>\n											</div>\n											\n											<div class="six columns"> </div>\n										</div> <!-- .row -->\n											<p>\n												<label for="comment">Comment</label>\n												<textarea name="comment" class=''textarea large'' rows="8" cols="35" id="comment"></textarea>\n											</p>\n\n											<p>\n												<input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n											</p>\n											\n											\n										{/exp:comment:form}\n										\n									</fieldset>              \n\n\n\n							</div> <!-- END #comment-form -->\n							\n						</div> <!-- columns -->\n								\n							\n\n						<div class="four columns">	\n							{embed="includes/sidebar"}\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}', '', 1336506599, 1, 'n', 0, '', 'n', 'n', 'o', 262),
(19, 1, 4, 'sidebar', 'y', 'webpage', '<div class="inset rounded sidebar">\n	<h2>Recent News</h2>\n	{exp:channel:entries channel="news" dynamic="no" limit="5"}\n	\n		<div class="news-snippet">\n			<a href="{title_permalink=''news/view''}">\n				<h3>{title}</h3>\n			</a>\n			<h4>{entry_date format=''%j %F %Y''}</h4>\n		</div> <!-- .news-snippet -->\n	\n	{/exp:channel:entries}\n\n</div>', '', 1334660313, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(20, 1, 10, 'index', 'y', 'webpage', '{embed="includes/header" page="{segment_1}" page_title="Sign up or find out more - {company_name}}\n			\n				<div class="container"> \n				\n					<div class="row">\n						<div class="twelve columns">\n							<h1>Interested in joining up or finding out about special offers and upcoming events? Fill in your details and we’ll keep you in the loop.</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class="row top-section">\n						\n						<div class="six columns">	\n						\n							{exp:freeform:form \n								form:class="nice custom validatingForm"\n								collection="Sign Up"\n								return="/thankyou"\n								notify="{global:contact_email}"\n								send_user_email="yes"\n								template="mewe_notification_template" \n								user_email_template="mewe_template"\n								}\n							\n								<div class="row">\n									<div class="six columns">	\n										<label for="first_name">Name *</label>\n										<input id="first_name" name="first_name" class="input-text required" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="last_name">Surname *</label>\n										<input id="last_name" name="last_name" class="input-text required" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->\n							\n								<div class="row">\n									<div class="twelve columns">\n											<label for="email">Email *</label>\n											<input id="email" name="email" class="input-text required email" type="text">\n									</div>\n								</div>	\n													\n								<div class="row">\n									<div class="six columns">	\n										<label for="phone_number">Phone number</label>\n										<input id="phone_number" name="phone_number" class="input-text" type="text">\n									</div><!-- columns -->\n								\n									<div class="six columns">	\n										<label for="postcode">Postcode</label>\n										<input id="postcode" name="postcode" class="input-text" type="text">\n									</div><!-- columns -->\n								</div><!-- row -->		\n						\n								<div class="row">\n									<div class="twelve columns">\n									\n										<label for="creative_insutry">What creative industry are you in?</label>\n										<select style="display:none;" id="creative_insutry" name="creative_industry" class="expand">\n										  	<option>Design</option>\n										  	<option>New Media</option>\n											<option>Television</option>\n										  	<option>Writing</option>\n											<option>Music</option>\n											<option>Other\n												</option>\n										</select>\n										\n										\n									\n										<label for="membership_type">What type of membership are you interested in?</label>\n										<select style="display:none;" id="membership_type" name="membership_type" class="expand">\n										  	<option>Network</option>\n											<option>Hub</option>\n										  	<option>Incubator</option>\n											<option>Just events</option>\n										  	<option>Not sure</option>	\n										</select>\n										\n										<label for="business_stage">What stage of development is your business/project at?</label>\n										<select style="display:none;" id="business_stage" name="business_stage" class="expand">\n											<option>Pre start-up / concept development</option>\n											<option>Start-up</option>\n										  	<option>Established over 1 year</option>\n										</select>										\n									\n									</div>	<!-- columns -->\n								</div> <!-- row -->\n							\n								<div class="row submit-section">\n\n									<div class="six columns">	\n										<input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n										\n									</div><!-- columns -->\n								\n									<div class="six columns terms">\n								            <span id="checkbox"><input id="opt-in" checked="checked" type="checkbox" /></span>\n								            <span id="checkbox-label"><label for="opt-in">Uncheck this box if you don’t want to recieve news about special discounts, upcoming events and more. Don’t worry, we hate spam and we’ll never share your details with anyone else.</label></span>\n									</div><!-- columns -->\n\n								</div><!-- row -->\n							\n							\n							{/exp:freeform:form} <!-- form -->\n										\n						</div> <!-- columns -->\n				\n						\n						<div class="six columns hide-on-phones">\n							<div class="large-image">\n								<img src="/img/membership.png" class="frame" />\n							</div>\n						</div> <!-- columns -->\n								\n							\n	\n			\n					</div> <!-- .row -->\n					\n					\n					<div class="row">\n						<div class="twelve columns">\n						\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n\n				</div> <!-- container -->\n\n{embed="includes/footer"}', '', 1337601146, 1, 'n', 0, '', 'n', 'n', 'o', 62),
(21, 1, 1, '404', 'y', 'webpage', '{exp:http_header status="404"}\n{embed="includes/header"}\n<div class="container">\n	<h1>You seem to have lost your way! </h1>\n	<!-- <p>Don''t worry you can head home <a href="{path=''site_index''}">here</a></p> -->\n</div>\n{embed="includes/footer"}\n', '', 1335005233, 1, 'n', 0, '', 'n', 'n', 'o', 1706),
(22, 1, 11, 'index', 'y', 'webpage', '{embed="includes/header" page="{segment_1}" page_title="Contact Us - {company_name}"}\n\n<div class="container">\n	<div class="row">\n		<div class="twelve columns">\n			<h2>We''d love to hear from you !</h2>\n		</div>\n	</div>\n	\n	<div class="row">\n		<div class="six columns">\n		\n			\n			 	\n					\n				{exp:freeform:form \n					form:class="nice custom validatingForm"\n					collection="Contact Us"\n					required="name|email"\n					return="/thankyou"\n					notify="{global:contact_email}"\n					template="mewe_notification_template"\n					send_user_email="yes"\n					user_email_template="mewe_template"  \n					}\n							\n			       \n							\n							\n							<label for="name">What''s your name?</label>\n			                <input type="text" class="input-text required" id="name" name="name" size="40" maxlength="35" />\n\n			                <label for="email">Your Email</label>\n			                <input type="text" class="input-text required email" id="email" name="email" size="40" maxlength="35" />\n\n			                <label for="subject">Subject</label>\n			                <input type="text" class="input-text required" id="subject" name="subject" size="40" />\n\n			                <label for="message">Message</label>\n			                <textarea id="message" name="message" rows="18" class="large required" >\n\n			                </textarea>\n\n			                <input type="submit" class="large black button radius black-gradient" name="submit" value="Submit" />\n\n				{/exp:freeform:form}\n	\n		</div> <!-- columns -->\n		<div class="six columns"></div>\n		\n	</div> <!-- row -->\n	\n</div>\n\n{embed="includes/footer"}', '', 1337280163, 1, 'n', 0, '', 'n', 'n', 'o', 46),
(52, 1, 15, 'index', 'y', 'webpage', '{if logged_in}\n\n	{if segment_2 != ""} \n\n		{embed="members/profile" member="{segment_2}"}\n	\n	{if:else}\n\n		{embed="members/community"}\n\n	{/if}\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n	', '', 1335955097, 1, 'n', 0, '', 'n', 'n', 'o', 414);
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`) VALUES
(54, 1, 15, 'edit_profile', 'y', 'webpage', '\n{if logged_in}\n\n	{embed="includes/header" page="edit_profile" page_title="Edit your profile"}\n	\n	<div class="container">\n\n	{exp:user:edit form:class="nice custom validatingForm" return="members/edit_profile/success" error_page="member/error" dynamic="off"}\n\n	{if segment_3 == "success"}\n		<div class="alert-box success">You''ve successfully updated your profile!</div>\n	{/if}\n\n	<h1>Edit your profile</h1>\n		\n		<div class="row profile-form">\n\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Contact Details</h4>\n\n					<p>\n						<label for="location">Where are you based?</label>\n						<input type=''text'' class="input-text required" name=''location'' value=''{location}'' maxlength=''50''/>\n					</p>\n	\n					<p>\n						<label for="url">Your Website</label>\n						<input id="url" name="url" class="input-text" type="url" value=''{url}'' maxlength=''75'' />\n					</p>\n	\n					<p>	\n						<label for="facebook">{lang:facebook:label}</label>\n						<input type=''text'' name=''facebook'' class=''input-text'' value="{facebook}" />\n					</p>	\n	\n					<p>	\n						<label for="twitter">{lang:twitter:label}</label>\n						<input type=''text'' name=''twitter'' class=''input-text'' value="{twitter}" />\n					</p>\n\n					<p>	\n						<label for="linkedin">{lang:linkedin:label}</label>\n						<input type=''text'' name=''linkedin'' class=''input-text'' value="{linkedin}" />\n					</p>\n\n				</div>\n				\n\n			\n				<div class="profile-section">	\n		\n					<h4>Profile photo</h4>\n					\n					{if photo_filename != ""}\n						{exp:ce_img:pair:member-photo src="{photo_url}{photo_filename}" max="250" crop="yes" allow_scale_larger="yes"}\n							<img src="{member-photo:made}" id="photo"/>\n						{/exp:ce_img:pair:member-photo}\n\n					{if:else}\n						<img id="photo"src="/img/default_user_photo_small.png">\n					{/if}\n					\n					\n		            <p>\n						<span id=''photo-uploader''>\n		              		<input type="button" name="upload" id="upload" value="Upload a new photo" />\n		            	</span>\n					</p>\n					\n					<div class="alert-box success">For best results upload a square photo of at least 250x250 pixels.</div>\n					\n\n					<script src="/javascripts/fileuploader.js" type="text/javascript"></script>\n				\n					<!-- This div will be replaced by Jquery with the animated progress bar -->\n					<div id="photo-progressbar"></div>\n				\n				\n					<!-- file upload script -->\n					{embed="includes/upload_script" type="photo"}\n				\n				</div>\n\n				<div class="profile-section">\n					<h4>Bio</h4>\n					<p>\n						<label for="bio">Tell us a bit about yourself</label>\n						<textarea name=''bio'' class=''textarea large'' type="text" rows="10">{bio}</textarea>\n					</p>\n	\n				</div>\n\n\n			\n			\n	\n			</div> <!-- /.columns -->\n	\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n					<h4>Your Company</h4>\n\n					<p>	\n						<label for="company_name">{lang:company_name:label}</label>\n						<input type=''text'' name=''company_name'' class=''input-text'' value="{company_name}" />\n					</p>\n	\n					<p>\n	\n					\n					<!-- \n						Because ExpressionEngine only has fields for Member Photo and Avatar, \n						We are using Avatar to store the company logo.\n					-->\n		\n					<label for="avatar_filename">Company Logo</label>\n					\n					{exp:ce_img:pair:avatar src="{avatar_url}{avatar_filename}" max="100" allow_scale_larger="yes" crop="yes"}\n						<img src="{avatar:made}" id="avatar"/>\n					{/exp:ce_img:pair:avatar}\n					\n					<p>\n						<span id=''avatar-uploader''>\n		              		<input type="button" name="avatar-upload" id="avatar-upload" value="Upload a new logo" />\n		            	</span>\n					</p>\n				\n					<!-- This div will be replaced by Jquery with the animated progress bar -->\n					<div id="avatar-progressbar"></div>\n					\n					<div class="alert-box success">For best results upload a square logo of at least 100x100 pixels.</div>\n				\n					<!-- file upload script -->\n					{embed="includes/upload_script" type="avatar"}\n					\n	\n					<p>	\n						<label for="company_address">{lang:company_address:label}</label>\n						<textarea name=''company_address'' class=''textarea large'' rows=''2'' maxlength=''200''>{company_address}</textarea>\n					</p>	\n	\n					<p>	\n						<label for="company_description">{lang:company_description:label}</label>\n						<textarea name=''company_description'' class=''textarea large''>{company_description}</textarea>\n					</p>\n	\n	\n					<p>	\n						<label for="current_projects">{lang:current_projects:label}</label>\n						<textarea name=''current_projects'' class=''textarea large''>{current_projects}</textarea>\n					</p>\n\n				</div>\n			\n				<div class="profile-section">\n	\n					<h4>Skills and Experience</h4>\n\n					<p>	\n						<label for="creative_sector">{lang:creative_sector:label}</label>\n						<select name="creative_sector"> \n						{select_creative_sector} \n						<option value="{value}" {selected}>{value}</option> \n						{/select_creative_sector} \n						</select>\n					</p>	\n\n					<p>	\n						<label for="skills">{lang:skills:label}</label>\n						<textarea name=''skills'' class=''textarea large''>{skills}</textarea>\n					</p>\n\n					<p>	\n						<label for="experience">{lang:experience:label}</label>\n						<textarea name=''experience'' class=''textarea large''>{experience}</textarea>\n					</p>	\n\n				</div>\n	\n			</div> <!-- /.columns -->\n		\n		</div> <!-- /.row -->\n\n	<input type="submit" value="Do it !" class="large black button radius black-gradient" name="submit">\n\n	\n	{/exp:user:edit}\n\n\n	</div> <!-- /container -->\n\n\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}', '', 1336506599, 1, 'n', 0, '', 'n', 'n', 'o', 1095),
(55, 1, 15, 'community', 'y', 'webpage', '{if logged_in}\n\n	{embed="includes/header" page_title="The Community - {company_name}}\n\n	<div class="container community"> \n\n			<h1>Community</h1>\n		\n			<ul class="block-grid six-up mobile community-grid">\n		\n				{exp:user:users group_id=''5'' dynamic=''off'' }\n			\n				<li>\n					<!-- link to individual member profile page -->\n					<a href="/members/{member_id}">\n						<div class="frame">\n							{if photo_filename != ""}\n								{exp:ce_img:pair:tiger src="{photo_url}{photo_filename}" max="250" crop="yes" allow_scale_larger="yes"}\n									<img src="{tiger:made}" />\n								{/exp:ce_img:pair:tiger}	\n\n							{if:else}\n								<img src="/img/default_user_photo_small.png">\n							{/if}\n							\n						</div>\n					<p class="orange-header-bar">{screen_name}</p></a>\n				</li>\n			       \n				{/exp:user:users}\n			\n			</ul>\n		\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}', '', 1336506599, 1, 'n', 0, '', 'n', 'n', 'o', 1),
(57, 1, 15, 'error', 'y', 'webpage', '{embed="includes/header" page="error" page_title="Error - {company_name}}\n\n	<div class="content">\n		<h2>{title}</h2>\n		<h3>{heading}</h3>\n		<p>{content}</p>\n		<p>{link}</p>\n	</div>\n	\n{embed="includes/footer"}', '', 1335955097, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(58, 1, 15, 'edit_account', 'y', 'webpage', '\n{if logged_in}\n\n	{embed="includes/header" page="edit_profile" page_title="Edit your account - {company_name}}\n	\n	<div class="container">\n\n	{exp:user:edit form:class="nice custom validatingForm" return="members/edit_account/success" error_page="member/error" dynamic="off"}\n\n	{if segment_3 == "success"}\n		<div class="alert-box success">You''ve successfully updated your account!</div>\n	{/if}\n\n	<h1>Edit your account</h1>\n		\n		<div class="row profile-form">\n\n			<div class="six columns">\n	\n				<div class="profile-section">\n	\n				\n					<p>\n						<label for="current_password">* Your current password is required to change your account details</label>\n						<input type=''password'' autocomplete="off" class="input-text required password" name=''current_password'' id="current_password" value='''' type="password"/>	\n					</p>\n				\n				</div>\n	\n				<div class="profile-section">\n					\n					<h4>Email address</h4>\n					\n					<p>\n						<label for="email">* Email address</label>\n						<input type=''text'' class="input-text required email" name=''email'' id="email" value=''{email}'' type="email" maxlength=''50''/>	\n					</p>\n				\n					<h4>Change Your Password</h4>\n					\n					<p>\n						<label for="new_password">New Password</label>\n						<input type=''password'' class="input-text password" name=''password'' id="password" value='''' type="password"/>	\n					</p>\n					\n					<p>\n						<label for="password_confirm">Confirm Password</label>\n						<input type=''password'' class="input-text password" name=''password_confirm'' id="password_confirm" value='''' type="password"/>\n					</p>\n				</div> <!-- profile-section -->\n\n	\n			</div> <!-- /.columns -->\n	\n			<div class="six columns">\n\n			</div> <!-- /.columns -->\n		\n		</div> <!-- /.row -->\n\n	<input type="submit" value="Do it !" class="large black button radius black-gradient" name="submit">\n\n	\n	{/exp:user:edit}\n\n\n	</div> <!-- /container -->\n\n\n\n	{embed="includes/footer"}\n\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}', '', 1335955097, 1, 'n', 0, '', 'n', 'n', 'o', 50),
(61, 1, 4, 'people_gallery', 'y', 'webpage', '{exp:channel:entries channel="about"}\n\n	{{embed:field}}\n		<li> \n			{if video != ""}\n				\n				{exp:antenna url=''{video}'' vimeo_portrait=''false'' youtube_rel=''0'' vimeo_title=''false''}\n					<div class="flex-video vimeo widescreen">{embed_code}</div>\n				{/exp:antenna}	\n\n			{if:else}\n			\n					{if photo != ""}\n					\n						{exp:ce_img:pair:mugshot src="{photo}" height="184" width="320" crop="yes" allow_scale_larger="yes"}\n							<img src="{mugshot:made}" />\n						{/exp:ce_img:pair:mugshot}\n					\n					{if:else}\n						<img src="http://lorempixel.com/200/120">\n					{/if}\n			{/if}\n\n			<!-- If the heading is below a video embed it''s given a separate class to ensure its aligned -->\n			<h3 {if video !="" }class="video_heading"{/if}>{name}</h3>\n			<p>{bio}</p>\n		\n		</li>\n		\n	{/{embed:field}}\n	\n{/exp:channel:entries}', '', 1337280163, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(62, 1, 15, 'profile', 'y', 'webpage', '\n{if logged_in}\n\n	{embed="includes/header" page_title="{exp:user:stats}{screen_name}{/exp:user:stats}"}\n\n\n	<div class="container public-profile"> \n\n		<div class="row">\n	\n			<div class="eight columns main-profile">\n		\n			{exp:user:stats}\n			<!-- Get member ID from the url segment -->\n		\n			<!-- Only show profiles for member sin the ''members'' group  (5)-->\n			{if group_id !=5 } \n				{redirect="404"} \n			{/if}\n		\n				<!-- Members profile picture and name -->\n				<div class="row">\n					<div class="six columns">\n						<div class="frame">\n							<!-- if photo -->\n							{if photo_filename != ""}\n									\n									{exp:ce_img:pair:member-photo src="{photo_url}{photo_filename}" max="250" crop="yes" allow_scale_larger="yes"}\n										<img src="{member-photo:made}" id="photo"/>\n									{/exp:ce_img:pair:member-photo}\n\n							{if:else}\n								<img src="/img/default_user_photo_small.png"/>\n							{/if}\n						</div>\n					</div>\n\n				\n					<div class="six columns">\n						<h1>{screen_name}</h1>\n						<p class="creative-sector">{creative_sector}</p>\n					</div>\n				</div> <!-- row -->\n				\n				<!-- About Me and other information -->\n				<div class="row">\n\n					<div class="twelve columns">\n					\n						<!-- network icons -->\n\n							<div class="row">\n									<div class="twelve columns">\n											{if facebook != ""}\n												<a href="{exp:valid_url}{facebook}{/exp:valid_url}" target="_blank" ><img src="/img/facebook.png" alt="facebook logo"/></a>\n											{/if}\n							\n											{if twitter != ""}\n												<a href="{exp:valid_url}{twitter}{/exp:valid_url}" target="_blank" ><img src="/img/twitter.png" alt="twitter logo"/></a>\n											{/if}\n							\n											{if linkedin != ""}\n												<a href="{exp:valid_url}{linkedin}{/exp:valid_url}" target="_blank" ><img src="/img/linkedin.png" alt="linked in logo"/></a>\n											{/if}\n									</div> <!-- columns -->\n							</div> <!-- row -->\n\n					\n				\n						<h3>About me</h3>\n						<p>{bio}</p>\n\n						<h3>Current projects</h3>\n						<p>{current_projects}</p>									\n\n					\n					\n					</div> <!-- columns -->\n\n				</div> <!-- row -->\n				\n				\n			</div> <!-- columns -->		\n										\n\n			<div class="four columns">	\n				<div class="inset rounded sidebar">\n					{if avatar_filename != "" }\n\n					{exp:ce_img:pair:avatar src="{avatar_url}{avatar_filename}" max="100" allow_scale_larger="yes" crop="yes"}\n						<img src="{avatar:made}" class="member-logo"/>\n					{/exp:ce_img:pair:avatar}\n	\n\n					{if:else}\n						<img src="http://placehold.it/100x100" class="member-logo" />\n					{/if}\n					<h3 class="company-name">{company_name}</h3>\n					<p class="contact-details">\n						{if company_address != ""}\n							{company_address}<br />\n						{/if}\n					\n						{email}</br />\n					\n						{if company_phone != ""}\n							{company_phone}<br />\n						{/if}\n					\n						{if url != ""}\n							<a href="{exp:valid_url}{url}{/exp:valid_url}" target="_blank" >{url}</a><br />\n						{/if}\n					</p>\n				\n					{if company_description != ""}\n						<h2>Business description</h2>\n						<p>{company_description}</p>\n					{/if}\n				\n					{if skills != ""}\n						<h2>Skills</h2>\n						<p>{skills}</p>\n					{/if}\n				\n					{if experience != ""}\n						<h2>Experience</h2>\n						<p>{experience}</p>\n					{/if}\n											\n				</div>\n\n			</div> <!-- columns -->\n			\n\n		</div> <!-- .row -->\n	\n\n	{/exp:user:stats}\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n	\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n\n', '', 1337366314, 1, 'n', 0, '', 'n', 'n', 'o', 55),
(63, 1, 1, 'message', 'y', 'webpage', '{embed="includes/header" page_title="{heading}" meta="{meta_refresh}"}\n\n<div class="container">\n\n	<!-- <h1>{heading}</h1> -->\n\n	{content}\n\n	<p>{link}</p>\n\n</div>\n\n{embed="includes/footer"}', '', 1335955097, 1, 'n', 0, '', 'n', 'n', 'o', 18),
(64, 1, 16, 'index', 'y', 'webpage', '<?php\n\nerror_log("Started upload script", 0);\n\n// $rootdir_staging = ''/var/www/vhosts/projoosr.com/subdomains/mewe-staging/httpdocs'';\n// $rootdir_dev = ''/Applications/MAMP/htdocs/MeWe_CMS'';\n\n$rootdir = ''{global:base_path}'';\n\n// Include the CE image class to create thumbnails \nif ( ! class_exists( ''CE_image'' ) )\n{\n	require $rootdir.''/mewemin/expressionengine/third_party/ce_img/libraries/Ce_image.php'';\n}\n\n/**\n * Handle file uploads via XMLHttpRequest\n */\nclass qqUploadedFileXhr {\n    /**\n     * Save the file to the specified path\n     * @return boolean TRUE on success\n     */\n    function save($path) {    \n        $input = fopen("php://input", "r");\n        $temp = tmpfile();\n        $realSize = stream_copy_to_stream($input, $temp);\n        fclose($input);\n        \n        if ($realSize != $this->getSize()){            \n            return false;\n        }\n        \n        $target = fopen($path, "w");        \n        fseek($temp, 0, SEEK_SET);\n        stream_copy_to_stream($temp, $target);\n        fclose($target);\n        \n        return true;\n    }\n    function getName() {\n        return $_GET[''qqfile''];\n    }\n    function getSize() {\n        if (isset($_SERVER["CONTENT_LENGTH"])){\n            return (int)$_SERVER["CONTENT_LENGTH"];            \n        } else {\n            throw new Exception(''Getting content length is not supported.'');\n        }      \n    }   \n}\n\n/**\n * Handle file uploads via regular form post (uses the $_FILES array)\n */\nclass qqUploadedFileForm {  \n    /**\n     * Save the file to the specified path\n     * @return boolean TRUE on success\n     */\n    function save($path) {\n        if(!move_uploaded_file($_FILES[''qqfile''][''tmp_name''], $path)){\n            return false;\n        }\n        return true;\n    }\n    function getName() {\n        return $_FILES[''qqfile''][''name''];\n    }\n    function getSize() {\n        return $_FILES[''qqfile''][''size''];\n    }\n}\n\nclass qqFileUploader {\n    private $allowedExtensions = array();\n    private $sizeLimit = 10485760;\n    private $file;\n\n    function __construct(array $allowedExtensions = array(), $sizeLimit = 10485760){        \n        $allowedExtensions = array_map("strtolower", $allowedExtensions);\n            \n        $this->allowedExtensions = $allowedExtensions;        \n        $this->sizeLimit = $sizeLimit;\n        \n        $this->checkServerSettings();       \n\n        if (isset($_GET[''qqfile''])) {\n            $this->file = new qqUploadedFileXhr();\n        } elseif (isset($_FILES[''qqfile''])) {\n            $this->file = new qqUploadedFileForm();\n        } else {\n            $this->file = false; \n        }\n    }\n    \n    private function checkServerSettings(){        \n        $postSize = $this->toBytes(ini_get(''post_max_size''));\n        $uploadSize = $this->toBytes(ini_get(''upload_max_filesize''));        \n        \n        if ($postSize < $this->sizeLimit || $uploadSize < $this->sizeLimit){\n            $size = max(1, $this->sizeLimit / 1024 / 1024) . ''M'';             \n            die("{''error'':''increase post_max_size and upload_max_filesize to $size''}");    \n        }        \n    }\n    \n    private function toBytes($str){\n        $val = trim($str);\n        $last = strtolower($str[strlen($str)-1]);\n        switch($last) {\n            case ''g'': $val *= 1024;\n            case ''m'': $val *= 1024;\n            case ''k'': $val *= 1024;        \n        }\n        return $val;\n    }\n    \n    /**\n     * Returns array(''success''=>true) or array(''error''=>''error message'')\n     */\n    function handleUpload($uploadDirectory, $replaceOldFile = TRUE){\n        if (!is_writable($uploadDirectory)){\n            return array(''error'' => "Server error. Upload directory isn''t writable.");\n        }\n        \n        if (!$this->file){\n            return array(''error'' => ''No files were uploaded.'');\n        }\n        \n        $size = $this->file->getSize();\n        \n        if ($size == 0) {\n            return array(''error'' => ''File is empty'');\n        }\n        \n        if ($size > $this->sizeLimit) {\n            return array(''error'' => ''File is too large'');\n        }\n        \n        $pathinfo = pathinfo($this->file->getName());\n        $filename = "{segment_2}_{exp:user:stats}{member_id}{/exp:user:stats}";\n        //$filename = md5(uniqid());\n        $ext = $pathinfo[''extension''];\n\n		\n\n        if($this->allowedExtensions && !in_array(strtolower($ext), $this->allowedExtensions)){\n            $these = implode('', '', $this->allowedExtensions);\n            return array(''error'' => ''File has an invalid extension, it should be one of ''. $these . ''.'');\n        }\n        \n        if(!$replaceOldFile){\n            /// don''t overwrite previous files that were uploaded\n            while (file_exists($uploadDirectory . $filename . ''.'' . $ext)) {\n                $filename .= rand(10, 99);\n            }\n        }\n        \n        if ($this->file->save($uploadDirectory . $filename . ''.'' . $ext)){\n            return array(''success''=>true, ''full_filename'' => $filename . ''.'' . $ext, ''upload_directory'' => $uploadDirectory );\n        } else {\n            return array(''error''=> ''Could not save uploaded file.'' .\n                ''The upload was cancelled, or server error encountered'');\n        }\n        \n    }    \n}\n\n// list of valid extensions, ex. array("jpeg", "xml", "bmp")\n$allowedExtensions = array();\n// max file size in bytes\n$sizeLimit = 10 * 1024 * 1024;\n\n$uploader = new qqFileUploader($allowedExtensions, $sizeLimit);\n\n// Check to see if the second url segment is photo or avatar and handle the upload accordingly. \n// Return an error if the segment is neither of these values.\nswitch ("{segment_2}") {\n\n	case "photo":		\n		error_log(''its a photo...''.$rootdir, 0);\n		file_put_contents(''php://stderr'',''its a photo...''.$rootdir, TRUE);\n		$result = $uploader->handleUpload($rootdir.''/images/member_photos/'');\n	break;\n	\n	case "avatar":\n		$result = $uploader->handleUpload($rootdir.''/images/avatars/'');\n	break;\n	\n	default:\n		$result = array(''error''=> ''Could not save uploaded file.'');\n	\n}\n\n\n\n// If the file uploaded okay, then we update the user''s record in the expressionengine database \n// to point to the new file.\nif ($result[''success'']) {\n	error_log(''Success, updating DB...'', 0);\n	file_put_contents(''php://stderr'', "\\n\\nUpdating database...\\n\\n", TRUE);\n	\n	/* create thumbnail */\n	\n	$settings = array();\n	\n	// Use different thumbnail settings for user photos or avatar (company logo)\n	\n	if ("{segment_2}" == "photo") {\n		$settings = array(''max'' => 250, ''crop'' => TRUE, ''allow_scale_larger'' => TRUE);\n	}\n	else if ("{segment_2}" == "avatar")	{\n		$settings = array(''max'' => 100, ''crop'' => TRUE, ''allow_scale_larger'' => TRUE);\n	} \n	\n	\n	//instantiate the class with the defined settings\n	$ce_image = new Ce_image($settings);\n	\n	//create the thumbnail\n	$ce_image->make( $result[''upload_directory''] . $result[''full_filename'']  );\n	\n	//get the location of the thumbnail\n 	$ce_image->create_tag();\n	$result["thumbnail"] = $ce_image->get_relative_path();\n	\n	// Remove the upload directory from the response\n	//$result[''upload_directory''] = "";\n\n	//close the image (free up memory)\n	$ce_image->close();\n	\n	/* Update the ee database */\n	\n	$data = array(''{segment_2}_filename'' => $result[''full_filename'']);\n\n	$sql = $this->EE->db->update_string(''exp_members'', $data, "member_id = ''{exp:user:stats}{member_id}{/exp:user:stats}''");\n\n	$this->EE->db->query($sql);\n	\n}\nelse {\n	unset($result["full_filename"]);\n	unset($result["upload_directory"]);\n	file_put_contents(''php://stderr'', "\\n\\nFailed\\n", TRUE);\n	error_log(''Failed uploading/converting image '', 0);\n	echo htmlspecialchars(json_encode($result), ENT_NOQUOTES);\n	\n}\n\n// to pass data through iframe you will need to encode all html tags\n\n// Remove unnecessary items from the reponse\nunset($result["full_filename"]);\nunset($result["upload_directory"]);\n\nerror_log(''result is''.print_r($result,true), 0);\nfile_put_contents(''php://stderr'', ''result is ''. print_r($result,true), TRUE);\necho htmlspecialchars(json_encode($result), ENT_NOQUOTES);\n\n?>', '', 1337280163, 1, 'n', 0, '', 'n', 'y', 'o', 188),
(65, 1, 4, 'upload_script', 'y', 'webpage', '<script>    \n\n$(document).ready(function() {\n	\n	// init the progress bar\n	$("#{embed:type}-progressbar").progressbar({ value: 0 });\n	\n	// set some styles on it\n	$("#{embed:type}-progressbar").css({ ''height'':''10px'' });\n	$("#{embed:type}-progressbar").css({ ''display'':''none'' });\n	$(".ui-progressbar-value").css({ ''background-image'' : ''url(/img/uploader/progress-bar.gif)'' }); \n});\n\n\nfunction create{embed:type}Uploader(){            \n    var {embed:type}_uploader = new qq.FileUploaderBasic({\n        button: document.getElementById(''{embed:type}-uploader''),\n        action: ''/uploader/{embed:type}'',\n        debug: true,\n\n		onSubmit: function(id, filename) {\n			$("#{embed:type}-progressbar").show(''slide'',''slow'');\n			$("#{embed:type}-progressbar").progressbar( "option", "value", 5 ); },\n			\n       	onProgress: function(id, filename, loaded, total) {\n            			console.log( ''Progress for file: %s, ID: %s, loaded: %s, total: %s'', \n									  id, filename, loaded, total);\n						var progress = Math.round((loaded / total) * 100)*0.95;\n						$("#{embed:type}-progressbar").progressbar("option", "value", progress+5 );	},\n						\n		onComplete: function(id, filename, responseJSON) {\n		                    console.log(''File upload for file %s, id %s done with status %s'', filename, id, responseJSON);\n		                    $("#{embed:type}-progressbar").hide(''highlight'',''slow'');\n							d = new Date();\n							if (''{embed:type}'' == "photo")\n								path="/images/member_photos";\n							else if (''{embed:type}'' == "avatar")\n								path="/images/avatars"\n\n							// Refresh the image using the newly created thumbnail\n							\n							 $("#{embed:type}").attr("src", responseJSON[''thumbnail''] + "?"+d.getTime());  \n							}\n							\n							\n		\n     });    \n}\n\n    create{embed:type}Uploader();     \n\n\n</script>', '', 1336752939, 1, 'n', 0, '', 'n', 'n', 'o', 0),
(66, 1, 15, 'resources', 'y', 'webpage', '{if logged_in}\n\n	{embed="includes/header"}\n\n	<div class="container"> \n		\n		<div class="row">\n	\n			{exp:channel:entries channel="resources"}\n			\n				<table>\n					\n					{resources_list}\n						<tr>\n							<td>\n								<h3>{name}</h3>\n								<p>{description}</p>\n								<p><a href="{url}" target="_blank">{exp:valid_url}{url}{/exp:valid_url}</a></p>\n							</td>\n							<td>\n								{if file != ""}\n									<a href="{file}" target="_blank"><img src="/img/file-icon.png" style="max-width:50%"/></a>\n								{/if}\n							</td>\n						</tr>\n					{/resources_list}\n				\n				</table>\n			\n			{/exp:channel:entries}\n\n		</div> <!-- .row -->\n\n	</div> <!-- container -->\n\n	{embed="includes/footer"}\n	\n	\n{if:else}\n\n	{redirect=''member/login''}\n\n{/if}\n\n', '', 1337366314, 1, 'n', 0, '', 'n', 'n', 'o', 19),
(67, 1, 1, 'thankyou', 'y', 'webpage', '{embed="includes/header" page="thankyou"}\n<div class="container">\n	\n	<div class="row">\n		<div class="six columns">\n			<h1>Thanks for getting in touch!</h1>\n			<p>We love to hear about new businesses and projects and respond to all enquiries personally.</p>\n			<p>Please expect an email from one of our team within the next few days!</p>\n				\n				<div class="row">\n					<div class="six columns">\n							<a class="medium black button radius black-gradient" href="/"><span>Return to the site</span></a>\n					</div>\n					<div class="six columns"></div>\n				</div>\n			\n		</div>\n		\n		<div class="six columns">\n			<img src="/img/thanks.png" class="large" />\n		</div>\n		\n	</div>\n	\n	\n\n		\n</div>\n{embed="includes/footer"}', '', 1337280163, 1, 'n', 0, '', 'n', 'n', 'o', 51),
(68, 1, 15, 'welcome_email', 'y', 'webpage', 'Welcome aboard !\n\nYou''ve now been registered as a member of the MeWe360 online community ! Your username and password are :\n\nusername: {mbr_username}\npassword: {password}\n\nWhy not login and update your online profile : \n\nhttp://www.mewe360.com/member/login\n\nThis enables you to show other members what skills and experience you have to offer. You should also change your password to something to something you can easily remember. If you have any difficulties logging or queries about your account then please drop us a line.\n\n', '', 1337280163, 1, 'n', 0, '', 'n', 'n', 'o', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups`
--

CREATE TABLE IF NOT EXISTS `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(1, 1, 'site', 1, 'y'),
(2, 1, 'news', 2, 'n'),
(4, 1, 'includes', 4, 'n'),
(5, 1, 'about', 5, 'n'),
(6, 1, 'incubator', 6, 'n'),
(7, 1, 'workspace', 7, 'n'),
(8, 1, 'membership', 8, 'n'),
(9, 1, 'events', 9, 'n'),
(10, 1, 'sign-up', 10, 'n'),
(11, 1, 'contact-us', 10, 'n'),
(15, 1, 'members', 14, 'n'),
(16, 1, 'uploader', 15, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_member_groups`
--

CREATE TABLE IF NOT EXISTS `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY  (`group_id`,`template_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY  (`template_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_throttle`
--

CREATE TABLE IF NOT EXISTS `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL auto_increment,
  `ip_address` varchar(16) NOT NULL default '0',
  `last_activity` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_no_access`
--

CREATE TABLE IF NOT EXISTS `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY  (`upload_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_upload_no_access`
--

INSERT INTO `exp_upload_no_access` (`upload_id`, `upload_loc`, `member_group`) VALUES
(1, 'cp', 6),
(2, 'cp', 5),
(3, 'cp', 5),
(4, 'cp', 5),
(5, 'cp', 5),
(6, 'cp', 5),
(7, 'cp', 5);

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs`
--

CREATE TABLE IF NOT EXISTS `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `site_id` int(4) unsigned NOT NULL default '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL default '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL default 'img',
  `max_size` varchar(16) default NULL,
  `max_height` varchar(6) default NULL,
  `max_width` varchar(6) default NULL,
  `properties` varchar(120) default NULL,
  `pre_format` varchar(120) default NULL,
  `post_format` varchar(120) default NULL,
  `file_properties` varchar(120) default NULL,
  `file_pre_format` varchar(120) default NULL,
  `file_post_format` varchar(120) default NULL,
  `cat_group` varchar(255) default NULL,
  `batch_location` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`) VALUES
(1, 1, 'News Article Images', '/home/mewe360/public_html/client_uploads/article_images/', '/client_uploads/article_images/', 'img', '1048576', '', '', '', '', '', '', '', '', '', NULL),
(2, 1, 'Past Event Photos', '/home/mewe360/public_html/client_uploads/event_photos/', '/client_uploads/event_photos/', 'img', '', '', '', '', '', '', '', '', '', '', NULL),
(3, 1, 'General Site Images', '/home/mewe360/public_html/client_uploads/site_images/', '/client_uploads/site_images/', 'img', '', '', '', '', '', '', '', '', '', '', NULL),
(4, 1, 'MeWe Staff/Team/Board Photos', '/home/mewe360/public_html/client_uploads/mewe_staff_photos/', '/client_uploads/mewe_staff_photos/', 'img', '', '', '', '', '', '', '', '', '', '', NULL),
(5, 1, 'Public Download Files', '/home/mewe360/public_html/downloads/', '/downloads/', 'all', '', '', '', '', '', '', '', '', '', '', NULL),
(6, 1, 'Videos', '/home/mewe360/public_html/client_uploads/videos/', '/client_uploads/videos/', 'all', '', '', '', '', '', '', '', '', '', '', NULL),
(7, 1, 'Sponsor Logos', '/home/mewe360/public_html/client_uploads/sponsor_logos/', '/client_uploads/sponsor_logos/', 'img', '', '', '', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_user_activation_group`
--

CREATE TABLE IF NOT EXISTS `exp_user_activation_group` (
  `member_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  KEY `member_id` (`member_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_user_authors`
--

CREATE TABLE IF NOT EXISTS `exp_user_authors` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `author_id` int(10) unsigned NOT NULL default '0',
  `entry_id` int(10) unsigned NOT NULL default '0',
  `principal` char(1) NOT NULL default 'n',
  `entry_date` int(10) NOT NULL default '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `author_id` (`author_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_user_cache`
--

CREATE TABLE IF NOT EXISTS `exp_user_cache` (
  `cache_id` int(10) unsigned NOT NULL auto_increment,
  `type` varchar(150) NOT NULL,
  `entry_date` int(10) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY  (`cache_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_user_category_posts`
--

CREATE TABLE IF NOT EXISTS `exp_user_category_posts` (
  `member_id` int(10) unsigned NOT NULL default '0',
  `cat_id` int(10) unsigned NOT NULL default '0',
  KEY `member_id` (`member_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_user_keys`
--

CREATE TABLE IF NOT EXISTS `exp_user_keys` (
  `key_id` int(10) unsigned NOT NULL auto_increment,
  `author_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `date` int(10) NOT NULL,
  `email` varchar(150) NOT NULL,
  `hash` varchar(8) NOT NULL,
  PRIMARY KEY  (`key_id`),
  KEY `email` (`email`),
  KEY `hash` (`hash`),
  KEY `author_id` (`author_id`),
  KEY `member_id` (`member_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_user_params`
--

CREATE TABLE IF NOT EXISTS `exp_user_params` (
  `params_id` int(10) unsigned NOT NULL auto_increment,
  `hash` varchar(25) NOT NULL,
  `entry_date` int(10) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY  (`params_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1202 ;

--
-- Dumping data for table `exp_user_params`
--

INSERT INTO `exp_user_params` (`params_id`, `hash`, `entry_date`, `data`) VALUES
(1201, 'LPPCuyTzgTcuEWxCJYEUZhQbc', 1337363328, 'a:11:{s:9:"member_id";i:5;s:6:"checks";s:0:"";s:13:"custom_checks";s:16:"creative_sector|";s:8:"username";s:5:"kevin";s:17:"username_override";s:0:"";s:16:"exclude_username";s:0:"";s:8:"required";s:0:"";s:8:"group_id";s:0:"";s:17:"password_required";s:0:"";s:13:"secure_action";s:2:"no";s:29:"screen_name_password_required";s:1:"y";}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_user_preferences`
--

CREATE TABLE IF NOT EXISTS `exp_user_preferences` (
  `preference_id` int(10) unsigned NOT NULL auto_increment,
  `preference_name` varchar(50) NOT NULL,
  `preference_value` text NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  PRIMARY KEY  (`preference_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `exp_user_preferences`
--

INSERT INTO `exp_user_preferences` (`preference_id`, `preference_name`, `preference_value`, `site_id`) VALUES
(1, 'email_is_username', 'n', 1),
(2, 'screen_name_override', '', 1),
(3, 'category_groups', '', 1),
(4, 'welcome_email_subject', 'Welcome Email', 1),
(5, 'welcome_email_content', '', 1),
(6, 'user_forgot_username_message', '{screen_name},\n\nPer your request, we have emailed you your username for {site_name} located at {site_url}.\n\nUsername: {username}', 1),
(7, 'member_update_admin_notification_template', '', 1),
(8, 'member_update_admin_notification_emails', '', 1),
(9, 'key_expiration', '7', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_user_search`
--

CREATE TABLE IF NOT EXISTS `exp_user_search` (
  `search_id` varchar(32) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL default '1',
  `ip_address` varchar(16) NOT NULL,
  `search_date` int(10) unsigned NOT NULL,
  `total_results` int(8) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `categories` text NOT NULL,
  `member_ids` text NOT NULL,
  `fields` text NOT NULL,
  `cfields` text NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY  (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_user_welcome_email_list`
--

CREATE TABLE IF NOT EXISTS `exp_user_welcome_email_list` (
  `member_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `email_sent` char(1) NOT NULL default 'n',
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
