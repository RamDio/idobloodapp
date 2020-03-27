<?php

require_once 'connection.php';
$userid=$_POST['userid'];

$query="DELETE tbluser FROM tbluser WHERE userid='$userid'";
$exeQuery = mysqli_query($con,$query);

if($exeQuery){
    echo(json_encode(array('code'=> 1, 'message'=>'User terminated')));
}else{
    echo(json_encode(array('code'=> 2, 'message'=>'termination failed')));
}



?>

