# ************************************************************
# Sequel Pro SQL dump
# Version 3348
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.1.44)
# Database: atheycreek
# Generation Time: 2011-08-19 18:52:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table sym_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_authors`;

CREATE TABLE `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','developer') NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') NOT NULL DEFAULT 'no',
  `default_area` varchar(255) DEFAULT NULL,
  `auth_token_active` enum('yes','no') NOT NULL DEFAULT 'no',
  `language` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_authors` WRITE;
/*!40000 ALTER TABLE `sym_authors` DISABLE KEYS */;

INSERT INTO `sym_authors` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `last_seen`, `user_type`, `primary`, `default_area`, `auth_token_active`, `language`)
VALUES
	(1,'admin','7e523a069053bd727bf980a2eaef2913c8692c1e','Admin','Admin','noreply@churchdeploy.com','2011-08-19 11:51:53','developer','yes',NULL,'no',NULL);

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
  KEY `expiry` (`expiry`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_extensions` WRITE;
/*!40000 ALTER TABLE `sym_extensions` DISABLE KEYS */;

INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`)
VALUES
	(1,'xssfilter','enabled','1.0'),
	(2,'debugdevkit','enabled','1.1'),
	(3,'export_ensemble','enabled','1.13'),
	(4,'selectbox_link_field','enabled','1.19'),
	(5,'jit_image_manipulation','enabled','1.10'),
	(6,'maintenance_mode','enabled','1.4'),
	(7,'profiledevkit','enabled','1.0.4'),
	(8,'markdown','enabled','1.13');

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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_extensions_delegates` WRITE;
/*!40000 ALTER TABLE `sym_extensions_delegates` DISABLE KEYS */;

INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`)
VALUES
	(1,1,'/blueprints/events/new/','AppendEventFilter','appendEventFilter'),
	(2,1,'/blueprints/events/edit/','AppendEventFilter','appendEventFilter'),
	(3,1,'/frontend/','EventPreSaveFilter','eventPreSaveFilter'),
	(4,2,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(5,2,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),
	(6,3,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(7,5,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(8,5,'/system/preferences/','Save','__SavePreferences'),
	(9,6,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(10,6,'/system/preferences/','Save','__SavePreferences'),
	(11,6,'/system/preferences/','CustomActions','__toggleMaintenanceMode'),
	(12,6,'/backend/','AppendPageAlert','__appendAlert'),
	(13,6,'/blueprints/pages/','AppendPageContent','__appendType'),
	(14,6,'/frontend/','FrontendPrePageResolve','__checkForMaintenanceMode'),
	(15,6,'/frontend/','FrontendParamsResolve','__addParam'),
	(16,7,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(17,7,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



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
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_input
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_input`;

CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_select
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_select`;

CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') NOT NULL DEFAULT 'no',
  `static_options` text,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_selectbox_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_selectbox_link`;

CREATE TABLE `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `related_field_id` varchar(255) NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_taglist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_taglist`;

CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
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
  `validator` varchar(255) DEFAULT NULL,
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
  `data_sources` text,
  `events` text,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_pages_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_pages_types`;

CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_sections_association
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sections_association`;

CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sessions`;

CREATE TABLE `sym_sessions` (
  `session` varchar(100) NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sessions` WRITE;
/*!40000 ALTER TABLE `sym_sessions` DISABLE KEYS */;

INSERT INTO `sym_sessions` (`session`, `session_expires`, `session_data`)
VALUES
	('f99e2f0f3c6217cd018b76611c496bcb',1313779913,'sym-|a:2:{s:8:\"username\";s:5:\"admin\";s:4:\"pass\";s:40:\"7e523a069053bd727bf980a2eaef2913c8692c1e\";}');

/*!40000 ALTER TABLE `sym_sessions` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;