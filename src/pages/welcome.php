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
		<a href="#">
			<img src="<?=$photo['path']?>" alt="<?=$photo['description']?>" data-id="<?=$photo['id']?>" data-title="<?=$image['title']?>" 
				width="300" height="200">
			<span>
				<?=$image['description']?>
			</span>
		</a>
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
