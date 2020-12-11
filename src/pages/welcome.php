<?php

	include "../config.php";

	$query = $db->query("SELECT * FROM images ORDER by uploaded_on DESC");

	if ($query->num_rows > 0)
	{
		while($row = $query->fetch_assoc())
		{
			$imaageURL = 'uploads/'.$row["file_name"];
	?>
		<img src="<?php echo $imageURL; ?>" alt="" />
	<?php }
	}
	else
	{
		?>
		<p>No image(s) found...</p>
<?php } ?>


<?php include "templates/header.php"; ?>
    <head>
      <title>Welcome </title>
   </head>
   
	<img src="<?php echo $imageURL; ?>" alt="" />

   <body>
      <h1>Welcome <?php echo $login_session; ?></h1>
      <ul>
        <li><a href="upload.php">Upload a Photo</a></li>
        <li><a href="group.php">Manage your Groups</a></li>
        <li><a href="subscriptions.php">Manage Subscriptions</a></li>
        <li><a href="index.php">Logout</a></h2>
      
      </ul>
   </body>

<?php include "templates/footer.php"; ?>
