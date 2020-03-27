<?php

require_once 'connection.php';
$userid =$_POST['userid'];
$firstname =$_POST['firstname'];
$lastname =$_POST['lastname'];
$gender =$_POST['gender'];
$contact =$_POST['contact'];
$address =$_POST['address'];
$bloodtype =$_POST['bloodtype'];
$username =$_POST['username'];
$password=$_POST['password'];

$query="UPDATE tbluser SET firstname='$firstname',lastname='$lastname',gender='$gender',
contact='$contact',address='$address',bloodtype='$bloodtype',username='$username',password='$password'
WHERE userid='$userid'";

$exeQuery = mysqli_query($con,$query);

if($exeQuery){
    echo(json_encode(array('code'=> 1, 'message'=>'User Modified')));
}else{
    echo(json_encode(array('code'=> 2, 'message'=>'modification failed')));
}



?>