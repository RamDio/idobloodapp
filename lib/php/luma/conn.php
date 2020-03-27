<?php
$username="id12357317_root";//change username 
$password="00000"; //change password
$host="localhost";
$db_name="id12357317_idoblood"; //change databasename

$connect=mysqli_connect($host,$username,$password,$db_name);

if(!$connect)
{
	echo json_encode("Connection Failed");
}

?>
