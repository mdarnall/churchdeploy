<?




//header('Content-Type: text/html; charset=utf-8'); 

$dbc = @mysql_connect ('localhost', 'root', 'root') OR die ('Could not connect to MySQL: ' . mysql_error() );
mysql_select_db ('teachings') OR die ('Could not select the database: ' . mysql_error() );

/*
$query = mysql_query('SELECT * FROM `boom` WHERE `9` = \'1753\'');

while($result = mysql_fetch_array($query))
{
	print_r($result);
}
*/



	
	$content = file_get_contents('http://atheycreek.com/messageMetaData.aspx?id=' . $_GET['a']);
	
	
	//echo $content;
	
	$b = $_GET['a'] + 1;
	
	$redirect = '<html><head><meta http-equiv="REFRESH" content=".25;url=http://churchdeploy/hack/teachings-harvest.php?a=' . $b . '"></HEAD><body>' . $_GET['a'] . '</body></HTML>';
	
	if ( trimmer($content, '<span id="txtChapter" class="text" style="Z-INDEX: 113; LEFT: 88px; POSITION: absolute; TOP: 165px">', '</span>') == 'Verse')
	{
		
		//$sql = "INSERT INTO `boom` (`id`, `9`) VALUES (NULL, '" . $_GET['a'] . "')";

		//mysql_query($sql);
		
		echo $redirect;

	}
	else {
		
		$meta = explode('|', trimmer($content, '<span id="txtMsgInfo" class="text" style="Z-INDEX: 101; LEFT: 16px; POSITION: absolute; TOP: 96px">', '</span>'));
		
		foreach($meta as $obj) {
			$llama[] = trim($obj);
		}
		
		$llama[] =  trimmer($content, 'Teacher:</b></span><span id="txtAuthor" class="text" style="Z-INDEX: 110; LEFT: 88px; POSITION: absolute; TOP: 135px">', '</span><span id="Label2"');
		$llama[] =  trimmer($content, '<b>Book:</b></span><span id="txtBook" class="text" style="Z-INDEX: 106; LEFT: 88px; POSITION: absolute; TOP: 150px">', '</span></form>');
		$llama[] =  trimmer($content, '<span id="txtChapter" class="text" style="Z-INDEX: 113; LEFT: 88px; POSITION: absolute; TOP: 165px">', '</span>');
		$llama[] = trimmer($content, 'Description:</b><br> ', '<br><br></DIV>');
		$llama[] = trimmer($content, 'Keywords:</b><br> ', '<br><br></DIV>');
		
		//print_r($llama);
		
		$sql = 'INSERT INTO `boom` (`id`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`) VALUES (NULL, ';
		
		foreach ($llama as $key => $value) 
		{
			$sql .= "'" . mysql_real_escape_string($value);
			
			if($key < count($llama) - 1)
			{
				$sql .= "', ";
			}
			else {
				$sql .= "', '" . $_GET['a'] . "'";
			}
		}
		
		$sql .= ');';
		
		if( mysql_query($sql) )
		{
			//echo 1;
			
			
		}
		else {
			//echo mysql_error();
		}
	}	
	
	//echo $sql;

/*
	if($_GET['a'] < 1760)
	{
		echo $redirect;	
	}
*/	
	
	if($_GET['a'] < 1800)
	{
		echo $redirect;	
	}




function trimmer($hay, $start, $stop)
{
	$step1 = strpos($hay, $start);
	$step1_strlen = strlen($start);
	
	$step2 = strpos($hay, $stop, $step1);
	
	$blah = str_replace('â€™', '’', trim( substr($hay, $step1 + $step1_strlen, $step2 - $step1 - $step1_strlen) ) );
	
	if( strlen($blah) )
	{
		return $blah;
	}
}


?>