<?php

$dir = '/Users/bear/work/picture/';

$files = scandir($dir);

$result = array();
foreach ($files as $index => $file){
  if (!preg_match('/.(jpe?g|gif|png|bmp|tiff?$)$/i', $file)) continue;
  array_push($result, array('fname'=>$file));
}

print json_encode($result, JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT);

?>
