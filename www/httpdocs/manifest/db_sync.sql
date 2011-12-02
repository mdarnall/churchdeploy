
-- 2011-12-02 13:44:23, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/edit/3/
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

-- 2011-12-02 13:44:36, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/new/
INSERT INTO `sym_sections` (`name`, `navigation_group`, `handle`, `sortorder`) VALUES ('test', 'Content', 'test', '9');

-- 2011-12-02 13:44:55, Kirk Strobeck, http://churchdeploy/symphony/blueprints/sections/
DELETE FROM sym_sections WHERE  `id` = '9';
UPDATE sym_sections SET `sortorder` = (`sortorder` - 1) WHERE `sortorder` > '9';
DELETE FROM sym_sections_association WHERE  `parent_section_id` = '9';
