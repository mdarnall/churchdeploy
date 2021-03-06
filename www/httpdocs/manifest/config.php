<?php
	$settings = array(


		###### ADMIN ######
		'admin' => array(
			'max_upload_size' => '5242880',
		),
		########


		###### SYMPHONY ######
		'symphony' => array(
			'pagination_maximum_rows' => '17',
			'allow_page_subscription' => '1',
			'lang' => 'en',
			'pages_table_nest_children' => 'no',
			'strict_error_handling' => 'yes',
			'session_gc_divisor' => '10',
			'version' => '2.2.5',
			'cookie_prefix' => 'sym-',
		),
		########


		###### LOG ######
		'log' => array(
			'archive' => '1',
			'maxsize' => '102400',
		),
		########


		###### IMAGE ######
		'image' => array(
			'cache' => '1',
			'quality' => '90',
		),
		########


		###### DATABASE ######
		'database' => array(
			'character_set' => 'utf8',
			'character_encoding' => 'utf8',
			'runtime_character_set_alter' => '1',
			'query_caching' => 'on',
			'host' => '127.0.0.1',
			'port' => '3306',
			'user' => 'root',
			'password' => 'root',
			'db' => 'atheycreek',
			'tbl_prefix' => 'sym_',
		),
		########


		###### PUBLIC ######
		'public' => array(
			'display_event_xml_in_source' => 'no',
		),
		########


		###### GENERAL ######
		'general' => array(
			'useragent' => 'Symphony/2.2.5',
			'sitename' => 'Athey Creek Christian Fellowship',
		),
		########


		###### FILE ######
		'file' => array(
			'write_mode' => '0644',
		),
		########


		###### DIRECTORY ######
		'directory' => array(
			'write_mode' => '0755',
		),
		########


		###### REGION ######
		'region' => array(
			'time_format' => 'H:i',
			'date_format' => 'd F Y',
			'datetime_separator' => ' ',
			'timezone' => 'America/Los_Angeles',
		),
		########


		###### MAINTENANCE_MODE ######
		'maintenance_mode' => array(
			'enabled' => 'no',
		),
		########


		###### MEMBERS ######
		'members' => array(
			'cookie-prefix' => 'sym-members',
			'section' => '1',
			'identity' => '5',
		),
		########


		###### LANGUAGE_REDIRECT ######
		'language_redirect' => array(
			'language_codes' => 'en',
		),
		########


		###### EMAIL ######
		'email' => array(
			'default_gateway' => 'sendmail',
		),
		########


		###### EMAIL_SENDMAIL ######
		'email_sendmail' => array(
			'from_name' => 'atheycreek',
			'from_address' => 'noreply@atheycreek.com',
		),
		########


		###### EMAIL_SMTP ######
		'email_smtp' => array(
			'from_name' => 'Symphony',
			'from_address' => 'noreply@atheycreek.com',
			'host' => '127.0.0.1',
			'port' => '25',
			'secure' => 'no',
			'auth' => '0',
			'username' => 'kirkstrobeck',
			'password' => 'c4angeblip4',
		),
		########


		###### MAPTOFRONT ######
		'maptofront' => array(
			'fallback' => 'home',
			'map_sub_to_front' => 'yes',
		),
		########


		###### SEARCH_INDEX ######
		'search_index' => array(
			're-index-per-page' => '20',
			're-index-refresh-rate' => '0.5',
			'get-param-prefix' => null,
			'get-param-keywords' => 'keywords',
			'get-param-per-page' => 'per-page',
			'get-param-sort' => 'sort',
			'get-param-direction' => 'direction',
			'get-param-sections' => 'sections',
			'get-param-page' => 'page',
			'default-sections' => 'downloads,events,events-recurring,tags,teachings,teachings-series,teachings-tags,text',
			'default-per-page' => '10',
			'default-sort' => 'score',
			'default-direction' => 'desc',
			'excerpt-length' => '250',
			'min-word-length' => '1',
			'max-word-length' => '30',
			'stem-words' => 'yes',
			'build-entries' => 'yes',
			'mode' => 'like',
			'log-keywords' => 'yes',
			'indexes' => 'a:9:{i:10;a:3:{s:6:\"fields\";a:3:{i:0;s:4:\"name\";i:1;s:4:\"file\";i:2;s:4:\"tags\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:206;s:2:\"no\";}}i:6;a:3:{s:6:\"fields\";a:8:{i:0;s:4:\"name\";i:1;s:4:\"date\";i:2;s:11:\"description\";i:3;s:8:\"location\";i:4;s:11:\"member-role\";i:5;s:4:\"tags\";i:6;s:4:\"type\";i:7;s:9:\"childcare\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:213;s:2:\"no\";}}i:21;a:3:{s:6:\"fields\";a:10:{i:0;s:4:\"name\";i:1;s:9:\"frequency\";i:2;s:11:\"description\";i:3;s:9:\"locations\";i:4;s:9:\"downloads\";i:5;s:4:\"text\";i:6;s:6:\"verses\";i:7;s:6:\"events\";i:8;s:11:\"member-role\";i:9;s:9:\"childcare\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:214;s:2:\"no\";}}i:5;a:3:{s:6:\"fields\";N;s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:208;s:2:\"no\";}}i:3;a:3:{s:6:\"fields\";a:5:{i:0;s:3:\"tag\";i:1;s:11:\"description\";i:2;s:4:\"slug\";i:3;s:6:\"parent\";i:4;s:5:\"order\";}s:9:\"weighting\";s:1:\"1\";s:7:\"filters\";a:1:{i:57;s:2:\"no\";}}i:13;a:3:{s:6:\"fields\";a:13:{i:0;s:5:\"title\";i:1;s:4:\"slug\";i:2;s:8:\"filename\";i:3;s:10:\"current-id\";i:4;s:11:\"description\";i:5;s:7:\"speaker\";i:6;s:11:\"member-role\";i:7;s:4:\"date\";i:8;s:5:\"video\";i:9;s:3:\"day\";i:10;s:4:\"tags\";i:11;s:8:\"featured\";i:12;s:3:\"seo\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:216;s:2:\"no\";}}i:27;a:3:{s:6:\"fields\";a:3:{i:0;s:5:\"title\";i:1;s:6:\"poster\";i:2;s:9:\"teachings\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:233;s:2:\"no\";}}i:15;a:3:{s:6:\"fields\";a:2:{i:0;s:3:\"tag\";i:1;s:4:\"hide\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:217;s:2:\"no\";}}i:7;a:3:{s:6:\"fields\";a:2:{i:0;s:7:\"content\";i:1;s:4:\"tags\";}s:9:\"weighting\";s:1:\"2\";s:7:\"filters\";a:1:{i:209;s:2:\"no\";}}}',
			'synonyms' => 'a:5:{s:40:\"3ac3d78a847fb9d566efa1f4a473a70e171a7622\";a:2:{s:4:\"word\";s:7:\"2 Peter\";s:8:\"synonyms\";s:36:\"second peter, secondpeter, 2nd peter\";}s:40:\"a7acb6fae59000aeab5e29ebf5dbe669c2044a45\";a:2:{s:4:\"word\";s:10:\"Revelation\";s:8:\"synonyms\";s:75:\"revelations, revelashuns, revelations, revalations, revelation study series\";}s:40:\"165ccd67438b50ac44bbfdf7b5208f9c115f12b2\";a:2:{s:4:\"word\";s:18:\"Women’s ministry\";s:8:\"synonyms\";s:74:\"womens ministry, wemons minisrty, womens ministry, wemons, wemons ministry\";}s:40:\"327c98604f85ba4098058cef24c148397a30208c\";a:2:{s:4:\"word\";s:9:\"teachings\";s:8:\"synonyms\";s:7:\"sermons\";}s:40:\"7bc12421ced5605a68d050d460c7c82fab5b20d8\";a:2:{s:4:\"word\";s:9:\"2nd peter\";s:8:\"synonyms\";s:52:\"2 Peter, second peter, secondpeter, 2Peter, 2ndPeter\";}}',
		),
		########


		###### GLOBALRESOURCELOADER ######
		'globalresourceloader' => array(
			'ds-names' => 'alerts_entries_by_tag,alerts_global,downloads_entries_by_tag,events_3_latest,events_all_entries_filtered,events_all_entries_past_filtered,events_entries_by_tag,events_entries_by_tag_related,events_entries_past_by_tag_related,events_recurring_all_entries_filtered,events_recurring_entries_by_tag,images_entries_by_tag,images_toolkit_all_entries_filtered,layouts_default,layouts_ds_tags_entries_by_tag,locations_ds_events_entries_by_tag,locations_entries_by_tag,misc_all_entries,search,search_suggestions,status_all_entries,tags_all_entries,tags_entries_by_tag,teachings_3_latest,teachings_entries_by_series_filtered,teachings_entries_by_year_filtered,teachings_entry_by_book_filtered,teachings_entry_by_id,teachings_entry_by_tag_filtered,teachings_featured_filtered,teachings_series_entries_filtered,teachings_series_home_filtered,teachings_tags_random_filtered,text_entries_by_tag,twitter_latest_entry,verses_entries_by_tag,xml_apibibliacom,xml_books_of_the_bible',
		),
		########


		###### CACHELITE ######
		'cachelite' => array(
			'lifetime' => '86400',
			'show-comments' => 'no',
			'backend-delegates' => 'no',
		),
		########
	);
