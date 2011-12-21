
-- 2011-12-16 16:16:40, Kirk Strobeck, http://churchdeploy/symphony/blueprints/pages/edit/1/
DELETE FROM sym_pages_types WHERE  `page_id` = '1';
INSERT INTO `sym_pages_types` (`page_id`, `type`) VALUES ('1', 'index');

-- 2011-12-16 18:43:02, Kirk Strobeck, http://churchdeploy/symphony/system/extensions/
CREATE TABLE IF NOT EXISTS `sym_fields_filter` (
				`id` int(11) unsigned NOT NULL auto_increment,
				`field_id` int(11) unsigned NOT NULL,
				`filter_publish` TEXT default '',
				`filter_publish_errors` enum('yes','no') NOT NULL default 'no',
				`filter_datasource` enum('yes','no') NOT NULL default 'no',
				PRIMARY KEY  (`id`),
				KEY `field_id` (`field_id`)
			);
INSERT INTO `sym_extensions` (`name`, `status`, `version`) VALUES ('filterfield', 'enabled', '1.1');
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '30 ';

-- 2011-12-16 19:00:53, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/10/
UPDATE sym_sections SET  `name` = 'Downloads',  `navigation_group` = 'Content',  `handle` = 'downloads',  `hidden` = 'no' WHERE  `id` = 10;
UPDATE sym_fields SET  `element_name` = 'name',  `label` = 'Name',  `parent_section` = '10',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '71';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '71'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('71', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'file',  `label` = 'File',  `parent_section` = '10',  `location` = 'sidebar',  `required` = 'no',  `type` = 'uniqueupload',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '72';
DELETE FROM `sym_fields_uniqueupload` WHERE `field_id` = '72' LIMIT 1;
INSERT INTO `sym_fields_uniqueupload` (`field_id`, `destination`, `validator`) VALUES ('72', '/workspace/uploads/downloads', NULL);
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '10',  `location` = 'main',  `required` = 'yes',  `type` = 'selectbox_link',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '70';
DELETE FROM `sym_fields_selectbox_link` WHERE `field_id` = '70';
INSERT INTO `sym_fields_selectbox_link` (`field_id`, `related_field_id`, `allow_multiple_selection`, `show_association`, `limit`) VALUES ('70', '21', 'yes', 'yes', '9999');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '70';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('3', '21', '10', '70', 'no');
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('filter', 'Filter', '10', 'main', 'no', 'filter', 'no', '3');
CREATE TABLE IF NOT EXISTS `sym_entries_data_118` (
					`id` int(11) unsigned NOT NULL auto_increment,
					`entry_id` int(11) unsigned NOT NULL,
					`value` enum('yes','no') DEFAULT 'yes',
					PRIMARY KEY (`id`),
					KEY `entry_id` (`entry_id`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2011-12-16 19:22:07, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/10/
UPDATE sym_sections SET  `name` = 'Downloads',  `navigation_group` = 'Content',  `handle` = 'downloads',  `hidden` = 'no' WHERE  `id` = 10;
DELETE FROM sym_fields WHERE  `id` = '118';
DELETE FROM sym_fields_filter WHERE  `field_id` = '118';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '118';
DROP TABLE `sym_entries_data_118`;
UPDATE sym_fields SET  `element_name` = 'name',  `label` = 'Name',  `parent_section` = '10',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '71';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '71'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('71', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'file',  `label` = 'File',  `parent_section` = '10',  `location` = 'sidebar',  `required` = 'no',  `type` = 'uniqueupload',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '72';
DELETE FROM `sym_fields_uniqueupload` WHERE `field_id` = '72' LIMIT 1;
INSERT INTO `sym_fields_uniqueupload` (`field_id`, `destination`, `validator`) VALUES ('72', '/workspace/uploads/downloads', NULL);
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '10',  `location` = 'main',  `required` = 'yes',  `type` = 'selectbox_link',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '70';
DELETE FROM `sym_fields_selectbox_link` WHERE `field_id` = '70';
INSERT INTO `sym_fields_selectbox_link` (`field_id`, `related_field_id`, `allow_multiple_selection`, `show_association`, `limit`) VALUES ('70', '21', 'yes', 'yes', '9999');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '70';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('3', '21', '10', '70', 'no');

-- 2011-12-19 02:33:51, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'msg-id',  `label` = 'msg_id',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '99';
DELETE FROM `sym_fields_input` WHERE `field_id` = '99' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('99', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-number',  `label` = 'msg_number',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-title',  `label` = 'msg_title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'msg-date',  `label` = 'msg_date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-chapter',  `label` = 'msg_chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-type',  `label` = 'msg_type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'dayname',  `label` = 'DayName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '105';
DELETE FROM `sym_fields_input` WHERE `field_id` = '105' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('105', NULL);
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'bookname',  `label` = 'BookName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '106';
DELETE FROM `sym_fields_input` WHERE `field_id` = '106' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('106', NULL);
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-description',  `label` = 'msg_description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('keywords', 'Keywords', '13', 'main', 'no', 'textarea', 'yes', '15');
CREATE TABLE IF NOT EXISTS `sym_entries_data_119` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `value` MEDIUMTEXT,
				  `value_formatted` MEDIUMTEXT,
				  PRIMARY KEY  (`id`),
				  UNIQUE KEY `entry_id` (`entry_id`),
				  FULLTEXT KEY `value` (`value`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('119', 'markdown_extra_with_smartypants', '15');

-- 2011-12-19 02:34:14, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'msg-id',  `label` = 'msg_id',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '99';
DELETE FROM `sym_fields_input` WHERE `field_id` = '99' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('99', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-number',  `label` = 'msg_number',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-title',  `label` = 'msg_title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'msg-date',  `label` = 'msg_date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-chapter',  `label` = 'msg_chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-type',  `label` = 'msg_type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'dayname',  `label` = 'DayName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '105';
DELETE FROM `sym_fields_input` WHERE `field_id` = '105' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('105', NULL);
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'bookname',  `label` = 'BookName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '106';
DELETE FROM `sym_fields_input` WHERE `field_id` = '106' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('106', NULL);
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-description',  `label` = 'msg_description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '119';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('119', 'markdown_extra_with_smartypants', '15');

-- 2011-12-19 02:55:33, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'msg-id',  `label` = 'msg_id',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '99';
DELETE FROM `sym_fields_input` WHERE `field_id` = '99' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('99', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-number',  `label` = 'msg_number',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-title',  `label` = 'msg_title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'msg-date',  `label` = 'msg_date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-chapter',  `label` = 'msg_chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-type',  `label` = 'msg_type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'dayname',  `label` = 'DayName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '105';
DELETE FROM `sym_fields_input` WHERE `field_id` = '105' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('105', NULL);
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'bookname',  `label` = 'BookName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '106';
DELETE FROM `sym_fields_input` WHERE `field_id` = '106' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('106', NULL);
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-description',  `label` = 'msg_description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '119';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('119', 'markdown_extra_with_smartypants', '15');
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('keywords2', 'Keywords2', '13', 'main', 'no', 'taglist', 'yes', '16');
CREATE TABLE IF NOT EXISTS `sym_entries_data_120` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `handle` varchar(255) default NULL,
				  `value` varchar(255) default NULL,
				  PRIMARY KEY  (`id`),
				  KEY `entry_id` (`entry_id`),
				  KEY `handle` (`handle`),
				  KEY `value` (`value`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('120', 'existing', NULL);

-- 2011-12-19 09:11:56, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'msg-id',  `label` = 'msg_id',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '99';
DELETE FROM `sym_fields_input` WHERE `field_id` = '99' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('99', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-number',  `label` = 'msg_number',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-title',  `label` = 'msg_title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'msg-date',  `label` = 'msg_date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-chapter',  `label` = 'msg_chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-type',  `label` = 'msg_type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'dayname',  `label` = 'DayName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '105';
DELETE FROM `sym_fields_input` WHERE `field_id` = '105' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('105', NULL);
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'bookname',  `label` = 'BookName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '106';
DELETE FROM `sym_fields_input` WHERE `field_id` = '106' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('106', NULL);
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-description',  `label` = 'msg_description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '15' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('keywords', 'Keywords', '13', 'main', 'no', 'taglist', 'yes', '16');
CREATE TABLE IF NOT EXISTS `sym_entries_data_119` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `handle` varchar(255) default NULL,
				  `value` varchar(255) default NULL,
				  PRIMARY KEY  (`id`),
				  KEY `entry_id` (`entry_id`),
				  KEY `handle` (`handle`),
				  KEY `value` (`value`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', 'existing', NULL);

-- 2011-12-19 09:19:54, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'msg-id',  `label` = 'msg_id',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '99';
DELETE FROM `sym_fields_input` WHERE `field_id` = '99' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('99', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-number',  `label` = 'msg_number',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-title',  `label` = 'msg_title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'msg-date',  `label` = 'msg_date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-chapter',  `label` = 'msg_chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-type',  `label` = 'msg_type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'dayname',  `label` = 'DayName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '105';
DELETE FROM `sym_fields_input` WHERE `field_id` = '105' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('105', NULL);
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'bookname',  `label` = 'BookName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '106';
DELETE FROM `sym_fields_input` WHERE `field_id` = '106' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('106', NULL);
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-description',  `label` = 'msg_description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '15' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'yes',  `sortorder` = '16' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', 'existing', NULL);
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('speaker', 'Speaker', '13', 'main', 'no', 'input', 'yes', '17');
CREATE TABLE IF NOT EXISTS `sym_entries_data_120` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `handle` varchar(255) default NULL,
				  `value` varchar(255) default NULL,
				  PRIMARY KEY  (`id`),
				  UNIQUE KEY `entry_id` (`entry_id`),
				  KEY `handle` (`handle`),
				  KEY `value` (`value`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);

-- 2011-12-19 09:20:45, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 09:33:07, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 09:33:09, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 09:40:39, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/new/
INSERT INTO `sym_sections` (`name`, `navigation_group`, `handle`, `sortorder`) VALUES ('Sermon tags', 'Content', 'sermon-tags', '13');
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('text', 'Text', '14', 'main', 'no', 'multilingual', 'yes', '0');
CREATE TABLE IF NOT EXISTS `sym_entries_data_121` (
      `id` int(11) unsigned NOT NULL auto_increment,
    	`entry_id` int(11) unsigned NOT NULL,
    	`handle` VARCHAR(255) DEFAULT NULL,
			`value` TEXT DEFAULT NULL,`handle-en` VARCHAR(255) DEFAULT NULL,
    		`value-en` TEXT DEFAULT NULL,
				`word_count-en` INT(11) UNSIGNED DEFAULT NULL,
				`value_format-en` TEXT DEFAULT NULL,PRIMARY KEY (`id`),
			KEY `entry_id` (`entry_id`)
    );
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '121'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('121', '25', 'single', 'none', NULL, '0', 'yes', 'yes');

-- 2011-12-19 09:48:14, Kirk Strobeck, http://churchdeploy/symphony/publish/sermon-tags/
UPDATE sym_sections SET  `entry_order` = '121',  `entry_order_direction` = 'asc' WHERE  `id` = 14;

-- 2011-12-19 09:48:16, Kirk Strobeck, http://churchdeploy/symphony/publish/sermon-tags/
UPDATE sym_sections SET  `entry_order` = '121',  `entry_order_direction` = 'desc' WHERE  `id` = 14;

-- 2011-12-19 09:49:17, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/
DELETE FROM sym_fields WHERE  `id` = '121';
DELETE FROM sym_fields_multilingual WHERE  `field_id` = '121';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '121';
DROP TABLE `sym_entries_data_121`;
DELETE FROM sym_sections WHERE  `id` = '14';
UPDATE sym_sections SET `sortorder` = (`sortorder` - 1) WHERE `sortorder` > '13';
DELETE FROM sym_sections_association WHERE  `parent_section_id` = '14';

-- 2011-12-19 09:53:21, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/new/
INSERT INTO `sym_sections` (`name`, `navigation_group`, `handle`, `sortorder`) VALUES ('Teachings: Tag', 'Content', 'teachings-tag', '13');
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('tag', 'Tag', '15', 'main', 'no', 'input', 'yes', '0');
CREATE TABLE IF NOT EXISTS `sym_entries_data_122` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `handle` varchar(255) default NULL,
				  `value` varchar(255) default NULL,
				  PRIMARY KEY  (`id`),
				  UNIQUE KEY `entry_id` (`entry_id`),
				  KEY `handle` (`handle`),
				  KEY `value` (`value`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_input` WHERE `field_id` = '122' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('122', NULL);

-- 2011-12-19 09:54:44, Kirk Strobeck, http://churchdeploy/symphony/ajax/reorder/blueprints/sections/
UPDATE `sym_sections` SET `sortorder` = '1' WHERE `id` = '10' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '2' WHERE `id` = '6' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '3' WHERE `id` = '8' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '4' WHERE `id` = '5' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '5' WHERE `id` = '1' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '6' WHERE `id` = '3' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '7' WHERE `id` = '13' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '8' WHERE `id` = '15' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '9' WHERE `id` = '7' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '10' WHERE `id` = '4' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '11' WHERE `id` = '11' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '12' WHERE `id` = '9' LIMIT 1;
UPDATE `sym_sections` SET `sortorder` = '13' WHERE `id` = '2' LIMIT 1;

-- 2011-12-19 09:56:24, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '109',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 09:56:25, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 09:56:28, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 09:57:28, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '99',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 09:57:29, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '99',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 09:57:33, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 09:57:36, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 09:57:37, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 09:57:38, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 10:09:53, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'msg-id',  `label` = 'msg_id',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '99';
DELETE FROM `sym_fields_input` WHERE `field_id` = '99' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('99', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-number',  `label` = 'msg_number',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-title',  `label` = 'msg_title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'msg-date',  `label` = 'msg_date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-chapter',  `label` = 'msg_chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-type',  `label` = 'msg_type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'dayname',  `label` = 'DayName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '105';
DELETE FROM `sym_fields_input` WHERE `field_id` = '105' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('105', NULL);
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'bookname',  `label` = 'BookName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '106';
DELETE FROM `sym_fields_input` WHERE `field_id` = '106' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('106', NULL);
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-description',  `label` = 'msg_description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '15' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'yes',  `sortorder` = '16' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);

-- 2011-12-19 10:10:45, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'msg-id',  `label` = 'msg_id',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '99';
DELETE FROM `sym_fields_input` WHERE `field_id` = '99' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('99', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-number',  `label` = 'msg_number',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-title',  `label` = 'msg_title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'msg-date',  `label` = 'msg_date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-chapter',  `label` = 'msg_chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-type',  `label` = 'msg_type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'dayname',  `label` = 'DayName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '105';
DELETE FROM `sym_fields_input` WHERE `field_id` = '105' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('105', NULL);
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'bookname',  `label` = 'BookName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '106';
DELETE FROM `sym_fields_input` WHERE `field_id` = '106' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('106', NULL);
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-description',  `label` = 'msg_description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '15' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'yes',  `sortorder` = '16' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('reference-id', 'Reference ID', '13', 'main', 'no', 'input', 'yes', '18');
CREATE TABLE IF NOT EXISTS `sym_entries_data_123` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `handle` varchar(255) default NULL,
				  `value` varchar(255) default NULL,
				  PRIMARY KEY  (`id`),
				  UNIQUE KEY `entry_id` (`entry_id`),
				  KEY `handle` (`handle`),
				  KEY `value` (`value`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);

-- 2011-12-19 10:14:12, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '123',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 10:14:14, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '123',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 10:14:28, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '123',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 10:14:29, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '123',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 10:17:50, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-id',  `label` = 'msg_id',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '99';
DELETE FROM `sym_fields_input` WHERE `field_id` = '99' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('99', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-number',  `label` = 'msg_number',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-title',  `label` = 'msg_title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'msg-date',  `label` = 'msg_date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-chapter',  `label` = 'msg_chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-type',  `label` = 'msg_type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'dayname',  `label` = 'DayName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '105';
DELETE FROM `sym_fields_input` WHERE `field_id` = '105' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('105', NULL);
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'bookname',  `label` = 'BookName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '106';
DELETE FROM `sym_fields_input` WHERE `field_id` = '106' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('106', NULL);
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-description',  `label` = 'msg_description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '18' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);

-- 2011-12-19 10:18:37, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
DELETE FROM sym_fields WHERE  `id` = '99';
DELETE FROM sym_fields_input WHERE  `field_id` = '99';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '99';
DROP TABLE `sym_entries_data_99`;
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-title',  `label` = 'msg_title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'msg-date',  `label` = 'msg_date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-chapter',  `label` = 'msg_chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-type',  `label` = 'msg_type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'dayname',  `label` = 'DayName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '105';
DELETE FROM `sym_fields_input` WHERE `field_id` = '105' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('105', NULL);
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'bookname',  `label` = 'BookName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '106';
DELETE FROM `sym_fields_input` WHERE `field_id` = '106' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('106', NULL);
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-description',  `label` = 'msg_description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '15' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'yes',  `sortorder` = '16' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);

-- 2011-12-19 10:18:58, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'msg-date',  `label` = 'msg_date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-chapter',  `label` = 'msg_chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'msg-type',  `label` = 'msg_type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'dayname',  `label` = 'DayName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '105';
DELETE FROM `sym_fields_input` WHERE `field_id` = '105' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('105', NULL);
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'bookname',  `label` = 'BookName',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '106';
DELETE FROM `sym_fields_input` WHERE `field_id` = '106' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('106', NULL);
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'msg-description',  `label` = 'msg_description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '15' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'yes',  `sortorder` = '16' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);

-- 2011-12-19 10:23:15, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
DELETE FROM sym_fields WHERE  `id` = '106';
DELETE FROM sym_fields_input WHERE  `field_id` = '106';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '106';
DROP TABLE `sym_entries_data_106`;
DELETE FROM sym_fields WHERE  `id` = '105';
DELETE FROM sym_fields_input WHERE  `field_id` = '105';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '105';
DROP TABLE `sym_entries_data_105`;
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('keywords', 'Keywords', '13', 'sidebar', 'no', 'subsectionmanager', 'yes', '13');
CREATE TABLE IF NOT EXISTS `sym_entries_data_124` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `relation_id` int(11) unsigned DEFAULT NULL,
				  PRIMARY KEY (`id`),
				  KEY `entry_id` (`entry_id`),
				  KEY `relation_id` (`relation_id`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('speaker', 'Speaker', '13', 'main', 'no', 'subsectionmanager', 'yes', '15');
CREATE TABLE IF NOT EXISTS `sym_entries_data_125` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `relation_id` int(11) unsigned DEFAULT NULL,
				  PRIMARY KEY (`id`),
				  KEY `entry_id` (`entry_id`),
				  KEY `relation_id` (`relation_id`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '16' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';

-- 2011-12-19 10:23:33, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '16' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';

-- 2011-12-19 10:23:44, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';

-- 2011-12-19 10:24:07, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';

-- 2011-12-19 10:24:28, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '0' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';

-- 2011-12-19 10:24:28, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '0' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';

-- 2011-12-19 10:33:41, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '0' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';

-- 2011-12-19 10:33:48, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 10:33:50, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 10:34:26, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '0' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';

-- 2011-12-19 10:34:30, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '108',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 10:34:32, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '101',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 10:34:36, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 10:34:40, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 10:35:33, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';

-- 2011-12-19 10:35:57, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '104';
DELETE FROM `sym_fields_input` WHERE `field_id` = '104' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('104', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '17' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';

-- 2011-12-19 10:38:20, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7880/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7880';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '124', '0');

-- 2011-12-19 10:38:58, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7880/saved/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7880';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '124', '0');

-- 2011-12-19 10:40:26, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/new/
INSERT INTO `sym_sections` (`name`, `navigation_group`, `handle`, `sortorder`) VALUES ('Teachings: Type', 'Content', 'teachings-type', '14');
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('type', 'Type', '16', 'main', 'yes', 'multilingual', 'yes', '0');
CREATE TABLE IF NOT EXISTS `sym_entries_data_126` (
      `id` int(11) unsigned NOT NULL auto_increment,
    	`entry_id` int(11) unsigned NOT NULL,
    	`handle` VARCHAR(255) DEFAULT NULL,
			`value` TEXT DEFAULT NULL,`handle-en` VARCHAR(255) DEFAULT NULL,
    		`value-en` TEXT DEFAULT NULL,
				`word_count-en` INT(11) UNSIGNED DEFAULT NULL,
				`value_format-en` TEXT DEFAULT NULL,PRIMARY KEY (`id`),
			KEY `entry_id` (`entry_id`)
    );
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '126'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('126', '25', 'single', 'none', NULL, '0', 'yes', 'yes');

-- 2011-12-19 10:41:35, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
DELETE FROM sym_fields WHERE  `id` = '104';
DELETE FROM sym_fields_input WHERE  `field_id` = '104';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '104';
DROP TABLE `sym_entries_data_104`;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('type', 'Type', '13', 'sidebar', 'no', 'subsectionmanager', 'yes', '7');
CREATE TABLE IF NOT EXISTS `sym_entries_data_127` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `relation_id` int(11) unsigned DEFAULT NULL,
				  PRIMARY KEY (`id`),
				  KEY `entry_id` (`entry_id`),
				  KEY `relation_id` (`relation_id`)
				) ENGINE=MyISAM;
DELETE FROM `sym_fields_stage` WHERE `field_id` = '127' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (127, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '127' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('127', '16', '1', '1', '0', '{$type}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '127';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '127', '16', '127', 'yes');
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '13' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '15' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '16' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '17' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2011-12-19 10:41:56, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7880/saved/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7880';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '127', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '124', '0');

-- 2011-12-19 10:42:27, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7880/saved/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7880';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '127', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '124', '0');

-- 2011-12-19 10:42:45, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '108',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 10:42:46, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '108',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 10:42:55, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '127';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '127' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (127, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '127' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('127', '16', '1', '1', '0', '{$type}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '127';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '127', '16', '127', 'yes');
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '13' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '15' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '16' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '17' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2011-12-19 10:44:00, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '127';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '127' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (127, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '127' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('127', '16', '1', '1', '0', '{$type}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '127';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '127', '16', '127', 'yes');
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '8' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '13' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '15' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '16' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '17' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2011-12-19 10:44:05, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '109',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 10:44:06, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '109',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 10:44:10, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2011-12-19 10:44:11, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2011-12-19 10:44:51, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
DELETE FROM sym_fields WHERE  `id` = '127';
DELETE FROM sym_fields_subsectionmanager WHERE  `field_id` = '127';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '127';
DROP TABLE `sym_entries_data_127`;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '10' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2011-12-19 10:48:30, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7877/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7877';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7877', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7877', '124', '0');

-- 2011-12-19 10:48:48, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '10' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2, Checked 3, Checked 4', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2011-12-19 10:52:33, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7874/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7874';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7874', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7874', '124', '11533,12427,11098,11502,11599,12100,12101,12102,12172,12449');

-- 2011-12-19 10:53:33, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7877/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7877';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7877', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7877', '124', '10439,11533,10673,10759,10882,11010,11015,11016,11694,11863,12140');

-- 2011-12-19 10:53:38, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7877/saved/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7877';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7877', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7877', '124', '10439,11533,10673,10759,10882,11010,11015,11016,11694,11863,12140');

-- 2011-12-19 10:54:12, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7880/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7880';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '124', '10609,10825,11874,11938,11962,12114,12440');

-- 2011-12-19 10:55:05, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Content',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '3' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '7' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '10' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '15' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2, Checked 3, Checked 4', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '16' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
