
-- 2011-12-02 15:44:31, Kirk Strobeck, http://churchdeploy/symphony/system/extensions/
INSERT INTO `sym_extensions` (`name`, `status`, `version`) VALUES ('db_sync', 'enabled', '0.9.1');
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '28 ';

-- 2011-12-02 15:50:10, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/1/
UPDATE sym_sections SET  `name` = 'Members',  `navigation_group` = 'Content',  `handle` = 'members',  `hidden` = 'no' WHERE  `id` = 1;
UPDATE sym_fields SET  `element_name` = 'first-name',  `label` = 'First name',  `parent_section` = '1',  `location` = 'main',  `required` = 'yes',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '2';
DELETE FROM `sym_fields_input` WHERE `field_id` = '2' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('2', NULL);
UPDATE sym_fields SET  `element_name` = 'last-name',  `label` = 'Last name',  `parent_section` = '1',  `location` = 'main',  `required` = 'yes',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '4';
DELETE FROM `sym_fields_input` WHERE `field_id` = '4' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('4', NULL);
UPDATE sym_fields SET  `element_name` = 'photo',  `label` = 'Photo',  `parent_section` = '1',  `location` = 'sidebar',  `required` = 'no',  `type` = 'uniqueupload',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '50';
DELETE FROM `sym_fields_uniqueupload` WHERE `field_id` = '50' LIMIT 1;
INSERT INTO `sym_fields_uniqueupload` (`field_id`, `destination`, `validator`) VALUES ('50', '/workspace/uploads/members/photos', '/\\.(?:jpe?g)$/i');
UPDATE sym_fields SET  `element_name` = 'email',  `label` = 'Email',  `parent_section` = '1',  `location` = 'sidebar',  `required` = 'no',  `type` = 'memberemail',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '5';
CREATE TABLE IF NOT EXISTS `sym_fields_memberemail` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `field_id` int(11) unsigned NOT NULL,
				  PRIMARY KEY  (`id`),
				  UNIQUE KEY `field_id` (`field_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
DELETE FROM `sym_fields_memberemail` WHERE `field_id` = '5' LIMIT 1;
INSERT INTO `sym_fields_memberemail` (`field_id`) VALUES ('5');
UPDATE sym_fields SET  `element_name` = 'job-title',  `label` = 'Job title',  `parent_section` = '1',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '52';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '52'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('52', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'gender',  `label` = 'Gender',  `parent_section` = '1',  `location` = 'sidebar',  `required` = 'yes',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '11';
DELETE FROM `sym_fields_select` WHERE `field_id` = '11' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('11', 'Male, Female', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '11';
UPDATE sym_fields SET  `element_name` = 'birthday',  `label` = 'Birthday',  `parent_section` = '1',  `location` = 'sidebar',  `required` = 'yes',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '12';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '12' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, `context`) VALUES (12, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '12' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('12', '0', '0', '1');
UPDATE sym_fields SET  `element_name` = 'password',  `label` = 'Password',  `parent_section` = '1',  `location` = 'sidebar',  `required` = 'no',  `type` = 'memberpassword',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '6';
CREATE TABLE IF NOT EXISTS `sym_fields_memberpassword` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `field_id` int(11) unsigned NOT NULL,
				  `length` tinyint(2) NOT NULL,
				  `strength` enum('weak', 'good', 'strong') NOT NULL,
				  `salt` varchar(255) default NULL,
				  `code_expiry` varchar(50) NOT NULL,
				  PRIMARY KEY  (`id`),
				  UNIQUE KEY `field_id` (`field_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
DELETE FROM `sym_fields_memberpassword` WHERE `field_id` = '6' LIMIT 1;
INSERT INTO `sym_fields_memberpassword` (`field_id`, `length`, `strength`, `salt`, `code_expiry`) VALUES ('6', '8', 'good', 'kv235l2KL@JV#Rkj3v253kv55662f3@$}{', '24 hours');
UPDATE sym_fields SET  `element_name` = 'activation',  `label` = 'Activation',  `parent_section` = '1',  `location` = 'sidebar',  `required` = 'no',  `type` = 'memberactivation',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '7';
CREATE TABLE IF NOT EXISTS `sym_fields_memberactivation` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `field_id` int(11) unsigned NOT NULL,
				  `code_expiry` varchar(50) NOT NULL,
				  `activation_role_id` int(11) unsigned NOT NULL,
				  `deny_login` enum('yes','no') NOT NULL default 'yes',
				  PRIMARY KEY  (`id`),
				  UNIQUE KEY `field_id` (`field_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
DELETE FROM `sym_fields_memberactivation` WHERE `field_id` = '7' LIMIT 1;
INSERT INTO `sym_fields_memberactivation` (`field_id`, `code_expiry`, `activation_role_id`, `deny_login`) VALUES ('7', '3 hours', '1', 'no');
UPDATE sym_fields SET  `element_name` = 'role',  `label` = 'Role',  `parent_section` = '1',  `location` = 'sidebar',  `required` = 'yes',  `type` = 'memberrole',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '9';
CREATE TABLE IF NOT EXISTS `sym_fields_memberrole` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `field_id` int(11) unsigned NOT NULL,
				  `default_role` int(11) unsigned NOT NULL,
				  PRIMARY KEY (`id`),
				  UNIQUE KEY `field_id` (`field_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
DELETE FROM `sym_fields_memberrole` WHERE `field_id` = '9' LIMIT 1;
INSERT INTO `sym_fields_memberrole` (`field_id`, `default_role`) VALUES ('9', '1');
UPDATE sym_fields SET  `element_name` = 'about',  `label` = 'About',  `parent_section` = '1',  `location` = 'main',  `required` = 'yes',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '54';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '54'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('54', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '1',  `location` = 'main',  `required` = 'yes',  `type` = 'selectbox_link',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '55';
DELETE FROM `sym_fields_selectbox_link` WHERE `field_id` = '55';
INSERT INTO `sym_fields_selectbox_link` (`field_id`, `related_field_id`, `allow_multiple_selection`, `show_association`, `limit`) VALUES ('55', '21', 'yes', 'yes', '9999');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '55';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('3', '21', '1', '55', 'no');

-- 2011-12-02 15:51:13, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/3/
UPDATE sym_sections SET  `name` = 'Tags',  `navigation_group` = 'Content',  `handle` = 'tags',  `hidden` = 'no' WHERE  `id` = 3;
UPDATE sym_fields SET  `element_name` = 'tag',  `label` = 'Tag',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '19';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '19'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('19', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '21';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '21'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('21', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'parent',  `label` = 'Parent',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'selectbox_link',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '20';
DELETE FROM `sym_fields_selectbox_link` WHERE `field_id` = '20';
INSERT INTO `sym_fields_selectbox_link` (`field_id`, `related_field_id`, `allow_multiple_selection`, `show_association`, `limit`) VALUES ('20', '19', 'yes', 'yes', '9999');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '20';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('3', '19', '3', '20', 'no');
UPDATE sym_fields SET  `element_name` = 'top-nav',  `label` = 'Top nav',  `parent_section` = '3',  `location` = 'sidebar',  `required` = 'no',  `type` = 'checkbox',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '22';
DELETE FROM `sym_fields_checkbox` WHERE `field_id` = '22' LIMIT 1;
INSERT INTO `sym_fields_checkbox` (`field_id`, `default_state`) VALUES ('22', 'off');
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('slug', 'Slug', '3', 'sidebar', 'no', 'input', 'yes', '5');
CREATE TABLE IF NOT EXISTS `sym_entries_data_56` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `handle` varchar(255) default NULL,
				  `value` varchar(255) default NULL,
				  PRIMARY KEY  (`id`),
				  UNIQUE KEY `entry_id` (`entry_id`),
				  KEY `handle` (`handle`),
				  KEY `value` (`value`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_input` WHERE `field_id` = '56' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('56', NULL);

-- 2011-12-02 15:51:27, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/3/saved/
UPDATE sym_sections SET  `name` = 'Tags',  `navigation_group` = 'Content',  `handle` = 'tags',  `hidden` = 'no' WHERE  `id` = 3;
UPDATE sym_fields SET  `element_name` = 'tag',  `label` = 'Tag',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '19';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '19'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('19', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '21';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '21'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('21', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'parent',  `label` = 'Parent',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'selectbox_link',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '20';
DELETE FROM `sym_fields_selectbox_link` WHERE `field_id` = '20';
INSERT INTO `sym_fields_selectbox_link` (`field_id`, `related_field_id`, `allow_multiple_selection`, `show_association`, `limit`) VALUES ('20', '19', 'yes', 'yes', '9999');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '20';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('3', '19', '3', '20', 'no');
UPDATE sym_fields SET  `element_name` = 'top-nav',  `label` = 'Top nav',  `parent_section` = '3',  `location` = 'sidebar',  `required` = 'no',  `type` = 'checkbox',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '22';
DELETE FROM `sym_fields_checkbox` WHERE `field_id` = '22' LIMIT 1;
INSERT INTO `sym_fields_checkbox` (`field_id`, `default_state`) VALUES ('22', 'off');
UPDATE sym_fields SET  `element_name` = 'slug',  `label` = 'Slug',  `parent_section` = '3',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '56';
DELETE FROM `sym_fields_input` WHERE `field_id` = '56' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('56', NULL);

-- 2011-12-02 15:52:13, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/3/saved/
UPDATE sym_sections SET  `name` = 'Tags',  `navigation_group` = 'Content',  `handle` = 'tags',  `hidden` = 'no' WHERE  `id` = 3;
DELETE FROM sym_fields WHERE  `id` = '22';
DELETE FROM sym_fields_checkbox WHERE  `field_id` = '22';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '22';
DROP TABLE `sym_entries_data_22`;
UPDATE sym_fields SET  `element_name` = 'tag',  `label` = 'Tag',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '19';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '19'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('19', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '21';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '21'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('21', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'parent',  `label` = 'Parent',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'selectbox_link',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '20';
DELETE FROM `sym_fields_selectbox_link` WHERE `field_id` = '20';
INSERT INTO `sym_fields_selectbox_link` (`field_id`, `related_field_id`, `allow_multiple_selection`, `show_association`, `limit`) VALUES ('20', '19', 'yes', 'yes', '9999');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '20';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('3', '19', '3', '20', 'no');
UPDATE sym_fields SET  `element_name` = 'slug',  `label` = 'Slug',  `parent_section` = '3',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '4' WHERE  `id` = '56';
DELETE FROM `sym_fields_input` WHERE `field_id` = '56' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('56', NULL);
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('hidden', 'Hidden', '3', 'sidebar', 'no', 'checkbox', 'yes', '5');
CREATE TABLE IF NOT EXISTS `sym_entries_data_57` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `value` enum('yes','no') NOT NULL default 'no',
				  PRIMARY KEY  (`id`),
				  UNIQUE KEY `entry_id` (`entry_id`),
				  KEY `value` (`value`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_checkbox` WHERE `field_id` = '57' LIMIT 1;
INSERT INTO `sym_fields_checkbox` (`field_id`, `default_state`) VALUES ('57', 'off');
