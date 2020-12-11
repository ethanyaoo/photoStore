<?php
	if(isset($_FILES['image']))
	{
		$errors = array();
		$file_name = $_FILES['image']['name'];
		$file_size = $_FILES['image']['size'];
		$file_tmp = $_FILES['image']['tmp_name'];
		$file_type = $_FILES['image']['type'];
		$file_ext = strtolower(end(explode('.', $_FILES['image']['name'])));

		$extensions = array("jpeg", "jpg", "png");

		if (in_array($file_ext, $extensions) === false)
		{
			$errors[] = "Please choose a JPEG or PNG file";
		}
	}
?>

<?php include "templates/header.php"; ?>

<h2>
	<form action="" method="POST" enctype="multipart/form-data">
		<label for="file">
			Upload an image
		</label>

		<input type="file" name="image" />

		<label for="submit">
			Submit
		</label>
		<input type="submit"/>
	</form>
</h2>

<?php include "templates/footer.php"; ?>
