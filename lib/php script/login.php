<?php

require_once 'connection.php';
$pseudo=$_GET['PSEUDO'];

$query="SELECT * FROM tbluser WHERE username='$pseudo'";

$result = mysqli_query($con,$query);

$array = array();

while ($row = mysqli_fetch_assoc($result)) 
{
    $array[]=$row;
}

echo ($result) ?
json_encode(array("code"=> 1, "result"=>$array)):
json_encode(array("code"=> 0, "message"=>"No data found"));

?>