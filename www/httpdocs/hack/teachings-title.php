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


$query = mysql_query('SELECT * FROM `sym_entries_data_101`');

while( $result = mysql_fetch_array($query) )
{
	$value = $result['value'];
	
	$temp = strpos($value, '?s');
	
	if( $temp ) {
		
		 $value = substr($value, 0, $temp) . '\'' . substr($value, $temp + 1);
	}
	
	//$value = str_replace("'", '’', $value);
	
	if(substr($value,0,1) == '?')
	{
		$value = substr($value, 1);
	}
	
	$value = ucfirst($value); 
	

	$sql = '
		INSERT INTO `sym_entries_data_108` 
		(
			`id`, 
			`entry_id`, 
			`handle`, 
			`value`, 
			`handle-en`, 
			`value-en`, 
			`word_count-en`, 
			`value_format-en`
		) 
		VALUES 
		(
			NULL, 
			\'' . $result[1] . '\', 
			\'' . Lang::createHandle( $value ) . '\', 
			\'' . mysql_real_escape_string($value) . '\', 
			\'' . Lang::createHandle( $value ) . '\', 
			\'' . mysql_real_escape_string($value) . '\', 
			\'' . (substr_count($value, ' ') + 1) . '\', 
			\'' . mysql_real_escape_string($value) . '\'
		);
	';
	
	if( mysql_query($sql))
	{
		echo $value . '<br>';
	}
}

?>