<?php 
include "conn.php";
// REGISTER USER

  
    // $name = mysqli_real_escape_string($connect, $_POST['name']);
    // $email = mysqli_real_escape_string($connect, $_POST['email']);
    // $mobile = mysqli_real_escape_string($connect, $_POST['mobile']);
     $name = isset($_POST['name']) ? $_POST['name'] : '';
     $email = isset($_POST['email']) ? $_POST['email'] : '';
     $mobile = isset($_POST['mobile']) ? $_POST['mobile'] : '';
  
    $query = "INSERT INTO registereduser (name,email,mobile)
  			  VALUES('$name', '$email','$mobile')";
    $results = mysqli_query($connect, $query);
    if($results>0)
    {
        echo "user added successfully";
    }