<?php
	require "../config.php";

	if(isset($_FILES['image']))
	{
		$errors = array();
		$file_name = $_FILES['image']['name'];
		$file_tmp = $_FILES['image']['tmp_name'];
		$file_type = $_FILES['image']['type'];
		$file_ext = strtolower(end(explode('.', $_FILES['image']['name'])));

		$extensions = array("jpeg", "jpg", "png");

		if (in_array($file_ext, $extensions) === false)
		{
			$errors[] = "Please choose a JPEG or PNG file";
		}

		if (empty($errors)==true)
		{
			move_uploaded_file($file_tmp, "images/".$file_name);

			$pdo = pdo_connect_mysql();
			$stmt = $pdo->prepare('INSERT INTO photos VALUES (NULL, CURRENT_TIMESTAMP, ?, ?)');
			$stmt->execute([$_POST["images/".$file_name], $_POST['uploaderName']);
			echo "Uploaded";
		}
		else
		{
			print_r($errors);
		}
	}
?>

<?php include "templates/header.php"; ?>

<h2>
	<form action="" method="POST" enctype="multipart/form-data">
		<label for="name">
			Input name
		</label>
		<input type="text" name="uploaderName" id="uploaderName">

		<label for="image">
			Upload an image
		</label>
		<input type="file" name="image" accept="image/*" id="image" />

		<label for="submit">
			Submit
		</label>
		<input type="submit"/>
	</form>
</h2>

<?php include "templates/footer.php"; ?>
