<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	
	<head>
	
		<title></title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		
	</head>
	
	<body>
	
	<?



require_once('../manifest/config.php');

define('DOCROOT', rtrim(realpath(dirname(__FILE__) . '/../'), '/'));
    
require_once(DOCROOT . '/symphony/lib/boot/bundle.php');
require_once(TOOLKIT . '/class.lang.php');
require_once(DOCROOT . '/symphony/lib/toolkit/class.general.php');
require_once(DOCROOT . '/symphony/lib/toolkit/class.lang.php');

Lang::load(LANG . '/lang.%s.php', ($settings['symphony']['lang'] ? $settings['symphony']['lang'] : 'en'));

$connection = mysql_connect($settings['database']['host'], $settings['database']['user'], $settings['database']['password']) or die("ERROR 333937");

mysql_select_db('teachings', $connection);


header('Content-Type: text/html; charset=utf-8'); 

//$dbc = @mysql_connect ('localhost', 'root', 'root') OR die ('Could not connect to MySQL: ' . mysql_error() );
//mysql_select_db ('churchdeploy') OR die ('Could not select the database: ' . mysql_error() );


$query = mysql_query('SELECT * FROM `boom`'); //2011-12-07T00:00:00-08:00

while( $result = mysql_fetch_array($query) )
{
	if($result[7])
	{
		echo $result[7] . '<br>';
	}
}

?>