<?

// Speedy server

$a = urldecode($_GET['a']);

if(!strpos($a, ','))
{
	$a .= ',';
}

$files = explode(',', $a);
$expires = 60*60*24*365*20; // seconds, minutes, hours, days, years
$contents = '';
$etag = '';


foreach($files as $file)
{
	$contents .= file_get_contents($file);	
	$fp = fopen($file, "r"); 
	$etag .= md5(serialize(fstat($fp))); 
	fclose($fp);

	
}

if(substr($files[0],-3) == '.js') {
	$mime = 'text/javascript';
} else {
	$mime = mime_content_type($files[0]);
}
/*
header("Pragma: public");
header("Cache-Control: maxage=".$expires);
header('Expires: ' . gmdate('D, d M Y H:i:s', time()+$expires) . ' GMT');
header("Connection: keep-alive");
header("Content-type: ". $mime); 
header('Content-encoding: gzip');
header('Content-Length: '. filesize($files[0])); 
header('Etag: '.$etag); 
*/


echo $files[0];

echo curl_download($files[0]);
//echo gzencode($contents, 9);



function curl_download($url)
{
	$curl_handle=curl_init();
	curl_setopt($curl_handle,CURLOPT_URL,$url);
	curl_setopt($curl_handle,CURLOPT_CONNECTTIMEOUT,2);
	curl_setopt($curl_handle,CURLOPT_RETURNTRANSFER,1);
	$buffer = curl_exec($curl_handle);
	curl_close($curl_handle);

	return $buffer;
}



?>