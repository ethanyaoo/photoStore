<!DOCTYPE html>
<?php include "templates/header.php"; ?>

<?php
	session_start();

    if (isset( $_GET["photoID"]))
    {
	echo "<p>ID: " . $_GET["photoID"] . "</p>";
    }

    function thumbs(){
    	$sql = "INSERT INTO thumbsUp (username, photoID) VALUES ($myusername, $myPhotoID)";
    	
    }
    function commenting(){
    	$random_number = intval("0".rand(1,9));//creating random comment ID
    	$sql = "INSERT INTO comment (commentID, photoID, username_commenter, comment) VALUES ($random_number, $myPhotoID, $myusername, comment_message)";
    }
    
    if($_SERVER["REQUEST_METHOD"]=="POST"){
    	$myusername = mysql_real_escape_string($db,$_POST['username']);
        
        $sql = "SELECT username FROM member";
        $result = mysql_query($db,$sql);
        
        $myPhotoID = mysql_real_escape_string($db, $_POST['photoID']);
       
    }
?>

<head>
		<title>PhotoStore</title>
		
    </head>
    <body>
        <h1>Photo Info</h1>
        <div>
			
			<img src="/image/{{posterInfo.filepath}}" width="500" />
      <br />
      <form action="/thumbsUp_photo" method="post">
        
        <button type="submit" onclick = "thumbs()" name="photoID" value={{photoID}}> Thumbs Up</button>
      </form>
      
			<h3>PhotoID {{photoID}}</h3>
			<div>
				<span>Posted By: {{firstName}} {{lastName}}</span>
				<br>
				
			</div>
			
			<br>
			<div>
				<h2>Thumbs Ups</h2>
                
    			<?php 
                $sql="SELECT username FROM thumbUp WHERE photoID = $myPhotoID";
   			    $result=mysql_query($sql);
    			$i=1;
    				while($row=mysql_fetch_assoc($result))
    {
        $name[$i] = $row['username'];
        $i++;
    } 
    //Start table
    echo "<table>";
    echo "<tr><th>Username</th>";

    // Loop through the results from the database
    for ($i = 1; $i <=count($name); $i++) 
    {
    // Show entries
        echo    
            "<tr>
            <td>$name[$i]</td>
            </tr>";

    }

    echo "</table>" 
     ?>
				<table>
					<tr>
						<th> Username </th>
						
					</tr>
					
						<tr>
							<td> {{Thumbs Up usernames}} </td>
                            
							
						</tr>
					
				</table>
			</div>
			<div>
				
			  <form action="/image_detail/addcomment" method="post">
				  <h2>Add Comment</h2>
				  <input type="hidden" name="photoID" value={{photoID}}>
				  <input type="text" name="comment_message" placeholder="write your message here..." required/>
				  <input type="submit" onclick = "commenting()" value="Add">
			  </form>
				
			</div>
			<div>
				<h2>Comments</h2>
                
                <?php 
                $sql="SELECT * FROM comment WHERE photoID = $myPhotoID";
   			    $result=mysql_query($sql);
    			$i=1;
    				while($row=mysql_fetch_assoc($result))
    {
        $name[$i] = $row['username'];
        $message[$i] = $row['comment'];
        $i++;
    } 
    //Start table
    echo "<table>";
    echo "<tr><th>Username</th>";
    echo "<tr><th>Comment</th>";

    // Loop through the results from the database
    for ($i = 1; $i <=count($name); $i++) 
    {
    // Show entries
        echo    
            "<tr>
            <td>$name[$i]</td>
            <td>$message[$i]</td>
            </tr>";

    }

    echo "</table>" 
     ?>
				<table>
					<tr>
						<th> Username </th>
						<th> Comment </th>
					</tr>
					
						<tr>
							<td> {{username_commenter}} </td>
							<td> {{comment}} </td>
						</tr>
					
				</table>
			</div>
		</div>


		<br>
        <a href="/images">Go back</a>
    </body>
<?php include "templates/footer.php"; ?>
