<?php
/*
Insert a new record into a database table using data from the URL
	(connecting to the database with PDO)
The URL would look something like:
  	http://site.com/script.php?title=Hi&body=Hello%20world%20how%20are%20you
*/


if(isset($_GET['title'])){ 
	/* Get data from the form*/
	$title = $_GET['title'];
	$body = $_GET['body'];
	
	/* Connect to database */
	$dsn = 'mysql:dbname=testdb;host=mysql.yourdomain.com';
	$user = 'dbuser';
	$password = 'dbpass';

	/* Create PDO object */
	$pdo = new PDO($dsn, $user, $password);
	$sql = "INSERT INTO blog_posts (title,body) VALUES(?,?)";

	/* prepare the SQL statement and return a PDOStatement object */
	$statement = $pdo->prepare($sql);
	
	/* Execute the SQL with the data */ 	
	if ($statement->execute(array($title,$body))){ // returns true if it worked
		echo "success";		
	} else {
		echo "fail";
		// Debug: show the error message
		//print_r( $statement->errorInfo());
	}
	
} else { // if there's no title in the $_GET array
	echo 'no data';
}

?>