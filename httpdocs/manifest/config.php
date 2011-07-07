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
			'version' => '2.2.1',
			'cookie_prefix' => 'sym-',
			'strict_error_handling' => 'yes',
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


		###### PUBLIC ######
		'public' => array(
			'display_event_xml_in_source' => 'no',
		),
		########


		###### GENERAL ######
		'general' => array(
			'sitename' => 'Athey Creek Christian Fellowship',
			'useragent' => 'Symphony/2.2.1',
		),
		########


		###### REGION ######
		'region' => array(
			'time_format' => 'H:i',
			'date_format' => 'd F Y',
			'timezone' => 'US/Pacific',
			'datetime_separator' => ' ',
		),
		########


		###### SMTP_EMAIL_LIBRARY ######
		'smtp_email_library' => array(
			'host' => null,
			'port' => null,
			'auth' => '0',
			'username' => null,
			'password' => null,
		),
		########


		###### FILE ######
		'file' => array(
			'write_mode' => '0775',
		),
		########


		###### DIRECTORY ######
		'directory' => array(
			'write_mode' => '0775',
		),
		########


		###### MAPTOFRONT ######
		'maptofront' => array(
			'fallback' => 'index',
			'map_sub_to_front' => 'yes',
		),
		########


		###### NEATIFY ######
		'neatify' => array(
			'remove-header' => 'no',
			'remove-footer' => 'no',
			'select-all' => 'no',
			'sort-menus' => 'no',
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
		),
		########
	);

		
    if($_SERVER['HTTP_HOST'] == 'accf')
    {
        $settings['database'] = array(
			'character_set' => 'utf8',
			'character_encoding' => 'utf8',
			'runtime_character_set_alter' => '1',
			'query_caching' => 'default',
			'host' => 'localhost',
			'port' => '3306',
			'user' => 'root',
			'password' => 'root',
			'db' => 'accf',
			'tbl_prefix' => 'sym_',
        );
    }
    else if($_SERVER['HTTP_HOST'] == '72.10.33.203')
    {
        $settings['database'] = array(
    		'driver' => 'mysql',
            'character_set' => 'utf8',
            'character_encoding' => 'utf8',
            'runtime_character_set_alter' => '1',
            'query_caching' => 'default',
            'host' => '72.10.33.203',
            'port' => '3306',
            'user' => 'atheycreek',
            'password' => '1*29T>!ep<u#xPt',
            'db' => 'atheycreek',
            'tbl_prefix' => 'sym_',
        );
    }