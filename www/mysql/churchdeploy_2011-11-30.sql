# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.9)
# Database: churchdeploy
# Generation Time: 2011-11-30 21:47:04 +0000
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_authors` WRITE;
/*!40000 ALTER TABLE `sym_authors` DISABLE KEYS */;

INSERT INTO `sym_authors` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `last_seen`, `user_type`, `primary`, `default_area`, `auth_token_active`, `language`)
VALUES
	(1,'admin','7e523a069053bd727bf980a2eaef2913c8692c1e','Admin','Admin','noreply@churchdeploy.com','2011-11-30 13:45:39','developer','yes',NULL,'no',NULL);

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

LOCK TABLES `sym_cache` WRITE;
/*!40000 ALTER TABLE `sym_cache` DISABLE KEYS */;

INSERT INTO `sym_cache` (`id`, `hash`, `creation`, `expiry`, `data`)
VALUES
	(3,'64da42043cb20526f8f9cb0c932bc9ff',1322444019,NULL,'eJw9jTsOwjAQRK8ych0S6CicpOYYhmywJccb2et8zkbBkbgCDgXdaGb03uf11v02eSwUk+PQqkt9VqDw4MGFZ6uyjKer6jsdKc0cEnVaaJPuhtV5D7EUaeRIJRnBRAFzNDuo8Hasx1rBu1EKDHmGZb/DmjCkqgDEchas0YhF6TBwvh/PWjc/iW7+1i+KDj22'),
	(4,'4030426c0be50039c507dcb1ea6d2c85',1322444773,NULL,'eJw9jTsOwjAQRK8ych0S6CicpOYYhmywJccb2et8zkbBkbgCDgXdaGb03uf11v02eSwUk+PQqkt9VqDw4MGFZ6uyjKer6jsdKc0cEnVaaJPuhtV5D7EUaeRIJRnBRAFzNDuo8Hasx1rBu1EKDHmGZb/DmjCkqgDEchas0YhF6TBwvh/PWjc/iW7+1i+KDj22'),
	(5,'5c67eed489fbe3c0ddcf8361d869ae38',1322445313,NULL,'eJyVWMFyG7kRvacq/4D1KaliuMktZWmtsl1rW4qtuOJNfAY5TQ5KQ4AFYDTLPe1v5FtyyL/kB/ILed0NYIYSU5tcJHIGaHS/fv26wX//45/XNz8eBvNIMbngv3vxh/XvXxjy29A5v//uxZh3v/vji5tX15HSMfhEr64z/Zhf3XqTezIb2jvvsdJMNsmTryF2K2N9177Jq8nl3rwPl17h6dr8gCfJHkieuGfGy+61eT0MeIdnMEmRzMF2WHgyvTtciWleGsbMD8SWDxnPT7pJl+feZnnH39YGodTFg9vRVfOQv7W4Brfvswk7cyC/Nr/+1eu2iJ8nWCf4CM87Gx88pTTbqU/MNhyOkXryHXXGZfZNIo96jIVD3iTy2exiOChcUx8SGV+huQu9X6C15T+7ELEXgfMhK5MDkLOxPmCf2YuP7OhKg7dAEXHgSwzjvpf4DxLIhgZHj0DlAzX4ZEvZvhkVOvHy4kl1LXtZcObjcxybD1Pvtr0ix6DhvHiS2GU3UFIoYZ53TiEOXXOocEMezmSSry2nhRBPXyMJk4QquH8o6I18Tu/g/eR1R/liIm3JPVI373mD6OUMEAr/lwsEd5x1MHv7SAaHHgMYqhhxSOJIQgkxTJJaxO3bLgm9oG+CFyc46y/NV0FL2L4JET5yTmBjMwS24pH9kuLJIa/l826g1F98C+81j+oHauppRQqGxQAD0k00IPBDQAWNYNhvpNC4QHsaFK/9EOJpJWbkI8NTzg1+OHEth5wRb3n4zuJvXP3W7Eb1ah/tljRhccw9lxhz3WwsV8dMsJbXbXSE8JM9obBXIBu8YOf5xB2XzcHcmnS0D7TiXC+pZXcZmUFKsAUFuaMYkcQNoZCgKICcK6pXvrWnipN4kNhrcajnXHM1AY3KBnVP42FD8mlt3uGjCIadxPDecfrB1E8o8KQZeQKCEhRL7iiNybzto0tg4X2QYkFAPeoQRpBFY4vMuQMU7DnsX4KvdedmgQ0JKJ1nhOMWyx1tBxuV3LPg8WYtaITLfMFuzhMbJ7V6R1PRhyNSlHKSgD7So8uUVNnuKI7JDkz7AKY8aFa/9vgSWW/CeCNow9o2+B2QrrB25JF2LoErQWzx+hYMLXpFDavCbebjQy3Ur0wFPPQ4pBxnvh+cTe3QZNFFZovreZ3Q6BjDsafcllufuDzhw30QcfZsoRxc9OVZfNqFuIOdhAuwUgyda4IgOaa1ug26A1L1RRJ3SjTsbpjhfGTxmRF4DG4rpRA8UIxcJU083dBR1G7xCQViUo5W5F/ewqHaM7SZpxZODd18jyc2LfCdZpUSj+VTMfO5t8gGUbqcD86rHLCECty1x+x+atFywlbG7fTbhubWpLlWrZM84iM5ZvOTdImg1GQJxLN+3NbzdNiYLCTipVAsS4NOGW6yeDCcKoWnMK5UaE6E5hImpSVSgd7ukrxjyWHkf0Fyap9PfaB//fx3TCI2bxnnRmq0MCSbqTF6CH8iIVqis2moY+eQ5Ddw1EI5LU44BcB7h0RaLVIsExxE3CRk7OcC56HCY7bDvHLSJUgZAlbxKXHMKSpZ4zp5Q30YlB8f7WHTGpxyIoNhLLrMK+mBrnWB0tp/KLJyLt1C59cVtyrdIn1NyP5P9b49mwFqekGRXqAfB7aj7Q/HYPxLMuTcpmhpWCkTxKBlD6WrNwgXvNHD5valUrnkWkITYAC+HF0EWTpKW0yFbEX0sSfLzWFwqE2LrD6S4o2ldhPg3XiUEeHw38PqaSEfPH2ECwTXhi2T5FyAzMa/sn1JhFRb6u3Apuiy0+pcpIN1Mq6rbwvjmlvNWvGCXWA/eM2HgFb1HgWQazzAR40u8NN4li0ITW0eYva2qFvjsNacMjmHdveYQu3inUtbd8SccyXHoqwehOMcvLJe54nJDg+s7nNnuMz4bxb3Aj6m2eeERp0j05HsQ5tMTyDrMGBQ7PTA0j308DxCo7taaZP2BF3fQBd/NG+qZ9oliB4gSjds7fRUW/9iNxuHIa4VEV6AmZhASHsEUENdZT76k01ZxjQVDh4Eh6rItemcn/+Wi0I8I5Wok04xNQg11KutrEEop4UODJHkGQnUSnZ6h8Aa1WKDcYYXhhF19mffmgwDriEp2Jr3Ge0GtIDAJpGqSODZFwc5N58RcRTt3cTAlS5XhJ2LCHfnVPvrzaCs0J3PEqEdjHQ43IWxMOIT+q00pwr8RcSfDi88psklTa+0MF+Iwi+nmSxtFj9UnnY8FKN4eeTQEMsNRGc2b18ui3vD1yEktzNv6dgv3eQBtLlos+OIX3NFeaptg6utEbM4NImc7gMnsV7n3tvBDVTErIL6uXeDO15G8Z0YFf2+x39dKslDDNzlOE6rqG1dlsFF0yrmJKfruq0eeI/x1npR9F/OnDyqXUlG9TpFDVWjFnMRYOtQbBP0EVEqENh8b3+CjrFwnKUgAWlNZHPpabG+lVsxlwxP93uoWPklQ5pP0FtcNX9TI30a0nlRqltcjPOxpb0/a+7tylUUD+5oN0SAhvFkzrrSK/jKGsx+RI6/OQ/pHGCwdqsTU5vuDhCrIrl1PrswFr7R7isCUUItpAVG1O4gsAeKYGqGf3rp2jnEFnlJ671Mqebi00PP/C2CmWsxnbeeq/MXf5IGuCsorf+noLZ2xCB3u3ih4cy+Xgyl/FqQ5hvFWaveR+IeXwdEDpUNJFqfXXMWnvyNohvQCB7Lfz6/XGBk1v2AELSpnkgOGuSgMq2EI/m5IKzf01B/60AfrfONXuLaV+m1C0Axdq2vv5WfGK+/bb85/gew+jRg'),
	(6,'b095ca7c5cbc98401a772c334b698a0f',1322445923,NULL,'eJw9jTsOwjAQRK8ych0S6CicpOYYhmywJccb2et8zkbBkbgCDgXdaGb03uf11v02eSwUk+PQqkt9VqDw4MGFZ6uyjKer6jsdKc0cEnVaaJPuhtV5D7EUaeRIJRnBRAFzNDuo8Hasx1rBu1EKDHmGZb/DmjCkqgDEchas0YhF6TBwvh/PWjc/iW7+1i+KDj22'),
	(7,'bb698c17a719102be88575c36b7054fb',1322445943,NULL,'eJw9jTsOwjAQRK8ych0S6CicpOYYhmywJccb2et8zkbBkbgCDgXdaGb03uf11v02eSwUk+PQqkt9VqDw4MGFZ6uyjKer6jsdKc0cEnVaaJPuhtV5D7EUaeRIJRnBRAFzNDuo8Hasx1rBu1EKDHmGZb/DmjCkqgDEchas0YhF6TBwvh/PWjc/iW7+1i+KDj22'),
	(40,'3e827070b6d6b99a25721d51738ad7ad',1322689507,NULL,'eJw9jTsOwjAQRK8ych0S6CicpOYYhmywJccb2et8zkbBkbgCDgXdaGb03uf11v02eSwUk+PQqkt9VqDw4MGFZ6uyjKer6jsdKc0cEnVaaJPuhtV5D7EUaeRIJRnBRAFzNDuo8Hasx1rBu1EKDHmGZb/DmjCkqgDEchas0YhF6TBwvh/PWjc/iW7+1i+KDj22'),
	(19,'686c64348178159be40f1ffe80554e90',1322539871,NULL,'eJw9jk0OgjAQha8y6VpFdyYWWHkQoANMQmdMp1A4mwuP5BUsLFy+vO/9fN8fW69+ggWDknBpbperAeROHPFQmjn257upKxtQX8KKlY24xuq5IEOjEEfcwOFEuQDdLj3MHAVmPUEaqRuhD+J3A1ociDnXQsow4IaJIqMqZrZhB56YNOYnIP2RSBLcwxbHoi3+F37PXEKJ'),
	(20,'35c068308606c1cc8b2ae1cbd0890630',1322539885,NULL,'eJxtVsuO3DYQvAfIPxB7noyTW7C7XgOGE9uAgwBZAz5TUktihiIFkhpZ35ZDPim/kOpuambW8Gk0YrMf1dXV+u+ffx/ffJ28OVPKLobXd78cf74zFNrYuTC8vltK/9Ovd2+eHhPlOYZMT4+FvpanPzaTYziYPqaBigmxmGkz3q4PplmK8XhXRhfIjGRTMSeimQ3aOE02dBOFku/N7zHBMgxlNLE3nd3yweDU+BgG411P+ncm2+Ixj9Z7eKXN2K4zJfIzHc2nPT6ldpMLJS1widSyPZFY3ZvG8cFIk7FNXDi7zQRqTw9mTa6QHi0okZ9MsY0nTuqmiHvzHCUJvhwX07PH3p7jkiTqEGNnltAByYL/gM849ZbdMBb29h4WbAoMjuZzWnLZTT79+dc7szqkrUVeoj4oImSDFLkEqZuP4xpehjuaj6Fe38wKNI1tTyGunroB3tykcHJCAmXnErWKxGzLmI/mxx/ekoRZXSZNbY9EG6FjPVK65KvuOpq5w32Kk6Gz88ii1ACN1OBRlCQNwO2Z/KFCkFJc94MmBkL8DzEwmi8B4fO8NFxlWxlR3xN6gOr7tLiSGd8rdi60iWymS9MUlcamkDmv3nnAoo5mcLBs6lnAANcz5b2IBSEMU0aMA614CODdPgIdJoPhYtw4p3a0uVDg/guBtJYH3MR9Shx9BYwbn44uYyYS9wHTpxOxjkDyAoGPZ0JY9qt2+PcAoAmtRoNBQHEqNAN50TO5j78deeYd7LmxH+w8bwbh2BL8w68twmF2j353cdohuDHAcLOHb4nGeYodZm7kl1mmxRWO0PAdPrfhe0bZeajNNdZgdQYSCVy41HMHh+i7o3mGAVxOMRH3pXVxyWqUlsYxJdlNFQbp/ZB1PFsb0Dc0Byw3NtX+RIYfKgTOUqfThMgsIrcyxCGRFAObZHY5fZ3E+tpTr29h0I4gi0yW0Bc0hoHOH8LKA/yCZTbbUED0KnOcNfuS4RNbUbpL0RZCRgIZa2EVvEn74u2GcL5TyYIXBWLcuwyCMMMCqXmiApSVSEjw886uZqutx02RTO6ztoXFB0yDxUtNE0M+zyySLo/VHpMOUmKI325C66vyFCHjvBfZpHgCe5f5SoHWx6XLpktxNh2rjV5Zmbj7mPkq84LBrejowKs+yZ7JXMVel0iUy1ADnbAbOcAiARkE2yqrHGqpAjUk9OIiXNgUAlu43QCr9SdVSdFbk21P/kZI+hh3KeTMc1kmrJWj+cJ+xIMHhYuUfNAX6p2tkZrtk3XdvdnIvjjGrXpnj5S9FL6rbl6JCjqhpFc3MnpL1yE0q/jhokdVpDAp0VsGaX+zuvZE3QGCgjsYbYyNiMk+/MKgS0xOo42hd4iw67QeSlMueEjPGmIqFaznwD3+gkyEzZyu7NHaWaZ7VEVTbekWuiakU8qpzHHdK5HNKbhEgAQzzBN6c7M8uZ2YanwGAIX3UVPl4oxlLaqoRhYdXlEfAQSqGNyZHjS0tIJVnpPAgOh3yDtsv7oGeA+qs1y+DZhJamfEV8ISwjRlapcE5lx9PZeEcHUV80eBKDI/8iJq7ZIBg+vZy4ixQ6FBP3RwBW/SdDS/hfOmme6LKc6y2WLV3naMUfINtK8i1qprf9GD1aZOpKiJkwvKDtUh6f69fOzxTZSACWPTy24W5SToteoNSsx0uxFv2ocsr2dKu+oacuF5G1efo21ceUHSv/ERBbwUP16CWJNhN9c/KV+ccRNxprNd6QAJgFJtmqV8+ChtXcB0oMGDj2lTDziY6JbyvJTiFPeEQHCfj4+v5BP58dXlm/l/4f8Jdw=='),
	(33,'d1f54f90288ac93faeba36a4d69bd6fc',1322574034,NULL,'eJxdkUFOw0AMRfdI3MHKGlLYoZKmEmIBEhIScIFp4jQjJp5o7Gmas7HgSFwBZ5JWiF0ytv/73/75+i62x87BAQNbT5vsNr/JAKnytaX9JovSXN9l27IIyL0nxrIQPEr5ESILWAJpEV5e3x5hsNKCcU5fLCG0aILcg6EaHBoC8gKRxC9lP5D+1koVbVFUDs+0jI8wmJHBVJ/kB4f1XtVsd5W0lMbt1FbbgJWk7t5IyzlcXjxgwgyWcbZ2IuGIvIZGLZ39znI19moTmuA7wIN16kIWwC5lcBoqmR6BzAHdPNaZEPxwKuw8ofKfPPkY/i1kqnPcTSkrnIeXd4TGavomRCsMvvmzO0tVQMO4hne/uEkcE4gnX411upZZqHdIMs7KaRl6KEY+hYiKAB9lbiYc9IMwL1bpisXqfNZfyz25ZQ==');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries` WRITE;
/*!40000 ALTER TABLE `sym_entries` DISABLE KEYS */;

INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`)
VALUES
	(7,1,1,'2011-11-02 04:17:55','2011-11-02 11:17:55'),
	(11,2,1,'2011-11-22 01:55:49','2011-11-22 09:55:49'),
	(12,2,1,'2011-11-22 01:56:06','2011-11-22 09:56:06'),
	(13,2,1,'2011-11-22 02:01:58','2011-11-22 10:01:58'),
	(21,3,1,'2011-11-22 04:02:12','2011-11-22 12:02:12'),
	(20,3,1,'2011-11-22 04:02:06','2011-11-22 12:02:06'),
	(19,3,1,'2011-11-22 04:02:00','2011-11-22 12:02:00'),
	(18,3,1,'2011-11-22 04:01:53','2011-11-22 12:01:53'),
	(22,3,1,'2011-11-22 04:02:18','2011-11-22 12:02:18'),
	(23,3,1,'2011-11-22 04:02:23','2011-11-22 12:02:23'),
	(24,3,1,'2011-11-22 04:02:29','2011-11-22 12:02:29'),
	(25,3,1,'2011-11-26 09:10:47','2011-11-26 17:10:47'),
	(26,3,1,'2011-11-26 09:11:20','2011-11-26 17:11:20'),
	(27,3,1,'2011-11-26 09:11:50','2011-11-26 17:11:50'),
	(28,3,1,'2011-11-26 09:12:21','2011-11-26 17:12:21'),
	(29,3,1,'2011-11-26 09:14:01','2011-11-26 17:14:01'),
	(30,3,1,'2011-11-26 09:14:21','2011-11-26 17:14:21'),
	(31,3,1,'2011-11-26 09:14:40','2011-11-26 17:14:40'),
	(32,4,1,'2011-11-26 12:15:23','2011-11-26 20:15:23'),
	(33,5,1,'2011-11-27 19:02:01','2011-11-28 03:02:01'),
	(34,5,1,'2011-11-27 19:05:36','2011-11-28 03:05:36'),
	(35,5,1,'2011-11-27 19:08:31','2011-11-28 03:08:31'),
	(36,6,1,'2011-11-27 19:18:23','2011-11-28 03:18:23'),
	(37,6,1,'2011-11-27 19:37:09','2011-11-28 03:37:09'),
	(38,5,1,'2011-11-27 20:01:54','2011-11-28 04:01:54'),
	(39,6,1,'2011-11-27 20:27:50','2011-11-28 04:27:50'),
	(40,7,1,'2011-11-28 18:45:23','2011-11-29 02:45:23'),
	(41,8,1,'2011-11-28 19:53:16','2011-11-29 03:53:16'),
	(42,4,1,'2011-11-28 20:08:47','2011-11-29 04:08:47'),
	(43,3,1,'2011-11-28 20:34:55','2011-11-29 04:34:55'),
	(44,8,1,'2011-11-28 20:37:56','2011-11-29 04:37:56'),
	(45,7,1,'2011-11-28 21:26:24','2011-11-29 05:26:24');

/*!40000 ALTER TABLE `sym_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_11
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_11`;

CREATE TABLE `sym_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_11` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_11` DISABLE KEYS */;

INSERT INTO `sym_entries_data_11` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(8,7,'male','Male');

/*!40000 ALTER TABLE `sym_entries_data_11` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_12
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_12`;

CREATE TABLE `sym_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_12` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_12` DISABLE KEYS */;

INSERT INTO `sym_entries_data_12` (`id`, `entry_id`, `start`, `end`)
VALUES
	(3,7,'1982-02-09 12:17:55','1982-02-09 12:17:55');

/*!40000 ALTER TABLE `sym_entries_data_12` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_14
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_14`;

CREATE TABLE `sym_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_14` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_14` DISABLE KEYS */;

INSERT INTO `sym_entries_data_14` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(5,11,'msapplication-tooltip','msapplication-tooltip'),
	(7,12,'msapplication-starturl','msapplication-starturl'),
	(6,13,'description','description');

/*!40000 ALTER TABLE `sym_entries_data_14` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_16
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_16`;

CREATE TABLE `sym_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_16` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_16` DISABLE KEYS */;

INSERT INTO `sym_entries_data_16` (`id`, `entry_id`, `value`, `value_formatted`)
VALUES
	(4,12,'http://churchdeploy.com/',NULL),
	(2,11,'To make Jesus known.',NULL),
	(3,13,'The mission of Church Deploy is to build, as a community, the best church website framework possible and give it away, free of charge.',NULL);

/*!40000 ALTER TABLE `sym_entries_data_16` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_19
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_19`;

CREATE TABLE `sym_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` text,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_19` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_19` DISABLE KEYS */;

INSERT INTO `sym_entries_data_19` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(18,18,'about','About','about','About','1','About'),
	(19,19,'services','Services','services','Services','1','Services'),
	(20,20,'events','Events','events','Events','1','Events'),
	(21,21,'teachings','Teachings','teachings','Teachings','1','Teachings'),
	(22,22,'ministries','Ministries','ministries','Ministries','1','Ministries'),
	(23,23,'missions','Missions','missions','Missions','1','Missions'),
	(24,24,'give','Give','give','Give','1','Give'),
	(30,25,'men','Men','men','Men','1','Men'),
	(29,26,'women','Women','women','Women','1','Women'),
	(34,27,'children-0-k','Children (0-K)','children-0-k','Children (0-K)','2','Children (0-K)'),
	(28,28,'grade-school','Grade School','grade-school','Grade School','2','Grade School'),
	(31,29,'jr-high','Jr. High','jr-high','Jr. High','2','Jr. High'),
	(32,30,'high-school','High school','high-school','High school','2','High school'),
	(33,31,'college','College','college','College','1','College'),
	(38,43,'home','Home','home','Home','1','Home');

/*!40000 ALTER TABLE `sym_entries_data_19` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_2`;

CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_2` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_2` DISABLE KEYS */;

INSERT INTO `sym_entries_data_2` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(8,7,'john','John');

/*!40000 ALTER TABLE `sym_entries_data_2` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_20
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_20`;

CREATE TABLE `sym_entries_data_20` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_20` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_20` DISABLE KEYS */;

INSERT INTO `sym_entries_data_20` (`id`, `entry_id`, `relation_id`)
VALUES
	(18,18,NULL),
	(19,19,NULL),
	(20,20,NULL),
	(21,21,NULL),
	(22,22,NULL),
	(23,23,NULL),
	(24,24,NULL),
	(30,25,22),
	(29,26,22),
	(34,27,22),
	(28,28,22),
	(31,29,22),
	(32,30,22),
	(33,31,22),
	(38,43,NULL);

/*!40000 ALTER TABLE `sym_entries_data_20` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_21
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_21`;

CREATE TABLE `sym_entries_data_21` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_21` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_21` DISABLE KEYS */;

INSERT INTO `sym_entries_data_21` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(16,24,'giving-at-athey','Giving at Athey','giving-at-athey','Giving at Athey',3,'Giving at Athey'),
	(10,18,'about-us','About us','about-us','About us',2,'About us'),
	(11,19,'services','Services','services','Services',1,'Services'),
	(12,20,'events','Events','events','Events',1,'Events'),
	(13,21,'teachings','Teachings','teachings','Teachings',1,'Teachings'),
	(14,22,'ministries','Ministries','ministries','Ministries',1,'Ministries'),
	(15,23,'missions','Missions','missions','Missions',1,'Missions'),
	(22,25,'men-s-ministries','Men’s ministries','men-s-ministries','Men’s ministries',2,'Men’s ministries'),
	(21,26,'women-s-ministries','Women’s ministries','women-s-ministries','Women’s ministries',2,'Women’s ministries'),
	(26,27,'children-s-ministries','Children’s ministries','children-s-ministries','Children’s ministries',2,'Children’s ministries'),
	(20,28,'grade-school-ministries','Grade School ministries','grade-school-ministries','Grade School ministries',3,'Grade School ministries'),
	(23,29,'junior-high-ministries','Junior high ministries','junior-high-ministries','Junior high ministries',3,'Junior high ministries'),
	(24,30,'high-school-ministries','High school ministries','high-school-ministries','High school ministries',3,'High school ministries'),
	(25,31,'college-ministries','College ministries','college-ministries','College ministries',2,'College ministries'),
	(30,43,'welcome-home','Welcome home','welcome-home','Welcome home',2,'Welcome home');

/*!40000 ALTER TABLE `sym_entries_data_21` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_22
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_22`;

CREATE TABLE `sym_entries_data_22` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_22` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_22` DISABLE KEYS */;

INSERT INTO `sym_entries_data_22` (`id`, `entry_id`, `value`)
VALUES
	(1,18,'yes'),
	(2,19,'yes'),
	(3,20,'yes'),
	(4,21,'yes'),
	(5,22,'yes'),
	(6,23,'yes'),
	(7,24,'yes'),
	(13,25,'no'),
	(12,26,'no'),
	(17,27,'no'),
	(11,28,'no'),
	(14,29,'no'),
	(15,30,'no'),
	(16,31,'no'),
	(21,43,'yes');

/*!40000 ALTER TABLE `sym_entries_data_22` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_23
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_23`;

CREATE TABLE `sym_entries_data_23` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_23` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_23` DISABLE KEYS */;

INSERT INTO `sym_entries_data_23` (`id`, `entry_id`, `value`)
VALUES
	(8,18,2),
	(11,21,5),
	(10,20,4),
	(9,19,3),
	(12,22,6),
	(13,23,7),
	(14,24,8),
	(20,25,9),
	(19,26,10),
	(24,27,11),
	(18,28,12),
	(21,29,13),
	(22,30,14),
	(23,31,15),
	(28,43,1);

/*!40000 ALTER TABLE `sym_entries_data_23` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_24
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_24`;

CREATE TABLE `sym_entries_data_24` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_24` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_24` DISABLE KEYS */;

INSERT INTO `sym_entries_data_24` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(3,32,'1-timothy-2-8','1 Timothy 2:8'),
	(9,42,'proverbs-3-5-10','Proverbs 3:5-10');

/*!40000 ALTER TABLE `sym_entries_data_24` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_25
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_25`;

CREATE TABLE `sym_entries_data_25` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_25` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_25` DISABLE KEYS */;

INSERT INTO `sym_entries_data_25` (`id`, `entry_id`, `relation_id`)
VALUES
	(3,32,25),
	(9,42,18);

/*!40000 ALTER TABLE `sym_entries_data_25` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_26
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_26`;

CREATE TABLE `sym_entries_data_26` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_26` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_26` DISABLE KEYS */;

INSERT INTO `sym_entries_data_26` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(1,33,'church-building','Church building','church-building','Church building',2,'Church building'),
	(4,34,'joey-meador-s-place',NULL,NULL,NULL,0,NULL),
	(5,35,NULL,NULL,NULL,NULL,0,NULL),
	(8,38,'mt-hood-national-forest','Mt. Hood national forest','mt-hood-national-forest','Mt. Hood national forest',4,'Mt. Hood national forest');

/*!40000 ALTER TABLE `sym_entries_data_26` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_27
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_27`;

CREATE TABLE `sym_entries_data_27` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_27` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_27` DISABLE KEYS */;

INSERT INTO `sym_entries_data_27` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(1,33,'athey-creek-christian-fellowship','Athey Creek Christian Fellowship','athey-creek-christian-fellowship','Athey Creek Christian Fellowship',4,'Athey Creek Christian Fellowship'),
	(4,34,'joey-meador-s-place','Joey Meador’s place','joey-meador-s-place','Joey Meador’s place',3,'Joey Meador’s place'),
	(5,35,'erik-and-kim-ortiz-s-home','Erik & Kim Ortiz’s home','erik-and-kim-ortiz-s-home','Erik & Kim Ortiz’s home',4,'Erik &amp; Kim Ortiz’s home'),
	(8,38,'mt-hood-national-forest-headquarters','Mt. Hood national forest headquarters','mt-hood-national-forest-headquarters','Mt. Hood national forest headquarters',5,'Mt. Hood national forest headquarters');

/*!40000 ALTER TABLE `sym_entries_data_27` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_28
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_28`;

CREATE TABLE `sym_entries_data_28` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_28` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_28` DISABLE KEYS */;

INSERT INTO `sym_entries_data_28` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(1,33,NULL,'Main building for fellowship',NULL,'Main building for fellowship',4,'<p>Main building for fellowship</p>\n'),
	(4,34,NULL,NULL,NULL,NULL,0,'\n'),
	(5,35,NULL,NULL,NULL,NULL,0,'\n'),
	(8,38,NULL,'Located twenty miles east of the city of Portland, Oregon, and the northern Willamette River valley, the Mt. Hood National Forest extends south from the strikingly beautiful Columbia River Gorge across more than sixty miles of forested mountains, lakes and streams to Olallie Scenic Area, a high lake basin under the slopes of Mt. Jefferson. The Forest encompasses some 1,067,043 acres.\r\n\r\nOur many visitors enjoy fishing, camping, boating and hiking in the summer, hunting in the fall, and skiing and other snow sports in the winter. Berry-picking and mushroom collection are popular, and for many area residents, a trip in December to cut the family\'s Christmas tree is a long standing tradition.\r\n\r\nThe Cascade Range Forest Reserve was established in 1893, and divided into several National Forests in 1908, when the northern portion was merged with the Bull Run Reserve (city watershed) and named Oregon National Forest. The name was changed again to Mt. Hood National Forest in 1924.\r\n\r\nSome popular destinations that offer rewarding visits are Timberline Lodge, built in 1937 high on Mt. Hood, Lost Lake, Trillium Lake, Timothy Lake, Rock Creek Reservoir and portions of the Old Oregon Trail, including Barlow Road.\r\nThere are 311,448 acres of designated wilderness on the Forest. The largest is the Mt. Hood Wilderness, which includes the mountain\'s peak and upper slopes. Others are Clackamas, Lower White River, Roaring River, Badger Creek, Salmon-Huckleberry, Hatfield, and Bull-of-the-Woods. Olallie Scenic Area is a lightly-roaded lake basin that provides a primitive recreational experience.',NULL,'Located twenty miles east of the city of Portland, Oregon, and the northern Willamette River valley, the Mt. Hood National Forest extends south from the strikingly beautiful Columbia River Gorge across more than sixty miles of forested mountains, lakes and streams to Olallie Scenic Area, a high lake basin under the slopes of Mt. Jefferson. The Forest encompasses some 1,067,043 acres.\r\n\r\nOur many visitors enjoy fishing, camping, boating and hiking in the summer, hunting in the fall, and skiing and other snow sports in the winter. Berry-picking and mushroom collection are popular, and for many area residents, a trip in December to cut the family\'s Christmas tree is a long standing tradition.\r\n\r\nThe Cascade Range Forest Reserve was established in 1893, and divided into several National Forests in 1908, when the northern portion was merged with the Bull Run Reserve (city watershed) and named Oregon National Forest. The name was changed again to Mt. Hood National Forest in 1924.\r\n\r\nSome popular destinations that offer rewarding visits are Timberline Lodge, built in 1937 high on Mt. Hood, Lost Lake, Trillium Lake, Timothy Lake, Rock Creek Reservoir and portions of the Old Oregon Trail, including Barlow Road.\r\nThere are 311,448 acres of designated wilderness on the Forest. The largest is the Mt. Hood Wilderness, which includes the mountain\'s peak and upper slopes. Others are Clackamas, Lower White River, Roaring River, Badger Creek, Salmon-Huckleberry, Hatfield, and Bull-of-the-Woods. Olallie Scenic Area is a lightly-roaded lake basin that provides a primitive recreational experience.',242,'<p>Located twenty miles east of the city of Portland, Oregon, and the northern Willamette River valley, the Mt. Hood National Forest extends south from the strikingly beautiful Columbia River Gorge across more than sixty miles of forested mountains, lakes and streams to Olallie Scenic Area, a high lake basin under the slopes of Mt. Jefferson. The Forest encompasses some 1,067,043 acres.</p>\n\n<p>Our many visitors enjoy fishing, camping, boating and hiking in the summer, hunting in the fall, and skiing and other snow sports in the winter. Berry-picking and mushroom collection are popular, and for many area residents, a trip in December to cut the family&#8217;s Christmas tree is a long standing tradition.</p>\n\n<p>The Cascade Range Forest Reserve was established in 1893, and divided into several National Forests in 1908, when the northern portion was merged with the Bull Run Reserve (city watershed) and named Oregon National Forest. The name was changed again to Mt. Hood National Forest in 1924.</p>\n\n<p>Some popular destinations that offer rewarding visits are Timberline Lodge, built in 1937 high on Mt. Hood, Lost Lake, Trillium Lake, Timothy Lake, Rock Creek Reservoir and portions of the Old Oregon Trail, including Barlow Road.\nThere are 311,448 acres of designated wilderness on the Forest. The largest is the Mt. Hood Wilderness, which includes the mountain&#8217;s peak and upper slopes. Others are Clackamas, Lower White River, Roaring River, Badger Creek, Salmon-Huckleberry, Hatfield, and Bull-of-the-Woods. Olallie Scenic Area is a lightly-roaded lake basin that provides a primitive recreational experience.</p>\n');

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
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_29` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_29` DISABLE KEYS */;

INSERT INTO `sym_entries_data_29` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(1,33,'27520-sw-95th-ave','27520 SW 95th Ave'),
	(4,34,'10895-sw-brown-st','10895 SW Brown St.'),
	(5,35,'20807-sw-siletz-ct','20807 SW Siletz Ct.'),
	(8,38,'16400-champion-way','16400 Champion Way');

/*!40000 ALTER TABLE `sym_entries_data_29` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_30
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_30`;

CREATE TABLE `sym_entries_data_30` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_30` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_30` DISABLE KEYS */;

INSERT INTO `sym_entries_data_30` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(1,33,'wilsonville','Wilsonville'),
	(4,34,'tualatin','Tualatin'),
	(5,35,'tualatin','Tualatin'),
	(8,38,'sandy','Sandy');

/*!40000 ALTER TABLE `sym_entries_data_30` ENABLE KEYS */;
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
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_31` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_31` DISABLE KEYS */;

INSERT INTO `sym_entries_data_31` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(1,33,'or','OR'),
	(4,34,'or','OR'),
	(5,35,'or','OR'),
	(8,38,'or','OR');

/*!40000 ALTER TABLE `sym_entries_data_31` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_32
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_32`;

CREATE TABLE `sym_entries_data_32` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_32` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_32` DISABLE KEYS */;

INSERT INTO `sym_entries_data_32` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(1,33,'97070','97070'),
	(4,34,'97062','97062'),
	(5,35,'97062','97062'),
	(8,38,'97055','97055');

/*!40000 ALTER TABLE `sym_entries_data_32` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_33
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_33`;

CREATE TABLE `sym_entries_data_33` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_33` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_33` DISABLE KEYS */;

INSERT INTO `sym_entries_data_33` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(7,39,'early-morning-worship','Early morning worship','early-morning-worship','Early morning worship',3,'Early morning worship'),
	(8,36,'men-s-breakfast','Men’s breakfast','men-s-breakfast','Men’s breakfast',2,'Men’s breakfast'),
	(9,37,'snowshoe-adventure','Snowshoe adventure','snowshoe-adventure','Snowshoe adventure',2,'Snowshoe adventure');

/*!40000 ALTER TABLE `sym_entries_data_33` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_34
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_34`;

CREATE TABLE `sym_entries_data_34` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_34` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_34` DISABLE KEYS */;

INSERT INTO `sym_entries_data_34` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(7,39,NULL,NULL,NULL,NULL,0,'\n'),
	(8,36,NULL,'Donec id elit non mi porta gravida at eget metus. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Maecenas faucibus mollis interdum. Sed posuere consectetur est at lobortis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam quis risus eget urna mollis ornare vel eu leo. Donec ullamcorper nulla non metus auctor fringilla.\r\n\r\nVivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Etiam porta sem malesuada magna mollis euismod. Donec id elit non mi porta gravida at eget metus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Donec id elit non mi porta gravida at eget metus.',NULL,'Donec id elit non mi porta gravida at eget metus. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Maecenas faucibus mollis interdum. Sed posuere consectetur est at lobortis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam quis risus eget urna mollis ornare vel eu leo. Donec ullamcorper nulla non metus auctor fringilla.\r\n\r\nVivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Etiam porta sem malesuada magna mollis euismod. Donec id elit non mi porta gravida at eget metus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Donec id elit non mi porta gravida at eget metus.',129,'<p>Donec id elit non mi porta gravida at eget metus. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Maecenas faucibus mollis interdum. Sed posuere consectetur est at lobortis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam quis risus eget urna mollis ornare vel eu leo. Donec ullamcorper nulla non metus auctor fringilla.</p>\n\n<p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Etiam porta sem malesuada magna mollis euismod. Donec id elit non mi porta gravida at eget metus. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Donec id elit non mi porta gravida at eget metus.</p>\n'),
	(9,37,NULL,'Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Maecenas faucibus mollis interdum. Vestibulum id ligula porta felis euismod semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sed odio dui.',NULL,'Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Maecenas faucibus mollis interdum. Vestibulum id ligula porta felis euismod semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sed odio dui.',43,'<p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Maecenas faucibus mollis interdum. Vestibulum id ligula porta felis euismod semper. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sed odio dui.</p>\n');

/*!40000 ALTER TABLE `sym_entries_data_34` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_35
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_35`;

CREATE TABLE `sym_entries_data_35` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_35` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_35` DISABLE KEYS */;

INSERT INTO `sym_entries_data_35` (`id`, `entry_id`, `start`, `end`)
VALUES
	(7,39,'2012-02-25 20:17:00','2012-02-25 20:17:00'),
	(8,36,'2012-01-22 18:00:00','2012-01-22 18:00:00'),
	(9,37,'2012-02-03 14:00:00','2012-02-05 12:00:00');

/*!40000 ALTER TABLE `sym_entries_data_35` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_36
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_36`;

CREATE TABLE `sym_entries_data_36` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_36` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_36` DISABLE KEYS */;

INSERT INTO `sym_entries_data_36` (`id`, `entry_id`, `relation_id`)
VALUES
	(8,36,33),
	(9,37,33),
	(7,39,35);

/*!40000 ALTER TABLE `sym_entries_data_36` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_37
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_37`;

CREATE TABLE `sym_entries_data_37` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_37` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_37` DISABLE KEYS */;

INSERT INTO `sym_entries_data_37` (`id`, `entry_id`, `relation_id`)
VALUES
	(3,38,25);

/*!40000 ALTER TABLE `sym_entries_data_37` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_38
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_38`;

CREATE TABLE `sym_entries_data_38` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_38` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_38` DISABLE KEYS */;

INSERT INTO `sym_entries_data_38` (`id`, `entry_id`, `relation_id`)
VALUES
	(4,37,22),
	(2,39,25),
	(3,36,25),
	(5,37,25);

/*!40000 ALTER TABLE `sym_entries_data_38` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_4
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_4`;

CREATE TABLE `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_4` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_4` DISABLE KEYS */;

INSERT INTO `sym_entries_data_4` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(8,7,'doe','Doe');

/*!40000 ALTER TABLE `sym_entries_data_4` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_40
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_40`;

CREATE TABLE `sym_entries_data_40` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_40` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_40` DISABLE KEYS */;

INSERT INTO `sym_entries_data_40` (`id`, `entry_id`, `handle`, `value`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(3,40,NULL,'## Kids of all ages have every opportunity to learn, grow and have fun at our fellowship.\r\n\r\nThanks for checking out our Children’s Ministry web page. The Lord has blessed us with a great bunch of kids at Athey Creek. We enjoy sharing the love of Jesus with them in a safe and secure environment. Feel free to click on the links on this page to get a better understanding of children’s ministry at Athey Creek.\r\n\r\nIf you are looking for a way to plug into our Children’s Ministry, we ask that you sign up at the Children’s Ministry table in the Kid\'s Lobby. We will contact you about the process itself, and give you the information you will need as you pray through your involvement. If you simply want more information on our Children’s Ministry, please look through our Document Library.',NULL,'## Kids of all ages have every opportunity to learn, grow and have fun at our fellowship.\r\n\r\nThanks for checking out our Children’s Ministry web page. The Lord has blessed us with a great bunch of kids at Athey Creek. We enjoy sharing the love of Jesus with them in a safe and secure environment. Feel free to click on the links on this page to get a better understanding of children’s ministry at Athey Creek.\r\n\r\nIf you are looking for a way to plug into our Children’s Ministry, we ask that you sign up at the Children’s Ministry table in the Kid\'s Lobby. We will contact you about the process itself, and give you the information you will need as you pray through your involvement. If you simply want more information on our Children’s Ministry, please look through our Document Library.',141,'<h2>Kids of all ages have every opportunity to learn, grow and have fun at our fellowship.</h2>\n\n<p>Thanks for checking out our Children’s Ministry web page. The Lord has blessed us with a great bunch of kids at Athey Creek. We enjoy sharing the love of Jesus with them in a safe and secure environment. Feel free to click on the links on this page to get a better understanding of children’s ministry at Athey Creek.</p>\n\n<p>If you are looking for a way to plug into our Children’s Ministry, we ask that you sign up at the Children’s Ministry table in the Kid&#8217;s Lobby. We will contact you about the process itself, and give you the information you will need as you pray through your involvement. If you simply want more information on our Children’s Ministry, please look through our Document Library.</p>\n'),
	(5,45,NULL,'## What We Believe\r\n\r\n### The Athey Creek Christian Fellowship is a body of believers desiring to know the Lord in an ever-increasing measure. We are a non-denominational fellowship associating with all who are in the Body of Christ.\r\n\r\nWe believe there is one God who eternally exists in three persons: the Father, the Son and the Holy Spirit. We believe that Jesus Christ, the second person of the Holy Trinity, was born of a virgin, lived a sinless life, died a sacrificial death for the sins of the world, rose bodily from the dead, ascended into Heaven and is coming again to judge the living and the dead and to establish God’s kingdom of righteousness and peace on the earth.\r\n\r\nWe believe the only true basis of Christian fellowship is God’s love, which is greater than any differences we possess and without which we have no right to claim ourselves Christians.  \r\n*1 Corinthians 13*\r\n\r\nWe believe that salvation comes through Jesus alone. It is by His grace and work on the cross we can go to Heaven, not by any work we do.   \r\n*Ephesians 2:8-9*\r\n\r\nWe believe the marks of a maturing church are Faith, Hope and Love.  \r\n*Colossians 1:3-7*\r\n\r\nWe believe the Bible to be the inspired and inerrant Word of God. We place high emphasis on the teaching of God’s Word, the Bible, that our Faith may grow.   \r\n*Romans 10:17, 2 Timothy 3:16*\r\n\r\nWe live in anticipation of the return of Jesus, for He is our Blessed Hope.  \r\n*Titus 2:13*\r\n\r\nWe desire the fullness of the Spirit in our lives, for the fruit of the Spirit is Love.  \r\n*Galatians 5:22*',NULL,'## What We Believe\r\n\r\n### The Athey Creek Christian Fellowship is a body of believers desiring to know the Lord in an ever-increasing measure. We are a non-denominational fellowship associating with all who are in the Body of Christ.\r\n\r\nWe believe there is one God who eternally exists in three persons: the Father, the Son and the Holy Spirit. We believe that Jesus Christ, the second person of the Holy Trinity, was born of a virgin, lived a sinless life, died a sacrificial death for the sins of the world, rose bodily from the dead, ascended into Heaven and is coming again to judge the living and the dead and to establish God’s kingdom of righteousness and peace on the earth.\r\n\r\nWe believe the only true basis of Christian fellowship is God’s love, which is greater than any differences we possess and without which we have no right to claim ourselves Christians.  \r\n*1 Corinthians 13*\r\n\r\nWe believe that salvation comes through Jesus alone. It is by His grace and work on the cross we can go to Heaven, not by any work we do.   \r\n*Ephesians 2:8-9*\r\n\r\nWe believe the marks of a maturing church are Faith, Hope and Love.  \r\n*Colossians 1:3-7*\r\n\r\nWe believe the Bible to be the inspired and inerrant Word of God. We place high emphasis on the teaching of God’s Word, the Bible, that our Faith may grow.   \r\n*Romans 10:17, 2 Timothy 3:16*\r\n\r\nWe live in anticipation of the return of Jesus, for He is our Blessed Hope.  \r\n*Titus 2:13*\r\n\r\nWe desire the fullness of the Spirit in our lives, for the fruit of the Spirit is Love.  \r\n*Galatians 5:22*',262,'<h2>What We Believe</h2>\n\n<h3>The Athey Creek Christian Fellowship is a body of believers desiring to know the Lord in an ever-increasing measure. We are a non-denominational fellowship associating with all who are in the Body of Christ.</h3>\n\n<p>We believe there is one God who eternally exists in three persons: the Father, the Son and the Holy Spirit. We believe that Jesus Christ, the second person of the Holy Trinity, was born of a virgin, lived a sinless life, died a sacrificial death for the sins of the world, rose bodily from the dead, ascended into Heaven and is coming again to judge the living and the dead and to establish God’s kingdom of righteousness and peace on the earth.</p>\n\n<p>We believe the only true basis of Christian fellowship is God’s love, which is greater than any differences we possess and without which we have no right to claim ourselves Christians.<br />\n<em>1 Corinthians 13</em></p>\n\n<p>We believe that salvation comes through Jesus alone. It is by His grace and work on the cross we can go to Heaven, not by any work we do.<br />\n<em>Ephesians 2:8-9</em></p>\n\n<p>We believe the marks of a maturing church are Faith, Hope and Love.<br />\n<em>Colossians 1:3-7</em></p>\n\n<p>We believe the Bible to be the inspired and inerrant Word of God. We place high emphasis on the teaching of God’s Word, the Bible, that our Faith may grow.<br />\n<em>Romans 10:17, 2 Timothy 3:16</em></p>\n\n<p>We live in anticipation of the return of Jesus, for He is our Blessed Hope.<br />\n<em>Titus 2:13</em></p>\n\n<p>We desire the fullness of the Spirit in our lives, for the fruit of the Spirit is Love.<br />\n<em>Galatians 5:22</em></p>\n');

/*!40000 ALTER TABLE `sym_entries_data_40` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_42
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_42`;

CREATE TABLE `sym_entries_data_42` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_42` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_42` DISABLE KEYS */;

INSERT INTO `sym_entries_data_42` (`id`, `entry_id`, `relation_id`)
VALUES
	(3,40,25),
	(5,45,43);

/*!40000 ALTER TABLE `sym_entries_data_42` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_43
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_43`;

CREATE TABLE `sym_entries_data_43` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_43` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_43` DISABLE KEYS */;

INSERT INTO `sym_entries_data_43` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`)
VALUES
	(14,41,'/uploads/images/leaderboards/4870479764_4c6c8bae69_o-4ed6a3dfbff6d.jpg',1792266,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2011-11-30T13:45:03-08:00\";s:5:\"width\";i:1751;s:6:\"height\";i:1293;}'),
	(13,44,'/uploads/images/leaderboards/3832084148_7e7220f655_b-4ed461a4663af.jpeg',675995,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2011-11-28T20:37:56-08:00\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;}');

/*!40000 ALTER TABLE `sym_entries_data_43` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_44
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_44`;

CREATE TABLE `sym_entries_data_44` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_44` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_44` DISABLE KEYS */;

INSERT INTO `sym_entries_data_44` (`id`, `entry_id`, `relation_id`)
VALUES
	(19,41,25),
	(18,41,22),
	(17,44,43);

/*!40000 ALTER TABLE `sym_entries_data_44` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_45
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_45`;

CREATE TABLE `sym_entries_data_45` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_45` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_45` DISABLE KEYS */;

INSERT INTO `sym_entries_data_45` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(13,41,'top-center','Top center'),
	(12,44,NULL,NULL);

/*!40000 ALTER TABLE `sym_entries_data_45` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_46
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_46`;

CREATE TABLE `sym_entries_data_46` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_46` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_46` DISABLE KEYS */;

INSERT INTO `sym_entries_data_46` (`id`, `entry_id`, `value`)
VALUES
	(6,44,44),
	(7,41,41);

/*!40000 ALTER TABLE `sym_entries_data_46` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_47
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_47`;

CREATE TABLE `sym_entries_data_47` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_47` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_47` DISABLE KEYS */;

INSERT INTO `sym_entries_data_47` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(3,44,'475','475');

/*!40000 ALTER TABLE `sym_entries_data_47` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_5
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_5`;

CREATE TABLE `sym_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_5` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_5` DISABLE KEYS */;

INSERT INTO `sym_entries_data_5` (`id`, `entry_id`, `value`)
VALUES
	(8,7,'john_doe@churchdeploy.com');

/*!40000 ALTER TABLE `sym_entries_data_5` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_6
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_6`;

CREATE TABLE `sym_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recovery-code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') COLLATE utf8_unicode_ci NOT NULL,
  `reset` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recovery-code` (`recovery-code`),
  KEY `entry_id` (`entry_id`),
  KEY `length` (`length`),
  KEY `password` (`password`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_6` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_6` DISABLE KEYS */;

INSERT INTO `sym_entries_data_6` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`)
VALUES
	(8,7,'2c950d774d28d9f1e7a3f156309d43b88978cd4b',NULL,9,'strong','no',NULL);

/*!40000 ALTER TABLE `sym_entries_data_6` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_7
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_7`;

CREATE TABLE `sym_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `activated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sym_entries_data_9
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_9`;

CREATE TABLE `sym_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_9` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_9` DISABLE KEYS */;

INSERT INTO `sym_entries_data_9` (`id`, `entry_id`, `role_id`)
VALUES
	(8,7,1);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_extensions` WRITE;
/*!40000 ALTER TABLE `sym_extensions` DISABLE KEYS */;

INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`)
VALUES
	(1,'xssfilter','enabled','1.1'),
	(2,'debugdevkit','enabled','1.2.1'),
	(3,'export_ensemble','enabled','1.16'),
	(4,'selectbox_link_field','enabled','1.22'),
	(5,'jit_image_manipulation','enabled','1.14'),
	(6,'maintenance_mode','enabled','1.5'),
	(7,'profiledevkit','enabled','1.0.4'),
	(8,'markdown','enabled','1.13'),
	(9,'members','enabled','1.1.1'),
	(10,'datetime','enabled','2.1.1'),
	(25,'language_redirect','enabled','1.0.3'),
	(12,'uniqueuploadfield','enabled','1.4.2'),
	(13,'uniqueinputfield','enabled','1.3'),
	(14,'html5_doctype','enabled','1.2.5'),
	(15,'image_index_preview','enabled','1.2.1'),
	(16,'jquery_date_picker','enabled','1.3'),
	(24,'multilingual_field','enabled','1.4.1'),
	(18,'massuploadutility','enabled','0.9.8'),
	(19,'order_entries','enabled','1.9.7'),
	(20,'root_page_params','enabled','1.2'),
	(21,'subsectionmanager','enabled','1.3'),
	(22,'tweak_ui','enabled','0.1.2'),
	(23,'configuration','enabled','1.3.5'),
	(26,'health_check','enabled','1.4'),
	(27,'systemidfield','enabled','1.0.2');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_extensions_delegates` WRITE;
/*!40000 ALTER TABLE `sym_extensions_delegates` DISABLE KEYS */;

INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`)
VALUES
	(96,1,'/frontend/','EventPreSaveFilter','eventPreSaveFilter'),
	(94,1,'/blueprints/events/new/','AppendEventFilter','appendEventFilter'),
	(95,1,'/blueprints/events/edit/','AppendEventFilter','appendEventFilter'),
	(97,2,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(98,2,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),
	(99,3,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(104,5,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(105,5,'/system/preferences/','Save','__SavePreferences'),
	(119,18,'/publish/new/','EntryPostCreate','returnJSON'),
	(114,6,'/frontend/','FrontendPrePageResolve','__checkForMaintenanceMode'),
	(115,6,'/frontend/','FrontendParamsResolve','__addParam'),
	(111,6,'/system/preferences/','CustomActions','__toggleMaintenanceMode'),
	(112,6,'/backend/','AppendPageAlert','__appendAlert'),
	(113,6,'/blueprints/pages/','AppendPageContent','__appendType'),
	(131,7,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(132,7,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),
	(110,6,'/system/preferences/','Save','__SavePreferences'),
	(128,9,'/blueprints/events/new/','AppendEventFilter','appendFilter'),
	(127,9,'/system/preferences/','Save','savePreferences'),
	(126,9,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(124,9,'/frontend/','EventPostSaveFilter','processPostSaveFilter'),
	(125,9,'/backend/','AdminPagePreGenerate','appendAssets'),
	(123,9,'/frontend/','EventPreSaveFilter','checkEventPermissions'),
	(122,9,'/frontend/','FrontendProcessEvents','appendLoginStatusToEventXML'),
	(150,25,'/system/preferences/','Save','__SavePreferences'),
	(149,25,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(102,14,'/frontend/','FrontendOutputPostGenerate','parse_html'),
	(103,15,'/backend/','AdminPagePreGenerate','__appendAssets'),
	(106,16,'/backend/','InitaliseAdminPageHead','initializeAdmin'),
	(142,24,'/system/preferences/','Save','__SavePreferences'),
	(109,6,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(118,18,'/backend/','AdminPagePreGenerate','initaliseAdminPageHead'),
	(117,18,'/system/preferences/','CustomActions','savePreferences'),
	(116,18,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(129,9,'/blueprints/events/edit/','AppendEventFilter','appendFilter'),
	(121,9,'/frontend/','FrontendParamsResolve','addMemberDetailsToPageParams'),
	(120,9,'/frontend/','FrontendPageResolved','checkFrontendPagePermissions'),
	(130,19,'/backend/','InitaliseAdminPageHead','appendScriptToHead'),
	(134,20,'/system/preferences/','AddCustomPreferenceFieldsets','append_preferences'),
	(133,20,'/frontend/','FrontendPrePageResolve','addPage'),
	(139,21,'/backend/','AppendPageAlert','__upgradeMediathek'),
	(138,21,'/publish/edit/','EntryPostEdit','__saveSortOrder'),
	(137,21,'/publish/new/','EntryPostNew','__saveSortOrder'),
	(136,21,'/backend/','AdminPagePreGenerate','__appendAssets'),
	(140,22,'/backend/','InitaliseAdminPageHead','addScriptToHead'),
	(92,23,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(93,23,'/system/preferences/','Save','__SavePreferences'),
	(141,24,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(135,20,'/system/preferences/','Save','save_settings'),
	(145,26,'/backend/','InitaliseAdminPageHead','initaliseAdminPageHead'),
	(146,26,'/backend/','DashboardPanelRender','render_panel'),
	(147,26,'/backend/','DashboardPanelOptions','dashboard_panel_options'),
	(148,26,'/backend/','DashboardPanelTypes','dashboard_panel_types');

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

LOCK TABLES `sym_fields` WRITE;
/*!40000 ALTER TABLE `sym_fields` DISABLE KEYS */;

INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`)
VALUES
	(12,'Birthday','birthday','datetime',1,'yes',3,'sidebar','yes'),
	(2,'First name','first-name','input',1,'yes',0,'main','yes'),
	(14,'Name','name','input',2,'no',0,'main','yes'),
	(4,'Last name','last-name','input',1,'yes',1,'main','yes'),
	(5,'Email','email','memberemail',1,'yes',2,'main','yes'),
	(6,'Password','password','memberpassword',1,'yes',5,'sidebar','no'),
	(7,'Activation','activation','memberactivation',1,'no',6,'sidebar','yes'),
	(11,'Gender','gender','select',1,'yes',4,'sidebar','yes'),
	(9,'Role','role','memberrole',1,'yes',7,'sidebar','yes'),
	(20,'Parent','parent','selectbox_link',3,'no',2,'main','yes'),
	(16,'Content','content','textarea',2,'no',1,'main','yes'),
	(19,'Tag','tag','multilingual',3,'no',0,'main','yes'),
	(21,'Description','description','multilingual',3,'yes',1,'main','yes'),
	(22,'Top nav','top-nav','checkbox',3,'no',3,'sidebar','yes'),
	(23,'Order','order','order_entries',3,'no',4,'main','no'),
	(24,'Passage','passage','input',4,'no',0,'main','yes'),
	(25,'Tags','tags','selectbox_link',4,'yes',1,'main','yes'),
	(26,'Name - Casual','name-casual','multilingual',5,'no',1,'main','yes'),
	(27,'Name- Formal','name-formal','multilingual',5,'no',0,'main','yes'),
	(28,'Description','description','multilingual',5,'no',2,'main','yes'),
	(29,'Address','address','input',5,'no',3,'sidebar','yes'),
	(30,'City','city','input',5,'no',4,'sidebar','yes'),
	(31,'State','state','input',5,'no',5,'sidebar','yes'),
	(32,'Zip','zip','input',5,'no',6,'sidebar','yes'),
	(33,'Name','name','multilingual',6,'no',0,'main','yes'),
	(34,'Description','description','multilingual',6,'no',1,'main','yes'),
	(35,'Date','date','datetime',6,'no',2,'sidebar','yes'),
	(36,'Location','location','selectbox_link',6,'yes',3,'main','yes'),
	(37,'Tags','tags','selectbox_link',5,'yes',7,'sidebar','yes'),
	(38,'Tags','tags','selectbox_link',6,'yes',4,'sidebar','yes'),
	(40,'Content','content','multilingual',7,'no',0,'main','yes'),
	(42,'Tags','tags','selectbox_link',7,'yes',1,'sidebar','yes'),
	(43,'Image','image','uniqueupload',8,'no',1,'main','yes'),
	(44,'Tags','tags','selectbox_link',8,'yes',3,'sidebar','yes'),
	(45,'Position','position','select',8,'no',2,'sidebar','yes'),
	(46,'ID','id','systemid',8,'no',0,'main','yes'),
	(47,'Height','height','input',8,'no',4,'sidebar','yes');

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

LOCK TABLES `sym_fields_checkbox` WRITE;
/*!40000 ALTER TABLE `sym_fields_checkbox` DISABLE KEYS */;

INSERT INTO `sym_fields_checkbox` (`id`, `field_id`, `default_state`, `description`)
VALUES
	(7,22,'off',NULL);

/*!40000 ALTER TABLE `sym_fields_checkbox` ENABLE KEYS */;
UNLOCK TABLES;


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



# Dump of table sym_fields_datetime
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_datetime`;

CREATE TABLE `sym_fields_datetime` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `prepopulate` tinyint(1) DEFAULT '1',
  `time` tinyint(1) DEFAULT '1',
  `range` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_fields_datetime` WRITE;
/*!40000 ALTER TABLE `sym_fields_datetime` DISABLE KEYS */;

INSERT INTO `sym_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `range`)
VALUES
	(9,12,1,0,0),
	(16,35,1,1,1);

/*!40000 ALTER TABLE `sym_fields_datetime` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `sym_fields_input` WRITE;
/*!40000 ALTER TABLE `sym_fields_input` DISABLE KEYS */;

INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`)
VALUES
	(67,14,NULL),
	(43,2,NULL),
	(44,4,NULL),
	(68,24,NULL),
	(85,29,NULL),
	(86,30,NULL),
	(87,31,NULL),
	(88,32,NULL),
	(91,47,'/^-?(?:\\d+(?:\\.\\d+)?|\\.\\d+)$/i');

/*!40000 ALTER TABLE `sym_fields_input` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberactivation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberactivation`;

CREATE TABLE `sym_fields_memberactivation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `code_expiry` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `activation_role_id` int(11) unsigned NOT NULL,
  `deny_login` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_memberactivation` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberactivation` DISABLE KEYS */;

INSERT INTO `sym_fields_memberactivation` (`id`, `field_id`, `code_expiry`, `activation_role_id`, `deny_login`)
VALUES
	(14,7,'3 hours',1,'no');

/*!40000 ALTER TABLE `sym_fields_memberactivation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberemail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberemail`;

CREATE TABLE `sym_fields_memberemail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_memberemail` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberemail` DISABLE KEYS */;

INSERT INTO `sym_fields_memberemail` (`id`, `field_id`)
VALUES
	(14,5);

/*!40000 ALTER TABLE `sym_fields_memberemail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberpassword
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberpassword`;

CREATE TABLE `sym_fields_memberpassword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code_expiry` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_memberpassword` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberpassword` DISABLE KEYS */;

INSERT INTO `sym_fields_memberpassword` (`id`, `field_id`, `length`, `strength`, `salt`, `code_expiry`)
VALUES
	(14,6,8,'good','kv235l2KL@JV#Rkj3v253kv55662f3@$}{','24 hours');

/*!40000 ALTER TABLE `sym_fields_memberpassword` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberrole`;

CREATE TABLE `sym_fields_memberrole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_role` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_memberrole` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberrole` DISABLE KEYS */;

INSERT INTO `sym_fields_memberrole` (`id`, `field_id`, `default_role`)
VALUES
	(14,9,1);

/*!40000 ALTER TABLE `sym_fields_memberrole` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_multilingual
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_multilingual`;

CREATE TABLE `sym_fields_multilingual` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `column_length` int(11) unsigned DEFAULT '75',
  `text_size` enum('single','small','medium','large','huge') DEFAULT 'medium',
  `formatter` varchar(255) DEFAULT NULL,
  `text_validator` varchar(255) DEFAULT NULL,
  `text_length` int(11) unsigned DEFAULT '0',
  `unique_handle` enum('yes','no') DEFAULT 'yes',
  `use_def_lang_vals` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_fields_multilingual` WRITE;
/*!40000 ALTER TABLE `sym_fields_multilingual` DISABLE KEYS */;

INSERT INTO `sym_fields_multilingual` (`id`, `field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`)
VALUES
	(21,19,25,'single','none',NULL,0,'yes','yes'),
	(22,21,25,'single','none',NULL,0,'yes','yes'),
	(53,26,25,'single','none',NULL,0,'yes','yes'),
	(52,27,25,'single','none',NULL,0,'yes','yes'),
	(54,28,25,'medium','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(59,33,25,'single','none',NULL,0,'yes','yes'),
	(60,34,25,'medium','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(63,40,25,'large','markdown_extra_with_smartypants',NULL,0,'yes','yes');

/*!40000 ALTER TABLE `sym_fields_multilingual` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_order_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_order_entries`;

CREATE TABLE `sym_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_fields_order_entries` WRITE;
/*!40000 ALTER TABLE `sym_fields_order_entries` DISABLE KEYS */;

INSERT INTO `sym_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`)
VALUES
	(6,23,'yes','yes');

/*!40000 ALTER TABLE `sym_fields_order_entries` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `sym_fields_select` WRITE;
/*!40000 ALTER TABLE `sym_fields_select` DISABLE KEYS */;

INSERT INTO `sym_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`)
VALUES
	(13,11,'no','no','no','Male, Female',NULL),
	(21,45,'no','no','no','Top left, Top center, Top right, Middle left, Middle center, Middle right, Bottom left, Bottom center, Bottom right',NULL);

/*!40000 ALTER TABLE `sym_fields_select` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `sym_fields_selectbox_link` WRITE;
/*!40000 ALTER TABLE `sym_fields_selectbox_link` DISABLE KEYS */;

INSERT INTO `sym_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`)
VALUES
	(16,20,'yes','yes','19',999),
	(18,25,'yes','yes','21',999),
	(35,36,'no','yes','27',20),
	(30,37,'yes','yes','21',20),
	(36,38,'yes','yes','21',20),
	(38,42,'yes','yes','21',20),
	(49,44,'yes','yes','21',20);

/*!40000 ALTER TABLE `sym_fields_selectbox_link` ENABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_fields_stage` WRITE;
/*!40000 ALTER TABLE `sym_fields_stage` DISABLE KEYS */;

INSERT INTO `sym_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`)
VALUES
	(9,12,1,1,0,0,0,'datetime'),
	(16,35,1,1,1,0,0,'datetime');

/*!40000 ALTER TABLE `sym_fields_stage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_stage_sorting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_stage_sorting`;

CREATE TABLE `sym_fields_stage_sorting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `order` text,
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table sym_fields_subsectionmanager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_subsectionmanager`;

CREATE TABLE `sym_fields_subsectionmanager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `subsection_id` varchar(255) NOT NULL,
  `filter_tags` text,
  `caption` text,
  `droptext` text,
  `included_fields` text,
  `allow_multiple` tinyint(1) DEFAULT '0',
  `show_preview` tinyint(1) DEFAULT '0',
  `lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table sym_fields_systemid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_systemid`;

CREATE TABLE `sym_fields_systemid` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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

LOCK TABLES `sym_fields_textarea` WRITE;
/*!40000 ALTER TABLE `sym_fields_textarea` DISABLE KEYS */;

INSERT INTO `sym_fields_textarea` (`id`, `field_id`, `formatter`, `size`)
VALUES
	(4,16,NULL,15);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table sym_fields_uniqueupload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_uniqueupload`;

CREATE TABLE `sym_fields_uniqueupload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_uniqueupload` WRITE;
/*!40000 ALTER TABLE `sym_fields_uniqueupload` DISABLE KEYS */;

INSERT INTO `sym_fields_uniqueupload` (`id`, `field_id`, `destination`, `validator`)
VALUES
	(12,43,'/workspace/uploads/images/leaderboards','/\\.(?:jpe?g)$/i');

/*!40000 ALTER TABLE `sym_fields_uniqueupload` ENABLE KEYS */;
UNLOCK TABLES;


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



# Dump of table sym_members_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles`;

CREATE TABLE `sym_members_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_members_roles` WRITE;
/*!40000 ALTER TABLE `sym_members_roles` DISABLE KEYS */;

INSERT INTO `sym_members_roles` (`id`, `name`, `handle`)
VALUES
	(1,'Public','public'),
	(2,'Member','member'),
	(3,'Not yet activated','not-yet-activated');

/*!40000 ALTER TABLE `sym_members_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_members_roles_event_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles_event_permissions`;

CREATE TABLE `sym_members_roles_event_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `event` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `level` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`event`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sym_members_roles_forbidden_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles_forbidden_pages`;

CREATE TABLE `sym_members_roles_forbidden_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



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

LOCK TABLES `sym_pages` WRITE;
/*!40000 ALTER TABLE `sym_pages` DISABLE KEYS */;

INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`)
VALUES
	(1,NULL,'Home','home',NULL,'pt1/pt1-handle/pt2/pt3/pt4/pt5/pt6','dynamic_xml_apibibliacom,events_entries_by_tag,events_entries_by_tag_locations,images_entries_by_tag,seo_all_entries,tags_all_entries,text_entries_by_tag,verses_entries_by_tag','language_redirect',1),
	(2,NULL,'Member','member',NULL,'pt1/pt2/pt3/pt4/pt5/pt6',NULL,'members_activate_account,members_create,members_generate_recovery_code,members_regenerate_activation_code,members_reset_password',2);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_pages_types` WRITE;
/*!40000 ALTER TABLE `sym_pages_types` DISABLE KEYS */;

INSERT INTO `sym_pages_types` (`id`, `page_id`, `type`)
VALUES
	(31,1,'index');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sections` WRITE;
/*!40000 ALTER TABLE `sym_sections` DISABLE KEYS */;

INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`)
VALUES
	(1,'Members','members',2,NULL,'asc','no','Members'),
	(2,'SEO','seo',3,NULL,'asc','no','Content'),
	(3,'Tags','tags',1,'23','asc','no','Content'),
	(5,'Locations','locations',5,NULL,'asc','no','Content'),
	(4,'Verses','verses',4,NULL,'asc','no','Content'),
	(6,'Events','events',6,'35','asc','no','Content'),
	(7,'Text','text',7,NULL,'asc','no','Content'),
	(8,'Images','images',8,NULL,'asc','no','Content');

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
  `hide_association` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sections_association` WRITE;
/*!40000 ALTER TABLE `sym_sections_association` DISABLE KEYS */;

INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`)
VALUES
	(16,3,19,3,20,'no'),
	(18,3,21,4,25,'no'),
	(35,5,27,6,36,'no'),
	(30,3,21,5,37,'no'),
	(36,3,21,6,38,'no'),
	(38,3,21,7,42,'no'),
	(49,3,21,8,44,'no');

/*!40000 ALTER TABLE `sym_sections_association` ENABLE KEYS */;
UNLOCK TABLES;


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
	('e0f1b01f74a48ea62ec9530cd0247e32',1322689540,'sym-|a:2:{s:8:\"username\";s:5:\"admin\";s:4:\"pass\";s:40:\"7e523a069053bd727bf980a2eaef2913c8692c1e\";}sym-members|a:0:{}sym-language-redirect|a:2:{s:8:\"language\";s:2:\"en\";s:6:\"region\";s:0:\"\";}');

/*!40000 ALTER TABLE `sym_sessions` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
