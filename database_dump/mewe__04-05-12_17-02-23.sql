-- MySQL dump 10.13  Distrib 5.5.9, for osx10.6 (i386)
--
-- Host: localhost    Database: mewe
-- ------------------------------------------------------
-- Server version	5.5.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exp_accessories`
--

DROP TABLE IF EXISTS `exp_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(50) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_accessories`
--

LOCK TABLES `exp_accessories` WRITE;
/*!40000 ALTER TABLE `exp_accessories` DISABLE KEYS */;
INSERT INTO `exp_accessories` VALUES (1,'Expressionengine_info_acc','1|5','addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities','1.0');
/*!40000 ALTER TABLE `exp_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_actions`
--

DROP TABLE IF EXISTS `exp_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_actions`
--

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;
INSERT INTO `exp_actions` VALUES (1,'Comment','insert_new_comment'),(2,'Comment_mcp','delete_comment_notification'),(3,'Comment','comment_subscribe'),(4,'Comment','edit_comment'),(5,'Email','send_email'),(6,'Safecracker','submit_entry'),(7,'Safecracker','combo_loader'),(8,'Search','do_search'),(9,'Channel','insert_new_entry'),(10,'Channel','filemanager_endpoint'),(11,'Channel','smiley_pop'),(12,'Member','registration_form'),(13,'Member','register_member'),(14,'Member','activate_member'),(15,'Member','member_login'),(16,'Member','member_logout'),(17,'Member','retrieve_password'),(18,'Member','reset_password'),(19,'Member','send_member_email'),(20,'Member','update_un_pw'),(21,'Member','member_search'),(22,'Member','member_delete');
/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_captcha`
--

DROP TABLE IF EXISTS `exp_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_captcha`
--

LOCK TABLES `exp_captcha` WRITE;
/*!40000 ALTER TABLE `exp_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_categories`
--

DROP TABLE IF EXISTS `exp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_categories`
--

LOCK TABLES `exp_categories` WRITE;
/*!40000 ALTER TABLE `exp_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_field_data`
--

DROP TABLE IF EXISTS `exp_category_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_field_data`
--

LOCK TABLES `exp_category_field_data` WRITE;
/*!40000 ALTER TABLE `exp_category_field_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_fields`
--

DROP TABLE IF EXISTS `exp_category_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_fields`
--

LOCK TABLES `exp_category_fields` WRITE;
/*!40000 ALTER TABLE `exp_category_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_groups`
--

DROP TABLE IF EXISTS `exp_category_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_groups`
--

LOCK TABLES `exp_category_groups` WRITE;
/*!40000 ALTER TABLE `exp_category_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_posts`
--

DROP TABLE IF EXISTS `exp_category_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_posts`
--

LOCK TABLES `exp_category_posts` WRITE;
/*!40000 ALTER TABLE `exp_category_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data`
--

DROP TABLE IF EXISTS `exp_channel_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data`
--

LOCK TABLES `exp_channel_data` WRITE;
/*!40000 ALTER TABLE `exp_channel_data` DISABLE KEYS */;
INSERT INTO `exp_channel_data` VALUES (1,1,1,'','none','','none'),(2,1,1,'','none','','none'),(3,1,1,'',NULL,'','none'),(4,1,1,'',NULL,'','none'),(5,1,1,'',NULL,'','none'),(6,1,1,'',NULL,'','none'),(7,1,1,'',NULL,'','none'),(8,1,2,'',NULL,'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat','none');
/*!40000 ALTER TABLE `exp_channel_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_entries_autosave`
--

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_entries_autosave`
--

LOCK TABLES `exp_channel_entries_autosave` WRITE;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_fields`
--

DROP TABLE IF EXISTS `exp_channel_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_related_to` varchar(12) NOT NULL DEFAULT 'channel',
  `field_related_id` int(6) unsigned NOT NULL DEFAULT '0',
  `field_related_orderby` varchar(12) NOT NULL DEFAULT 'date',
  `field_related_sort` varchar(4) NOT NULL DEFAULT 'desc',
  `field_related_max` smallint(4) NOT NULL DEFAULT '0',
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_fields`
--

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_fields` VALUES (2,1,2,'main_copy','Main Copy','This is the main copy at the top of the about page','text','','0',0,0,'channel',1,'title','desc',0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(3,1,3,'news_excerpt','News Excerpt','Please enter a short excerpt for this article which will be displayed on the home page.','text','','0',0,0,'channel',2,'title','desc',0,6,256,'y','ltr','y','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJ5IjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=');
/*!40000 ALTER TABLE `exp_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_member_groups`
--

DROP TABLE IF EXISTS `exp_channel_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_member_groups`
--

LOCK TABLES `exp_channel_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_channel_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_titles`
--

DROP TABLE IF EXISTS `exp_channel_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` VALUES (1,1,1,1,0,NULL,'0.0.0.0','about','about','open','y',0,0,0,0,'n','n',1333615317,'n','2012','04','05',0,0,20120405105458,0,0),(2,1,1,1,0,NULL,'127.0.0.1','about','about1','open','y',0,0,0,0,'n','n',1333620261,'n','2012','04','05',0,0,20120405114322,0,0),(3,1,1,1,0,NULL,'127.0.0.1','about','about2','open','y',0,0,0,0,'n','n',1333622663,'n','2012','04','05',0,0,20120405114424,0,0),(4,1,1,1,0,NULL,'127.0.0.1','incubator','incubator','open','y',0,0,0,0,'n','n',1333624334,'n','2012','04','05',0,0,20120405121315,0,0),(5,1,1,1,0,NULL,'127.0.0.1','workspace','workspace','open','y',0,0,0,0,'n','n',1333624631,'n','2012','04','05',0,0,20120405121812,0,0),(6,1,1,1,0,NULL,'127.0.0.1','membership','membership','open','y',0,0,0,0,'n','n',1333625024,'n','2012','04','05',0,0,20120405122346,0,0),(7,1,1,1,0,NULL,'127.0.0.1','sign up','sign-up','open','y',0,0,0,0,'n','n',1333631943,'n','2012','04','05',0,0,20120405142004,0,0),(8,1,2,1,0,NULL,'127.0.0.1','News Headline','news-headline','open','y',0,0,0,0,'y','n',1333636013,'n','2012','04','05',0,0,20120405154354,0,0);
/*!40000 ALTER TABLE `exp_channel_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channels`
--

DROP TABLE IF EXISTS `exp_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(225) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `ping_return_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels`
--

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
INSERT INTO `exp_channels` VALUES (1,1,'pages','Pages','http://localhost/MeWe_CMS/','','en',7,0,1333631943,0,NULL,NULL,'open',NULL,NULL,'','n','y',NULL,'all','y','n','n','','','n','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','','n','','n',10,'','',0),(2,1,'news','MeWe News','http://localhost/MeWe_CMS/',NULL,'en',1,0,1333636013,0,NULL,NULL,'open',3,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'y',NULL,'n',10,'','',0);
/*!40000 ALTER TABLE `exp_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_comment_subscriptions`
--

DROP TABLE IF EXISTS `exp_comment_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `subscription_date` varchar(10) DEFAULT NULL,
  `notification_sent` char(1) DEFAULT 'n',
  `hash` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_comment_subscriptions`
--

LOCK TABLES `exp_comment_subscriptions` WRITE;
/*!40000 ALTER TABLE `exp_comment_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_comment_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_comments`
--

DROP TABLE IF EXISTS `exp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `url` varchar(75) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_comments`
--

LOCK TABLES `exp_comments` WRITE;
/*!40000 ALTER TABLE `exp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_cp_log`
--

DROP TABLE IF EXISTS `exp_cp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'admin','127.0.0.1',1332434777,'Logged in'),(2,1,1,'admin','0.0.0.0',1333614007,'Logged in'),(3,1,1,'admin','0.0.0.0',1333614352,'Channel Created:&nbsp;&nbsp;Pages'),(4,1,1,'admin','0.0.0.0',1333615165,'Field Group Created:&nbsp;About'),(5,1,1,'admin','127.0.0.1',1333618296,'Logged in'),(6,1,1,'admin','0.0.0.0',1333619827,'Field group Deleted:&nbsp;&nbsp;About'),(7,1,1,'admin','0.0.0.0',1333620299,'Field Group Created:&nbsp;about'),(8,1,1,'admin','127.0.0.1',1333631918,'Logged in'),(9,1,1,'admin','127.0.0.1',1333635423,'Channel Created:&nbsp;&nbsp;MeWe News'),(10,1,1,'admin','127.0.0.1',1333635485,'Field Group Created:&nbsp;news');
/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_cp_search_index`
--

DROP TABLE IF EXISTS `exp_cp_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_search_index`
--

LOCK TABLES `exp_cp_search_index` WRITE;
/*!40000 ALTER TABLE `exp_cp_search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_cp_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_developer_log`
--

DROP TABLE IF EXISTS `exp_developer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_developer_log`
--

LOCK TABLES `exp_developer_log` WRITE;
/*!40000 ALTER TABLE `exp_developer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_developer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache`
--

DROP TABLE IF EXISTS `exp_email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
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
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache`
--

LOCK TABLES `exp_email_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_mg`
--

DROP TABLE IF EXISTS `exp_email_cache_mg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache_mg`
--

LOCK TABLES `exp_email_cache_mg` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_mg` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_mg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_ml`
--

DROP TABLE IF EXISTS `exp_email_cache_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache_ml`
--

LOCK TABLES `exp_email_cache_ml` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_console_cache`
--

DROP TABLE IF EXISTS `exp_email_console_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_console_cache`
--

LOCK TABLES `exp_email_console_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_console_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_console_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_tracker`
--

DROP TABLE IF EXISTS `exp_email_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(16) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_tracker`
--

LOCK TABLES `exp_email_tracker` WRITE;
/*!40000 ALTER TABLE `exp_email_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_entry_ping_status`
--

DROP TABLE IF EXISTS `exp_entry_ping_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`ping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_entry_ping_status`
--

LOCK TABLES `exp_entry_ping_status` WRITE;
/*!40000 ALTER TABLE `exp_entry_ping_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_entry_ping_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_entry_versioning`
--

DROP TABLE IF EXISTS `exp_entry_versioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_entry_versioning`
--

LOCK TABLES `exp_entry_versioning` WRITE;
/*!40000 ALTER TABLE `exp_entry_versioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_entry_versioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_extensions`
--

DROP TABLE IF EXISTS `exp_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_extensions`
--

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;
INSERT INTO `exp_extensions` VALUES (1,'Safecracker_ext','form_declaration_modify_data','form_declaration_modify_data','',10,'2.1','y');
/*!40000 ALTER TABLE `exp_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field_formatting`
--

DROP TABLE IF EXISTS `exp_field_formatting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_formatting`
--

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;
INSERT INTO `exp_field_formatting` VALUES (4,2,'none'),(5,2,'br'),(6,2,'xhtml'),(7,3,'none'),(8,3,'br'),(9,3,'xhtml');
/*!40000 ALTER TABLE `exp_field_formatting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field_groups`
--

DROP TABLE IF EXISTS `exp_field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_groups`
--

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
INSERT INTO `exp_field_groups` VALUES (2,1,'about'),(3,1,'News');
/*!40000 ALTER TABLE `exp_field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_fieldtypes`
--

DROP TABLE IF EXISTS `exp_fieldtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_fieldtypes`
--

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;
INSERT INTO `exp_fieldtypes` VALUES (1,'select','1.0','YTowOnt9','n'),(2,'text','1.0','YTowOnt9','n'),(3,'textarea','1.0','YTowOnt9','n'),(4,'date','1.0','YTowOnt9','n'),(5,'file','1.0','YTowOnt9','n'),(6,'multi_select','1.0','YTowOnt9','n'),(7,'checkboxes','1.0','YTowOnt9','n'),(8,'radio','1.0','YTowOnt9','n'),(9,'rel','1.0','YTowOnt9','n');
/*!40000 ALTER TABLE `exp_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_categories`
--

DROP TABLE IF EXISTS `exp_file_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_categories`
--

LOCK TABLES `exp_file_categories` WRITE;
/*!40000 ALTER TABLE `exp_file_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_dimensions`
--

DROP TABLE IF EXISTS `exp_file_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_dimensions`
--

LOCK TABLES `exp_file_dimensions` WRITE;
/*!40000 ALTER TABLE `exp_file_dimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_watermarks`
--

DROP TABLE IF EXISTS `exp_file_watermarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_watermarks`
--

LOCK TABLES `exp_file_watermarks` WRITE;
/*!40000 ALTER TABLE `exp_file_watermarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_watermarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_files`
--

DROP TABLE IF EXISTS `exp_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_files`
--

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_global_variables`
--

DROP TABLE IF EXISTS `exp_global_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_global_variables`
--

LOCK TABLES `exp_global_variables` WRITE;
/*!40000 ALTER TABLE `exp_global_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_global_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_html_buttons`
--

DROP TABLE IF EXISTS `exp_html_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_html_buttons`
--

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;
INSERT INTO `exp_html_buttons` VALUES (1,1,0,'b','<strong>','</strong>','b',1,'1','btn_b'),(2,1,0,'i','<em>','</em>','i',2,'1','btn_i'),(3,1,0,'blockquote','<blockquote>','</blockquote>','q',3,'1','btn_blockquote'),(4,1,0,'a','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','btn_a'),(5,1,0,'img','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','btn_img');
/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_layout_publish`
--

DROP TABLE IF EXISTS `exp_layout_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_layout_publish`
--

LOCK TABLES `exp_layout_publish` WRITE;
/*!40000 ALTER TABLE `exp_layout_publish` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_layout_publish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_bulletin_board`
--

DROP TABLE IF EXISTS `exp_member_bulletin_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_bulletin_board`
--

LOCK TABLES `exp_member_bulletin_board` WRITE;
/*!40000 ALTER TABLE `exp_member_bulletin_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_bulletin_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_data`
--

DROP TABLE IF EXISTS `exp_member_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_data`
--

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;
INSERT INTO `exp_member_data` VALUES (1);
/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_fields`
--

DROP TABLE IF EXISTS `exp_member_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_fields`
--

LOCK TABLES `exp_member_fields` WRITE;
/*!40000 ALTER TABLE `exp_member_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_groups`
--

DROP TABLE IF EXISTS `exp_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_admin_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_groups`
--

LOCK TABLES `exp_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_member_groups` DISABLE KEYS */;
INSERT INTO `exp_member_groups` VALUES (1,1,'Super Admins','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','','y','y','y',0,'y',20,60,'y','y','y','y','y'),(2,1,'Banned','','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',60,'n',20,60,'n','n','n','n','n'),(3,1,'Guests','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(4,1,'Pending','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(5,1,'Members','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','y','n','','y','n','y',10,'y',20,60,'y','n','n','y','y');
/*!40000 ALTER TABLE `exp_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_homepage`
--

DROP TABLE IF EXISTS `exp_member_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_homepage`
--

LOCK TABLES `exp_member_homepage` WRITE;
/*!40000 ALTER TABLE `exp_member_homepage` DISABLE KEYS */;
INSERT INTO `exp_member_homepage` VALUES (1,'l',1,'l',2,'n',0,'r',1,'n',0,'r',2,'r',0,'l',0);
/*!40000 ALTER TABLE `exp_member_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_search`
--

DROP TABLE IF EXISTS `exp_member_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_search`
--

LOCK TABLES `exp_member_search` WRITE;
/*!40000 ALTER TABLE `exp_member_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_members`
--

DROP TABLE IF EXISTS `exp_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_comments` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(8) NOT NULL,
  `daylight_savings` char(1) NOT NULL DEFAULT 'n',
  `localization_is_site_default` char(1) NOT NULL DEFAULT 'n',
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '20',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_members`
--

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;
INSERT INTO `exp_members` VALUES (1,1,'admin','Administrator','b85218ab9442fae496bc192cffe480c942e7cce1bf7fa05a79ca5f2f39fcae01da66caa339289a6f7ddb6a8180e97a2d4556a7a9c846e2c1bb002f7c61f30a68','J2-d%x1\"3qHVK!\"-1Xb?KvN;a:JVcA[]1dR\"CxYW7`q_d9IZ.&^lH!a-d\"dPKbVnTzyC2YT!v|kbiaMPP\'}bV)9|x5S!\'$|V9#{khbh!+[]an9]6z{#F^{Pl%8KL`r\'(','e6383410a67ec1a6ba095d0a0f00561963b17dd3','5b27c318272bbcd2fa443c194542f0fbc22cc790',NULL,'marc@langsman.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'127.0.0.1',1332434213,1333626037,1333640801,8,0,0,0,1333636068,0,0,0,'n','y','y','y','y','y','y','y','y','english','UTC','y','n','us',NULL,NULL,NULL,NULL,'20',NULL,'18','','Pages|index.php?S=435749ed7c6eaed9fd1b3703a306c0b48ed90769&amp;D=cp&amp;C=addons_modules&M=show_module_cp&module=pages|1\nTemplate Manager|index.php?S=435749ed7c6eaed9fd1b3703a306c0b48ed90769&amp;D=cp&amp;C=design&M=manager|2\nChannel Fields|index.php?S=647d5411e9a344da653795a21c7454256b07dd9f&amp;D=cp&amp;C=admin_content&M=field_group_management|3','n',0);
/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_attachments`
--

DROP TABLE IF EXISTS `exp_message_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_attachments`
--

LOCK TABLES `exp_message_attachments` WRITE;
/*!40000 ALTER TABLE `exp_message_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_copies`
--

DROP TABLE IF EXISTS `exp_message_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_copies`
--

LOCK TABLES `exp_message_copies` WRITE;
/*!40000 ALTER TABLE `exp_message_copies` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_data`
--

DROP TABLE IF EXISTS `exp_message_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_data`
--

LOCK TABLES `exp_message_data` WRITE;
/*!40000 ALTER TABLE `exp_message_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_folders`
--

DROP TABLE IF EXISTS `exp_message_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_folders`
--

LOCK TABLES `exp_message_folders` WRITE;
/*!40000 ALTER TABLE `exp_message_folders` DISABLE KEYS */;
INSERT INTO `exp_message_folders` VALUES (1,'InBox','Sent','','','','','','','','');
/*!40000 ALTER TABLE `exp_message_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_listed`
--

DROP TABLE IF EXISTS `exp_message_listed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_listed`
--

LOCK TABLES `exp_message_listed` WRITE;
/*!40000 ALTER TABLE `exp_message_listed` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_listed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_module_member_groups`
--

DROP TABLE IF EXISTS `exp_module_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_module_member_groups`
--

LOCK TABLES `exp_module_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_module_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_module_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_modules`
--

DROP TABLE IF EXISTS `exp_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_modules`
--

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;
INSERT INTO `exp_modules` VALUES (1,'Comment','2.2','y','n'),(2,'Email','2.0','n','n'),(3,'Emoticon','2.0','n','n'),(4,'File','1.0.0','n','n'),(5,'Jquery','1.0','n','n'),(6,'Pages','2.2','y','y'),(7,'Query','2.0','n','n'),(8,'Rss','2.0','n','n'),(9,'Safecracker','2.1','y','n'),(10,'Search','2.1','n','n'),(11,'Channel','2.0.1','n','n'),(12,'Member','2.1','n','n'),(13,'Stats','2.0','n','n');
/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_online_users`
--

DROP TABLE IF EXISTS `exp_online_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_online_users`
--

LOCK TABLES `exp_online_users` WRITE;
/*!40000 ALTER TABLE `exp_online_users` DISABLE KEYS */;
INSERT INTO `exp_online_users` VALUES (1,1,1,'n','Administrator','127.0.0.1',1333640938,''),(2,1,1,'n','Administrator','127.0.0.1',1333640938,''),(5,1,1,'n','Administrator','127.0.0.1',1333640938,''),(6,1,1,'n','Administrator','127.0.0.1',1333640938,''),(7,1,1,'n','Administrator','127.0.0.1',1333640938,''),(8,1,1,'n','Administrator','127.0.0.1',1333640938,''),(9,1,1,'n','Administrator','127.0.0.1',1333640938,''),(10,1,1,'n','Administrator','127.0.0.1',1333640938,'');
/*!40000 ALTER TABLE `exp_online_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_pages_configuration`
--

DROP TABLE IF EXISTS `exp_pages_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_pages_configuration` (
  `configuration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `configuration_name` varchar(60) NOT NULL,
  `configuration_value` varchar(100) NOT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_pages_configuration`
--

LOCK TABLES `exp_pages_configuration` WRITE;
/*!40000 ALTER TABLE `exp_pages_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_pages_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_password_lockout`
--

DROP TABLE IF EXISTS `exp_password_lockout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_password_lockout`
--

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_password_lockout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_ping_servers`
--

DROP TABLE IF EXISTS `exp_ping_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL DEFAULT '80',
  `ping_protocol` varchar(12) NOT NULL DEFAULT 'xmlrpc',
  `is_default` char(1) NOT NULL DEFAULT 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_ping_servers`
--

LOCK TABLES `exp_ping_servers` WRITE;
/*!40000 ALTER TABLE `exp_ping_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_ping_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_relationships`
--

DROP TABLE IF EXISTS `exp_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_relationships` (
  `rel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `rel_parent_id` int(10) NOT NULL DEFAULT '0',
  `rel_child_id` int(10) NOT NULL DEFAULT '0',
  `rel_type` varchar(12) NOT NULL,
  `rel_data` mediumtext NOT NULL,
  `reverse_rel_data` mediumtext NOT NULL,
  PRIMARY KEY (`rel_id`),
  KEY `rel_parent_id` (`rel_parent_id`),
  KEY `rel_child_id` (`rel_child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_relationships`
--

LOCK TABLES `exp_relationships` WRITE;
/*!40000 ALTER TABLE `exp_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_remember_me`
--

DROP TABLE IF EXISTS `exp_remember_me`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(16) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_remember_me`
--

LOCK TABLES `exp_remember_me` WRITE;
/*!40000 ALTER TABLE `exp_remember_me` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_remember_me` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_reset_password`
--

DROP TABLE IF EXISTS `exp_reset_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_reset_password`
--

LOCK TABLES `exp_reset_password` WRITE;
/*!40000 ALTER TABLE `exp_reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_revision_tracker`
--

DROP TABLE IF EXISTS `exp_revision_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_revision_tracker`
--

LOCK TABLES `exp_revision_tracker` WRITE;
/*!40000 ALTER TABLE `exp_revision_tracker` DISABLE KEYS */;
INSERT INTO `exp_revision_tracker` VALUES (1,1,'exp_templates','template_data',1332436401,1,''),(2,1,'exp_templates','template_data',1332436403,1,''),(3,2,'exp_templates','template_data',1332436446,1,''),(4,4,'exp_templates','template_data',1333614807,1,''),(5,4,'exp_templates','template_data',1333616189,1,'<!DOCTYPE html>\n\n<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->\n<!--[if lt IE 7]> <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\" lang=\"en\"> <![endif]-->\n<!--[if IE 7]>    <html class=\"no-js lt-ie9 lt-ie8\" lang=\"en\"> <![endif]-->\n<!--[if IE 8]>    <html class=\"no-js lt-ie9\" lang=\"en\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\" lang=\"en\"> <!--<![endif]-->\n<head>\n	<meta charset=\"utf-8\" />\n\n	<!-- Set the viewport width to device width for mobile -->\n	<meta name=\"viewport\" content=\"width=device-width\" />\n\n	<title>Welcome to MeWe</title>\n  \n	<!-- Included CSS Files -->\n	<!-- Combine and Compress These CSS Files -->\n	<link rel=\"stylesheet\" href=\"stylesheets/globals.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/typography.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/grid.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/ui.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/forms.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/orbit.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/reveal.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/mobile.css\">\n	\n	<!-- End Combine and Compress These CSS Files -->\n	<link rel=\"stylesheet\" href=\"stylesheets/app.css\">\n\n	<!--[if lt IE 9]>\n		<link rel=\"stylesheet\" href=\"stylesheets/ie.css\">\n	<![endif]-->\n	\n	<!-- Non framework custom CSS -->\n	<link rel=\"stylesheet\" href=\"stylesheets/custom.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/about-us.css\">\n	\n	<!-- Google Webfonts -->\n	<link rel=\"stylesheet\" type=\"text/css\" href=\"http://fonts.googleapis.com/css?family=Candara\">\n	\n	<script src=\"javascripts/modernizr.foundation.js\"></script>\n\n\n	<!-- IE Fix for HTML5 Tags -->\n	<!--[if lt IE 9]>\n		<script src=\"http://html5shiv.googlecode.com/svn/trunk/html5.js\"></script>\n	<![endif]-->\n	\n	<script type=\'text/javascript\'>\n	(function (d, t) {\n	  var bh = d.createElement(t), s = d.getElementsByTagName(t)[0];\n	  bh.type = \'text/javascript\';\n	  bh.src = \'//www.bugherd.com/sidebarv2.js?apikey=da8da014-e25b-4041-b791-25f3100fa3c8\';\n	  s.parentNode.insertBefore(bh, s);\n	  })(document, \'script\');\n	</script>\n\n</head>\n\n<body>\n		\n		<div id=\"top-background\">\n			<div id=\"background\">\n				<div id=\"header\">\n				\n					<div class=\"row\" id=\"branding\">\n							<div class=\"twelve columns\">\n									<img src=\"img/Logo.png\" alt=\"Mewe Logo\" />\n							</div>\n							\n							<ul class=\"secondary-nav hide-on-phones shadow\">\n								<li><a href=\"#\">Login</a></li>\n								<li><a href=\"sign-up.html\" class=\"alternate\">Join Up</a></li>\n							</ul>\n					</div>\n\n					<div class=\"row\" id=\"masthead\" >\n						<div class=\"twelve columns\" >\n								<ul class=\"nav-bar hide-on-phones\" id=\"primary-nav\">\n									<li><a href=\"index.html\" class=\"main\"><span>Home</span></a></li>\n									<li class=\"selected\"> <a href=\"about-us.html\" class=\"main\">About</a></li>\n									<li> <a href=\"incubator.html\" class=\"main\">Incubator</a></li>\n									<li> <a href=\"workspace.html\" class=\"main\">Workspace</a></li>\n									<li> <a href=\"events.html\" class=\"main\">Events</a></li>\n									<li> <a href=\"membership.html\" class=\"main\">Membership</a></li>\n									<li> <a href=\"news.html\" class=\"main\">News</a></li>\n									<li class=\"hub has-flyout\">\n										<a href=\"#\" class=\"main\">Hub</a>\n										<div class=\"flyout\" style=\"display: none;\">\n											<ul>\n												<li><a href=\"profile.html\" class=\"main\">Profile</a></li>\n												<li><a href=\"community.html\" class=\"main\">Community</a></li>\n												<li><a href=\"#\" class=\"main\">Resources</a></li>\n											</ul>\n										</div>\n									</li>\n								</ul>\n						</div>\n					</div>\n				\n				</div> <!-- #header -->\n\n			\n				<div class=\"container\"> \n				\n					<div class=\"row\">\n						<div class=\"twelve columns\">\n							<h1>A new development house for ambitious and talented creative entrepreneurs</h1>\n						</div>\n					</div> <!-- row -->\n					\n					<div class=\"row top-section\">\n						\n						<div class=\"six columns\">\n							<div class=\"frame\">\n								<img src=\"http://lorempixel.com/450/250\"/>\n							</div>\n						</div> <!-- columns -->\n								\n							\n\n						<div class=\"six columns\">	\n							<p>We are a new type of development house for the arts and creative industries. We identify and develop “untapped” talent from the UK’s arts and creative sector and incubate associated new businesses.</p>  \n							<p>Through our incubator and venture fund we are investing £1 million in our network of entrepreneurs to provide:  finance, business and leadership expertise, wider networks and work space to help them realise their ambitions. Through this work we support creativity, leadership and wider social change. </p>\n							<p>We are based in “Grade A” offices near Piccadilly Circus in central London.</p>\n							<a class=\"medium black button radius black-gradient\" href=\"#\"><span>Join us today</span></a>\n						</div> <!-- columns -->\n							\n			\n					</div> <!-- .row -->\n					\n					\n					<div class=\"row\">\n						<div class=\"twelve columns\">\n							<h2>Why MeWe?</h2>\n\n							<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n							<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>\n\n							<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit,</p>\n\n							<h2>How we work...</h2>\n\n							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n\n							<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\n\n							<h2>Why join?</h2>\n\n							<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n\n							<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatisaccusantium doloremque laudantium, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,</p>\n				\n						</div> <!-- columns -->\n					</div> <!-- row -->\n					\n					<div class=\"row people-section\">\n						<div class=\"twelve columns\">\n							<dl class=\"tabs\">\n							  <dd><a href=\"#simple1\" class=\"active\">The Team</a></dd>\n							  <dd><a href=\"#simple2\">The Board</a></dd>\n							  <dd><a href=\"#simple3\">Advisors</a></dd>\n							</dl>\n\n							<ul class=\"tabs-content\">\n								\n								<li class=\"active\" id=\"simple1Tab\">\n									<div class=\"container\">\n										<p>Our team looks after MeWe’s members and keeps our events and workspace running smoothly.</p>\n										<ul class=\"block-grid four-up\">\n											<li>\n												<img src=\"http://lorempixel.com/200/120\">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src=\"http://lorempixel.com/200/120\">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src=\"http://lorempixel.com/200/120\">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n									\n											<li>\n												<img src=\"http://lorempixel.com/200/120\">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n										</ul>\n									</div>\n								</li>\n							  	\n							<li id=\"simple2Tab\">\n									<div class=\"container\">\n										<p>The board creates MeWe’s strategy to ensure that members are offered the most innovative and cutting-edge services for their businesses.</p>\n										<ul class=\"block-grid four-up\">\n											<li>\n												<img src=\"http://lorempixel.com/200/120/people/6\">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src=\"http://lorempixel.com/200/120/people/9\">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src=\"http://lorempixel.com/200/120/people/6\">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n\n											<li>\n												<img src=\"http://lorempixel.com/200/120/people/9\">\n												<h3>Team Member</h3>\n												<p>We are a new type of development house for the arts and creative industries.</p>\n											</li>\n										</ul>\n									</div>\n								\n								</li>\n								<li id=\"simple3Tab\">\n										<div class=\"container\">\n											\n											<p>From heads of leading media organisations to captains of creative industry, our advisors offer members invaluable one-to-one business coaching.</p>\n											\n											<ul class=\"block-grid four-up\">\n												<li>\n													<img src=\"http://placehold.it/200x120\">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src=\"http://placehold.it/200x120\">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src=\"http://placehold.it/200x120\">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n\n												<li>\n													<img src=\"http://placehold.it/200x120\">\n													<h3>Team Member</h3>\n													<p>We are a new type of development house for the arts and creative industries.</p>\n												</li>\n											</ul>\n										</div>\n\n									</li>\n							\n						\n							</ul>\n		\n						</div>\n					</div>\n					\n\n				</div> <!-- container -->\n\n				<div class=\"sponsors\">\n					<div class=\"row\">\n						<div class=\"twelve columns\"><img src=\"img/sponsors.png\" alt=\"Our Sponsors\" /></div>\n					</div>\n				</div>\n		\n				<div id=\"footer\">\n			\n					<div class=\"row\">\n						<div class=\"three columns\">\n							<h3>Find Us</h3>\n							<div class=\"container\">\n								<img class=\"map\" src=\"img/map.png\" />\n							</div>\n						</div>\n						<div class=\"three columns\">\n							<h3>Get in touch</h3>\n							<div class=\"container\">\n								<p>MeWe Foundation<br />Golden Square<br />London, W1 123<br /><br />020 7123 4567<br /><a href=\"mailto:info@mewe.com\">info@mewe.com</a></p>\n							</div>\n						</div>\n						\n						<div class=\"three columns networks\">\n							<h3>Networks</h3>\n							<div class=\"container\">\n								<ul>\n									<li><a href=\"#\"><img src=\"img/twitter.png\" />Twitter</a></li>\n									<li><a href=\"#\"><img src=\"img/facebook.png\" />Facebook</a></li>\n									<li><a href=\"#\"><img src=\"img/linkedin.png\" />LinkedIn</a></li>\n								</ul>\n							</div>\n						</div>\n						<div class=\"three columns feedback\">\n							<h3>Feedback</h3>\n							<div class=\"container\">\n								<p>We’re always looking to improve what we do. If you have feedback we\'d love to hear from you!</p>\n								<a href=\"#\" class=\"medium radius button black-gradient\">Get in touch</a>\n							</div>\n						</div>\n					</div>	\n				\n				\n				</div> <!-- .footer -->\n				\n				</div> <!-- #background -->\n		</div> <!-- #top-background -->\n\n\n\n	<!-- Included JS Files -->\n	<script src=\"javascripts/jquery.min.js\"></script>\n	<!-- Combine and Compress These JS Files -->\n	<script src=\"javascripts/jquery.reveal.js\"></script>\n	<script src=\"javascripts/jquery.orbit-1.4.0.js\"></script>\n	<script src=\"javascripts/jquery.customforms.js\"></script>\n	<script src=\"javascripts/jquery.placeholder.min.js\"></script>\n	<script src=\"javascripts/jquery.tooltips.js\"></script>\n	<!-- End Combine and Compress These JS Files -->\n	<script src=\"javascripts/app.js\"></script>\n	\n\n	\n	<!-- Live Reload Code -->\n	<script>document.write(\'<script src=\"http://\' + (location.host || \'localhost\').split(\':\')[0] + \':35729/livereload.js?snipver=1\"></\' + \'script>\')</script>\n\n</body>\n</html>'),(6,1,'exp_templates','template_data',1333616189,1,'<!DOCTYPE html>\n\n<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->\n<!--[if lt IE 7]> <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\" lang=\"en\"> <![endif]-->\n<!--[if IE 7]>    <html class=\"no-js lt-ie9 lt-ie8\" lang=\"en\"> <![endif]-->\n<!--[if IE 8]>    <html class=\"no-js lt-ie9\" lang=\"en\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\" lang=\"en\"> <!--<![endif]-->\n<head>\n	<meta charset=\"utf-8\" />\n\n	<!-- Set the viewport width to device width for mobile -->\n	<meta name=\"viewport\" content=\"width=device-width\" />\n\n	<title>Welcome to MeWe</title>\n  \n	<!-- Included CSS Files -->\n	<!-- Combine and Compress These CSS Files -->\n	<link rel=\"stylesheet\" href=\"stylesheets/globals.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/typography.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/grid.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/ui.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/forms.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/orbit.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/reveal.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/mobile.css\">\n	\n	<!-- End Combine and Compress These CSS Files -->\n	<link rel=\"stylesheet\" href=\"stylesheets/app.css\">\n\n	<!--[if lt IE 9]>\n		<link rel=\"stylesheet\" href=\"stylesheets/ie.css\">\n	<![endif]-->\n	\n	<!-- Non framework custom CSS -->\n	<link rel=\"stylesheet\" href=\"stylesheets/custom.css\">\n	\n	<!-- Google Webfonts -->\n	<link rel=\"stylesheet\" type=\"text/css\" href=\"http://fonts.googleapis.com/css?family=Candara\">\n	\n	<script src=\"javascripts/modernizr.foundation.js\"></script>\n\n\n	<!-- IE Fix for HTML5 Tags -->\n	<!--[if lt IE 9]>\n		<script src=\"http://html5shiv.googlecode.com/svn/trunk/html5.js\"></script>\n	<![endif]-->\n	\n	<script type=\'text/javascript\'>\n	(function (d, t) {\n	  var bh = d.createElement(t), s = d.getElementsByTagName(t)[0];\n	  bh.type = \'text/javascript\';\n	  bh.src = \'//www.bugherd.com/sidebarv2.js?apikey=da8da014-e25b-4041-b791-25f3100fa3c8\';\n	  s.parentNode.insertBefore(bh, s);\n	  })(document, \'script\');\n	</script>\n\n</head>\n\n<body>\n		\n		<div id=\"top-background\">\n			<div id=\"background\">\n				<div id=\"header\">\n\n					<div class=\"row\" id=\"branding\">\n							<div class=\"twelve columns\">\n									<img src=\"img/Logo.png\" alt=\"Mewe Logo\" />\n							</div>\n							\n							<ul class=\"secondary-nav hide-on-phones shadow\">\n								<li><a href=\"#\">Login</a></li>\n								<li><a href=\"sign-up.html\" class=\"alternate\">Join Up</a></li>\n							</ul>\n					</div>\n\n					<div class=\"row\" id=\"masthead\" >\n						<div class=\"twelve columns\" >\n								<ul class=\"nav-bar hide-on-phones\" id=\"primary-nav\">\n									<li class=\"selected\"><a href=\"index.html\" class=\"main\"><span>Home</span></a></li>\n									<li> <a href=\"about-us.html\" class=\"main\">About</a></li>\n									<li> <a href=\"incubator.html\" class=\"main\">Incubator</a></li>\n									<li> <a href=\"workspace.html\" class=\"main\">Workspace</a></li>\n									<li> <a href=\"events.html\" class=\"main\">Events</a></li>\n									<li> <a href=\"membership.html\" class=\"main\">Membership</a></li>\n									<li> <a href=\"news.html\" class=\"main\">News</a></li>\n									<li class=\"hub has-flyout\">\n										<a href=\"#\" class=\"main\">Hub</a>\n										<div class=\"flyout\" style=\"display: none;\">\n											<ul>\n												<li><a href=\"profile.html\" class=\"main\">Profile</a></li>\n												<li><a href=\"community.html\" class=\"main\">Community</a></li>\n												<li><a href=\"#\" class=\"main\">Resources</a></li>\n											</ul>\n										</div>\n									</li>\n								</ul>\n						</div>\n					</div>\n				\n				</div> <!-- #header -->\n\n			\n				<div class=\"container\"> \n\n					<div class=\"row\" id=\'topSection\'>\n\n						<div class=\"six columns push-six\" id=\"straplineArea\">\n								<div class=\"cta-container\">\n									<h1>We provide access to the best <a>funding</a>, <a>mentoring</a> and <a>incubation</a> to propel your creative business.</h1>\n									<a class=\"huge button black radius black-gradient hide-on-phones\" href=\"#\"><span>Join today</span></a>\n								</div>\n						</div> <!-- #straplineArea -->\n\n						<div class=\"six columns pull-six\" id=\'carousel\'>\n								\n								<div class=\"frame\">\n									     <img src=\"img/carousel/5.jpg\"/>\n								</div> <!-- carousel-container -->\n					\n				\n						</div> <!-- #carousel -->\n			\n				\n					</div> <!-- #topSection -->\n			\n					<div class=\"row services\">\n				\n							<div class=\"quarter columns\">\n								<div class=\"service rounded\">\n										<h2>Incubator</h2>\n									<img src=\"img/workspace.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>Fund your business</span></a>\n								</div> <!-- panel -->\n							</div>				\n				\n							<div class=\"quarter columns\">				\n								<div class=\"service rounded\">\n									<h2>Workspace</h2>\n									<img src=\"img/workspace.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>See the workspace</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class=\"quarter columns\">					\n								<div class=\"service rounded\">\n									<h2>Events</h2>\n									<img src=\"img/events.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>Come to an event</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class=\"quarter columns\">				\n								<div class=\"service rounded\">\n									<h2>Consulting</h2>\n									<img src=\"img/consulting.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>Find out more</span></a>\n								</div> <!-- panel -->\n							</div>\n\n\n					</div><!-- #services-->\n				\n\n					<div class=\"row\" id=\"news-area\">\n					\n						<div class=\"seven columns\">\n						\n							<h2>Latest news</h2>\n\n								<div class=\"row\">\n									<div class=\"three columns\">\n									\n										<div class=\"flex-video vimeo\">\n											<iframe src=\"http://player.vimeo.com/video/30995060?title=0&amp;byline=0&amp;portrait=0&amp;color=ffffff\" width=\"128\" height=\"80\" frameborder=\"0\"></iframe>\n										</div>\n									\n									</div> <!-- .six columns -->\n\n									<div class=\"nine columns\">\n										<div class=\"news-article\">\n											<header>\n												<h3 class=\"news-heading\">Headline</h3>\n												<p><span class=\"date\">19th February 2027</span> by Kevin <span class=\"comments\">3 comments</span></p>\n											</header>	\n											<p class=\"excerpt\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat... </p>\n										</div> <!-- .news-article -->\n									</div>\n								\n								</div> <!-- .row -->\n					\n\n\n						</div> <!-- .seven columns-->\n\n						<div class=\"five columns\">	\n							<h2>Upcoming events</h2>\n							<div class=\"row event\">\n								<div class=\"three columns\">\n										<div class=\"date-box\">\n											<p class=\"month\">MAR</p>\n											<p class=\"day\">25</p>\n										</div> <!-- date-box -->\n								</div>\n								<div class=\"nine columns\">\n									<div class=\"event-details\">\n										<h3 class=\"event-heading\">Networking Event</h3>\n										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>\n									</div> <!-- date- -->	\n								</div>\n							</div>\n		\n						</div> <!-- sidebar -->\n							\n			\n					</div> <!-- #news-area -->\n\n				</div> <!-- container -->\n\n				<div class=\"sponsors\">\n					<div class=\"row\">\n						<div class=\"twelve columns\"><img src=\"img/sponsors.png\" alt=\"Our Sponsors\" /></div>\n					</div>\n				</div>\n		\n				<div id=\"footer\">\n			\n					<div class=\"row\">\n						<div class=\"three columns\">\n							<h3>Find Us</h3>\n							<div class=\"container\">\n								<img class=\"map\" src=\"img/map.png\" />\n							</div>\n						</div>\n						<div class=\"three columns\">\n							<h3>Get in touch</h3>\n							<div class=\"container\">\n								<p>MeWe Foundation<br />Golden Square<br />London, W1 123<br /><br />020 7123 4567<br /><a href=\"mailto:info@mewe.com\">info@mewe.com</a></p>\n							</div>\n						</div>\n						\n						<div class=\"three columns networks\">\n							<h3>Networks</h3>\n							<div class=\"container\">\n								<ul>\n									<li><a href=\"#\"><img src=\"img/twitter.png\" />Twitter</a></li>\n									<li><a href=\"#\"><img src=\"img/facebook.png\" />Facebook</a></li>\n									<li><a href=\"#\"><img src=\"img/linkedin.png\" />LinkedIn</a></li>\n								</ul>\n							</div>\n						</div>\n						<div class=\"three columns feedback\">\n							<h3>Feedback</h3>\n							<div class=\"container\">\n								<p>We’re always looking to improve what we do. If you have feedback we\'d love to hear from you!</p>\n								<a href=\"#\" class=\"medium radius button black-gradient\">Get in touch</a>\n							</div>\n						</div>\n					</div>	\n				\n				\n				</div> <!-- .footer -->\n				\n				</div> <!-- #background -->\n		</div> <!-- #top-background -->\n\n\n\n	<!-- Included JS Files -->\n	<script src=\"javascripts/jquery.min.js\"></script>\n	<!-- Combine and Compress These JS Files -->\n	<script src=\"javascripts/jquery.reveal.js\"></script>\n	<script src=\"javascripts/jquery.orbit-1.4.0.js\"></script>\n	<script src=\"javascripts/jquery.customforms.js\"></script>\n	<script src=\"javascripts/jquery.placeholder.min.js\"></script>\n	<script src=\"javascripts/jquery.tooltips.js\"></script>\n	<!-- End Combine and Compress These JS Files -->\n	<script src=\"javascripts/app.js\"></script>\n	\n	<!-- MeWe Custom JS -->\n	<!-- <script src=\"javascripts/custom.js\"></script> -->\n	\n	<script type=\"text/javascript\">\n	//     $(window).load(function() {\n	  //       $(\'#featured\').orbit({directionalNav: false, timer: false});\n	  //   });\n	</script>\n	\n	<!-- Live Reload Code -->\n	<script>document.write(\'<script src=\"http://\' + (location.host || \'localhost\').split(\':\')[0] + \':35729/livereload.js?snipver=1\"></\' + \'script>\')</script>\n\n</body>\n</html>'),(7,5,'exp_templates','template_data',1333620117,1,''),(8,1,'exp_templates','template_data',1333622103,1,'<!DOCTYPE html>\n\n<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->\n<!--[if lt IE 7]> <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\" lang=\"en\"> <![endif]-->\n<!--[if IE 7]>    <html class=\"no-js lt-ie9 lt-ie8\" lang=\"en\"> <![endif]-->\n<!--[if IE 8]>    <html class=\"no-js lt-ie9\" lang=\"en\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\" lang=\"en\"> <!--<![endif]-->\n<head>\n	<meta charset=\"utf-8\" />\n\n	<!-- Set the viewport width to device width for mobile -->\n	<meta name=\"viewport\" content=\"width=device-width\" />\n\n	<title>Welcome to MeWe</title>\n  \n	<!-- Included CSS Files -->\n	<!-- Combine and Compress These CSS Files -->\n	<link rel=\"stylesheet\" href=\"stylesheets/globals.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/typography.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/grid.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/ui.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/forms.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/orbit.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/reveal.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/mobile.css\">\n	\n	<!-- End Combine and Compress These CSS Files -->\n	<link rel=\"stylesheet\" href=\"stylesheets/app.css\">\n\n	<!--[if lt IE 9]>\n		<link rel=\"stylesheet\" href=\"stylesheets/ie.css\">\n	<![endif]-->\n	\n	<!-- Non framework custom CSS -->\n	<link rel=\"stylesheet\" href=\"stylesheets/custom.css\">\n	\n	<!-- Google Webfonts -->\n	<link rel=\"stylesheet\" type=\"text/css\" href=\"http://fonts.googleapis.com/css?family=Candara\">\n	\n	<script src=\"javascripts/modernizr.foundation.js\"></script>\n\n\n	<!-- IE Fix for HTML5 Tags -->\n	<!--[if lt IE 9]>\n		<script src=\"http://html5shiv.googlecode.com/svn/trunk/html5.js\"></script>\n	<![endif]-->\n	\n	<script type=\'text/javascript\'>\n	(function (d, t) {\n	  var bh = d.createElement(t), s = d.getElementsByTagName(t)[0];\n	  bh.type = \'text/javascript\';\n	  bh.src = \'//www.bugherd.com/sidebarv2.js?apikey=da8da014-e25b-4041-b791-25f3100fa3c8\';\n	  s.parentNode.insertBefore(bh, s);\n	  })(document, \'script\');\n	</script>\n\n</head>\n\n<body>\n		\n		<div id=\"top-background\">\n			<div id=\"background\">\n				<div id=\"header\">\n\n					<div class=\"row\" id=\"branding\">\n							<div class=\"twelve columns\">\n									<img src=\"/img/Logo.png\" alt=\"Mewe Logo\" />\n							</div>\n							\n							<ul class=\"secondary-nav hide-on-phones shadow\">\n								<li><a href=\"#\">Login</a></li>\n								<li><a href=\"sign-up.html\" class=\"alternate\">Join Up</a></li>\n							</ul>\n					</div>\n\n					<div class=\"row\" id=\"masthead\" >\n						<div class=\"twelve columns\" >\n								<ul class=\"nav-bar hide-on-phones\" id=\"primary-nav\">\n									<li class=\"selected\"><a href=\"index.html\" class=\"main\"><span>Home</span></a></li>\n									<li> <a href=\"about.html\" class=\"main\">About</a></li>\n									<li> <a href=\"incubator.html\" class=\"main\">Incubator</a></li>\n									<li> <a href=\"workspace.html\" class=\"main\">Workspace</a></li>\n									<li> <a href=\"events.html\" class=\"main\">Events</a></li>\n									<li> <a href=\"membership.html\" class=\"main\">Membership</a></li>\n									<li> <a href=\"news.html\" class=\"main\">News</a></li>\n									<li class=\"hub has-flyout\">\n										<a href=\"#\" class=\"main\">Hub</a>\n										<div class=\"flyout\" style=\"display: none;\">\n											<ul>\n												<li><a href=\"profile.html\" class=\"main\">Profile</a></li>\n												<li><a href=\"community.html\" class=\"main\">Community</a></li>\n												<li><a href=\"#\" class=\"main\">Resources</a></li>\n											</ul>\n										</div>\n									</li>\n								</ul>\n						</div>\n					</div>\n				\n				</div> <!-- #header -->\n\n			\n				<div class=\"container\"> \n\n					<div class=\"row\" id=\'topSection\'>\n\n						<div class=\"six columns push-six\" id=\"straplineArea\">\n								<div class=\"cta-container\">\n									<h1>We provide access to the best <a>funding</a>, <a>mentoring</a> and <a>incubation</a> to propel your creative business.</h1>\n									<a class=\"huge button black radius black-gradient hide-on-phones\" href=\"#\"><span>Join today</span></a>\n								</div>\n						</div> <!-- #straplineArea -->\n\n						<div class=\"six columns pull-six\" id=\'carousel\'>\n								\n								<div class=\"frame\">\n									     <img src=\"/img/carousel/5.jpg\"/>\n								</div> <!-- carousel-container -->\n					\n				\n						</div> <!-- #carousel -->\n			\n				\n					</div> <!-- #topSection -->\n			\n					<div class=\"row services\">\n				\n							<div class=\"quarter columns\">\n								<div class=\"service rounded\">\n										<h2>Incubator</h2>\n									<img src=\"/img/workspace.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>Fund your business</span></a>\n								</div> <!-- panel -->\n							</div>				\n				\n							<div class=\"quarter columns\">				\n								<div class=\"service rounded\">\n									<h2>Workspace</h2>\n									<img src=\"/img/workspace.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>See the workspace</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class=\"quarter columns\">					\n								<div class=\"service rounded\">\n									<h2>Events</h2>\n									<img src=\"/img/events.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>Come to an event</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class=\"quarter columns\">				\n								<div class=\"service rounded\">\n									<h2>Consulting</h2>\n									<img src=\"/img/consulting.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>Find out more</span></a>\n								</div> <!-- panel -->\n							</div>\n\n\n					</div><!-- #services-->\n				\n\n					<div class=\"row\" id=\"news-area\">\n					\n						<div class=\"seven columns\">\n						\n							<h2>Latest news</h2>\n\n								<div class=\"row\">\n									<div class=\"three columns\">\n									\n										<div class=\"flex-video vimeo\">\n											<iframe src=\"http://player.vimeo.com/video/30995060?title=0&amp;byline=0&amp;portrait=0&amp;color=ffffff\" width=\"128\" height=\"80\" frameborder=\"0\"></iframe>\n										</div>\n									\n									</div> <!-- .six columns -->\n\n									<div class=\"nine columns\">\n										<div class=\"news-article\">\n											<header>\n												<h3 class=\"news-heading\">Headline</h3>\n												<p><span class=\"date\">19th February 2027</span> by Kevin <span class=\"comments\">3 comments</span></p>\n											</header>	\n											<p class=\"excerpt\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat... </p>\n										</div> <!-- .news-article -->\n									</div>\n								\n								</div> <!-- .row -->\n					\n\n\n						</div> <!-- .seven columns-->\n\n						<div class=\"five columns\">	\n							<h2>Upcoming events</h2>\n							<div class=\"row event\">\n								<div class=\"three columns\">\n										<div class=\"date-box\">\n											<p class=\"month\">MAR</p>\n											<p class=\"day\">25</p>\n										</div> <!-- date-box -->\n								</div>\n								<div class=\"nine columns\">\n									<div class=\"event-details\">\n										<h3 class=\"event-heading\">Networking Event</h3>\n										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>\n									</div> <!-- date- -->	\n								</div>\n							</div>\n		\n						</div> <!-- sidebar -->\n							\n			\n					</div> <!-- #news-area -->\n\n				</div> <!-- container -->\n\n				<div class=\"sponsors\">\n					<div class=\"row\">\n						<div class=\"twelve columns\"><img src=\"/img/sponsors.png\" alt=\"Our Sponsors\" /></div>\n					</div>\n				</div>\n		\n				<div id=\"footer\">\n			\n					<div class=\"row\">\n						<div class=\"three columns\">\n							<h3>Find Us</h3>\n							<div class=\"container\">\n								<img class=\"map\" src=\"/img/map.png\" />\n							</div>\n						</div>\n						<div class=\"three columns\">\n							<h3>Get in touch</h3>\n							<div class=\"container\">\n								<p>MeWe Foundation<br />Golden Square<br />London, W1 123<br /><br />020 7123 4567<br /><a href=\"mailto:info@mewe.com\">info@mewe.com</a></p>\n							</div>\n						</div>\n						\n						<div class=\"three columns networks\">\n							<h3>Networks</h3>\n							<div class=\"container\">\n								<ul>\n									<li><a href=\"#\"><img src=\"/img/twitter.png\" />Twitter</a></li>\n									<li><a href=\"#\"><img src=\"/img/facebook.png\" />Facebook</a></li>\n									<li><a href=\"#\"><img src=\"/img/linkedin.png\" />LinkedIn</a></li>\n								</ul>\n							</div>\n						</div>\n						<div class=\"three columns feedback\">\n							<h3>Feedback</h3>\n							<div class=\"container\">\n								<p>We’re always looking to improve what we do. If you have feedback we\'d love to hear from you!</p>\n								<a href=\"#\" class=\"medium radius button black-gradient\">Get in touch</a>\n							</div>\n						</div>\n					</div>	\n				\n				\n				</div> <!-- .footer -->\n				\n				</div> <!-- #background -->\n		</div> <!-- #top-background -->\n\n\n\n	<!-- Included JS Files -->\n	<script src=\"javascripts/jquery.min.js\"></script>\n	<!-- Combine and Compress These JS Files -->\n	<script src=\"javascripts/jquery.reveal.js\"></script>\n	<script src=\"javascripts/jquery.orbit-1.4.0.js\"></script>\n	<script src=\"javascripts/jquery.customforms.js\"></script>\n	<script src=\"javascripts/jquery.placeholder.min.js\"></script>\n	<script src=\"javascripts/jquery.tooltips.js\"></script>\n	<!-- End Combine and Compress These JS Files -->\n	<script src=\"javascripts/app.js\"></script>\n	\n	<!-- MeWe Custom JS -->\n	<!-- <script src=\"javascripts/custom.js\"></script> -->\n	\n	<script type=\"text/javascript\">\n	//     $(window).load(function() {\n	  //       $(\'#featured\').orbit({directionalNav: false, timer: false});\n	  //   });\n	</script>\n	\n	<!-- Live Reload Code -->\n	<script>document.write(\'<script src=\"http://\' + (location.host || \'localhost\').split(\':\')[0] + \':35729/livereload.js?snipver=1\"></\' + \'script>\')</script>\n\n</body>\n</html>'),(9,7,'exp_templates','template_data',1333623245,1,''),(10,8,'exp_templates','template_data',1333624011,1,''),(11,8,'exp_templates','template_data',1333624079,1,''),(12,9,'exp_templates','template_data',1333624368,1,''),(13,10,'exp_templates','template_data',1333624633,1,''),(14,11,'exp_templates','template_data',1333624981,1,''),(15,12,'exp_templates','template_data',1333631948,1,'');
/*!40000 ALTER TABLE `exp_revision_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_search`
--

DROP TABLE IF EXISTS `exp_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_search`
--

LOCK TABLES `exp_search` WRITE;
/*!40000 ALTER TABLE `exp_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_search_log`
--

DROP TABLE IF EXISTS `exp_search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_search_log`
--

LOCK TABLES `exp_search_log` WRITE;
/*!40000 ALTER TABLE `exp_search_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_search_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_security_hashes`
--

DROP TABLE IF EXISTS `exp_security_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (29,1333614003,'0.0.0.0','7004e9d8830e1be66f87ab91cb0c21a4162c7246'),(30,1333614007,'0.0.0.0','dd35eb381ae6a32cc4fdc94f4754f0a520f77a95'),(31,1333614007,'0.0.0.0','3efcc5425cb984f3140a65eb1c6be2ea6d97124e'),(32,1333614019,'0.0.0.0','169378cc8de60a49f54218bdaff1387ae77c9074'),(33,1333614067,'0.0.0.0','abfc5e0f996b16e57733bcb9aa5bbfdc9cab05b5'),(34,1333614068,'0.0.0.0','4b60d42c809738b7d69bcd5e494352b0c2ba842d'),(35,1333614236,'0.0.0.0','b7c35394f22ae51471a38a1b557bb65f28f8fe46'),(36,1333614332,'0.0.0.0','230c2270261859a12294fe79c31814712f417a63'),(37,1333614335,'0.0.0.0','ef321498a6f0b0c6a9c017f58bbd252672ca7338'),(38,1333614352,'0.0.0.0','88c0979d1a92b23fadfe34efab9a12e2a0a2b7b9'),(39,1333614352,'0.0.0.0','1d85e99ae643f336e5fc1940613d7e97e528e5d3'),(40,1333614366,'0.0.0.0','f9cbeccc300f569a91a8b20411b1ca53b4ffbd95'),(41,1333614454,'0.0.0.0','6b2e84b957c677f26bbd24f4047f56e64c5990b9'),(42,1333614454,'0.0.0.0','d4e6d732a784276fe54d21b3b379a76a0e663000'),(43,1333614526,'0.0.0.0','99973f555cdd4d7f7b6c54cd88b30a0a037df6b9'),(44,1333614530,'0.0.0.0','b23d419cea9a8ce495e1a05d54afb3ac7ca652cf'),(45,1333614547,'0.0.0.0','8732bebe88eb25738f723207a1e61dcba9ba2535'),(46,1333614547,'0.0.0.0','a5f4d52186716fe0f961f2306ee2a37452b80d75'),(47,1333614653,'0.0.0.0','e7d95bc02e760a12310d88f693db62d3acd504b8'),(48,1333614673,'0.0.0.0','01ae5823b38b5708c5b0de8783ea1367cbded55d'),(49,1333614683,'0.0.0.0','809eaffc06347fe60638cdb4d51637260a8e659c'),(50,1333614800,'0.0.0.0','8ad4ef68bab9973d3f175aa8c35e0591b4ee9c8a'),(51,1333614807,'0.0.0.0','20c50224ab0f927cfdff1e798c4aabf59f5e82a0'),(52,1333614807,'0.0.0.0','280149113c55c2857ca19f59f26cdc81c151475f'),(53,1333614836,'0.0.0.0','841002092f8ab0442cee8e9b02c510a88ed9767b'),(54,1333614836,'0.0.0.0','c684b20537cba53976f6aa43941141248edb1275'),(55,1333615106,'0.0.0.0','961693595482034222846c39baa0e7198d88d0b4'),(56,1333615108,'0.0.0.0','570d184cf3938c08303139c9c4b8890859d7ef74'),(57,1333615111,'0.0.0.0','5cb002e531138c6a0458af454645fc5d347e3882'),(58,1333615111,'0.0.0.0','9573d4955ed60c3ccb932b8ed3b5d75f1dd3d66a'),(59,1333615138,'0.0.0.0','90ba3aa90d742785b92ec4150420026fc634f714'),(60,1333615138,'0.0.0.0','a3f4d31b7c77c62cc422df8f48e287fcbe653826'),(61,1333615147,'0.0.0.0','d667af95e17d828acb2903c756262cb8f2426f67'),(62,1333615151,'0.0.0.0','2610439f16f8eb0861c54b9a1f22163f003dcd58'),(63,1333615165,'0.0.0.0','a33f73e1b139f96de5258babc92cd7a0d9012b85'),(64,1333615165,'0.0.0.0','fc425355090dde7a3eb867ffd113a031a882b159'),(65,1333615169,'0.0.0.0','76c9a2e5d7548785cbc4edf0ae0b247432d7818c'),(66,1333615179,'0.0.0.0','0d6db8003107fbc8564a05bebb1080dee21c34b5'),(67,1333615241,'0.0.0.0','4841f9fea01943f7dab14e832914265eb1c08e68'),(68,1333615242,'0.0.0.0','b1f2fb7a6ee6527cc0c66889e22fe7b0c183ef49'),(69,1333615259,'0.0.0.0','850ee4caaff30f7e91f80cf4b3d9d3b38124db7f'),(70,1333615262,'0.0.0.0','c11f69c2e62f71c015f920a14f9ce1b584994622'),(71,1333615262,'0.0.0.0','693cd3bba7ce571067bcd9cb248757bee3f82b85'),(72,1333615263,'0.0.0.0','64d082b3b201377f378383e0a4bb98fc63af075b'),(73,1333615291,'0.0.0.0','3f42212aaef7333d5cf71cc0101fa0c757b78f93'),(74,1333615291,'0.0.0.0','b5ba4ab168f05a8191c21bf80967780ec4a78fd8'),(75,1333615299,'0.0.0.0','89f6fc55fb9652ecb58d61d1cede7d070a25b5e6'),(76,1333615315,'0.0.0.0','0e5909be8d35d51c0c82d50fe91f05b857a7a44e'),(77,1333615317,'0.0.0.0','b8a50c124598e498cbd7cbe9a75cd8b299ed6e51'),(78,1333615317,'0.0.0.0','25107c0d4e65563ae5c7af9f45d41d938327fbde'),(79,1333615320,'0.0.0.0','593fad2f74cf067ec3a9177b5dc244268fccda93'),(80,1333615331,'0.0.0.0','976fede0e6dbcb690f44f0f60515a00af84aed80'),(81,1333615725,'0.0.0.0','d789628bb5598b3bd130c4fcd83eb9f12ba421ed'),(82,1333615871,'0.0.0.0','147edcb4f0a54115fd849d556018fd0155c42c4a'),(83,1333615892,'0.0.0.0','3ac4438a12686afaabfe0b877f870e0bcf5c4a54'),(84,1333615901,'0.0.0.0','cd9c0c6cb4df7e806bf970e7b45920ff02ded5fd'),(85,1333615901,'0.0.0.0','a9a3cd03f07545f3c1bbaec8c0fc6cf73fe88ad0'),(86,1333615906,'0.0.0.0','cda5c802b5f3685b57bb258631b96585fd2d2323'),(87,1333615906,'0.0.0.0','12477befc7ccc173536be37fc9422537fca18fbc'),(88,1333615911,'0.0.0.0','4d725dbd690cabf4bc379b4bff3d1b4bd227f48c'),(89,1333615916,'0.0.0.0','32c45fcd333b534f8d8f50588c0b6a5335770878'),(90,1333616143,'0.0.0.0','6d9c52a5a490353960f867b18f816e16bd34a04d'),(91,1333616181,'0.0.0.0','27dc64dc0babf961bf522ede4dc3d4920274e6d6'),(92,1333616189,'0.0.0.0','53935eeff52a733f8cbbccbb45d2b8f48759aff0'),(93,1333616190,'0.0.0.0','9b96d3d2e041bdeb7db3fba8f21ca74bacd8e665'),(94,1333616193,'0.0.0.0','ab9a99fcf8a2f22165516866c3ed92904ec15822'),(95,1333616200,'0.0.0.0','7977cb9b03d4aaa3d20b0f712b24c2166986612d'),(96,1333616218,'0.0.0.0','352b30932de3f13a3010e6fa1b4d823469c14d88'),(97,1333616222,'0.0.0.0','38f0941cce4f17f7ad0ceaf35877cb9aea83f969'),(98,1333616223,'0.0.0.0','c1959cb85b6cebc12e8ceb6147884cb9a87d941f'),(99,1333616249,'0.0.0.0','531d3ed7d23efacd9a2bed42817df2ce6bac1d2e'),(100,1333616249,'0.0.0.0','560c5cfc1bb48acab4605cf00238b658266722a6'),(101,1333616257,'0.0.0.0','78d224b8732d065276e2d61108b0032779d25a99'),(105,1333619667,'0.0.0.0','5d2edb883700c5397b1b9e434ba124c1f19f6bb9'),(106,1333619668,'0.0.0.0','9cce95f1fc6d9842cc7ba593b83e5d7a529d9647'),(107,1333619671,'0.0.0.0','5684a55409998461c8da4330f82754291658ae9d'),(108,1333619673,'0.0.0.0','9d5909c4b5540f419889b8d2e7a763ed104fd0d3'),(109,1333619698,'0.0.0.0','4f445376f675b44e07f233fd931b697080ee8261'),(110,1333619699,'0.0.0.0','33772e5abfe4857589a235e723930afca199f437'),(111,1333619701,'0.0.0.0','6f8bfd2c713bc697c71776cdbde50f9cfd04b03d'),(112,1333619712,'0.0.0.0','deed1d49b596127a1d5516986a47cc2bece2d460'),(113,1333619736,'0.0.0.0','14ac01464785a2dee962c708f68a6f41c80aef27'),(114,1333619744,'0.0.0.0','f131007d14fd4671ee09b1d5718472db101695f1'),(115,1333619767,'0.0.0.0','8a50b7b84c3e5b4986e03cc66f7b2e6ffd5fe9e9'),(116,1333619774,'0.0.0.0','da7561531fa594f91dce0d68c1661aa4f07e4f1b'),(117,1333619779,'0.0.0.0','e61f8b1514a68ea249e47f1d603727cdde6300ce'),(118,1333619786,'0.0.0.0','b34e23f91b6d37299352aea9b421fb6fdf0c2409'),(119,1333619789,'0.0.0.0','f1c71ced4e18198d3f8aff204e440f6b8879ec5d'),(120,1333619793,'0.0.0.0','1756cf01ee5a0d13177fe3840b31f842614a0e78'),(121,1333619800,'0.0.0.0','1ec1e5a9657af2a89722f9a189f4961b53f83658'),(122,1333619802,'0.0.0.0','5d8dbb56e07a4dd9e1610df52e23b740f3803e9e'),(123,1333619803,'0.0.0.0','1e8f962034b151bfbff8377a5ce69cc3b70e3d3b'),(124,1333619806,'0.0.0.0','48be8e1efe07515c8c05881c8c79eab70640bff3'),(125,1333619810,'0.0.0.0','fe49bb5c5148db7bc317a70deeccef9d4438b7ab'),(126,1333619821,'0.0.0.0','1434eee670c7b2ab0c776f94a5cb18ef6a77309a'),(127,1333619825,'0.0.0.0','ed998cc2b23b962a99d953cad3bbf677b7025e2b'),(128,1333619827,'0.0.0.0','e3351b9a3a54e5da6906ca23a7e534f9150b5e8f'),(129,1333619827,'0.0.0.0','debdcb37cc33017aade35cb96482dce463b4dca7'),(130,1333619831,'0.0.0.0','b7482da6b707c4d0df73e881facabaae9613f11a'),(131,1333620106,'0.0.0.0','b4fd1a7cb88b4f3128e12b33708bbe365adb990c'),(132,1333620112,'0.0.0.0','d24a5c57f9c6cb43583325bf9f45d373e028911d'),(133,1333620117,'0.0.0.0','8dce0bae453bb0adaafea6551880e7c7d61812c4'),(134,1333620117,'0.0.0.0','c623c65ef25b8eeac3e1ebc3a458537cc0dc59a4'),(135,1333620241,'0.0.0.0','2dde4b7cfe80b285aea58d5652ec47f1d043f026'),(136,1333620244,'0.0.0.0','95931fd90ec13b3cb3b30249ce64819ae85c394d'),(137,1333620244,'0.0.0.0','b4f542a2771a4ff7bf80a689f2ee18f4f9826c35'),(138,1333620245,'0.0.0.0','140e257d852246a945dda1dea73e1682857c1804'),(139,1333620267,'0.0.0.0','e8a35510458965206619c7da84ac1ab5af6f8e95'),(140,1333620267,'0.0.0.0','5f1d1db72700671b29953f0ce4d3b340134b6fd2'),(141,1333620278,'0.0.0.0','a3b1fcb071cd03ad5a94c43edaee9d8727e3289b'),(142,1333620288,'0.0.0.0','1eb5eda39e92c4624bc2445e3ebf274fb7a9bfbe'),(143,1333620299,'0.0.0.0','702230021e1bc511bd24445d2d6f74d981e84972'),(144,1333620299,'0.0.0.0','6392389af752a683468e5de498687eb59a153274'),(145,1333620301,'0.0.0.0','4a3f7ecce78989c97169694f7db3597abe44299d'),(146,1333620304,'0.0.0.0','87d3e9beeab2c756f7facec634cbd027ad2ede1c'),(147,1333620329,'0.0.0.0','be025c03ace23be8a9e2d85a0eccbeec9d278e3c'),(148,1333620329,'0.0.0.0','a1f2bec566136140b1bf40c2e0c057eafa8e44a9'),(149,1333620339,'0.0.0.0','7fce48a8fafdd27aee7284dea418454a8f460189'),(150,1333620343,'0.0.0.0','06a36b13e12d613a7aff6d048253a6ec97a3cf97'),(151,1333620364,'0.0.0.0','5a6945b3c6be2b18138bf4168984eb49452d2571'),(152,1333620370,'0.0.0.0','b7422473dde4b3407dac0943fe205bc41d11a1e5'),(153,1333620371,'0.0.0.0','6198f3645bc7bc15f9310c2471f8c36ed516f7b1'),(154,1333620377,'0.0.0.0','a755ae055f4ad936b87b6825aed3e0b647c21525'),(155,1333620381,'0.0.0.0','23f47930792562e357ade001b7d385a5e39c2146'),(156,1333620391,'0.0.0.0','a5c08726ba61f4b1a74710db614a70cee9be271e'),(157,1333620412,'0.0.0.0','454f367b5a08cd1452c379eeff7cfc2ee5e86cf5'),(158,1333620429,'0.0.0.0','07bdc6d6969839b48ba670b7cc7ca8f2b166aec6'),(159,1333620435,'0.0.0.0','c9e2b5bd82990487b4d166893aa89b98c497c373'),(160,1333620436,'0.0.0.0','a438ee31c66376a1f6e51799f34dfd72cbb415c7'),(161,1333620442,'0.0.0.0','98493d1daf34694bed30fbbdceb3a06e3eb8c985'),(162,1333620445,'0.0.0.0','9911a8267b08f73ec601491112d48dd5a4628a08'),(163,1333620451,'0.0.0.0','56dfcd6867534be78fba4511e237415dce8076c7'),(164,1333620941,'0.0.0.0','bfb0a2c01a32d001f3179997cc7cbdd1c54b1295'),(165,1333620944,'0.0.0.0','3682c072adc53187d917d329b238515039f74a07'),(263,1333631918,'127.0.0.1','02bb70b50086ea91a262c8200a967036b04d1487'),(264,1333631924,'127.0.0.1','ed8383829046d48baffb8fab8f2bbc90f20ea470'),(265,1333631928,'127.0.0.1','235ab7b4394fd9b3190eced1541720f9d034fa36'),(266,1333631940,'127.0.0.1','5026e34d2190dd32dc3827c7dad0315390a9add4'),(267,1333631943,'127.0.0.1','14d7cbf65d0fec60f70584c238dda2f9d98f4021'),(268,1333631948,'127.0.0.1','62958988ff3ba018c73088e5d8bde0e7e09e1a88'),(269,1333631948,'127.0.0.1','0ac05667e9669b5866a1a7b2f7e33a37126ad5bb'),(270,1333631976,'127.0.0.1','92cb09e6622520e3be03983b1e7bf223aeefb185'),(271,1333631979,'127.0.0.1','8e08921ff2f714106a6d22a182ba5c46189e948a'),(272,1333631979,'127.0.0.1','0fc61f100cfd029752ce236248103b5bf83d0c65'),(273,1333631980,'127.0.0.1','294f1c64575ea3abf44be1a9e444466284a12b38'),(274,1333632004,'127.0.0.1','9b400a4c74925b15f928a026f402f700bb98375e'),(275,1333632004,'127.0.0.1','349bc1f24647bee30e8bd6ff4164de1e14b2595c'),(276,1333633970,'127.0.0.1','166535ef0dfbd5f690d76c812660e92e34140f9b'),(277,1333633992,'127.0.0.1','64a52d4795df631cc56b5d189a290c65b05c3cfd'),(278,1333634468,'127.0.0.1','aa4a1cc1aea31b9d50d2e2298b166ad5cfa23584'),(279,1333634607,'127.0.0.1','2dd6fb3d483f86e700f5efdc58b54d6adb8880d1'),(280,1333634611,'127.0.0.1','9b520ebd68bf5c42d53b47a58692e29b9e7db1a1'),(281,1333635395,'127.0.0.1','606a98e1309f497bbd79ca9f8154bea2243cd3bd'),(282,1333635400,'127.0.0.1','9b4aa62cb93228c69d4c4496e07c190078e81716'),(283,1333635423,'127.0.0.1','81835eb456b5f9e39ca11ab4c45c988fddd40c43'),(284,1333635423,'127.0.0.1','c27bb770ec8af4dfaca2d1b102bea9a022d3c4ad'),(285,1333635440,'127.0.0.1','9d195fe1e64bd80c5263ca8bc9f48674c10f1da2'),(286,1333635458,'127.0.0.1','5b1a8649e7a4fb683335deaad0798598888e4047'),(287,1333635459,'127.0.0.1','4ff4fd15e1d52816b2d52c8d115d22ab734209cd'),(288,1333635469,'127.0.0.1','9f656391cc93296c3fe9faaa64a8d446d4101587'),(289,1333635471,'127.0.0.1','399c93253d316f55086c8b135552ef08fb696e16'),(290,1333635471,'127.0.0.1','fa6aebc76a2af64b3920124824e339152ac98bef'),(291,1333635473,'127.0.0.1','e7d8f4fe9a5e118a63fbbf17cf28906268ace6f0'),(292,1333635476,'127.0.0.1','403cee8f43c8b800491e7de6c458685ba8c4a8ee'),(293,1333635485,'127.0.0.1','2e83ba48304bd1a3da0e4584034562429a0d1d29'),(294,1333635485,'127.0.0.1','01b20e9fc0ae5d9310d21f6a5fd3400be76f2fec'),(295,1333635540,'127.0.0.1','10bb273217ab0bff1c945c8389037e57162e6f5d'),(296,1333635544,'127.0.0.1','c20c45d9c71c192638adb3be0bc220080d0f863f'),(297,1333635550,'127.0.0.1','f325d7d605baf027690dae011f3815373cf8a90b'),(298,1333635550,'127.0.0.1','24898d34c0e1aec65f9f45586e630cbe7bbf3700'),(299,1333635556,'127.0.0.1','9702970a130f9be4a4e37c207372e853db54c3d2'),(300,1333635559,'127.0.0.1','5715d9fcdc4278449e41338909929ea106bf8bb5'),(301,1333635562,'127.0.0.1','3f98bebbcf0a1237bbcd21ddeab5b87b7827edeb'),(302,1333635564,'127.0.0.1','be7e717603139dba5b33ebaca265d35a84c92d6c'),(303,1333635680,'127.0.0.1','1ec15fdaf8e534522477acaf0a357b7386eba3bb'),(304,1333635681,'127.0.0.1','ece41981eefab7342f5fcb17d83e01f849128e68'),(305,1333635691,'127.0.0.1','73e41965865ed9690ed5cc150918e79ae80bde71'),(306,1333635692,'127.0.0.1','cf5dfa44f9c65a62e3409f0a8f7f5e6519c3291b'),(307,1333635706,'127.0.0.1','ffba2758cf5f900b3cd97e0ced72a6902e6c8116'),(308,1333635710,'127.0.0.1','f1262cc147aa5eabba3736c2a6e08e09ce1181e2'),(309,1333635712,'127.0.0.1','730dfad3e90087e19002076b68690af8f581c24e'),(310,1333635725,'127.0.0.1','3834c447eb380163906443e3f9c9bcc2f933dc91'),(311,1333635725,'127.0.0.1','9126338ea017fd22ae670544e20100e3a9310825'),(312,1333635731,'127.0.0.1','cedbbcc60dfd15a6868b9f762ef64cf826b01f0f'),(313,1333635732,'127.0.0.1','fe6d5408e2a94def6d5138a443d482e94447a9cf'),(314,1333635831,'127.0.0.1','581bb8180f1cbdb5ec65702a3e261d7918e6da23'),(315,1333635833,'127.0.0.1','c2e9a59c48ecb496c8132c2ff3e58165adc8ac16'),(316,1333635836,'127.0.0.1','b18981b76fd9731eebf98be20263470cf1d434b4'),(317,1333635852,'127.0.0.1','a380cffed97631a3570779f9216802917be299ee'),(318,1333635852,'127.0.0.1','5fce0c10a7737c86dcc1eed3f13e6a1310cd411a'),(319,1333635925,'127.0.0.1','a20d9dae087af98894abf62fdfb6ff05db4ec93e'),(320,1333635928,'127.0.0.1','295a37b26d9a7bf82882bef5f8bba0a048113dfb'),(321,1333635935,'127.0.0.1','86fff5ab32acdd2f108826d18516b8e7d7661ebd'),(322,1333635935,'127.0.0.1','ab70ba63a149a7ce527f0cac92dc1ff931d031aa'),(323,1333635939,'127.0.0.1','8b00f3a3d6ea84848e8434dc9b0d7f9d6a3eb95b'),(324,1333635940,'127.0.0.1','2f1aaeee954b70b3a4f7b006b45eb6051244e82b'),(325,1333635940,'127.0.0.1','50fc32db4d630464b52a0cc567c0f64128836acd'),(326,1333635953,'127.0.0.1','491466f9c16f894ec3b12b0e707256b5bdd3ee7e'),(327,1333635955,'127.0.0.1','fb083793c3d8b808ef50519b98a4726e79cf81fd'),(328,1333635957,'127.0.0.1','6012b259ffd2168fbd946065eaa2a0272048a508'),(329,1333635989,'127.0.0.1','5e561e795d17f6792bd6ba4bcdc8671cc8a001c9'),(330,1333635989,'127.0.0.1','13ca585cc8813df1a8e85b65d042a5eeb666e50e'),(331,1333635993,'127.0.0.1','ad1631e2823766c197df16c4e91b7295640edfc7'),(332,1333635994,'127.0.0.1','7f67cc774ad12882f186d4a9d57bfeaa12f470ed'),(333,1333635994,'127.0.0.1','c20c4ccc18597c18df8a8ed5c2a901d0e9c8ecfe'),(334,1333636062,'127.0.0.1','5e0c38f774d80dda3330d94c6141398bd216055e'),(335,1333636063,'127.0.0.1','dd0fa1fa68d4dc9d61b331f37e1aa4b7de56fc6e'),(336,1333636063,'127.0.0.1','9a3e8e9ad31cb22f6d84f92326e55679d7102821'),(337,1333636068,'127.0.0.1','cd2f24d3b3044ba4018e64e93e21ed50f9e432bf'),(338,1333636068,'127.0.0.1','19df225982280eea51744de00a252cbc5768c6d3'),(339,1333636070,'127.0.0.1','e49bcb59e6d508063461769eaaa096963e7050c8'),(340,1333636072,'127.0.0.1','76ffdbd83c43ce1c1591e28b0e94961c9b9950f8'),(341,1333636074,'127.0.0.1','f4dcce6fd6533e1b7e1ec7fab67dbcb5b18f1dd3'),(342,1333636259,'127.0.0.1','0529092373c0fafc12ad3c11a64205d34a4c684b'),(343,1333636259,'127.0.0.1','d23107c0c7119d6fd5ffffc1642854b5b8dbc944'),(344,1333636263,'127.0.0.1','a2753adc082ee931fb186491ca6c5374cf597402'),(345,1333636266,'127.0.0.1','f72ad6567c497603c734410e98c4939e8ab6f181'),(346,1333636267,'127.0.0.1','dd21aece1c3ae3e77c14b84c2c4bece3556ba982'),(347,1333636267,'127.0.0.1','287e02b3fc8cb807150d06b9250087b6085bbac9'),(348,1333636272,'127.0.0.1','d4535c8a89e78d09b270cb1a28b5ceb5a7aa442b'),(349,1333636272,'127.0.0.1','51d8b67cc739b683e674a94f6aa3024d1b25aeba'),(350,1333636283,'127.0.0.1','a5650f4045df0e643bcf2cd1b867d13b8a573c37'),(351,1333636293,'127.0.0.1','d7b85b85b744b2676cf13e02cdcf049f25a8ea3a'),(352,1333636294,'127.0.0.1','acab282ca406020ff91c6cd95af5a17667ec5937'),(353,1333636294,'127.0.0.1','b067e0a86764d8a5923698bfaf83c9e768614876'),(354,1333636298,'127.0.0.1','e7a6c3b0a80de91ae0a12ea722b77b3a5d3868c7'),(355,1333636305,'127.0.0.1','0b694dd40bda5bd15890544007d6e0cb1655534f'),(356,1333636307,'127.0.0.1','89e782edd852fe6963f2a3b8a0c5f141d7e52cc0'),(357,1333636307,'127.0.0.1','cf65237f5dca69ea9b59fc47107d890808e5d9aa'),(358,1333636912,'127.0.0.1','de3f00e43d5cb4b68dfe94b6cdc94b944e565847'),(359,1333636912,'127.0.0.1','6e1598a1985b4a537be28915946acb24524d7003'),(360,1333636936,'127.0.0.1','7b47ad5f89da2ad97c727c86eb5e222009d47b8a'),(361,1333636936,'127.0.0.1','2ef24989905ff0ac2c1ec924723a32a0c3b41187'),(362,1333637034,'127.0.0.1','ae293b1e732626463e51704ce9fc5c5b677e80cd'),(363,1333637034,'127.0.0.1','ad82f86d01bd173875eec1b4d6bb7c047104ed19'),(364,1333637039,'127.0.0.1','037aa4c9af27127e8a0a4f6f168636781c7cafe4'),(365,1333640922,'127.0.0.1','d2a512ea748729bef5c564a28c730fc200e4425d'),(366,1333640923,'127.0.0.1','6510baa65065216f2691a2cea3c6e0b31f053860'),(367,1333640925,'127.0.0.1','c384efb21832b5602d13b969e9c464e8212b7a92'),(368,1333640926,'127.0.0.1','f57a67d309db22aa0122ef3cfd1680b1ca656229'),(369,1333640934,'127.0.0.1','2419fa794967f19ca658b70e6a2601457ce5eb83'),(370,1333640934,'127.0.0.1','f797568b5ca0fc040e69916454fc18d7f3518a49');
/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sessions`
--

DROP TABLE IF EXISTS `exp_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_sessions`
--

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;
INSERT INTO `exp_sessions` VALUES ('647d5411e9a344da653795a21c7454256b07dd9f',1,1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:11.0) Gecko/20100101 Firefox/11.0',1333640938);
/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sites`
--

DROP TABLE IF EXISTS `exp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` text NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_sites`
--

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;
INSERT INTO `exp_sites` VALUES (1,'MeWe 360','default_site',NULL,'YTo5MDp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3QvTWVXZV9DTVMvIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjMzOiJodHRwOi8vbG9jYWxob3N0L01lV2VfQ01TL3RoZW1lcy8iO3M6MTU6IndlYm1hc3Rlcl9lbWFpbCI7czoxNzoibWFyY0BsYW5nc21hbi5jb20iO3M6MTQ6IndlYm1hc3Rlcl9uYW1lIjtzOjA6IiI7czoyMDoiY2hhbm5lbF9ub21lbmNsYXR1cmUiO3M6NzoiY2hhbm5lbCI7czoxMDoibWF4X2NhY2hlcyI7czozOiIxNTAiO3M6MTE6ImNhcHRjaGFfdXJsIjtzOjQyOiJodHRwOi8vbG9jYWxob3N0L01lV2VfQ01TL2ltYWdlcy9jYXB0Y2hhcy8iO3M6MTI6ImNhcHRjaGFfcGF0aCI7czo1MToiL0FwcGxpY2F0aW9ucy9NQU1QL2h0ZG9jcy9NZVdlX0NNUy9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX2ZvbnQiO3M6MToieSI7czoxMjoiY2FwdGNoYV9yYW5kIjtzOjE6InkiO3M6MjM6ImNhcHRjaGFfcmVxdWlyZV9tZW1iZXJzIjtzOjE6Im4iO3M6MTc6ImVuYWJsZV9kYl9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImVuYWJsZV9zcWxfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJmb3JjZV9xdWVyeV9zdHJpbmciO3M6MToibiI7czoxMzoic2hvd19wcm9maWxlciI7czoxOiJuIjtzOjE4OiJ0ZW1wbGF0ZV9kZWJ1Z2dpbmciO3M6MToibiI7czoxNToiaW5jbHVkZV9zZWNvbmRzIjtzOjE6Im4iO3M6MTM6ImNvb2tpZV9kb21haW4iO3M6MDoiIjtzOjExOiJjb29raWVfcGF0aCI7czowOiIiO3M6MTc6InVzZXJfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MTg6ImFkbWluX3Nlc3Npb25fdHlwZSI7czoyOiJjcyI7czoyMToiYWxsb3dfdXNlcm5hbWVfY2hhbmdlIjtzOjE6InkiO3M6MTg6ImFsbG93X211bHRpX2xvZ2lucyI7czoxOiJ5IjtzOjE2OiJwYXNzd29yZF9sb2Nrb3V0IjtzOjE6InkiO3M6MjU6InBhc3N3b3JkX2xvY2tvdXRfaW50ZXJ2YWwiO3M6MToiMSI7czoyMDoicmVxdWlyZV9pcF9mb3JfbG9naW4iO3M6MToieSI7czoyMjoicmVxdWlyZV9pcF9mb3JfcG9zdGluZyI7czoxOiJ5IjtzOjI0OiJyZXF1aXJlX3NlY3VyZV9wYXNzd29yZHMiO3M6MToibiI7czoxOToiYWxsb3dfZGljdGlvbmFyeV9wdyI7czoxOiJ5IjtzOjIzOiJuYW1lX29mX2RpY3Rpb25hcnlfZmlsZSI7czowOiIiO3M6MTc6Inhzc19jbGVhbl91cGxvYWRzIjtzOjE6InkiO3M6MTU6InJlZGlyZWN0X21ldGhvZCI7czo4OiJyZWRpcmVjdCI7czo5OiJkZWZ0X2xhbmciO3M6NzoiZW5nbGlzaCI7czo4OiJ4bWxfbGFuZyI7czoyOiJlbiI7czoxMjoic2VuZF9oZWFkZXJzIjtzOjE6InkiO3M6MTE6Imd6aXBfb3V0cHV0IjtzOjE6Im4iO3M6MTM6ImxvZ19yZWZlcnJlcnMiO3M6MToibiI7czoxMzoibWF4X3JlZmVycmVycyI7czozOiI1MDAiO3M6MTE6InRpbWVfZm9ybWF0IjtzOjI6InVzIjtzOjE1OiJzZXJ2ZXJfdGltZXpvbmUiO3M6MzoiVVRDIjtzOjEzOiJzZXJ2ZXJfb2Zmc2V0IjtzOjA6IiI7czoxNjoiZGF5bGlnaHRfc2F2aW5ncyI7czoxOiJ5IjtzOjIxOiJkZWZhdWx0X3NpdGVfdGltZXpvbmUiO3M6MzoiVVRDIjtzOjE2OiJkZWZhdWx0X3NpdGVfZHN0IjtzOjE6InkiO3M6MTU6Imhvbm9yX2VudHJ5X2RzdCI7czoxOiJ5IjtzOjEzOiJtYWlsX3Byb3RvY29sIjtzOjQ6Im1haWwiO3M6MTE6InNtdHBfc2VydmVyIjtzOjA6IiI7czoxMzoic210cF91c2VybmFtZSI7czowOiIiO3M6MTM6InNtdHBfcGFzc3dvcmQiO3M6MDoiIjtzOjExOiJlbWFpbF9kZWJ1ZyI7czoxOiJuIjtzOjEzOiJlbWFpbF9jaGFyc2V0IjtzOjU6InV0Zi04IjtzOjE1OiJlbWFpbF9iYXRjaG1vZGUiO3M6MToibiI7czoxNjoiZW1haWxfYmF0Y2hfc2l6ZSI7czowOiIiO3M6MTE6Im1haWxfZm9ybWF0IjtzOjU6InBsYWluIjtzOjk6IndvcmRfd3JhcCI7czoxOiJ5IjtzOjIyOiJlbWFpbF9jb25zb2xlX3RpbWVsb2NrIjtzOjE6IjUiO3M6MjI6ImxvZ19lbWFpbF9jb25zb2xlX21zZ3MiO3M6MToieSI7czo4OiJjcF90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjIxOiJlbWFpbF9tb2R1bGVfY2FwdGNoYXMiO3M6MToibiI7czoxNjoibG9nX3NlYXJjaF90ZXJtcyI7czoxOiJ5IjtzOjEyOiJzZWN1cmVfZm9ybXMiO3M6MToieSI7czoxOToiZGVueV9kdXBsaWNhdGVfZGF0YSI7czoxOiJ5IjtzOjI0OiJyZWRpcmVjdF9zdWJtaXR0ZWRfbGlua3MiO3M6MToibiI7czoxNjoiZW5hYmxlX2NlbnNvcmluZyI7czoxOiJuIjtzOjE0OiJjZW5zb3JlZF93b3JkcyI7czowOiIiO3M6MTg6ImNlbnNvcl9yZXBsYWNlbWVudCI7czowOiIiO3M6MTA6ImJhbm5lZF9pcHMiO3M6MDoiIjtzOjEzOiJiYW5uZWRfZW1haWxzIjtzOjA6IiI7czoxNjoiYmFubmVkX3VzZXJuYW1lcyI7czowOiIiO3M6MTk6ImJhbm5lZF9zY3JlZW5fbmFtZXMiO3M6MDoiIjtzOjEwOiJiYW5fYWN0aW9uIjtzOjg6InJlc3RyaWN0IjtzOjExOiJiYW5fbWVzc2FnZSI7czozNDoiVGhpcyBzaXRlIGlzIGN1cnJlbnRseSB1bmF2YWlsYWJsZSI7czoxNToiYmFuX2Rlc3RpbmF0aW9uIjtzOjIxOiJodHRwOi8vd3d3LnlhaG9vLmNvbS8iO3M6MTY6ImVuYWJsZV9lbW90aWNvbnMiO3M6MToieSI7czoxMjoiZW1vdGljb25fdXJsIjtzOjQxOiJodHRwOi8vbG9jYWxob3N0L01lV2VfQ01TL2ltYWdlcy9zbWlsZXlzLyI7czoxOToicmVjb3VudF9iYXRjaF90b3RhbCI7czo0OiIxMDAwIjtzOjE3OiJuZXdfdmVyc2lvbl9jaGVjayI7czoxOiJ5IjtzOjE3OiJlbmFibGVfdGhyb3R0bGluZyI7czoxOiJuIjtzOjE3OiJiYW5pc2hfbWFza2VkX2lwcyI7czoxOiJ5IjtzOjE0OiJtYXhfcGFnZV9sb2FkcyI7czoyOiIxMCI7czoxMzoidGltZV9pbnRlcnZhbCI7czoxOiI4IjtzOjEyOiJsb2Nrb3V0X3RpbWUiO3M6MjoiMzAiO3M6MTU6ImJhbmlzaG1lbnRfdHlwZSI7czo3OiJtZXNzYWdlIjtzOjE0OiJiYW5pc2htZW50X3VybCI7czowOiIiO3M6MTg6ImJhbmlzaG1lbnRfbWVzc2FnZSI7czo1MDoiWW91IGhhdmUgZXhjZWVkZWQgdGhlIGFsbG93ZWQgcGFnZSBsb2FkIGZyZXF1ZW5jeS4iO3M6MTc6ImVuYWJsZV9zZWFyY2hfbG9nIjtzOjE6InkiO3M6MTk6Im1heF9sb2dnZWRfc2VhcmNoZXMiO3M6MzoiNTAwIjtzOjE3OiJ0aGVtZV9mb2xkZXJfcGF0aCI7czo0MjoiL0FwcGxpY2F0aW9ucy9NQU1QL2h0ZG9jcy9NZVdlX0NNUy90aGVtZXMvIjtzOjEwOiJpc19zaXRlX29uIjtzOjE6InkiO30=','YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==','YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3QvTWVXZV9DTVMvaW1hZ2VzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czo1MDoiL0FwcGxpY2F0aW9ucy9NQU1QL2h0ZG9jcy9NZVdlX0NNUy9pbWFnZXMvYXZhdGFycy8iO3M6MTY6ImF2YXRhcl9tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE3OiJhdmF0YXJfbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTM6ImF2YXRhcl9tYXhfa2IiO3M6MjoiNTAiO3M6MTM6ImVuYWJsZV9waG90b3MiO3M6MToibiI7czo5OiJwaG90b191cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3QvTWVXZV9DTVMvaW1hZ2VzL21lbWJlcl9waG90b3MvIjtzOjEwOiJwaG90b19wYXRoIjtzOjU2OiIvQXBwbGljYXRpb25zL01BTVAvaHRkb2NzL01lV2VfQ01TL2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxNToicGhvdG9fbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNjoicGhvdG9fbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTI6InBob3RvX21heF9rYiI7czoyOiI1MCI7czoxNjoiYWxsb3dfc2lnbmF0dXJlcyI7czoxOiJ5IjtzOjEzOiJzaWdfbWF4bGVuZ3RoIjtzOjM6IjUwMCI7czoyMToic2lnX2FsbG93X2ltZ19ob3RsaW5rIjtzOjE6Im4iO3M6MjA6InNpZ19hbGxvd19pbWdfdXBsb2FkIjtzOjE6Im4iO3M6MTE6InNpZ19pbWdfdXJsIjtzOjU1OiJodHRwOi8vbG9jYWxob3N0L01lV2VfQ01TL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjEyOiJzaWdfaW1nX3BhdGgiO3M6NjQ6Ii9BcHBsaWNhdGlvbnMvTUFNUC9odGRvY3MvTWVXZV9DTVMvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czo1NzoiL0FwcGxpY2F0aW9ucy9NQU1QL2h0ZG9jcy9NZVdlX0NNUy9pbWFnZXMvcG1fYXR0YWNobWVudHMvIjtzOjIzOiJwcnZfbXNnX21heF9hdHRhY2htZW50cyI7czoxOiIzIjtzOjIyOiJwcnZfbXNnX2F0dGFjaF9tYXhzaXplIjtzOjM6IjI1MCI7czoyMDoicHJ2X21zZ19hdHRhY2hfdG90YWwiO3M6MzoiMTAwIjtzOjE5OiJwcnZfbXNnX2h0bWxfZm9ybWF0IjtzOjQ6InNhZmUiO3M6MTg6InBydl9tc2dfYXV0b19saW5rcyI7czoxOiJ5IjtzOjE3OiJwcnZfbXNnX21heF9jaGFycyI7czo0OiI2MDAwIjtzOjE5OiJtZW1iZXJsaXN0X29yZGVyX2J5IjtzOjExOiJ0b3RhbF9wb3N0cyI7czoyMToibWVtYmVybGlzdF9zb3J0X29yZGVyIjtzOjQ6ImRlc2MiO3M6MjA6Im1lbWJlcmxpc3Rfcm93X2xpbWl0IjtzOjI6IjIwIjt9','YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJuIjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJ5IjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6InkiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czo3MDoiL0FwcGxpY2F0aW9ucy9NQU1QL2h0ZG9jcy9NZVdlX0NNUy9tZXdlbWluL2V4cHJlc3Npb25lbmdpbmUvdGVtcGxhdGVzLyI7fQ==','YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=','YToxOntzOjQ0OiIvQXBwbGljYXRpb25zL01BTVAvaHRkb2NzL01lV2VfQ01TL2luZGV4LnBocCI7czozMjoiZDI3OTRkODBlMjY0M2JhODNjYzhiYmNhNGRkODk2MmIiO30=','YToxOntpOjE7YTozOntzOjM6InVybCI7czoyNjoiaHR0cDovL2xvY2FsaG9zdC9NZVdlX0NNUy8iO3M6NDoidXJpcyI7YTo1OntpOjM7czo3OiIvYWJvdXQvIjtpOjQ7czoxMToiL2luY3ViYXRvci8iO2k6NTtzOjExOiIvd29ya3NwYWNlLyI7aTo2O3M6MTI6Ii9tZW1iZXJzaGlwLyI7aTo3O3M6ODoiL3NpZ24tdXAiO31zOjk6InRlbXBsYXRlcyI7YTo1OntpOjM7czoxOiI1IjtpOjQ7czoxOiI5IjtpOjU7czoyOiIxMCI7aTo2O3M6MjoiMTEiO2k6NztzOjI6IjEyIjt9fX0=');
/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_snippets`
--

DROP TABLE IF EXISTS `exp_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_snippets`
--

LOCK TABLES `exp_snippets` WRITE;
/*!40000 ALTER TABLE `exp_snippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_specialty_templates`
--

DROP TABLE IF EXISTS `exp_specialty_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_specialty_templates`
--

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;
INSERT INTO `exp_specialty_templates` VALUES (1,1,'y','offline_template','','<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),(2,1,'y','message_template','','<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:	#ffffff; \nmargin:				50px; \nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n  \na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),(3,1,'y','admin_notify_reg','Notification of new member registration','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),(4,1,'y','admin_notify_entry','A new channel entry has been posted','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),(5,1,'y','admin_notify_mailinglist','Someone has subscribed to your mailing list','A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),(6,1,'y','admin_notify_comment','You have just received a comment','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),(7,1,'y','mbr_activation_instructions','Enclosed is your activation code','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),(8,1,'y','forgot_password_instructions','Login information','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nYour password will be automatically reset, and a new password will be emailed to you.\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),(9,1,'y','reset_password_notification','New Login Information','{name},\n\nHere is your new login information:\n\nUsername: {username}\nPassword: {password}\n\n{site_name}\n{site_url}'),(10,1,'y','validated_member_notify','Your membership account has been activated','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),(11,1,'y','decline_member_validation','Your membership account has been declined','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),(12,1,'y','mailinglist_activation_instructions','Email Confirmation','Thank you for joining the \"{mailing_list}\" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),(13,1,'y','comment_notification','Someone just responded to your comment','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),(14,1,'y','comments_opened_notification','New comments have been added','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),(15,1,'y','private_message_notification','Someone has sent you a Private Message','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),(16,1,'y','pm_inbox_full','Your private message mailbox is full','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');
/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_stats`
--

DROP TABLE IF EXISTS `exp_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_stats`
--

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;
INSERT INTO `exp_stats` VALUES (1,1,1,1,'Administrator',8,0,0,0,1333636013,0,0,1333640938,8,1333639793,1334218705);
/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_status_groups`
--

DROP TABLE IF EXISTS `exp_status_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_status_groups`
--

LOCK TABLES `exp_status_groups` WRITE;
/*!40000 ALTER TABLE `exp_status_groups` DISABLE KEYS */;
INSERT INTO `exp_status_groups` VALUES (1,1,'Statuses');
/*!40000 ALTER TABLE `exp_status_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_status_no_access`
--

DROP TABLE IF EXISTS `exp_status_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_status_no_access`
--

LOCK TABLES `exp_status_no_access` WRITE;
/*!40000 ALTER TABLE `exp_status_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_status_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_statuses`
--

DROP TABLE IF EXISTS `exp_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_statuses`
--

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;
INSERT INTO `exp_statuses` VALUES (1,1,1,'open',1,'009933'),(2,1,1,'closed',2,'990000');
/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_groups`
--

DROP TABLE IF EXISTS `exp_template_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_groups`
--

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;
INSERT INTO `exp_template_groups` VALUES (1,1,'site',1,'y'),(2,1,'news',2,'n'),(3,1,'pages',3,'n'),(4,1,'includes',4,'n');
/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_member_groups`
--

DROP TABLE IF EXISTS `exp_template_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_member_groups`
--

LOCK TABLES `exp_template_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_no_access`
--

DROP TABLE IF EXISTS `exp_template_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_no_access`
--

LOCK TABLES `exp_template_no_access` WRITE;
/*!40000 ALTER TABLE `exp_template_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_templates`
--

DROP TABLE IF EXISTS `exp_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (1,1,1,'index','y','webpage','<!DOCTYPE html>\n\n<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->\n<!--[if lt IE 7]> <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\" lang=\"en\"> <![endif]-->\n<!--[if IE 7]>    <html class=\"no-js lt-ie9 lt-ie8\" lang=\"en\"> <![endif]-->\n<!--[if IE 8]>    <html class=\"no-js lt-ie9\" lang=\"en\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\" lang=\"en\"> <!--<![endif]-->\n<head>\n	<meta charset=\"utf-8\" />\n\n	<!-- Set the viewport width to device width for mobile -->\n	<meta name=\"viewport\" content=\"width=device-width\" />\n\n	<title>Welcome to MeWe</title>\n  \n	<!-- Included CSS Files -->\n	<!-- Combine and Compress These CSS Files -->\n	<link rel=\"stylesheet\" href=\"stylesheets/globals.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/typography.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/grid.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/ui.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/forms.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/orbit.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/reveal.css\">\n	<link rel=\"stylesheet\" href=\"stylesheets/mobile.css\">\n	\n	<!-- End Combine and Compress These CSS Files -->\n	<link rel=\"stylesheet\" href=\"stylesheets/app.css\">\n\n	<!--[if lt IE 9]>\n		<link rel=\"stylesheet\" href=\"stylesheets/ie.css\">\n	<![endif]-->\n	\n	<!-- Non framework custom CSS -->\n	<link rel=\"stylesheet\" href=\"stylesheets/custom.css\">\n	\n	<!-- Google Webfonts -->\n	<link rel=\"stylesheet\" type=\"text/css\" href=\"http://fonts.googleapis.com/css?family=Candara\">\n	\n	<script src=\"javascripts/modernizr.foundation.js\"></script>\n\n\n	<!-- IE Fix for HTML5 Tags -->\n	<!--[if lt IE 9]>\n		<script src=\"http://html5shiv.googlecode.com/svn/trunk/html5.js\"></script>\n	<![endif]-->\n	\n	<script type=\'text/javascript\'>\n	(function (d, t) {\n	  var bh = d.createElement(t), s = d.getElementsByTagName(t)[0];\n	  bh.type = \'text/javascript\';\n	  bh.src = \'//www.bugherd.com/sidebarv2.js?apikey=da8da014-e25b-4041-b791-25f3100fa3c8\';\n	  s.parentNode.insertBefore(bh, s);\n	  })(document, \'script\');\n	</script>\n\n</head>\n\n<body>\n		\n		<div id=\"top-background\">\n			<div id=\"background\">\n				<div id=\"header\">\n\n					<div class=\"row\" id=\"branding\">\n							<div class=\"twelve columns\">\n									<img src=\"/img/Logo.png\" alt=\"Mewe Logo\" />\n							</div>\n							\n							<ul class=\"secondary-nav hide-on-phones shadow\">\n								<li><a href=\"#\">Login</a></li>\n								<li><a href=\"sign-up.html\" class=\"alternate\">Join Up</a></li>\n							</ul>\n					</div>\n\n					<div class=\"row\" id=\"masthead\" >\n						<div class=\"twelve columns\" >\n								<ul class=\"nav-bar hide-on-phones\" id=\"primary-nav\">\n									<li class=\"selected\"><a href=\"index.html\" class=\"main\"><span>Home</span></a></li>\n									<li> <a href=\"about.html\" class=\"main\">About</a></li>\n									<li> <a href=\"incubator.html\" class=\"main\">Incubator</a></li>\n									<li> <a href=\"workspace.html\" class=\"main\">Workspace</a></li>\n									<li> <a href=\"events.html\" class=\"main\">Events</a></li>\n									<li> <a href=\"membership.html\" class=\"main\">Membership</a></li>\n									<li> <a href=\"news.html\" class=\"main\">News</a></li>\n									<li class=\"hub has-flyout\">\n										<a href=\"#\" class=\"main\">Hub</a>\n										<div class=\"flyout\" style=\"display: none;\">\n											<ul>\n												<li><a href=\"profile.html\" class=\"main\">Profile</a></li>\n												<li><a href=\"community.html\" class=\"main\">Community</a></li>\n												<li><a href=\"#\" class=\"main\">Resources</a></li>\n											</ul>\n										</div>\n									</li>\n								</ul>\n						</div>\n					</div>\n				\n				</div> <!-- #header -->\n\n			\n				<div class=\"container\"> \n\n					<div class=\"row\" id=\'topSection\'>\n\n						<div class=\"six columns push-six\" id=\"straplineArea\">\n								<div class=\"cta-container\">\n									<h1>We provide access to the best <a>funding</a>, <a>mentoring</a> and <a>incubation</a> to propel your creative business.</h1>\n									<a class=\"huge button black radius black-gradient hide-on-phones\" href=\"#\"><span>Join today</span></a>\n								</div>\n						</div> <!-- #straplineArea -->\n\n						<div class=\"six columns pull-six\" id=\'carousel\'>\n								\n								<div class=\"frame\">\n									     <img src=\"/img/carousel/5.jpg\"/>\n								</div> <!-- carousel-container -->\n					\n				\n						</div> <!-- #carousel -->\n			\n				\n					</div> <!-- #topSection -->\n			\n					<div class=\"row services\">\n				\n							<div class=\"quarter columns\">\n								<div class=\"service rounded\">\n										<h2>Incubator</h2>\n									<img src=\"/img/workspace.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>Fund your business</span></a>\n								</div> <!-- panel -->\n							</div>				\n				\n							<div class=\"quarter columns\">				\n								<div class=\"service rounded\">\n									<h2>Workspace</h2>\n									<img src=\"/img/workspace.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>See the workspace</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class=\"quarter columns\">					\n								<div class=\"service rounded\">\n									<h2>Events</h2>\n									<img src=\"/img/events.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>Come to an event</span></a>\n								</div> <!-- panel -->\n							</div>				\n					\n							<div class=\"quarter columns\">				\n								<div class=\"service rounded\">\n									<h2>Consulting</h2>\n									<img src=\"/img/consulting.jpg\" alt=\"MeWe Incubator\" />\n									<p>£1 million business incubator and venture fund</p>\n									<a href=\"#\" class=\"medium black button radius black-gradient\"><span>Find out more</span></a>\n								</div> <!-- panel -->\n							</div>\n\n\n					</div><!-- #services-->\n				\n\n					<div class=\"row\" id=\"news-area\">\n					\n						<div class=\"seven columns\">\n						\n							<h2>Latest news</h2>\n\n								<div class=\"row\">\n									<div class=\"three columns\">\n									\n										<div class=\"flex-video vimeo\">\n											<iframe src=\"http://player.vimeo.com/video/30995060?title=0&amp;byline=0&amp;portrait=0&amp;color=ffffff\" width=\"128\" height=\"80\" frameborder=\"0\"></iframe>\n										</div>\n									\n									</div> <!-- .six columns -->\n\n									<div class=\"nine columns\">\n										<div class=\"news-article\">\n											<header>\n												<h3 class=\"news-heading\">Headline</h3>\n												<p><span class=\"date\">19th February 2027</span> by Kevin <span class=\"comments\">3 comments</span></p>\n											</header>	\n											<p class=\"excerpt\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat... </p>\n										</div> <!-- .news-article -->\n									</div>\n								\n								</div> <!-- .row -->\n					\n\n\n						</div> <!-- .seven columns-->\n\n						<div class=\"five columns\">	\n							<h2>Upcoming events</h2>\n							<div class=\"row event\">\n								<div class=\"three columns\">\n										<div class=\"date-box\">\n											<p class=\"month\">MAR</p>\n											<p class=\"day\">25</p>\n										</div> <!-- date-box -->\n								</div>\n								<div class=\"nine columns\">\n									<div class=\"event-details\">\n										<h3 class=\"event-heading\">Networking Event</h3>\n										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>\n									</div> <!-- date- -->	\n								</div>\n							</div>\n		\n						</div> <!-- sidebar -->\n							\n			\n					</div> <!-- #news-area -->\n\n				</div> <!-- container -->\n\n				<div class=\"sponsors\">\n					<div class=\"row\">\n						<div class=\"twelve columns\"><img src=\"/img/sponsors.png\" alt=\"Our Sponsors\" /></div>\n					</div>\n				</div>\n		\n				<div id=\"footer\">\n			\n					<div class=\"row\">\n						<div class=\"three columns\">\n							<h3>Find Us</h3>\n							<div class=\"container\">\n								<img class=\"map\" src=\"/img/map.png\" />\n							</div>\n						</div>\n						<div class=\"three columns\">\n							<h3>Get in touch</h3>\n							<div class=\"container\">\n								<p>MeWe Foundation<br />Golden Square<br />London, W1 123<br /><br />020 7123 4567<br /><a href=\"mailto:info@mewe.com\">info@mewe.com</a></p>\n							</div>\n						</div>\n						\n						<div class=\"three columns networks\">\n							<h3>Networks</h3>\n							<div class=\"container\">\n								<ul>\n									<li><a href=\"#\"><img src=\"/img/twitter.png\" />Twitter</a></li>\n									<li><a href=\"#\"><img src=\"/img/facebook.png\" />Facebook</a></li>\n									<li><a href=\"#\"><img src=\"/img/linkedin.png\" />LinkedIn</a></li>\n								</ul>\n							</div>\n						</div>\n						<div class=\"three columns feedback\">\n							<h3>Feedback</h3>\n							<div class=\"container\">\n								<p>We’re always looking to improve what we do. If you have feedback we\'d love to hear from you!</p>\n								<a href=\"#\" class=\"medium radius button black-gradient\">Get in touch</a>\n							</div>\n						</div>\n					</div>	\n				\n				\n				</div> <!-- .footer -->\n				\n				</div> <!-- #background -->\n		</div> <!-- #top-background -->\n\n\n\n	<!-- Included JS Files -->\n	<script src=\"javascripts/jquery.min.js\"></script>\n	<!-- Combine and Compress These JS Files -->\n	<script src=\"javascripts/jquery.reveal.js\"></script>\n	<script src=\"javascripts/jquery.orbit-1.4.0.js\"></script>\n	<script src=\"javascripts/jquery.customforms.js\"></script>\n	<script src=\"javascripts/jquery.placeholder.min.js\"></script>\n	<script src=\"javascripts/jquery.tooltips.js\"></script>\n	<!-- End Combine and Compress These JS Files -->\n	<script src=\"javascripts/app.js\"></script>\n	\n	<!-- MeWe Custom JS -->\n	<!-- <script src=\"javascripts/custom.js\"></script> -->\n	\n	<script type=\"text/javascript\">\n	//     $(window).load(function() {\n	  //       $(\'#featured\').orbit({directionalNav: false, timer: false});\n	  //   });\n	</script>\n	\n	<!-- Live Reload Code -->\n	<script>document.write(\'<script src=\"http://\' + (location.host || \'localhost\').split(\':\')[0] + \':35729/livereload.js?snipver=1\"></\' + \'script>\')</script>\n\n</body>\n</html>','',1333622103,1,'n',0,'','n','n','o',866),(2,1,2,'index','y','webpage','','',1332436446,1,'n',0,'','n','n','o',1),(3,1,3,'index','n','webpage','',NULL,1333614547,0,'n',0,'','n','n','o',46),(5,1,3,'about','y','webpage','','',1333620117,1,'n',0,'','n','n','o',37),(6,1,4,'index','n','webpage','',NULL,1333623226,0,'n',0,'','n','n','o',0),(7,1,4,'header','y','webpage','','',1333623245,1,'n',0,'','n','n','o',0),(8,1,4,'footer','y','webpage','','',1333624079,1,'n',0,'','n','n','o',0),(9,1,3,'incubator','y','webpage','','',1333624368,1,'n',0,'','n','n','o',3),(10,1,3,'workspace','y','webpage','','',1333624633,1,'n',0,'','n','n','o',4),(11,1,3,'membership','y','webpage','','',1333624981,1,'n',0,'','n','n','o',3),(12,1,3,'sign-up','y','webpage','','',1333631948,1,'n',0,'','n','n','o',7);
/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_throttle`
--

DROP TABLE IF EXISTS `exp_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_throttle`
--

LOCK TABLES `exp_throttle` WRITE;
/*!40000 ALTER TABLE `exp_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_no_access`
--

DROP TABLE IF EXISTS `exp_upload_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_no_access`
--

LOCK TABLES `exp_upload_no_access` WRITE;
/*!40000 ALTER TABLE `exp_upload_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_upload_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_prefs`
--

DROP TABLE IF EXISTS `exp_upload_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_prefs`
--

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-04-05 17:02:24
