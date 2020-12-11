<?php include "templates/header.php"; ?>
    <head>
      <title>Welcome </title>
   </head>
   
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