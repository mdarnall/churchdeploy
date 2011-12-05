
-- 2011-12-04 10:54:36, Kirk Strobeck, http://churchdeploy/symphony/blueprints/pages/edit/1/
DELETE FROM sym_pages_types WHERE  `page_id` = '1';
INSERT INTO `sym_pages_types` (`page_id`, `type`) VALUES ('1', 'index');

-- 2011-12-04 16:08:08, Kirk Strobeck, http://churchdeploy/symphony/publish/tags/edit/43/
DELETE FROM `sym_fields_stage_sorting` WHERE `entry_id` = '43';
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('43', '64', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('43', '65', '0');
INSERT INTO `sym_fields_stage_sorting` (`entry_id`, `field_id`, `order`) VALUES ('43', '66', '0');
