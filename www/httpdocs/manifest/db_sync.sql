
-- 2011-12-16 16:16:40, Kirk Strobeck, http://churchdeploy/symphony/blueprints/pages/edit/1/
DELETE FROM sym_pages_types WHERE  `page_id` = '1';
INSERT INTO `sym_pages_types` (`page_id`, `type`) VALUES ('1', 'index');
