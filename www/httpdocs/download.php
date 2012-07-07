<?

// force download mp3
$filename = (isset($_REQUEST['file']) ? $_REQUEST['file'] : '');
$filesize = @filesize($filename);
if ($filename == '' || $filesize == 0) exit(0);

header("Content-Description: {$filename}");
header("Content-length: {$filesize}");
header("Content-Disposition: attatchment; filename={$filename}");
readfile($filename);
?>