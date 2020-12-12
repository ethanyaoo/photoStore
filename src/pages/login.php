<?php include "templates/header.php"; ?>
<?php
   if($_SERVER["REQUEST_METHOD"] == "POST") {
       
      
      $myusername = mysqli_real_escape_string($db,$_POST['username']);
      $mypassword = mysqli_real_escape_string($db,$_POST['password']); 
      
      $sql = "SELECT * FROM member WHERE username = '$myusername' and password = '$mypassword'";
      $result = mysqli_query($db,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      
      
      $count = mysqli_num_rows($result);
      
      
		
      if($count == 1) {
         session_register("myusername");
         $_SESSION['login_user'] = $myusername;
         
         header("location: welcome.php");
      }else {
         $error = "Your Login Name or Password is invalid";
      }
   }
?>   
    <head>
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <div>
            <form action="" method="post">
                <input type="text" name="username" placeholder="Username" required/>
                <br/>
                <input type="password" name="password" placeholder="Password" required/>
                <br/>
                <input type="submit" value="Login">
            </form>
        </div>
    </body>

<?php include "templates/footer.php"; ?>
