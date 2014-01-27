<?php
/* 
Output a CSV file using data from the database
This example connects with PDO, but you could use datamapper instead if you like
*/
$dsn = 'mysql:dbname=testdb;host=mysql.yourdomain.com';
$user = 'dbuser';
$password = 'dbpass';

//connect
$pdo = new PDO($dsn, $user, $password);
 
// write query
$sql = 'SELECT * FROM blog_posts';
 
// run the query, and get a PDOStatement Object
$statement = $pdo->query($sql); 

//fetch the results
$results = $statement->fetchAll();
 
//iterate through the results

foreach($results as $row){
	echo $row['id']; 
	echo ',';
	echo $row['title']; 
	echo ',';
	echo $row['body'];
	echo "\n";
}
?>