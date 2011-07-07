# Sequel Pro dump
# Version 2492
# http://code.google.com/p/sequel-pro
#
# Host: localhost (MySQL 5.1.44)
# Database: accf
# Generation Time: 2011-02-22 13:07:46 -0800
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
	(1,'kirkstrobeck','199aa97af20bc24339c1dfae5f94766c','Kirk','Strobeck','kirk@strobeck.com','2011-02-22 12:57:28','developer','yes',6,'no',NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_cache` WRITE;
/*!40000 ALTER TABLE `sym_cache` DISABLE KEYS */;
INSERT INTO `sym_cache` (`id`,`hash`,`creation`,`expiry`,`data`)
VALUES
	(1,'_session_config',1297047150,NULL,'eJwzBAAAMgAy'),
	(103,'f2180baa54f9b8cff1554bf468214f82',1298178380,NULL,'eJydVttu2zgQfe9XEFo0FzQWLSlObFlWWrhYYIEFtm3cBXZfDEYeS0QoUSWpOvn7HUqy5EudpvsS0HM5Z+ZwhlF095QL8h2U5rKYOZ47dAgUiVzxIp05Xxe/D8bOXfwmWgOsCIYWOkylTAXMnMyYMqT0gWlwG5ubyJwWmtYoGBwKZlGgGHy9d9psWUJxD0wlWYfAJnXigOoSEmoDdB2AOB5t87rgzWbjbgJXqpT6w+GIfjAy32KbDTcGVA9ccre11QxO/IaQiK9iw9Kw4dj1X1nA1k7JWsk8TBK0s4xFFLNssuDFIzHPJfZv4MnQzOTCIQrEzGECcQpmwCGZgnVXxTFRa7r7NntnWd4GH7Y8Dj1kYWUpeMIMXg9l2Ou7p45Qg1i/lsu1uacJDTcC4v2eyYAsGhzSXFhEm7AXKuwvbwU6Uby01r2Sre/nRfc4rk3+FVUQWYF+BcfLwpyxvJxqXiSw5KtZMPFu/WA8GY5vroPAHw/bkqpyhRe+iv2h5w2G/sC7WQz90PPC6+t/I7r12sh+7kNuINefQH1iKcTeKKKnfDYPCqOe7ennkxvc3kxGo4k/xjpHt1jkdmoxtaweBNfZyVJ7fxP/P+Z8V9v5fP6XVZFqw0ylQdOj4hoFu9n7siDvFcszZjFC8rniySNpBLwiiJyRMpNG6isi18RkQB4g5UWBz5Q1vN8SkntTrVAzMsc/OLkKcrkC4ZLta8WNK55plvx5W07Ibx8l9g3/yEr9kZcsMTsjjpUlEjEQq9GhlsDWeSbMlDW9n32rpJn+QICulSbiLDXTvj0LQJm1/XKjr+HearFD3Zk65pNCnWLYU66H/qG3ZzmF9tKj+NYPDu+lySWySHDtH1uoEndkoVjyiABLDWZeadzlv5m68K/IOT4ClTBLe3fn9c8EG8VTcLmfaOzBrtt3DpuLc8px4RjNmM5w1+jRhJxfTvvmj7x95xFtp6edpVe/FPvLx3OsjJZF2i5f/ftg8VhgdczTWsVSyTUX+GjZQE19bzjyfM+/sVOxTLhKBOhlIVXOhJvydb+FzU2EKcjWQo9NW0sOhmHBrDHvOHZEjxvFe5hd3wHDPl6HplHXBOJTM2Q/BcwGwKwgebTNt1NihWqOhVxLIeSmv7GFjf+I8bs3dcC3X4T9homh6KNqQxPDKpNJ1alQsBzi7iW6wBOpj5cRrV3buErx+IW9xXHAgFainiKi7f+CiNqvsfg/VhZDXw=='),
	(26,'c1eae13196cd46d65d23d20a16908b14',1297668131,NULL,'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'),
	(28,'05a163b14f80441c63e24568d07c4920',1297668285,NULL,'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'),
	(48,'1cbdce3a64734115ffbe1a6a651d4c6b',1298144087,NULL,'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'),
	(80,'0d04fe9500542525256bd7826ee5970d',1298174249,NULL,'eJw9jT0SgjAUBq/yTWoF7SxC6PQcQF5IZsh7ThJ+7mbhkbyCSGG7O7P7eb11u8UJC6UchBt1rS4KxIPYwGOj5uLON9UanSg/hTMZXWgr5i4JxRP6RJ2FODzEImTsaPVh8BgkUvGwsjJckribbiE+oWOLMSw/OQVHmLnIkVolTbbS9dHX9X/4Bf83Oqo='),
	(84,'7a883382a8c714eec2d1813a50368bc3',1298174701,NULL,'eJxtkUFOwzAQRa/ylXVIYYcgbVUWRUUsuYAbT2tLsQfZTtOejQVH4gqM3aYIxMayZr7/fzP++vhsl0fX40AhWvbz6q65rUC+Y239fl4NaXdzXy0XbaD4zj7Sok10TIs1ByRD2AZSGrzDM2vYCCmNxnYGHTtKBppHj11gJx11IF9DeY29PeRmb3eEwScuViOHXjd4M+QRldW5eDq3jXU1XjnoGiSkjgMVDwxRVBJbMBqsxPuFolSLwWQtjzdQ7jdwDn/IvMmoNOGK3hGiUX0Pn6NgBr+n8FiwJ/GWektlAvZ/9YITYmrwNCQJ/cE48VDLbPL6RFB9lKFkH4hE2eK8losvPIvBSixLWqZeKznDtLdrZKY+M18ArftnnA1GK2LrxViukdCpmMBDatpZ+c12dv3eb6IKubs='),
	(86,'c6901293a77068925a93ad581bde245b',1298174904,NULL,'eJw9jT0SgjAUBq/yTWoF7SxC6PQcQF5IZsh7ThJ+7mbhkbyCSGG7O7P7eb11u8UJC6UchBt1rS4KxIPYwGOj5uLON9UanSg/hTMZXWgr5i4JxRP6RJ2FODzEImTsaPVh8BgkUvGwsjJckribbiE+oWOLMSw/OQVHmLnIkVolTbbS9dHX9X/4Bf83Oqo='),
	(137,'3b9ea906e15ce7f056fc1b2b5c526ef9',1298407707,NULL,'eJw9jT0SgjAUBq/yTWoF7SxC6PQcQF5IZsh7ThJ+7mbhkbyCSGG7O7P7eb11u8UJC6UchBt1rS4KxIPYwGOj5uLON9UanSg/hTMZXWgr5i4JxRP6RJ2FODzEImTsaPVh8BgkUvGwsjJckribbiE+oWOLMSw/OQVHmLnIkVolTbbS9dHX9X/4Bf83Oqo='),
	(115,'a8c4dfdbc0e25650b8a35dced8332758',1298181139,NULL,'eJw9jUEOwiAURK/yw7q2ujOG0mO4Rh2FiPADv7WezYVH8goGFm5mksnLm+/7o6f1EWhBLj7FUe36rSLEc7r4eBvVLNfNXk1GZxROscBowSrm6JBB0tIXiokWXwVd3YiRONTKvrgDnWYhV2krdAcY4hoW7LMjZ5lf1eHQ66HJ9fB/+wF4wzmn'),
	(104,'04eab1a052ffc80a9cd88932e919bf55',1298178538,NULL,'eJy1k8GOmzAURff5CstSu0nBBjodQoGoUtUfmMy6cvELWDW2a3tK+vc14CSjTFXNZraXe8999jP1/jRK9BusE1o1OEspRqA6zYXqG/x4+JaUeN9u6iMAR8GqXNVr3Uto8OC9qQj5wRykq5Z2eiTKkYUSzJVkMwVU8viAY1obUA/AbDdcCGy3BBPiDHRkNrjFEDgZibmLeZqmdCpSbXuSU3pHvng9ntl+Et6DvYKNSKO2NOB2g1AteOtZX60dz79/mIFRJ+ho9dhMWvNwCO664SmoNQnhmSGF+on8HxOuwcPJk8GPEqPBwvFS/pIfpf2vZjvD3xVfb/AYWZANZjIEFPOAyW0ZM0aKjvmwLMLCyben1/emc+BcfnuyWO1AHmOrF15C+89rQAk6rHi0rrImq/s/017XysF1VphZfd3412i6+OOks/CGN/RyPe/ZaD47oTr4LnhT7LL7vCh3tPz0sSjyksbBQpMFd57syfCwSN7mNMsSmic5PYQ3RsvqrtxSWlFak7NlU5P5L2v/Agc4ONo='),
	(135,'005693122baa644ff3f5a15d319edeb2',1298405786,NULL,'eJw9j0FOAzEMRa9izRqmsEMonQoJCVEhIcEJTOOZRE3iNnbacjYWHIkrkASJpf/3f/7++fo2m0sMcKIsntN6uB1vBqC0Y+vTsh6Kztd3w2YymeTASWgyShedHpIFdQQzYQae4YktnFGAE2AI3dpXgOUozVbHQrDjkjR7kis4O0pt6xMcWnCV0nioPfny+vYIM5fFKeCCPsmfToliTTfgs2SkMMI7dycThtj0LdVLDg8N1fociye9r7AMzkuvueCJ6hBrqHJz7WQBP7joaFb9N7P6f/YX/tRmig=='),
	(136,'3d4b582991c1cd6b1aaad74f537305ff',1298407707,NULL,'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');

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
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries` WRITE;
/*!40000 ALTER TABLE `sym_entries` DISABLE KEYS */;
INSERT INTO `sym_entries` (`id`,`section_id`,`author_id`,`creation_date`,`creation_date_gmt`)
VALUES
	(1,2,1,'2011-02-07 17:13:28','2011-02-08 01:13:28'),
	(3,2,1,'2011-02-13 18:24:35','2011-02-14 02:24:35'),
	(4,5,1,'2011-02-19 10:48:52','2011-02-19 18:48:52'),
	(12,4,1,'2011-02-19 11:18:55','2011-02-19 19:18:55'),
	(11,4,1,'2011-02-19 11:18:40','2011-02-19 19:18:40'),
	(10,4,1,'2011-02-19 11:14:28','2011-02-19 19:14:28'),
	(9,4,1,'2011-02-19 11:01:33','2011-02-19 19:01:33'),
	(13,4,1,'2011-02-19 11:19:19','2011-02-19 19:19:19'),
	(14,4,1,'2011-02-19 11:19:34','2011-02-19 19:19:34'),
	(15,4,1,'2011-02-19 11:19:48','2011-02-19 19:19:48'),
	(16,4,1,'2011-02-19 11:19:59','2011-02-19 19:19:59'),
	(17,4,1,'2011-02-19 11:20:08','2011-02-19 19:20:08'),
	(18,4,1,'2011-02-19 11:20:23','2011-02-19 19:20:23'),
	(19,3,1,'2011-02-19 13:15:38','2011-02-19 21:15:38'),
	(20,4,1,'2011-02-19 13:17:02','2011-02-19 21:17:02'),
	(21,6,1,'2011-02-19 16:01:45','2011-02-20 00:01:45'),
	(22,3,1,'2011-02-19 16:03:12','2011-02-20 00:03:12'),
	(23,7,1,'2011-02-19 19:48:16','2011-02-20 03:48:16'),
	(25,7,1,'2011-02-19 20:39:43','2011-02-20 04:39:43'),
	(26,7,1,'2011-02-20 04:13:36','2011-02-20 12:13:36'),
	(27,3,1,'2011-02-22 12:33:05','2011-02-22 20:33:05'),
	(28,3,1,'2011-02-22 12:33:15','2011-02-22 20:33:15'),
	(29,3,1,'2011-02-22 12:33:23','2011-02-22 20:33:23'),
	(30,3,1,'2011-02-22 12:33:35','2011-02-22 20:33:35'),
	(31,3,1,'2011-02-22 12:33:47','2011-02-22 20:33:47'),
	(32,3,1,'2011-02-22 12:33:57','2011-02-22 20:33:57'),
	(33,3,1,'2011-02-22 12:34:07','2011-02-22 20:34:07'),
	(34,6,1,'2011-02-22 12:34:30','2011-02-22 20:34:30'),
	(35,6,1,'2011-02-22 12:35:12','2011-02-22 20:35:12'),
	(36,6,1,'2011-02-22 12:35:41','2011-02-22 20:35:41'),
	(37,6,1,'2011-02-22 12:36:12','2011-02-22 20:36:12'),
	(38,6,1,'2011-02-22 12:36:39','2011-02-22 20:36:39'),
	(39,6,1,'2011-02-22 12:37:03','2011-02-22 20:37:03'),
	(40,6,1,'2011-02-22 12:37:35','2011-02-22 20:37:35'),
	(41,7,1,'2011-02-22 12:37:54','2011-02-22 20:37:54'),
	(42,8,1,'2011-02-22 12:41:13','2011-02-22 20:41:13');

/*!40000 ALTER TABLE `sym_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_11
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_11`;

CREATE TABLE `sym_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_12
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_12`;

CREATE TABLE `sym_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_13
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_13`;

CREATE TABLE `sym_entries_data_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_14
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_14`;

CREATE TABLE `sym_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_17
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_17`;

CREATE TABLE `sym_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_17` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_17` DISABLE KEYS */;
INSERT INTO `sym_entries_data_17` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(1,19,'israel','Israel'),
	(2,22,'home','Home'),
	(3,27,'womens','Women\'s'),
	(4,28,'college-and-career','College and Career'),
	(5,29,'high-school','High School'),
	(6,30,'junior-high','Junior High'),
	(7,31,'childrens','Children\'s'),
	(8,32,'men-s','Men’s'),
	(9,33,'missions','Missions');

/*!40000 ALTER TABLE `sym_entries_data_17` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_18
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_18`;

CREATE TABLE `sym_entries_data_18` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_19
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_19`;

CREATE TABLE `sym_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries_data_23
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_23`;

CREATE TABLE `sym_entries_data_23` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned NOT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_23` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_23` DISABLE KEYS */;
INSERT INTO `sym_entries_data_23` (`id`,`entry_id`,`file`,`size`,`mimetype`,`meta`)
VALUES
	(4,9,'/uploads/photos/tumblr_lbme9ylN1M1qe7qcwo1_500-1298142093.jpg',293871,'image/jpg','a:3:{s:8:\"creation\";s:25:\"2011-02-19T11:01:33-08:00\";s:5:\"width\";i:467;s:6:\"height\";i:700;}'),
	(5,10,'/uploads/photos/tumblr_lbmegmfmbt1qe7qcwo1_500-1298142868.jpg',148810,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2011-02-19T11:14:27-08:00\";s:5:\"width\";i:500;s:6:\"height\";i:374;}'),
	(6,11,'/uploads/photos/tumblr_lbmhakBqmV1qe7qcwo1_500-1298143120.jpg',217914,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2011-02-19T11:18:40-08:00\";s:5:\"width\";i:500;s:6:\"height\";i:374;}'),
	(7,12,'/uploads/photos/tumblr_lboq6pi6pd1qe7qcwo1_500-1298143135.jpg',277473,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2011-02-19T11:18:55-08:00\";s:5:\"width\";i:500;s:6:\"height\";i:669;}'),
	(8,13,'/uploads/photos/tumblr_lbr8qkFhzU1qe7qcwo1_500-1298143159.jpg',390782,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2011-02-19T11:19:19-08:00\";s:5:\"width\";i:500;s:6:\"height\";i:669;}'),
	(9,14,'/uploads/photos/tumblr_lbs1y4VG4N1qe7qcwo1_500-1298143174.jpg',239741,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2011-02-19T11:19:34-08:00\";s:5:\"width\";i:500;s:6:\"height\";i:669;}'),
	(10,15,'/uploads/photos/tumblr_lbs4ganIet1qe7qcwo1_1280-1298143188.jpg',359886,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2011-02-19T11:19:48-08:00\";s:5:\"width\";i:800;s:6:\"height\";i:598;}'),
	(11,16,'/uploads/photos/tumblr_lbu4aeZ0Y01qe7qcwo1_1280-1298143199.jpg',327507,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2011-02-19T11:19:59-08:00\";s:5:\"width\";i:800;s:6:\"height\";i:598;}'),
	(12,17,'/uploads/photos/tumblr_lbudz9x18Z1qe7qcwo1_1280-1298143208.jpg',336059,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2011-02-19T11:20:08-08:00\";s:5:\"width\";i:598;s:6:\"height\";i:800;}'),
	(16,18,'/uploads/photos/tumblr_lbvl8vXdUE1qe7qcwo1_1280-1298143223.jpg',248161,'image/jpg','a:3:{s:8:\"creation\";s:25:\"2011-02-19T11:20:23-08:00\";s:5:\"width\";i:800;s:6:\"height\";i:598;}'),
	(15,20,'/uploads/photos/tumblr_lbygm9tYt11qe7qcwo1_1280-1298150222.jpg',428289,'image/jpg','a:3:{s:8:\"creation\";s:25:\"2011-02-19T13:17:02-08:00\";s:5:\"width\";i:800;s:6:\"height\";i:598;}');

/*!40000 ALTER TABLE `sym_entries_data_23` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_26
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_26`;

CREATE TABLE `sym_entries_data_26` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_26` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_26` DISABLE KEYS */;
INSERT INTO `sym_entries_data_26` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(4,9,'mcdonalds','Mcdonalds');

/*!40000 ALTER TABLE `sym_entries_data_26` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_28
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_28`;

CREATE TABLE `sym_entries_data_28` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_28` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_28` DISABLE KEYS */;
INSERT INTO `sym_entries_data_28` (`id`,`entry_id`,`value`,`local`,`gmt`)
VALUES
	(4,4,'2011-02-19T10:48:00-08:00',1298141280,1298141280);

/*!40000 ALTER TABLE `sym_entries_data_28` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_29
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_29`;

CREATE TABLE `sym_entries_data_29` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_29` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_29` DISABLE KEYS */;
INSERT INTO `sym_entries_data_29` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(4,4,'israel-trip-2010','Israel trip 2010');

/*!40000 ALTER TABLE `sym_entries_data_29` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_31
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_31`;

CREATE TABLE `sym_entries_data_31` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_31` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_31` DISABLE KEYS */;
INSERT INTO `sym_entries_data_31` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(2,9,'israel-trip-2010','Israel trip 2010'),
	(3,10,'israel-trip-2010','Israel trip 2010'),
	(4,11,'israel-trip-2010','Israel trip 2010'),
	(5,12,'israel-trip-2010','Israel trip 2010'),
	(6,13,'israel-trip-2010','Israel trip 2010'),
	(7,14,'israel-trip-2010','Israel trip 2010'),
	(8,15,'israel-trip-2010','Israel trip 2010'),
	(9,16,'israel-trip-2010','Israel trip 2010'),
	(10,17,'israel-trip-2010','Israel trip 2010'),
	(14,18,'israel-trip-2010','Israel trip 2010'),
	(13,20,'israel-trip-2010','Israel trip 2010');

/*!40000 ALTER TABLE `sym_entries_data_31` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_34
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_34`;

CREATE TABLE `sym_entries_data_34` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_34` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_34` DISABLE KEYS */;
INSERT INTO `sym_entries_data_34` (`id`,`entry_id`,`value`)
VALUES
	(3,4,'yes');

/*!40000 ALTER TABLE `sym_entries_data_34` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_35
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_35`;

CREATE TABLE `sym_entries_data_35` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_35` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_35` DISABLE KEYS */;
INSERT INTO `sym_entries_data_35` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(2,4,'home','Home'),
	(3,4,'israel','Israel');

/*!40000 ALTER TABLE `sym_entries_data_35` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_36
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_36`;

CREATE TABLE `sym_entries_data_36` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_36` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_36` DISABLE KEYS */;
INSERT INTO `sym_entries_data_36` (`id`,`entry_id`,`value`,`value_formatted`)
VALUES
	(6,21,'Proverbs 29:18 tells us, \"Without vision, the people perish.\" Biblically, vision typically means ‘God-given revelation’ and the Hebrew word for perish, used here in Proverbs, is a picture of someone running around like a madman. Without a vision for our fellowship, we would be like the madman, running aimlessly. The Lord has given our leadership a clear direction for us as a church, a mode in which we are to function.\r\n\r\n- A Ministry of Simplicity\r\n- A Ministry of Humility\r\n- A Ministry of Sincerity','<p>Proverbs 29:18 tells us, &#8220;Without vision, the people perish.&#8221; Biblically, vision typically means ‘God-given revelation’ and the Hebrew word for perish, used here in Proverbs, is a picture of someone running around like a madman. Without a vision for our fellowship, we would be like the madman, running aimlessly. The Lord has given our leadership a clear direction for us as a church, a mode in which we are to function.</p>\n\n<ul>\n<li>A Ministry of Simplicity</li>\n<li>A Ministry of Humility</li>\n<li>A Ministry of Sincerity</li>\n</ul>\n'),
	(7,34,'The Bulletin Board is a way for people to post information about Bible studies they are holding, classes they are leading and gatherings of all kinds that are taking place among the body of ACCF.  Our hope is that this encourages ventures of faith as people step out to do what the Lord has laid on their hearts in the way of Bible studies, service projects and times of fellowship.  To help facilitate this, this Bulletin Board is available to help you get the word out.','<p>The Bulletin Board is a way for people to post information about Bible studies they are holding, classes they are leading and gatherings of all kinds that are taking place among the body of ACCF.  Our hope is that this encourages ventures of faith as people step out to do what the Lord has laid on their hearts in the way of Bible studies, service projects and times of fellowship.  To help facilitate this, this Bulletin Board is available to help you get the word out.</p>\n'),
	(8,35,'### Offering a refreshing look at what it means to be a godly woman\r\n\r\nOur approach to Women’s Ministry at Athey Creek is rather simple.  In Titus 2:3-5, the Lord gives us a loving outline for godly living that is specifically directed to women.  We are blessed to have some wonderful ‘older’ women in our fellowship who are willing to come alongside the younger women.  Much of this happens naturally as the women interact at church or various gatherings.  Relationships are formed and women grow as they learn from one another.  There are also opportunities for prayer, fellowship and getting into the Word at Bible studies and various events that take place throughout the year.  If you would like to know more about current Bible studies or upcoming events, please check the links listed below.\r\n\r\nJudy Slaughter oversees our Women’s Ministry and she is available to meet with the women of our church who desire prayer, godly counsel or simply a time to fellowship.  Judy also leads many of the studies that we offer, and she enjoys seeing the Lord at work in the hearts and minds of the ladies at our church.  If you would like to meet with Judy, or if you have any questions about this ministry, please contact the church office at 971-327-2120. ','<h3>Offering a refreshing look at what it means to be a godly woman</h3>\n\n<p>Our approach to Women’s Ministry at Athey Creek is rather simple.  In Titus 2:3-5, the Lord gives us a loving outline for godly living that is specifically directed to women.  We are blessed to have some wonderful ‘older’ women in our fellowship who are willing to come alongside the younger women.  Much of this happens naturally as the women interact at church or various gatherings.  Relationships are formed and women grow as they learn from one another.  There are also opportunities for prayer, fellowship and getting into the Word at Bible studies and various events that take place throughout the year.  If you would like to know more about current Bible studies or upcoming events, please check the links listed below.</p>\n\n<p>Judy Slaughter oversees our Women’s Ministry and she is available to meet with the women of our church who desire prayer, godly counsel or simply a time to fellowship.  Judy also leads many of the studies that we offer, and she enjoys seeing the Lord at work in the hearts and minds of the ladies at our church.  If you would like to meet with Judy, or if you have any questions about this ministry, please contact the church office at 971-327-2120.</p>\n'),
	(9,36,'### Growing closer in our walks with Jesus\r\n\r\nWhether you are up to your eyeballs in homework, or simply grinding away in the work force, we want to provide a place for you to come away and be renewed.  If you are 18-24 years of age, we invite you to join us on Tuesday nights for a time of worship, prayer and the study of God’s Word.  At a time when many people are falling into worldly thinking and behavior, we want to see our young adults growing in their knowledge of the Lord and in their relationships with Him. \r\n\r\nDavid & Becca Frost lead this ministry.  If you have any questions about Tuesday nights, or the various College & Career events, you can contact David at 503-781-1459.  Or you can click on the links below for more information about studies and activities.','<h3>Growing closer in our walks with Jesus</h3>\n\n<p>Whether you are up to your eyeballs in homework, or simply grinding away in the work force, we want to provide a place for you to come away and be renewed.  If you are 18-24 years of age, we invite you to join us on Tuesday nights for a time of worship, prayer and the study of God’s Word.  At a time when many people are falling into worldly thinking and behavior, we want to see our young adults growing in their knowledge of the Lord and in their relationships with Him.</p>\n\n<p>David &amp; Becca Frost lead this ministry.  If you have any questions about Tuesday nights, or the various College &amp; Career events, you can contact David at 503-781-1459.  Or you can click on the links below for more information about studies and activities.</p>\n'),
	(10,37,'### Mission Work at Athey\r\n\r\nWe have been blessed with the love and goodness of the Lord here at Athey Creek. In response to this, many at Athey have naturally been motivated to step out in faith into a variety of mission fields – in Portland, throughout the U.S., and around the world. The Lord has opened up some amazing opportunities.\r\n\r\nThere are many ways to participate in mission work around the world. Through prayer, through giving, or through your own participation on a mission trip, it is wonderful to see the Great Commission in action! For some of us, our greatest mission field will be our families, or our neighbors, or perhaps someone at work. Jesus said, “The field is white unto harvest.” What a blessing it is that He allows us to be a part of the growing of His kingdom. We hope that you are encouraged as you fulfill the role He has ordained for you in this!\r\n\r\nChoose a mission from the right column to learn more about it. If you have any additional questions on our missions involvement contact the church office.','<h3>Mission Work at Athey</h3>\n\n<p>We have been blessed with the love and goodness of the Lord here at Athey Creek. In response to this, many at Athey have naturally been motivated to step out in faith into a variety of mission fields – in Portland, throughout the U.S., and around the world. The Lord has opened up some amazing opportunities.</p>\n\n<p>There are many ways to participate in mission work around the world. Through prayer, through giving, or through your own participation on a mission trip, it is wonderful to see the Great Commission in action! For some of us, our greatest mission field will be our families, or our neighbors, or perhaps someone at work. Jesus said, “The field is white unto harvest.” What a blessing it is that He allows us to be a part of the growing of His kingdom. We hope that you are encouraged as you fulfill the role He has ordained for you in this!</p>\n\n<p>Choose a mission from the right column to learn more about it. If you have any additional questions on our missions involvement contact the church office.</p>\n'),
	(11,38,'### Caring for the kids of our Fellowship\r\n\r\nThanks for checking out our Children’s Ministry web page.  The Lord has blessed us with a great bunch of kids at Athey Creek.  We enjoy sharing the love of Jesus with them in a safe and secure environment.  Feel free to click on the links on this page to get a better understanding of children’s ministry at Athey Creek.\r\n\r\nGod bless you,  \r\nJames\r\n','<h3>Caring for the kids of our Fellowship</h3>\n\n<p>Thanks for checking out our Children’s Ministry web page.  The Lord has blessed us with a great bunch of kids at Athey Creek.  We enjoy sharing the love of Jesus with them in a safe and secure environment.  Feel free to click on the links on this page to get a better understanding of children’s ministry at Athey Creek.</p>\n\n<p>God bless you,<br />\nJames</p>\n'),
	(12,39,'Our goal in the Jr. High Ministry is to worship the Lord, study the Bible and enjoy great fellowship. Whether we’re meeting on a Wednesday night or on one of our many trips, we always have an awesome time.  \r\nAs we study through the Bible, we learn what Jesus has done for us and how we should live our lives for Him. Come ready to worship the Lord, dig into the Word and have tons of crazy fun!\r\n\r\nIf you would like information on Bible Studies and Upcoming Events, check out the links below.  You can also visit the Jr. High Blog to see the latest pictures from recent Jr. High activities!\r\n\r\nIf you have any questions, you can contact Seth at (503) 984-6605.','<p>Our goal in the Jr. High Ministry is to worship the Lord, study the Bible and enjoy great fellowship. Whether we’re meeting on a Wednesday night or on one of our many trips, we always have an awesome time.<br />\nAs we study through the Bible, we learn what Jesus has done for us and how we should live our lives for Him. Come ready to worship the Lord, dig into the Word and have tons of crazy fun!</p>\n\n<p>If you would like information on Bible Studies and Upcoming Events, check out the links below.  You can also visit the Jr. High Blog to see the latest pictures from recent Jr. High activities!</p>\n\n<p>If you have any questions, you can contact Seth at (503) 984-6605.</p>\n'),
	(13,40,'The vision for our High School ministry is simply this: to know Jesus.  We get together each week to learn more about the person of Jesus and the impact He wants to make in our lives.  Through time spent in worship, in prayer and in studying His Word, He becomes more and more personal to each one of us.  This is the whole reason we get together at the ‘Shed’ every Thursday night.\r\n\r\nFellowship is an important part of what we do as well.  It is a huge blessing to have Christian friends walking this same path with us. The trips and events we do are always fun and a little crazy, but even these times are geared around the same purpose of knowing Jesus better.  So whether we’re on a snowy mountain or hanging out at the beach, we always have time to open up the Bible and learn more about Jesus. \r\n\r\nTake a look at the Bible Studies and Upcoming Events links below to see what’s happening right now. Also, don\'t forget to check out the High School Ministry\'s very own website below!\r\nIf you have any questions, contact Abe Menshenfriend at (971)222-9586.','<p>The vision for our High School ministry is simply this: to know Jesus.  We get together each week to learn more about the person of Jesus and the impact He wants to make in our lives.  Through time spent in worship, in prayer and in studying His Word, He becomes more and more personal to each one of us.  This is the whole reason we get together at the ‘Shed’ every Thursday night.</p>\n\n<p>Fellowship is an important part of what we do as well.  It is a huge blessing to have Christian friends walking this same path with us. The trips and events we do are always fun and a little crazy, but even these times are geared around the same purpose of knowing Jesus better.  So whether we’re on a snowy mountain or hanging out at the beach, we always have time to open up the Bible and learn more about Jesus.</p>\n\n<p>Take a look at the Bible Studies and Upcoming Events links below to see what’s happening right now. Also, don&#8217;t forget to check out the High School Ministry&#8217;s very own website below!\nIf you have any questions, contact Abe Menshenfriend at (971)222-9586.</p>\n');

/*!40000 ALTER TABLE `sym_entries_data_36` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_37
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_37`;

CREATE TABLE `sym_entries_data_37` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_37` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_37` DISABLE KEYS */;
INSERT INTO `sym_entries_data_37` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(3,21,'home','Home'),
	(4,34,NULL,NULL),
	(5,35,'womens','Women\'s'),
	(6,36,'college-and-career','College and Career'),
	(7,37,'missions','Missions'),
	(8,38,'childrens','Children\'s'),
	(9,39,'junior-high','Junior High'),
	(10,40,'high-school','High School');

/*!40000 ALTER TABLE `sym_entries_data_37` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_38
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_38`;

CREATE TABLE `sym_entries_data_38` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_38` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_38` DISABLE KEYS */;
INSERT INTO `sym_entries_data_38` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(9,23,'john-6-33','John 6:33'),
	(10,25,'proverbs-29-18','Proverbs 29:18'),
	(11,26,'2-chron-20-29-30','2 Chron 20:29-30'),
	(12,41,'romans-5-8','Romans 5:8');

/*!40000 ALTER TABLE `sym_entries_data_38` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_39
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_39`;

CREATE TABLE `sym_entries_data_39` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_39` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_39` DISABLE KEYS */;
INSERT INTO `sym_entries_data_39` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(13,26,'israel','Israel'),
	(12,25,'home','Home'),
	(11,23,'home','Home'),
	(14,41,'high-school','High School');

/*!40000 ALTER TABLE `sym_entries_data_39` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_40
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_40`;

CREATE TABLE `sym_entries_data_40` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_40` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_40` DISABLE KEYS */;
INSERT INTO `sym_entries_data_40` (`id`,`entry_id`,`value`)
VALUES
	(1,27,'yes'),
	(2,28,'yes'),
	(3,29,'yes'),
	(4,30,'yes'),
	(5,31,'yes'),
	(6,32,'yes'),
	(7,33,'yes');

/*!40000 ALTER TABLE `sym_entries_data_40` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_41
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_41`;

CREATE TABLE `sym_entries_data_41` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_41` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_41` DISABLE KEYS */;
INSERT INTO `sym_entries_data_41` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(10,42,'medical-release-form','Medical release form');

/*!40000 ALTER TABLE `sym_entries_data_41` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_42
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_42`;

CREATE TABLE `sym_entries_data_42` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned NOT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_42` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_42` DISABLE KEYS */;
INSERT INTO `sym_entries_data_42` (`id`,`entry_id`,`file`,`size`,`mimetype`,`meta`)
VALUES
	(10,42,'/uploads/files/Medical_Authorization_2011-1298407980.pdf',13388,'unknown','a:1:{s:8:\"creation\";s:25:\"2011-02-22T12:52:59-08:00\";}');

/*!40000 ALTER TABLE `sym_entries_data_42` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_43
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_43`;

CREATE TABLE `sym_entries_data_43` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_43` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_43` DISABLE KEYS */;
INSERT INTO `sym_entries_data_43` (`id`,`entry_id`,`value`,`value_formatted`)
VALUES
	(10,42,NULL,'\n');

/*!40000 ALTER TABLE `sym_entries_data_43` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_44
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_44`;

CREATE TABLE `sym_entries_data_44` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_44` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_44` DISABLE KEYS */;
INSERT INTO `sym_entries_data_44` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(29,42,'childrens','Children\'s'),
	(30,42,'high-school','High School'),
	(31,42,'junior-high','Junior High');

/*!40000 ALTER TABLE `sym_entries_data_44` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_5` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_5` DISABLE KEYS */;
INSERT INTO `sym_entries_data_5` (`id`,`entry_id`,`username`,`password`)
VALUES
	(3,1,'kirkstrobeck','199aa97af20bc24339c1dfae5f94766c'),
	(4,3,'kirk_strobeck2','199aa97af20bc24339c1dfae5f94766c');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_6` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_6` DISABLE KEYS */;
INSERT INTO `sym_entries_data_6` (`id`,`entry_id`,`role_id`)
VALUES
	(3,1,3),
	(4,3,2);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_8` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_8` DISABLE KEYS */;
INSERT INTO `sym_entries_data_8` (`id`,`entry_id`,`handle`,`value`)
VALUES
	(3,1,'kirk-strobeckcom','kirk@strobeck.com'),
	(4,3,'kirk-strobeckcom','kirk@strobeck.com');

/*!40000 ALTER TABLE `sym_entries_data_8` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_extensions` WRITE;
/*!40000 ALTER TABLE `sym_extensions` DISABLE KEYS */;
INSERT INTO `sym_extensions` (`id`,`name`,`status`,`version`)
VALUES
	(1,'asdc','enabled','1.3'),
	(2,'debugdevkit','enabled','1.0.5'),
	(8,'members','enabled','1.2.1beta'),
	(5,'profiledevkit','enabled','1.0.1'),
	(9,'smtp_email_library','enabled','1.1'),
	(25,'tweak_ui','enabled','0.1.2'),
	(11,'systemidfield','enabled','1.0.2'),
	(12,'reflectionfield','enabled','1.0.9'),
	(13,'jit_image_manipulation','enabled','1.09'),
	(18,'markdown','enabled','1.12'),
	(15,'uniqueuploadfield','enabled','1.2'),
	(19,'root_page_params','enabled','1.2'),
	(24,'neatify','disabled','1.0.1');

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
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

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
	(40,9,'/frontend/','EventPostSaveFilter','cbSendEmailSMTPFilter'),
	(42,12,'/publish/new/','EntryPostCreate','compileBackendFields'),
	(43,12,'/publish/edit/','EntryPostEdit','compileBackendFields'),
	(44,12,'/frontend/','EventPostSaveFilter','compileFrontendFields'),
	(45,13,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(46,13,'/system/preferences/','Save','__SavePreferences'),
	(69,25,'/backend/','InitaliseAdminPageHead','addScriptToHead'),
	(58,19,'/system/preferences/','AddCustomPreferenceFieldsets','append_preferences'),
	(59,19,'/system/preferences/','Save','save_settings'),
	(57,19,'/frontend/','FrontendPrePageResolve','addPage');

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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields` WRITE;
/*!40000 ALTER TABLE `sym_fields` DISABLE KEYS */;
INSERT INTO `sym_fields` (`id`,`label`,`element_name`,`type`,`parent_section`,`required`,`sortorder`,`location`,`show_column`)
VALUES
	(7,'Timezone Offset','timezone-offset','input',2,'no',7,'sidebar','yes'),
	(6,'Role','role','memberrole',2,'no',6,'sidebar','yes'),
	(5,'Username and Password','username-and-password','member',2,'yes',4,'sidebar','yes'),
	(8,'Email Address','email-address','input',2,'yes',5,'main','yes'),
	(34,'Promote','promote','checkbox',5,'no',2,'main','yes'),
	(11,'Date added','date-added','date',2,'no',2,'sidebar','yes'),
	(12,'First name','first-name','input',2,'yes',0,'main','yes'),
	(13,'Last name','last-name','input',2,'no',1,'main','yes'),
	(14,'Name','name','reflection',2,'no',3,'main','yes'),
	(39,'Tags','tags','select',7,'no',1,'main','yes'),
	(17,'Tag','tag','input',3,'yes',0,'main','yes'),
	(18,'Tags','tags','select',2,'no',8,'main','yes'),
	(19,'Official Athey representative','official-athey-representative','checkbox',2,'no',9,'main','yes'),
	(36,'Text','text','textarea',6,'yes',0,'main','yes'),
	(40,'Ministry','ministry','checkbox',3,'no',1,'main','yes'),
	(31,'Galleries','galleries','select',4,'no',1,'main','yes'),
	(23,'Photo','photo','uniqueupload',4,'yes',0,'main','yes'),
	(38,'Verse','verse','input',7,'yes',0,'main','yes'),
	(26,'Description','description','input',4,'no',2,'main','yes'),
	(28,'Date added','date-added','date',5,'no',1,'main','yes'),
	(29,'Name','name','input',5,'no',0,'main','yes'),
	(35,'Tags','tags','select',5,'no',3,'main','yes'),
	(37,'Tags','tags','select',6,'no',1,'main','yes'),
	(41,'Name','name','input',8,'yes',0,'main','yes'),
	(42,'File','file','uniqueupload',8,'yes',1,'main','yes'),
	(43,'Description','description','textarea',8,'no',2,'main','yes'),
	(44,'Tags','tags','select',8,'no',3,'sidebar','yes');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_checkbox` WRITE;
/*!40000 ALTER TABLE `sym_fields_checkbox` DISABLE KEYS */;
INSERT INTO `sym_fields_checkbox` (`id`,`field_id`,`default_state`,`description`)
VALUES
	(6,19,'off',NULL),
	(9,34,'off',NULL),
	(8,40,'off',NULL);

/*!40000 ALTER TABLE `sym_fields_checkbox` ENABLE KEYS */;
UNLOCK TABLES;


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
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_date` WRITE;
/*!40000 ALTER TABLE `sym_fields_date` DISABLE KEYS */;
INSERT INTO `sym_fields_date` (`id`,`field_id`,`pre_populate`,`calendar`)
VALUES
	(36,11,'yes','no'),
	(38,28,'yes','no');

/*!40000 ALTER TABLE `sym_fields_date` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_input
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_input`;

CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_input` WRITE;
/*!40000 ALTER TABLE `sym_fields_input` DISABLE KEYS */;
INSERT INTO `sym_fields_input` (`id`,`field_id`,`validator`)
VALUES
	(68,8,'/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i'),
	(69,7,NULL),
	(66,12,NULL),
	(67,13,NULL),
	(72,17,NULL),
	(71,26,NULL),
	(73,29,NULL),
	(59,38,NULL),
	(65,41,NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_member` WRITE;
/*!40000 ALTER TABLE `sym_fields_member` DISABLE KEYS */;
INSERT INTO `sym_fields_member` (`id`,`field_id`)
VALUES
	(10,5);

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;



# Dump of table sym_fields_memberrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberrole`;

CREATE TABLE `sym_fields_memberrole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_memberrole` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberrole` DISABLE KEYS */;
INSERT INTO `sym_fields_memberrole` (`id`,`field_id`)
VALUES
	(10,6);

/*!40000 ALTER TABLE `sym_fields_memberrole` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_reflection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_reflection`;

CREATE TABLE `sym_fields_reflection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `expression` varchar(255) DEFAULT NULL,
  `formatter` varchar(255) DEFAULT NULL,
  `override` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_reflection` WRITE;
/*!40000 ALTER TABLE `sym_fields_reflection` DISABLE KEYS */;
INSERT INTO `sym_fields_reflection` (`id`,`field_id`,`expression`,`formatter`,`override`,`hide`)
VALUES
	(5,14,'{entry/first-name} {entry/last-name}','none',NULL,'yes');

/*!40000 ALTER TABLE `sym_fields_reflection` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_select` WRITE;
/*!40000 ALTER TABLE `sym_fields_select` DISABLE KEYS */;
INSERT INTO `sym_fields_select` (`id`,`field_id`,`allow_multiple_selection`,`static_options`,`dynamic_options`)
VALUES
	(38,18,'no',NULL,17),
	(30,37,'yes',NULL,17),
	(40,31,'yes',NULL,29),
	(41,35,'yes',NULL,17),
	(32,39,'yes',NULL,17),
	(37,44,'yes',NULL,17);

/*!40000 ALTER TABLE `sym_fields_select` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_stage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_stage`;

CREATE TABLE `sym_fields_stage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `constructable` smallint(1) DEFAULT '0',
  `destructable` smallint(1) DEFAULT '0',
  `draggable` smallint(1) DEFAULT '0',
  `droppable` smallint(1) DEFAULT '0',
  `searchable` smallint(1) DEFAULT '0',
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



# Dump of table sym_fields_systemid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_systemid`;

CREATE TABLE `sym_fields_systemid` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_textarea` WRITE;
/*!40000 ALTER TABLE `sym_fields_textarea` DISABLE KEYS */;
INSERT INTO `sym_fields_textarea` (`id`,`field_id`,`formatter`,`size`)
VALUES
	(5,36,'markdown_extra_with_smartypants',15),
	(10,43,'markdown_extra_with_smartypants',15);

/*!40000 ALTER TABLE `sym_fields_textarea` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_uniqueinput
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_uniqueinput`;

CREATE TABLE `sym_fields_uniqueinput` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) DEFAULT NULL,
  `auto_unique` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_uniqueupload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_uniqueupload`;

CREATE TABLE `sym_fields_uniqueupload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) NOT NULL,
  `validator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_uniqueupload` WRITE;
/*!40000 ALTER TABLE `sym_fields_uniqueupload` DISABLE KEYS */;
INSERT INTO `sym_fields_uniqueupload` (`id`,`field_id`,`destination`,`validator`)
VALUES
	(25,23,'/workspace/uploads/photos','/\\.(?:bmp|gif|jpe?g|png)$/i'),
	(24,42,'/workspace/uploads/files','/\\.(?:doc|pdf|rtf|txt)$/i');

/*!40000 ALTER TABLE `sym_fields_uniqueupload` ENABLE KEYS */;
UNLOCK TABLES;


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
	(2,'35376ed1',1297131327),
	(3,'85b909d6',1297653875);

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
	(1,NULL,'Home','index',NULL,'tag','bible_verse_api,galleries,photos_per_gallery,tags,text,twitter,verses','members_register',0),
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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_pages_types` WRITE;
/*!40000 ALTER TABLE `sym_pages_types` DISABLE KEYS */;
INSERT INTO `sym_pages_types` (`id`,`page_id`,`type`)
VALUES
	(1,9,'403'),
	(24,1,'index'),
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sections` WRITE;
/*!40000 ALTER TABLE `sym_sections` DISABLE KEYS */;
INSERT INTO `sym_sections` (`id`,`name`,`handle`,`sortorder`,`entry_order`,`entry_order_direction`,`hidden`,`navigation_group`)
VALUES
	(2,'Members','members',6,NULL,'asc','no','People'),
	(3,'Tags','tags',0,'17','asc','no','Groups'),
	(4,'Photos','photos',3,NULL,'asc','no','Content'),
	(5,'Galleries','galleries',1,NULL,'asc','no','Groups'),
	(6,'Text','text',2,NULL,'asc','no','Content'),
	(7,'Verses','verses',5,NULL,'asc','no','Content'),
	(8,'Files','files',4,NULL,'asc','no','Content');

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
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sections_association` WRITE;
/*!40000 ALTER TABLE `sym_sections_association` DISABLE KEYS */;
INSERT INTO `sym_sections_association` (`id`,`parent_section_id`,`parent_section_field_id`,`child_section_id`,`child_section_field_id`,`cascading_deletion`)
VALUES
	(38,3,17,2,18,'no'),
	(30,3,17,6,37,'no'),
	(41,3,17,5,35,'no'),
	(40,5,29,4,31,'no'),
	(32,3,17,7,39,'no'),
	(37,3,17,8,44,'no');

/*!40000 ALTER TABLE `sym_sections_association` ENABLE KEYS */;
UNLOCK TABLES;


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
	('a87a761db7a4e438a9d10b6e2ca76ff8',1298210839,'sym-|a:2:{s:8:\"username\";s:12:\"kirkstrobeck\";s:4:\"pass\";s:32:\"199aa97af20bc24339c1dfae5f94766c\";}sym-members|a:0:{}'),
	('682e3e2df80f3218be55e6898191da50',1298408248,'sym-|a:2:{s:8:\"username\";s:12:\"kirkstrobeck\";s:4:\"pass\";s:32:\"199aa97af20bc24339c1dfae5f94766c\";}sym-members|a:0:{}');

/*!40000 ALTER TABLE `sym_sessions` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
