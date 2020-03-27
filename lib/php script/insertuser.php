<?php

require_once 'connection.php';
// $userid =$_POST['userid'];
$firstname =$_POST['firstname'];
$lastname =$_POST['lastname'];
$gender =$_POST['gender'];
$contact =$_POST['contact'];
$address =$_POST['address'];
$bloodtype =$_POST['bloodtype'];
$username =$_POST['username'];
$password=$_POST['password'];

$query="INSERT INTO tbluser(firstname,lastname,gender,contact,address,bloodtype,username,password)
VALUES ('$firstname','$lastname','$gender','$contact','$address','$bloodtype','$username','$username','$password')";

$exeQuery = mysqli_query($con,$query);

if($exeQuery){
    echo(json_encode(array('code'=> 1, 'message'=>'User added')));
}else{
    echo(json_encode(array('code'=> 2, 'message'=>'add failed')));
}



?>