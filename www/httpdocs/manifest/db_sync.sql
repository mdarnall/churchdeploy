
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

-- 2011-12-28 03:28:59, Kirk Strobeck, http://churchdeploy/symphony/system/extensions/
UPDATE sym_extensions SET  `name` = 'configuration',  `status` = 'enabled',  `version` = '1.3.5' WHERE  `id` = '23 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '23 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('23', '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('23', '/system/preferences/', 'Save', '__SavePreferences');
UPDATE sym_extensions SET  `name` = 'xssfilter',  `status` = 'enabled',  `version` = '1.1' WHERE  `id` = '1 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '1 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('1', '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('1', '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('1', '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
UPDATE sym_extensions SET  `name` = 'db_sync',  `status` = 'enabled',  `version` = '0.9.1' WHERE  `id` = '28 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '28 ';
UPDATE sym_extensions SET  `name` = 'datetime',  `status` = 'enabled',  `version` = '2.2.4' WHERE  `id` = '10 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '10 ';
UPDATE sym_extensions SET  `name` = 'debugdevkit',  `status` = 'enabled',  `version` = '1.2.1' WHERE  `id` = '2 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '2 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('2', '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('2', '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
UPDATE sym_extensions SET  `name` = 'export_ensemble',  `status` = 'enabled',  `version` = '1.16' WHERE  `id` = '3 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '3 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('3', '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
UPDATE sym_extensions SET  `name` = 'filterfield',  `status` = 'enabled',  `version` = '1.1' WHERE  `id` = '30 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '30 ';
UPDATE sym_extensions SET  `name` = 'multilingual_field',  `status` = 'enabled',  `version` = '1.4.1' WHERE  `id` = '24 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '24 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('24', '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('24', '/system/preferences/', 'Save', '__SavePreferences');
UPDATE sym_extensions SET  `name` = 'selectbox_link_field',  `status` = 'enabled',  `version` = '1.22' WHERE  `id` = '4 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '4 ';
UPDATE sym_extensions SET  `name` = 'systemidfield',  `status` = 'enabled',  `version` = '1.0.2' WHERE  `id` = '27 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '27 ';
UPDATE sym_extensions SET  `name` = 'uniqueuploadfield',  `status` = 'enabled',  `version` = '1.5' WHERE  `id` = '12 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '12 ';
UPDATE sym_extensions SET  `name` = 'uniqueinputfield',  `status` = 'enabled',  `version` = '1.4' WHERE  `id` = '13 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '13 ';
UPDATE sym_extensions SET  `name` = 'health_check',  `status` = 'enabled',  `version` = '1.4' WHERE  `id` = '26 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '26 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('26', '/backend/', 'InitaliseAdminPageHead', 'initaliseAdminPageHead');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('26', '/backend/', 'DashboardPanelRender', 'render_panel');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('26', '/backend/', 'DashboardPanelOptions', 'dashboard_panel_options');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('26', '/backend/', 'DashboardPanelTypes', 'dashboard_panel_types');
UPDATE sym_extensions SET  `name` = 'html5_doctype',  `status` = 'enabled',  `version` = '1.2.5' WHERE  `id` = '14 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '14 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('14', '/frontend/', 'FrontendOutputPostGenerate', 'parse_html');
UPDATE sym_extensions SET  `name` = 'image_index_preview',  `status` = 'enabled',  `version` = '1.2.1' WHERE  `id` = '15 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '15 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('15', '/backend/', 'AdminPagePreGenerate', '__appendAssets');
UPDATE sym_extensions SET  `name` = 'importcsv',  `status` = 'enabled',  `version` = '0.3' WHERE  `id` = '29 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '29 ';
UPDATE sym_extensions SET  `name` = 'jit_image_manipulation',  `status` = 'enabled',  `version` = '1.14' WHERE  `id` = '5 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '5 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('5', '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('5', '/system/preferences/', 'Save', '__SavePreferences');
UPDATE sym_extensions SET  `name` = 'jquery_date_picker',  `status` = 'enabled',  `version` = '1.3' WHERE  `id` = '16 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '16 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('16', '/backend/', 'InitaliseAdminPageHead', 'initializeAdmin');
UPDATE sym_extensions SET  `name` = 'language_redirect',  `status` = 'enabled',  `version` = '1.0.3' WHERE  `id` = '25 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '25 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('25', '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('25', '/system/preferences/', 'Save', '__SavePreferences');
UPDATE sym_extensions SET  `name` = 'maintenance_mode',  `status` = 'enabled',  `version` = '1.5' WHERE  `id` = '6 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '6 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('6', '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('6', '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('6', '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('6', '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('6', '/blueprints/pages/', 'AppendPageContent', '__appendType');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('6', '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('6', '/frontend/', 'FrontendParamsResolve', '__addParam');
UPDATE sym_extensions SET  `name` = 'massuploadutility',  `status` = 'enabled',  `version` = '0.9.8' WHERE  `id` = '18 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '18 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('18', '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('18', '/system/preferences/', 'CustomActions', 'savePreferences');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('18', '/backend/', 'AdminPagePreGenerate', 'initaliseAdminPageHead');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('18', '/publish/new/', 'EntryPostCreate', 'returnJSON');
UPDATE sym_extensions SET  `name` = 'members',  `status` = 'enabled',  `version` = '1.1.1' WHERE  `id` = '9 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '9 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('9', '/frontend/', 'FrontendPageResolved', 'checkFrontendPagePermissions');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('9', '/frontend/', 'FrontendParamsResolve', 'addMemberDetailsToPageParams');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('9', '/frontend/', 'FrontendProcessEvents', 'appendLoginStatusToEventXML');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('9', '/frontend/', 'EventPreSaveFilter', 'checkEventPermissions');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('9', '/frontend/', 'EventPostSaveFilter', 'processPostSaveFilter');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('9', '/backend/', 'AdminPagePreGenerate', 'appendAssets');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('9', '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('9', '/system/preferences/', 'Save', 'savePreferences');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('9', '/blueprints/events/new/', 'AppendEventFilter', 'appendFilter');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('9', '/blueprints/events/edit/', 'AppendEventFilter', 'appendFilter');
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '19 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('19', '/backend/', 'InitaliseAdminPageHead', 'appendScriptToHead');
UPDATE sym_extensions SET  `name` = 'profiledevkit',  `status` = 'enabled',  `version` = '1.0.4' WHERE  `id` = '7 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '7 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('7', '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('7', '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
UPDATE sym_extensions SET  `name` = 'root_page_params',  `status` = 'enabled',  `version` = '1.2' WHERE  `id` = '20 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '20 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('20', '/frontend/', 'FrontendPrePageResolve', 'addPage');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('20', '/system/preferences/', 'AddCustomPreferenceFieldsets', 'append_preferences');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('20', '/system/preferences/', 'Save', 'save_settings');
UPDATE sym_extensions SET  `name` = 'subsectionmanager',  `status` = 'enabled',  `version` = '1.3.2' WHERE  `id` = '21 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '21 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('21', '/backend/', 'AdminPagePreGenerate', '__appendAssets');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('21', '/publish/new/', 'EntryPostNew', '__saveSortOrder');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('21', '/publish/edit/', 'EntryPostEdit', '__saveSortOrder');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('21', '/backend/', 'AppendPageAlert', '__upgradeMediathek');
UPDATE sym_extensions SET  `name` = 'markdown',  `status` = 'enabled',  `version` = '1.13' WHERE  `id` = '8 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '8 ';
UPDATE sym_extensions SET  `name` = 'tweak_ui',  `status` = 'enabled',  `version` = '0.1.2' WHERE  `id` = '22 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '22 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('22', '/backend/', 'InitaliseAdminPageHead', 'addScriptToHead');

-- 2011-12-28 18:15:05, Kirk Strobeck, http://churchdeploy/symphony/system/extensions/
INSERT INTO `sym_extensions` (`name`, `status`, `version`) VALUES ('xmlimporter', 'enabled', '1.1.0');
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '31 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('31', '/backend/', 'InitaliseAdminPageHead', 'initializeAdmin');

-- 2011-12-28 18:28:34, Kirk Strobeck, http://churchdeploy/symphony/blueprints/pages/edit/1/
DELETE FROM sym_pages_types WHERE  `page_id` = '1';
INSERT INTO `sym_pages_types` (`page_id`, `type`) VALUES ('1', 'index');

-- 2011-12-28 19:03:24, Kirk Strobeck, http://churchdeploy/symphony/blueprints/pages/edit/1/
DELETE FROM sym_pages_types WHERE  `page_id` = '1';
INSERT INTO `sym_pages_types` (`page_id`, `type`) VALUES ('1', 'index');

-- 2012-01-04 21:40:52, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7879/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7879';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7879', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7879', '124', '0');

-- 2012-01-04 21:41:05, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings-tag/
UPDATE sym_sections SET  `entry_order` = '122',  `entry_order_direction` = 'asc' WHERE  `id` = 15;

-- 2012-01-12 11:54:33, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings-tag/
UPDATE sym_sections SET  `entry_order` = '127',  `entry_order_direction` = 'desc' WHERE  `id` = 15;

-- 2012-01-16 13:41:53, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '109',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-16 13:42:22, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/6830/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '6830';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('6830', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('6830', '124', '0');

-- 2012-01-16 13:56:03, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
DELETE FROM sym_fields WHERE  `id` = '102';
DELETE FROM sym_fields_date WHERE  `field_id` = '102';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '102';
DROP TABLE `sym_entries_data_102`;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '6' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '9' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag-old}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '13' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2, Checked 3, Checked 4', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '15' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-01-16 13:58:10, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '109',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-16 13:58:16, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '101',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-16 13:58:17, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '101',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-16 13:58:26, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/6489/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '6489';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('6489', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('6489', '124', '0');

-- 2012-01-16 14:31:13, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
DELETE FROM sym_fields WHERE  `id` = '101';
DELETE FROM sym_fields_input WHERE  `field_id` = '101';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '101';
DROP TABLE `sym_entries_data_101`;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '8' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag-old}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '10' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'status',  `label` = 'Status',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '13' WHERE  `id` = '114';
DELETE FROM `sym_fields_select` WHERE `field_id` = '114' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('114', 'Unconfirmed, Checked 1, Checked 2, Checked 3, Checked 4', 'no', 'yes', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-01-16 14:31:21, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '108',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-16 14:31:22, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '108',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-16 14:31:29, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '111',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-16 14:31:36, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-16 14:31:37, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-16 14:32:57, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7880/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7880';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7880', '124', '10609,10825,11874,11938,11962,12114,12440');

-- 2012-01-16 14:33:22, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
DELETE FROM sym_fields WHERE  `id` = '114';
DELETE FROM sym_fields_select WHERE  `field_id` = '114';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
DROP TABLE `sym_entries_data_114`;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '8' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'keywords',  `label` = 'Keywords',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag-old}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '10' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '13' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-01-16 16:10:45, Kirk Strobeck, http://churchdeploy/symphony/system/extensions/
UPDATE sym_extensions SET  `name` = 'importcsv',  `status` = 'disabled',  `version` = '0.3' WHERE  `id` = '29 ';

-- 2012-01-16 16:10:56, Kirk Strobeck, http://churchdeploy/symphony/system/extensions/
DELETE FROM sym_extensions WHERE  `name` = 'importcsv';

-- 2012-01-16 16:11:02, Kirk Strobeck, http://churchdeploy/symphony/system/extensions/
INSERT INTO `sym_extensions` (`name`, `status`, `version`) VALUES ('importcsv', 'enabled', '0.3');
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '32 ';

-- 2012-01-16 16:17:02, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-16 16:17:03, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-16 16:17:44, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-16 16:17:46, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-16 16:18:52, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '109',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-16 16:18:54, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-16 16:19:03, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '102',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-16 16:19:25, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '123';
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
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, '127:raw');
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

-- 2012-01-16 16:19:32, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '123',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-16 16:19:33, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '123',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-17 08:41:26, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-17 08:41:28, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-17 08:42:05, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
DELETE FROM sym_fields WHERE  `id` = '114';
DELETE FROM sym_fields_select WHERE  `field_id` = '114';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
DROP TABLE `sym_entries_data_114`;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'date-old',  `label` = 'Date - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'date',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '102';
DELETE FROM `sym_fields_date` WHERE `field_id` = '102' LIMIT 1;
INSERT INTO `sym_fields_date` (`field_id`, `pre_populate`) VALUES ('102', 'yes');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '123';
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
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, '127:raw');
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
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '15' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-01-17 08:53:55, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
DELETE FROM sym_fields WHERE  `id` = '102';
DELETE FROM sym_fields_date WHERE  `field_id` = '102';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '102';
DROP TABLE `sym_entries_data_102`;
DELETE FROM sym_fields WHERE  `id` = '114';
DELETE FROM sym_fields_select WHERE  `field_id` = '114';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '114';
DROP TABLE `sym_entries_data_114`;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'title-old',  `label` = 'Title - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '101';
DELETE FROM `sym_fields_input` WHERE `field_id` = '101' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('101', NULL);
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '6' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '9' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, '127:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '13' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '14' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-01-17 08:55:21, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '108',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-17 08:57:33, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '108',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-17 09:05:28, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
DELETE FROM sym_fields WHERE  `id` = '101';
DELETE FROM sym_fields_input WHERE  `field_id` = '101';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '101';
DROP TABLE `sym_entries_data_101`;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description-old',  `label` = 'Description - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'textarea',  `show_column` = 'no',  `sortorder` = '8' WHERE  `id` = '113';
DELETE FROM `sym_fields_textarea` WHERE `field_id` = '113' LIMIT 1;
INSERT INTO `sym_fields_textarea` (`field_id`, `formatter`, `size`) VALUES ('113', 'markdown_extra_with_smartypants', '15');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, '127:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '10' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '13' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-01-17 09:05:57, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-17 09:05:59, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-17 09:08:45, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7744/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7744';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7744', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7744', '124', '0');

-- 2012-01-17 09:09:02, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7747/saved/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7747';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7747', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7747', '124', '0');

-- 2012-01-17 09:10:55, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7747/saved/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7747';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7747', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7747', '124', '0');

-- 2012-01-17 09:47:31, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'asc' WHERE  `id` = 13;

-- 2012-01-17 09:47:32, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/
UPDATE sym_sections SET  `entry_order` = '112',  `entry_order_direction` = 'desc' WHERE  `id` = 13;

-- 2012-01-17 09:48:17, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
DELETE FROM sym_fields WHERE  `id` = '113';
DELETE FROM sym_fields_textarea WHERE  `field_id` = '113';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '113';
DROP TABLE `sym_entries_data_113`;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, '127:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '9' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name}<br /> <em>{$photo}</em>', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-01-17 09:49:42, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, '127:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '9' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name} {$last-name}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-01-17 09:53:01, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, '127:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '9' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name} {$last-name}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-01-17 09:53:20, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7779/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7779';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7779', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7779', '124', '0');

-- 2012-01-17 09:55:14, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7779/saved/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7779';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7779', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7779', '124', '0');

-- 2012-01-17 09:55:44, Kirk Strobeck, http://churchdeploy/symphony/publish/teachings/edit/7779/saved/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '7779';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7779', '125', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('7779', '124', '0');

-- 2012-01-17 10:06:21, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, '127:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '9' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '0', '0', '{$first-name} {$last-name}', NULL, NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-01-17 10:06:48, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (124, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, '127:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '9' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name} {$last-name}', NULL, '2,4');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-01-26 16:23:03, Kirk Strobeck, http://churchdeploy/symphony/system/extensions/
CREATE TABLE  `sym_fields_repeating_date` (
					`id` int(11) unsigned NOT NULL auto_increment,
					`field_id` int(11) unsigned NOT NULL,
					`pre_populate` enum('yes','no') NOT NULL default 'no',
					PRIMARY KEY (`id`),
					KEY `field_id` (`field_id`)
				);
INSERT INTO `sym_extensions` (`name`, `status`, `version`) VALUES ('repeating_date_field', 'enabled', '1.1');
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '32 ';

-- 2012-01-26 16:23:37, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/6/
UPDATE sym_sections SET  `name` = 'Events',  `navigation_group` = 'Content',  `handle` = 'events',  `hidden` = 'no' WHERE  `id` = 6;
UPDATE sym_fields SET  `element_name` = 'name',  `label` = 'Name',  `parent_section` = '6',  `location` = 'main',  `required` = 'yes',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '33';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '33'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('33', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '6',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '34';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '34'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('34', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '35';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '35' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (35, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '35' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('35', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'location',  `label` = 'Location',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'selectbox_link',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '36';
DELETE FROM `sym_fields_selectbox_link` WHERE `field_id` = '36';
INSERT INTO `sym_fields_selectbox_link` (`field_id`, `related_field_id`, `allow_multiple_selection`, `show_association`, `limit`) VALUES ('36', '27', 'no', 'yes', '9999');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '36';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('5', '27', '6', '36', 'no');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'selectbox_link',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '38';
DELETE FROM `sym_fields_selectbox_link` WHERE `field_id` = '38';
INSERT INTO `sym_fields_selectbox_link` (`field_id`, `related_field_id`, `allow_multiple_selection`, `show_association`, `limit`) VALUES ('38', '21', 'yes', 'yes', '9999');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '38';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('3', '21', '6', '38', 'no');
UPDATE sym_fields SET  `element_name` = 'members',  `label` = 'Members',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '130';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '130' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (130, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '130' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('130', '1', '1', '1', '0', '{$first-name} {$last-name}', NULL, '0', '2,4,50,5,52,52:raw,11,12,9,9:permissions,54,55,58,129');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '130';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('6', '130', '1', '130', 'yes');
INSERT INTO `sym_fields` (`element_name`, `label`, `parent_section`, `location`, `required`, `type`, `show_column`, `sortorder`) VALUES ('recurring', 'Recurring', '6', 'main', 'no', 'repeating_date', 'yes', '6');
CREATE TABLE IF NOT EXISTS `sym_entries_data_131` (
					`id` int(11) unsigned NOT NULL auto_increment,
					`entry_id` int(11) unsigned NOT NULL,
					`link_id` bigint(20) unsigned NOT NULL,
					`start` int(11) default NULL,
					`end` int(11) default NULL,
					`units` int(11) unsigned NOT NULL default 1,
					`mode` enum(
						'days',
						'weeks',
						'months-by-date',
						'months-by-weekday',
						'years-by-date',
						'years-by-weekday'
					) NOT NULL default 'days',
					PRIMARY KEY (`id`),
					KEY `entry_id` (`entry_id`),
					KEY `link_id` (`link_id`),
					KEY `start` (`start`),
					KEY `end` (`end`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `sym_entries_data_131_dates` (
					`id` int(11) NOT NULL auto_increment,
					`link_id` bigint(20) default NULL,
					`value` int(11) NOT NULL default '0',
					PRIMARY KEY  USING BTREE (`id`),
					KEY `link_id` (`link_id`),
					KEY `value` (`value`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DELETE FROM `sym_fields_repeating_date` WHERE `field_id` = '131' LIMIT 1;
INSERT INTO `sym_fields_repeating_date` (`field_id`, `pre_populate`) VALUES ('131', 'yes');

-- 2012-01-26 16:23:57, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/6/saved/
UPDATE sym_sections SET  `name` = 'Events',  `navigation_group` = 'Content',  `handle` = 'events',  `hidden` = 'no' WHERE  `id` = 6;
DELETE FROM sym_fields WHERE  `id` = '131';
DELETE FROM sym_fields_repeating_date WHERE  `field_id` = '131';
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '131';
DROP TABLE `sym_entries_data_131`;
UPDATE sym_fields SET  `element_name` = 'name',  `label` = 'Name',  `parent_section` = '6',  `location` = 'main',  `required` = 'yes',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '33';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '33'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('33', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '6',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '34';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '34'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('34', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '35';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '35' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (35, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '35' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('35', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'location',  `label` = 'Location',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'selectbox_link',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '36';
DELETE FROM `sym_fields_selectbox_link` WHERE `field_id` = '36';
INSERT INTO `sym_fields_selectbox_link` (`field_id`, `related_field_id`, `allow_multiple_selection`, `show_association`, `limit`) VALUES ('36', '27', 'no', 'yes', '9999');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '36';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('5', '27', '6', '36', 'no');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'selectbox_link',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '38';
DELETE FROM `sym_fields_selectbox_link` WHERE `field_id` = '38';
INSERT INTO `sym_fields_selectbox_link` (`field_id`, `related_field_id`, `allow_multiple_selection`, `show_association`, `limit`) VALUES ('38', '21', 'yes', 'yes', '9999');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '38';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('3', '21', '6', '38', 'no');
UPDATE sym_fields SET  `element_name` = 'members',  `label` = 'Members',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '130';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '130' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (130, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '130' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('130', '1', '1', '1', '0', '{$first-name} {$last-name}', NULL, '0', '2,4,50,5,52,52:raw,11,12,9,9:permissions,54,55,58,129');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '130';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('6', '130', '1', '130', 'yes');

-- 2012-03-06 15:15:28, Kirk Strobeck, http://churchdeploy/symphony/system/extensions/
UPDATE sym_extensions SET  `name` = 'subsectionmanager',  `status` = 'enabled',  `version` = '2.1.2' WHERE  `id` = '21 ';
DELETE FROM sym_extensions_delegates WHERE  `extension_id` = '21 ';
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('21', '/backend/', 'AdminPagePreGenerate', '__appendAssets');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('21', '/blueprints/datasources/', 'DatasourcePostCreate', '__clearSubsectionCache');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('21', '/blueprints/datasources/', 'DatasourcePostEdit', '__clearSubsectionCache');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('21', '/blueprints/datasources/', 'DatasourcePreDelete', '__clearSubsectionCache');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('21', '/publish/', 'Delete', '__deleteTabs');
INSERT INTO `sym_extensions_delegates` (`extension_id`, `page`, `delegate`, `callback`) VALUES ('21', '/backend/', 'AppendPageAlert', '__upgradeMediathek');

-- 2012-03-06 15:15:54, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/3/
UPDATE sym_sections SET  `name` = 'Tags',  `navigation_group` = 'Content',  `handle` = 'tags',  `hidden` = 'no' WHERE  `id` = 3;
UPDATE sym_fields SET  `element_name` = 'tag',  `label` = 'Tag',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '19';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '19'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('19', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'no',  `sortorder` = '1' WHERE  `id` = '21';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '21'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('21', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'slug',  `label` = 'Slug',  `parent_section` = '3',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '56';
DELETE FROM `sym_fields_input` WHERE `field_id` = '56' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('56', NULL);
UPDATE sym_fields SET  `element_name` = 'layout',  `label` = 'Layout',  `parent_section` = '3',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '140';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '140' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (140, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '140' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('140', '11', '1', '1', '0', '{$name}', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '140';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('3', '140', '11', '140', 'yes');
UPDATE sym_fields SET  `element_name` = 'parent',  `label` = 'Parent',  `parent_section` = '3',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '141';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '141' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (141, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '141' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('141', '3', '1', '1', '0', '{$tag} ({$description})', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '141';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('3', '141', '3', '141', 'yes');
UPDATE sym_fields SET  `element_name` = 'hidden',  `label` = 'Hidden',  `parent_section` = '3',  `location` = 'sidebar',  `required` = 'no',  `type` = 'checkbox',  `show_column` = 'no',  `sortorder` = '6' WHERE  `id` = '57';
DELETE FROM `sym_fields_checkbox` WHERE `field_id` = '57' LIMIT 1;
INSERT INTO `sym_fields_checkbox` (`field_id`, `default_state`) VALUES ('57', 'off');
UPDATE sym_fields SET  `element_name` = 'hide-from-header',  `label` = 'Hide from header',  `parent_section` = '3',  `location` = 'sidebar',  `required` = 'no',  `type` = 'checkbox',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '168';
DELETE FROM `sym_fields_checkbox` WHERE `field_id` = '168' LIMIT 1;
INSERT INTO `sym_fields_checkbox` (`field_id`, `default_state`) VALUES ('168', 'off');
UPDATE sym_fields SET  `element_name` = 'hide-from-footer',  `label` = 'Hide from footer',  `parent_section` = '3',  `location` = 'sidebar',  `required` = 'no',  `type` = 'checkbox',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '167';
DELETE FROM `sym_fields_checkbox` WHERE `field_id` = '167' LIMIT 1;
INSERT INTO `sym_fields_checkbox` (`field_id`, `default_state`) VALUES ('167', 'off');

-- 2012-03-06 15:16:47, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/10/
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
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '10',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '131';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '131' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (131, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '131' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('131', '3', '1', '1', '0', '{$tag} ({$description})', NULL, '1', '19:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '131';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('10', '131', '3', '131', 'yes');

-- 2012-03-06 15:16:56, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/8/
UPDATE sym_sections SET  `name` = 'Images',  `navigation_group` = 'Content',  `handle` = 'images',  `hidden` = 'no' WHERE  `id` = 8;
UPDATE sym_fields SET  `element_name` = 'id',  `label` = 'ID',  `parent_section` = '8',  `location` = 'main',  `required` = 'no',  `type` = 'systemid',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '46';
UPDATE sym_fields SET  `element_name` = 'image',  `label` = 'Image',  `parent_section` = '8',  `location` = 'main',  `required` = 'yes',  `type` = 'uniqueupload',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '43';
DELETE FROM `sym_fields_uniqueupload` WHERE `field_id` = '43' LIMIT 1;
INSERT INTO `sym_fields_uniqueupload` (`field_id`, `destination`, `validator`) VALUES ('43', '/workspace/uploads/images/leaderboards', '/\\.(?:jpe?g)$/i');
UPDATE sym_fields SET  `element_name` = 'caption',  `label` = 'Caption',  `parent_section` = '8',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '59';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '59'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('59', '25', 'small', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'position',  `label` = 'Position',  `parent_section` = '8',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '45';
DELETE FROM `sym_fields_select` WHERE `field_id` = '45' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('45', 'Top left, Top center, Top right, Middle left, Middle center, Middle right, Bottom left, Bottom center, Bottom right', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '45';
UPDATE sym_fields SET  `element_name` = 'height',  `label` = 'Height',  `parent_section` = '8',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '47';
DELETE FROM `sym_fields_input` WHERE `field_id` = '47' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('47', '/^-?(?:\\d+(?:\\.\\d+)?|\\.\\d+)$/i');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '8',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '139';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '139' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (139, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '139' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('139', '3', '1', '1', '0', '{$tag} ({$description})', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '139';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('8', '139', '3', '139', 'yes');

-- 2012-03-06 15:17:08, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/5/
UPDATE sym_sections SET  `name` = 'Locations',  `navigation_group` = 'Content',  `handle` = 'locations',  `hidden` = 'no' WHERE  `id` = 5;
UPDATE sym_fields SET  `element_name` = 'name-formal',  `label` = 'Name - Formal',  `parent_section` = '5',  `location` = 'main',  `required` = 'yes',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '27';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '27'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('27', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'name-casual',  `label` = 'Name - Casual',  `parent_section` = '5',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '26';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '26'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('26', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '5',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '28';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '28'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('28', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'address',  `label` = 'Address',  `parent_section` = '5',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '29';
DELETE FROM `sym_fields_input` WHERE `field_id` = '29' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('29', NULL);
UPDATE sym_fields SET  `element_name` = 'city',  `label` = 'City',  `parent_section` = '5',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '30';
DELETE FROM `sym_fields_input` WHERE `field_id` = '30' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('30', NULL);
UPDATE sym_fields SET  `element_name` = 'state',  `label` = 'State',  `parent_section` = '5',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '31';
DELETE FROM `sym_fields_input` WHERE `field_id` = '31' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('31', NULL);
UPDATE sym_fields SET  `element_name` = 'zip',  `label` = 'Zip',  `parent_section` = '5',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '32';
DELETE FROM `sym_fields_input` WHERE `field_id` = '32' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('32', NULL);
UPDATE sym_fields SET  `element_name` = 'latitude',  `label` = 'Latitude',  `parent_section` = '5',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '117';
DELETE FROM `sym_fields_input` WHERE `field_id` = '117' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('117', '/^-?(?:\\d+(?:\\.\\d+)?|\\.\\d+)$/i');
UPDATE sym_fields SET  `element_name` = 'longitude',  `label` = 'Longitude',  `parent_section` = '5',  `location` = 'sidebar',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '53';
DELETE FROM `sym_fields_input` WHERE `field_id` = '53' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('53', '/^-?(?:\\d+(?:\\.\\d+)?|\\.\\d+)$/i');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '5',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '142';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '142' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (142, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '142' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('142', '3', '1', '1', '0', '{$tag} ({$description})', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '142';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('5', '142', '3', '142', 'yes');

-- 2012-03-06 15:17:30, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/7/
UPDATE sym_sections SET  `name` = 'Text',  `navigation_group` = 'Content',  `handle` = 'text',  `hidden` = 'no' WHERE  `id` = 7;
UPDATE sym_fields SET  `element_name` = 'content',  `label` = 'Content',  `parent_section` = '7',  `location` = 'main',  `required` = 'yes',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '40';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '40'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('40', '25', 'large', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '7',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '148';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '148' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (148, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '148' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('148', '3', '1', '1', '0', '{$tag} ({$description})', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '148';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('7', '148', '3', '148', 'yes');

-- 2012-03-06 15:17:38, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/4/
UPDATE sym_sections SET  `name` = 'Verses',  `navigation_group` = 'Content',  `handle` = 'verses',  `hidden` = 'no' WHERE  `id` = 4;
UPDATE sym_fields SET  `element_name` = 'passage',  `label` = 'Passage',  `parent_section` = '4',  `location` = 'main',  `required` = 'yes',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '24';
DELETE FROM `sym_fields_input` WHERE `field_id` = '24' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('24', NULL);
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '4',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '149';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '149' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (149, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '149' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('149', '3', '1', '1', '0', '{$tag} ({$description})', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '149';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('4', '149', '3', '149', 'yes');

-- 2012-03-06 15:17:52, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/4/saved/
UPDATE sym_sections SET  `name` = 'Verses',  `navigation_group` = 'Content',  `handle` = 'verses',  `hidden` = 'no' WHERE  `id` = 4;
UPDATE sym_fields SET  `element_name` = 'passage',  `label` = 'Passage',  `parent_section` = '4',  `location` = 'main',  `required` = 'yes',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '24';
DELETE FROM `sym_fields_input` WHERE `field_id` = '24' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('24', NULL);
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '4',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '149';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '149' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (149, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '149' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('149', '3', '1', '1', '0', '{$tag} ({$description})', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '149';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('4', '149', '3', '149', 'yes');

-- 2012-03-06 15:27:14, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/4/saved/
UPDATE sym_sections SET  `name` = 'Verses',  `navigation_group` = 'Content',  `handle` = 'verses',  `hidden` = 'no' WHERE  `id` = 4;
UPDATE sym_fields SET  `element_name` = 'passage',  `label` = 'Passage',  `parent_section` = '4',  `location` = 'main',  `required` = 'yes',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '24';
DELETE FROM `sym_fields_input` WHERE `field_id` = '24' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('24', NULL);
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '4',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '149';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '149' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (149, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '149' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('149', '3', '1', '1', '0', '{$tag} ({$description})', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '149';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('4', '149', '3', '149', 'yes');

-- 2012-03-06 15:35:37, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/6/
UPDATE sym_sections SET  `name` = 'Events',  `navigation_group` = 'Events',  `handle` = 'events',  `hidden` = 'no' WHERE  `id` = 6;
UPDATE sym_fields SET  `element_name` = 'name',  `label` = 'Name',  `parent_section` = '6',  `location` = 'main',  `required` = 'yes',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '33';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '33'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('33', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '6',  `location` = 'main',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '35';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '35' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (35, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '35' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('35', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '6',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '34';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '34'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('34', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'location',  `label` = 'Location',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '136';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '136' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (136, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '136' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('136', '5', '0', '1', '0', '{$name-formal}', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '136';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('6', '136', '5', '136', 'yes');
UPDATE sym_fields SET  `element_name` = 'member-role',  `label` = 'Member/Role',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '138';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '138' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (138, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '138' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('138', '18', '1', '1', '0', '{$member} - {$role}', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '138';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('6', '138', '18', '138', 'yes');
UPDATE sym_fields SET  `element_name` = 'members',  `label` = 'Members',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'no',  `sortorder` = '5' WHERE  `id` = '130';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '130' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (130, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '130' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('130', '1', '1', '1', '0', '{$first-name} {$last-name}', NULL, '1', '2,4,50,5,52,52:raw,11,12,9,9:permissions,54,55,58,129');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '130';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('6', '130', '1', '130', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '137';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '137' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (137, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '137' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('137', '3', '1', '1', '0', '{$tag} ({$description})', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '137';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('6', '137', '3', '137', 'yes');
UPDATE sym_fields SET  `element_name` = 'type',  `label` = 'Type',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '145';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '145' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (145, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '145' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('145', '19', '0', '1', '0', '{$type}', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '145';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('6', '145', '19', '145', 'yes');
UPDATE sym_fields SET  `element_name` = 'childcare',  `label` = 'Childcare',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'checkbox',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '154';
DELETE FROM `sym_fields_checkbox` WHERE `field_id` = '154' LIMIT 1;
INSERT INTO `sym_fields_checkbox` (`field_id`, `default_state`) VALUES ('154', 'off');
UPDATE sym_fields SET  `element_name` = 'hidden',  `label` = 'Hidden',  `parent_section` = '6',  `location` = 'sidebar',  `required` = 'no',  `type` = 'checkbox',  `show_column` = 'yes',  `sortorder` = '9' WHERE  `id` = '146';
DELETE FROM `sym_fields_checkbox` WHERE `field_id` = '146' LIMIT 1;
INSERT INTO `sym_fields_checkbox` (`field_id`, `default_state`) VALUES ('146', 'off');

-- 2012-03-06 15:37:32, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'filename',  `label` = 'Filename',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (124, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, '0', '127:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '9' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name} {$last-name}', NULL, '1', '2,4');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');

-- 2012-03-06 15:37:55, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/1/
UPDATE sym_sections SET  `name` = 'Members',  `navigation_group` = 'Members',  `handle` = 'members',  `hidden` = 'no' WHERE  `id` = 1;
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
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('12', '0', '0', '0');
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
UPDATE sym_fields SET  `element_name` = 'about',  `label` = 'About',  `parent_section` = '1',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '54';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '54'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('54', '25', 'small', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '1',  `location` = 'main',  `required` = 'no',  `type` = 'selectbox_link',  `show_column` = 'yes',  `sortorder` = '11' WHERE  `id` = '55';
DELETE FROM `sym_fields_selectbox_link` WHERE `field_id` = '55';
INSERT INTO `sym_fields_selectbox_link` (`field_id`, `related_field_id`, `allow_multiple_selection`, `show_association`, `limit`) VALUES ('55', '21', 'yes', 'yes', '9999');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '55';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('3', '21', '1', '55', 'no');
UPDATE sym_fields SET  `element_name` = 'tags2',  `label` = 'Tags2',  `parent_section` = '1',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '12' WHERE  `id` = '151';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '151' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (151, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '151' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('151', '3', '1', '1', '0', '{$tag} ({$description})', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '151';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('1', '151', '3', '151', 'yes');
UPDATE sym_fields SET  `element_name` = 'phone-number',  `label` = 'Phone number',  `parent_section` = '1',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '14' WHERE  `id` = '129';
DELETE FROM `sym_fields_input` WHERE `field_id` = '129' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('129', NULL);

-- 2012-03-06 15:40:54, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/18/
UPDATE sym_sections SET  `name` = 'Members: Roles',  `navigation_group` = 'Members',  `handle` = 'members-roles',  `hidden` = 'no' WHERE  `id` = 18;
UPDATE sym_fields SET  `element_name` = 'member',  `label` = 'Member',  `parent_section` = '18',  `location` = 'main',  `required` = 'yes',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '135';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '135' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (135, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '135' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('135', '1', '0', '1', '0', '{$first-name} {$last-name}', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '135';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('18', '135', '1', '135', 'yes');
UPDATE sym_fields SET  `element_name` = 'role',  `label` = 'Role',  `parent_section` = '18',  `location` = 'main',  `required` = 'yes',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '134';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '134' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (134, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '134' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('134', '17', '0', '1', '0', '{$role} ({$context})', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '134';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('18', '134', '17', '134', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '18',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '152';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '152' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (152, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '152' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('152', '3', '1', '1', '0', '{$tag} ({$description})', NULL, '1', NULL);
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '152';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('18', '152', '3', '152', 'yes');

-- 2012-03-06 15:41:14, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/11/
UPDATE sym_sections SET  `name` = 'Layouts',  `navigation_group` = 'Structure',  `handle` = 'layouts',  `hidden` = 'no' WHERE  `id` = 11;
UPDATE sym_fields SET  `element_name` = 'name',  `label` = 'Name',  `parent_section` = '11',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '73';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '73'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('73', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'column-full-width',  `label` = 'Column - Full width',  `parent_section` = '11',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '74';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '74' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, destructable, searchable, draggable, `context`) VALUES (74, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '74' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('74', '9', '1', '1', '1', '{$label}', NULL, '1', '115:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '74';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('11', '74', '9', '74', 'yes');
UPDATE sym_fields SET  `element_name` = 'column-center',  `label` = 'Column - Center',  `parent_section` = '11',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '2' WHERE  `id` = '75';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '75' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, destructable, searchable, draggable, `context`) VALUES (75, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '75' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('75', '9', '1', '1', '1', '{$label}', NULL, '1', '115:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '75';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('11', '75', '9', '75', 'yes');
UPDATE sym_fields SET  `element_name` = 'column-right',  `label` = 'Column - Right',  `parent_section` = '11',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '76';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '76' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, destructable, searchable, draggable, `context`) VALUES (76, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '76' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('76', '9', '1', '1', '1', '{$label}', NULL, '1', '115:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '76';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('11', '76', '9', '76', 'yes');

-- 2012-03-06 15:41:57, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/13/saved/
UPDATE sym_sections SET  `name` = 'Teachings',  `navigation_group` = 'Teachings',  `handle` = 'teachings',  `hidden` = 'no' WHERE  `id` = 13;
UPDATE sym_fields SET  `element_name` = 'filename',  `label` = 'Filename',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '0' WHERE  `id` = '100';
DELETE FROM `sym_fields_input` WHERE `field_id` = '100' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('100', NULL);
UPDATE sym_fields SET  `element_name` = 'date',  `label` = 'Date',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'datetime',  `show_column` = 'yes',  `sortorder` = '1' WHERE  `id` = '109';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, draggable, destructable, `context`) VALUES (109, 1, 1, 1, 'datetime');
DELETE FROM `sym_fields_datetime` WHERE `field_id` = '109' LIMIT 1;
INSERT INTO `sym_fields_datetime` (`field_id`, `time`, `range`, `prepopulate`) VALUES ('109', '1', '1', '1');
UPDATE sym_fields SET  `element_name` = 'current-id',  `label` = 'Current ID',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '2' WHERE  `id` = '123';
DELETE FROM `sym_fields_input` WHERE `field_id` = '123' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('123', NULL);
UPDATE sym_fields SET  `element_name` = 'title',  `label` = 'Title',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '3' WHERE  `id` = '108';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '108'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('108', '25', 'single', 'none', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'chapter',  `label` = 'Chapter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'yes',  `sortorder` = '4' WHERE  `id` = '103';
DELETE FROM `sym_fields_input` WHERE `field_id` = '103' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('103', NULL);
UPDATE sym_fields SET  `element_name` = 'day',  `label` = 'Day',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '5' WHERE  `id` = '110';
DELETE FROM `sym_fields_select` WHERE `field_id` = '110' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('110', 'Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '110';
UPDATE sym_fields SET  `element_name` = 'book',  `label` = 'Book',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'select',  `show_column` = 'yes',  `sortorder` = '6' WHERE  `id` = '111';
DELETE FROM `sym_fields_select` WHERE `field_id` = '111' LIMIT 1;
INSERT INTO `sym_fields_select` (`field_id`, `static_options`, `allow_multiple_selection`, `sort_options`, `show_association`) VALUES ('111', 'Genesis, Exodus, Leviticus, Numbers, Deuteronomy, Joshua, Judges, Ruth, 1 Samuel, 2 Samuel, 1 Kings, 2 Kings, 1 Chronicles, 2 Chronicles, Ezra, Nehemiah, Esther, Job, Psalm, Proverbs, Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi, Matthew, Mark, Luke, John, Acts, Romans, 1 Corinthians, 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 Thessalonians, 2 Thessalonians, 1 Timothy, 2 Timothy, Titus, Philemon, Hebrews, James, 1 Peter, 2 Peter, 1 John, 2 John, 3 John, Jude, Revelation', 'no', 'no', 'yes');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '111';
UPDATE sym_fields SET  `element_name` = 'description',  `label` = 'Description',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'multilingual',  `show_column` = 'yes',  `sortorder` = '7' WHERE  `id` = '112';
DELETE FROM
				`sym_fields_multilingual`
			WHERE
				`field_id` = '112'
			LIMIT 1;
INSERT INTO `sym_fields_multilingual` (`field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`) VALUES ('112', '25', 'medium', 'markdown_extra_with_smartypants', NULL, '0', 'yes', 'yes');
UPDATE sym_fields SET  `element_name` = 'tags',  `label` = 'Tags',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '8' WHERE  `id` = '124';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, `context`) VALUES (124, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '124' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('124', '15', '1', '1', '0', '{$tag}', NULL, '1', '127:raw');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '124';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '124', '15', '124', 'yes');
UPDATE sym_fields SET  `element_name` = 'keywords-old',  `label` = 'Keywords - old',  `parent_section` = '13',  `location` = 'sidebar',  `required` = 'no',  `type` = 'taglist',  `show_column` = 'no',  `sortorder` = '9' WHERE  `id` = '119';
DELETE FROM `sym_fields_taglist` WHERE `field_id` = '119' LIMIT 1;
INSERT INTO `sym_fields_taglist` (`field_id`, `pre_populate_source`, `validator`) VALUES ('119', NULL, NULL);
UPDATE sym_fields SET  `element_name` = 'speaker',  `label` = 'Speaker',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'subsectionmanager',  `show_column` = 'yes',  `sortorder` = '10' WHERE  `id` = '125';
DELETE FROM `sym_fields_stage` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_stage` (`field_id`, constructable, destructable, searchable, draggable, `context`) VALUES (125, 1, 1, 1, 1, 'subsectionmanager');
DELETE FROM `sym_fields_subsectionmanager` WHERE `field_id` = '125' LIMIT 1;
INSERT INTO `sym_fields_subsectionmanager` (`field_id`, `subsection_id`, `allow_multiple`, `show_preview`, `lock`, `caption`, `droptext`, `recursion_levels`, `included_fields`) VALUES ('125', '1', '1', '1', '0', '{$first-name} {$last-name}', NULL, '1', '2,4');
DELETE FROM sym_sections_association WHERE  `child_section_field_id` = '125';
INSERT INTO `sym_sections_association` (`parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES ('13', '125', '1', '125', 'yes');
UPDATE sym_fields SET  `element_name` = 'speaker-old',  `label` = 'Speaker - old',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'input',  `show_column` = 'no',  `sortorder` = '11' WHERE  `id` = '120';
DELETE FROM `sym_fields_input` WHERE `field_id` = '120' LIMIT 1;
INSERT INTO `sym_fields_input` (`field_id`, `validator`) VALUES ('120', NULL);
UPDATE sym_fields SET  `element_name` = 'filter',  `label` = 'Filter',  `parent_section` = '13',  `location` = 'main',  `required` = 'no',  `type` = 'filter',  `show_column` = 'no',  `sortorder` = '12' WHERE  `id` = '118';
DELETE FROM `sym_fields_filter` WHERE `field_id` = '118';
INSERT INTO `sym_fields_filter` (`field_id`, `filter_publish`, `filter_publish_errors`, `filter_datasource`) VALUES ('118', NULL, 'no', 'yes');
