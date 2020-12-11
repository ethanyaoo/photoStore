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

		<input type="submit" name="submit" value="Submit">
	</form>
	
	<a href="index.php">
		Return
	</a>


<?php include "templates/footer.php"; ?>
