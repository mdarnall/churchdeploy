# Sequel Pro dump
# Version 2492
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.1.44)
# Database: accf
# Generation Time: 2011-02-13 16:58:48 -0800
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table sym_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_authors`;

CREATE TABLE `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','developer') NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') NOT NULL DEFAULT 'no',
  `default_section` int(11) NOT NULL,
  `auth_token_active` enum('yes','no') NOT NULL DEFAULT 'no',
  `language` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_authors` WRITE;
/*!40000 ALTER TABLE `sym_authors` DISABLE KEYS */;
INSERT INTO `sym_authors` (`id`,`username`,`password`,`first_name`,`last_name`,`email`,`last_seen`,`user_type`,`primary`,`default_section`,`auth_token_active`,`language`)
VALUES
	(1,'kirkstrobeck','199aa97af20bc24339c1dfae5f94766c','Kirk','Strobeck','kirk@strobeck.com','2011-02-13 15:39:00','developer','yes',6,'no',NULL);

/*!40000 ALTER TABLE `sym_authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_cache`;

CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creation` (`creation`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_cache` WRITE;
/*!40000 ALTER TABLE `sym_cache` DISABLE KEYS */;
INSERT INTO `sym_cache` (`id`,`hash`,`creation`,`expiry`,`data`)
VALUES
	(1,'_session_config',1297047150,NULL,'eJwzBAAAMgAy');

/*!40000 ALTER TABLE `sym_cache` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries`;

CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries` WRITE;
/*!40000 ALTER TABLE `sym_entries` DISABLE KEYS */;
INSERT INTO `sym_entries` (`id`,`section_id`,`author_id`,`creation_date`,`creation_date_gmt`)
VALUES
	(1,2,1,'2011-02-07 17:13:28','2011-02-08 01:13:28');

/*!40000 ALTER TABLE `sym_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_5
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_5`;

CREATE TABLE `sym_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_5` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_5` DISABLE KEYS */;
INSERT INTO `sym_entries_data_5` (`id`,`entry_id`,`username`,`password`)
VALUES
	(3,1,'kirkstrobeck','199aa97af20bc24339c1dfae5f94766c');

/*!40000 ALTER TABLE `sym_entries_data_5` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_6
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_6`;

CREATE TABLE `sym_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`,`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_6` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_6` DISABLE KEYS */;
INSERT INTO `sym_entries_data_6` (`id`,`entry_id`,`role_id`)
VALUES
	(3,1,3);

/*!40000 ALTER TABLE `sym_entries_data_6` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_7
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_7`;

CREATE TABLE `sym_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_8
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_8`;

CREATE TABLE `sym_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_8` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_8` DISABLE KEYS */;
INSERT INTO `sym_entries_data_8` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(3,1,'kirk-strobeckcom','kirk@strobeck.com');

/*!40000 ALTER TABLE `sym_entries_data_8` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_9
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_9`;

CREATE TABLE `sym_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_9` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_9` DISABLE KEYS */;
INSERT INTO `sym_entries_data_9` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(3,1,'kirk-strobeck','Kirk Strobeck');

/*!40000 ALTER TABLE `sym_entries_data_9` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_extensions`;

CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_extensions` WRITE;
/*!40000 ALTER TABLE `sym_extensions` DISABLE KEYS */;
INSERT INTO `sym_extensions` (`id`,`name`,`status`,`version`)
VALUES
	(1,'asdc','enabled','1.3'),
	(2,'debugdevkit','enabled','1.0.5'),
	(8,'members','enabled','1.2.1beta'),
	(5,'profiledevkit','enabled','1.0.1'),
	(9,'smtp_email_library','enabled','1.1');

/*!40000 ALTER TABLE `sym_extensions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_extensions_delegates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_extensions_delegates`;

CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `delegate` varchar(100) NOT NULL,
  `callback` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_extensions_delegates` WRITE;
/*!40000 ALTER TABLE `sym_extensions_delegates` DISABLE KEYS */;
INSERT INTO `sym_extensions_delegates` (`id`,`extension_id`,`page`,`delegate`,`callback`)
VALUES
	(1,2,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(2,2,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),
	(32,8,'/frontend/','EventPreSaveFilter','checkEventPermissions'),
	(31,8,'/frontend/','EventPostSaveFilter','processEventData'),
	(30,8,'/frontend/','FrontendProcessEvents','appendLoginStatusToEventXML'),
	(28,8,'/frontend/','FrontendParamsResolve','cbAddParamsToPage'),
	(29,8,'/frontend/','FrontendParamsResolve','cbAddMemberDetailsToPageParams'),
	(11,5,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(12,5,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),
	(33,8,'/publish/new/','EntryPostCreate','cbEmailNewMember'),
	(27,8,'/frontend/','FrontendPageResolved','cbCheckFrontendPagePermissions'),
	(34,9,'/system/preferences/','AddCustomPreferenceFieldsets','cbAppendPreferences'),
	(35,9,'/system/preferences/','Save','cbSavePreferences'),
	(36,9,'/blueprints/events/new/','AppendEventFilter','cbAddFilterToEventEditor'),
	(37,9,'/blueprints/events/edit/','AppendEventFilter','cbAddFilterToEventEditor'),
	(38,9,'/blueprints/events/new/','AppendEventFilterDocumentation','cbAppendEventFilterDocumentation'),
	(39,9,'/blueprints/events/edit/','AppendEventFilterDocumentation','cbAppendEventFilterDocumentation'),
	(40,9,'/frontend/','EventPostSaveFilter','cbSendEmailSMTPFilter');

/*!40000 ALTER TABLE `sym_extensions_delegates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields`;

CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `element_name` varchar(50) NOT NULL,
  `type` varchar(32) NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields` WRITE;
/*!40000 ALTER TABLE `sym_fields` DISABLE KEYS */;
INSERT INTO `sym_fields` (`id`,`label`,`element_name`,`type`,`parent_section`,`required`,`sortorder`,`location`,`show_column`)
VALUES
	(7,'Timezone Offset','timezone-offset','input',2,'no',4,'sidebar','yes'),
	(6,'Role','role','memberrole',2,'no',3,'sidebar','yes'),
	(5,'Username and Password','username-and-password','member',2,'yes',1,'main','yes'),
	(8,'Email Address','email-address','input',2,'yes',2,'main','yes'),
	(9,'Name','name','input',2,'yes',0,'main','yes');

/*!40000 ALTER TABLE `sym_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_author
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_author`;

CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_checkbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_checkbox`;

CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') NOT NULL DEFAULT 'on',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_date
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_date`;

CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') NOT NULL DEFAULT 'no',
  `calendar` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_input
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_input`;

CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_input` WRITE;
/*!40000 ALTER TABLE `sym_fields_input` DISABLE KEYS */;
INSERT INTO `sym_fields_input` (`id`,`field_id`,`validator`)
VALUES
	(10,8,'/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i'),
	(11,7,NULL),
	(9,9,NULL);

/*!40000 ALTER TABLE `sym_fields_input` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_member`;

CREATE TABLE `sym_fields_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_member` WRITE;
/*!40000 ALTER TABLE `sym_fields_member` DISABLE KEYS */;
INSERT INTO `sym_fields_member` (`id`,`field_id`)
VALUES
	(4,5);

/*!40000 ALTER TABLE `sym_fields_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberlink
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberlink`;

CREATE TABLE `sym_fields_memberlink` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_memberrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberrole`;

CREATE TABLE `sym_fields_memberrole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_memberrole` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberrole` DISABLE KEYS */;
INSERT INTO `sym_fields_memberrole` (`id`,`field_id`)
VALUES
	(4,6);

/*!40000 ALTER TABLE `sym_fields_memberrole` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_select
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_select`;

CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `static_options` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_taglist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_taglist`;

CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) DEFAULT NULL,
  `pre_populate_source` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_textarea
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_textarea`;

CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_upload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_upload`;

CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) NOT NULL,
  `validator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_forgotpass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_forgotpass`;

CREATE TABLE `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(6) NOT NULL,
  `expiry` varchar(25) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_members_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_codes`;

CREATE TABLE `sym_members_codes` (
  `member_id` int(11) unsigned NOT NULL,
  `code` varchar(8) NOT NULL,
  `expiry` int(11) NOT NULL,
  PRIMARY KEY (`member_id`),
  KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_members_codes` WRITE;
/*!40000 ALTER TABLE `sym_members_codes` DISABLE KEYS */;
INSERT INTO `sym_members_codes` (`member_id`,`code`,`expiry`)
VALUES
	(1,'6f87d121',1297131208),
	(2,'35376ed1',1297131327);

/*!40000 ALTER TABLE `sym_members_codes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_members_email_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_email_templates`;

CREATE TABLE `sym_members_email_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_members_email_templates` WRITE;
/*!40000 ALTER TABLE `sym_members_email_templates` DISABLE KEYS */;
INSERT INTO `sym_members_email_templates` (`id`,`subject`,`body`,`type`)
VALUES
	(5,'Account Activation','Dear {$name},\r\n\r\nThanks for registering at {$site-name}!\r\n\r\nTo activate your account, head to {$root}/activate/{$code}\r\n\r\nThis code will expire in one hour, so if you miss your window, simply head to the link above and click \"Resend activation email\" to get a new one.\r\n\r\nIf you have problems activating your account, please get in touch with us using our contact form at {$root}/contact/ and we\'ll do our best to help.\r\n\r\nWe don\'t know you yet, but we can already tell that you\'ll be a wonderful addition to our growing community!\r\n\r\nRegards,\r\n\r\n---\r\nSymphony Team','activate-account'),
	(6,'Reset Password','Dear {$name},\r\n\r\nTo reset your password, please head over to: {$root}/reset-password/{$code}\r\n\r\nThe code will expire in one hour, so if you miss your window, head back to {$root}/reset-password/ and click the \"Resend Email\" button to generate a new reset key.\r\n\r\nIf you have any trouble, please get in touch with us via our contact form at {$root}/contact/ and we\'ll do our best to help.\r\n\r\nRegards,\r\n\r\n---\r\nSymphony Team','reset-password'),
	(7,'New password','Dear {$name},\r\n\r\nJust now, you have made a request for a new password. Here it is: {$new-password}\r\n\r\nThere\'s a good chance that you won\'t like this new password and would like to change it--that\'s okay, we\'re not offended.\r\n\r\nYou can do that once you\'re logged in by going to your member profile page.\r\n\r\nIf you have any trouble, please get in touch with us via our contact form at {$root}/contact/ and we\'ll do our best to help.\r\n\r\nRegards,\r\n\r\n---\r\nSymphony Team','new-password'),
	(8,'Membership Activated','Dear {$name},\r\n\r\nCongratulations on obtaining your citizenship! You are now a fully fledged member of the community.\r\n\r\nRegards,\r\n\r\n---\r\nSymphony Team','welcome');

/*!40000 ALTER TABLE `sym_members_email_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_members_email_templates_role_mapping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_email_templates_role_mapping`;

CREATE TABLE `sym_members_email_templates_role_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_template_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_template_id` (`email_template_id`,`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_members_email_templates_role_mapping` WRITE;
/*!40000 ALTER TABLE `sym_members_email_templates_role_mapping` DISABLE KEYS */;
INSERT INTO `sym_members_email_templates_role_mapping` (`id`,`email_template_id`,`role_id`)
VALUES
	(11,5,2),
	(2,6,3),
	(3,6,4),
	(4,6,2),
	(5,7,4),
	(6,7,2),
	(7,7,3),
	(9,8,3),
	(10,8,4);

/*!40000 ALTER TABLE `sym_members_email_templates_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_members_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles`;

CREATE TABLE `sym_members_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_members_roles` WRITE;
/*!40000 ALTER TABLE `sym_members_roles` DISABLE KEYS */;
INSERT INTO `sym_members_roles` (`id`,`name`)
VALUES
	(1,'Guest'),
	(2,'Inactive'),
	(3,'Member'),
	(4,'Administrator');

/*!40000 ALTER TABLE `sym_members_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_members_roles_event_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles_event_permissions`;

CREATE TABLE `sym_members_roles_event_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `event` varchar(50) NOT NULL,
  `action` varchar(60) NOT NULL,
  `level` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`event`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_members_roles_event_permissions` WRITE;
/*!40000 ALTER TABLE `sym_members_roles_event_permissions` DISABLE KEYS */;
INSERT INTO `sym_members_roles_event_permissions` (`id`,`role_id`,`event`,`action`,`level`)
VALUES
	(34,4,'members_register','create',1),
	(35,4,'members_register','edit',2),
	(31,1,'members_register','create',1),
	(32,1,'members_register','edit',0),
	(33,2,'members_register','edit',0),
	(29,3,'members_register','edit',0);

/*!40000 ALTER TABLE `sym_members_roles_event_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_members_roles_forbidden_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles_forbidden_pages`;

CREATE TABLE `sym_members_roles_forbidden_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`page_id`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_members_roles_forbidden_pages` WRITE;
/*!40000 ALTER TABLE `sym_members_roles_forbidden_pages` DISABLE KEYS */;
INSERT INTO `sym_members_roles_forbidden_pages` (`id`,`role_id`,`page_id`)
VALUES
	(86,1,13),
	(85,1,12),
	(84,1,7),
	(83,1,8),
	(82,1,6),
	(108,2,8),
	(109,2,7),
	(110,2,13),
	(112,2,15),
	(113,3,8),
	(119,4,14),
	(81,1,5),
	(111,2,14),
	(80,1,4),
	(114,3,14),
	(118,4,7),
	(87,1,15);

/*!40000 ALTER TABLE `sym_members_roles_forbidden_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_pages`;

CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `handle` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `data_sources` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `events` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_pages` WRITE;
/*!40000 ALTER TABLE `sym_pages` DISABLE KEYS */;
INSERT INTO `sym_pages` (`id`,`parent`,`title`,`handle`,`path`,`params`,`data_sources`,`events`,`sortorder`)
VALUES
	(1,NULL,'Home','home',NULL,NULL,NULL,NULL,0),
	(2,NULL,'Register','register',NULL,NULL,NULL,'members_register',1),
	(3,NULL,'Reset Password','reset-password',NULL,'code',NULL,'members_reset_password',2),
	(4,NULL,'Activate','activate',NULL,'code',NULL,'members_activate_account,members_resend_activation_email',4),
	(5,NULL,'Change Password','change-password',NULL,NULL,NULL,'members_change_password',6),
	(7,NULL,'Special Members Only Page','special-members-only-page',NULL,NULL,NULL,NULL,10),
	(8,NULL,'Special Administrator Only Page','special-administrator-only-page',NULL,NULL,NULL,NULL,11),
	(9,NULL,'Forbidden','forbidden',NULL,NULL,NULL,NULL,12),
	(10,NULL,'Page Not Found','page-not-found',NULL,NULL,NULL,NULL,13),
	(11,NULL,'Login','login',NULL,NULL,NULL,NULL,8),
	(12,11,'Success','success','login',NULL,NULL,NULL,9),
	(13,4,'Success','success','activate',NULL,NULL,NULL,5),
	(14,3,'Success','success','reset-password',NULL,NULL,NULL,3),
	(15,5,'Success','success','change-password',NULL,NULL,NULL,7);

/*!40000 ALTER TABLE `sym_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_pages_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_pages_types`;

CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_pages_types` WRITE;
/*!40000 ALTER TABLE `sym_pages_types` DISABLE KEYS */;
INSERT INTO `sym_pages_types` (`id`,`page_id`,`type`)
VALUES
	(1,9,'403'),
	(2,1,'index'),
	(3,10,'404');

/*!40000 ALTER TABLE `sym_pages_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sections`;

CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `handle` varchar(255) NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `entry_order` varchar(7) DEFAULT NULL,
  `entry_order_direction` enum('asc','desc') DEFAULT 'asc',
  `hidden` enum('yes','no') NOT NULL DEFAULT 'no',
  `navigation_group` varchar(255) NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sections` WRITE;
/*!40000 ALTER TABLE `sym_sections` DISABLE KEYS */;
INSERT INTO `sym_sections` (`id`,`name`,`handle`,`sortorder`,`entry_order`,`entry_order_direction`,`hidden`,`navigation_group`)
VALUES
	(2,'Members','members',999,NULL,'asc','no','Content');

/*!40000 ALTER TABLE `sym_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_sections_association
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sections_association`;

CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `cascading_deletion` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sessions`;

CREATE TABLE `sym_sessions` (
  `session` varchar(255) NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text,
  PRIMARY KEY (`session`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sessions` WRITE;
/*!40000 ALTER TABLE `sym_sessions` DISABLE KEYS */;
INSERT INTO `sym_sessions` (`session`,`session_expires`,`session_data`)
VALUES
	('a87a761db7a4e438a9d10b6e2ca76ff8',1297640340,'sym-|a:2:{s:8:\"username\";s:12:\"kirkstrobeck\";s:4:\"pass\";s:32:\"199aa97af20bc24339c1dfae5f94766c\";}sym-members|a:0:{}');

/*!40000 ALTER TABLE `sym_sessions` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
