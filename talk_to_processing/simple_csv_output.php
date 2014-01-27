<?php
// Simplest CSV example ever. 
// PHP is creating a CSV file instead of HTML
// You could point your processing script to this URL to get the CSV
echo "123,circle,jane\n";
echo "45,square,joe\n";
echo "230,square,judy\n";

// You could use an array and a loop to create this, too
$stuff = array(
	array(363,'circle','andrew'),
	array(145,'circle','alice'),
	array(38,'square','anne')	
);
foreach ($stuff as $thing){
	echo $thing[0] .','. $thing[1] .','.$thing[2] ."\n";
}
