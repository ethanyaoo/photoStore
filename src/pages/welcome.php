<?php
	include 'functions.php';

	$pdo = pdo_connect_mysql();

	$stmt = $pdo->query('SELECT * FROM photos ORDER by postingdate DESC');
	$images = $stmt->fetchALL(PDO::FETCH_ASSOC);
?>

<?php include "templates/header.php"; ?>
    <head>
      <title>Welcome </title>
   </head>

	<div class="photo"">
		<?php foreach ($photos as $photo) : ?>
		<?php if (file_exists($photo['path'])): ?>
		<a href="photoinfo.php?id=<?php echo $id;?>">
			Go to Photo
		</a>
		<img src=<?=$photo['filepath']?>" data-id="<?=$photo['photoID']?>" width="300" height="200">
		<span>
			<?=$photo['photoPoster']?>
		</span>
		<?php endif; ?>
		<?php endforeach ?>

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
