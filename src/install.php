<?php

	require "config.php";

	try
	{
		$connection = new PDO("mysql:host=$host", $username, $password, $options);
		$sql = file_get_contents("../data/photoStore.sql");
		$connectionn->exec($sql);

		echo "Database and tables created";
	}
	catch(PDOException $error)
	{
		echo $sql . "<br>" . $error->getMessage();
	}
?>
