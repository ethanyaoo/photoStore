if (isset($_POST['submit']))
{
	require "../config.php";
	
	try
	{
		$connection = new PDO($dsn, $username, $password, $options);

		$new_user = array(
			"username" => $_POST['username'],
			"password" => $_POST['password'],
			"firstName" => $_POST['firstName'],
			"lastName" => $_POST['lastName'],
			"bio"	   => $_POST['bio']
		);

		$sql = sprintf(
			"INSERT INTO %s (%s) values (%s)",
			"users",
			implode(", ", array_keys($new_user)),
			":" . implode(", :", array_keys($new_user))
			);

		$statement = $connection->prepare($sql);
		$statement->execute($new_user);

	{
	catch(PDOException $error)
	{
		echo $sql . "<br>" . $error->getMessage();
	}
}

<?php include "templates/header.php"; ?>

<h2> Register new account </h2>
	<form method="post">
		<label for="username">
			Username
		</label>
		<input type="text" name="username" id="username">

		<label for="password">
			Password
		</label>
		<input type="text" name="password" id="password">

		<label for="firstName">
			First Name
		</label>
		<input type="text" name="firstName" id="firstName">

		<label for="lastName">
			Last Name
		</label>
		<input type="text" name="lastName" id="lastName">

		<label for="bio">
			Bio
		</label>
		<input type="text" name="bio" id="bio">


		<input type="submit" name="submit" value="Submit">
	</form>
	
	<a href="index.php">
		Return
	</a>


<?php include "templates/footer.php"; ?>
