<?php

$dns='mysql:host=https://idobloodadmin.000webhostapp.com;dbname=id12357317_idoblood';
$user='root';
$pass='00000';

try{
	$db= new PDO($dns,$user,$pass);
	echo 'connected succesfully';
}catch(PDOException $e){
	$error=$e->getMessage();
	echo $error;
}

}