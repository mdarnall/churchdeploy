<?


require_once('../manifest/config.php');

define('DOCROOT', rtrim(realpath(dirname(__FILE__) . '/../'), '/'));
    
require_once(DOCROOT . '/symphony/lib/boot/bundle.php');
require_once(TOOLKIT . '/class.lang.php');
require_once(DOCROOT . '/symphony/lib/toolkit/class.general.php');
require_once(DOCROOT . '/symphony/lib/toolkit/class.lang.php');

Lang::load(LANG . '/lang.%s.php', ($settings['symphony']['lang'] ? $settings['symphony']['lang'] : 'en'));

$connection = mysql_connect($settings['database']['host'], $settings['database']['user'], $settings['database']['password']) or die("ERROR 333937");

mysql_select_db($settings['database']['db'], $connection);


//header('Content-Type: text/html; charset=utf-8'); 

//$dbc = @mysql_connect ('localhost', 'root', 'root') OR die ('Could not connect to MySQL: ' . mysql_error() );
//mysql_select_db ('churchdeploy') OR die ('Could not select the database: ' . mysql_error() );


$query = mysql_query('SELECT * FROM `sym_entries_data_102`'); //2011-12-07T00:00:00-08:00

while( $result = mysql_fetch_array($query) )
{
	$value = $result['value'];
		
	//2011-12-07 00:00:00
	$sql = '
		INSERT INTO `sym_entries_data_109` 
		(
			`id`, 
			`entry_id`, 
			`start`, 
			`end`
		)
		VALUES 
		(
			NULL, 
			\'' . $result[1] . '\', 
			\'' . substr($value, 0, 10) . ' 00:00:00\', 
			\'' . substr($value, 0, 10) . ' 00:00:00\'
		);
	';
	
	if( mysql_query($sql))
	{
		echo $value . '<br>';
	}
}

?>