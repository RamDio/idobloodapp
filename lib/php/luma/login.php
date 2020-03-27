<?php

include 'conn.php';

// $username = $_POST['username'];
// $password = $_POST['password'];
 $name = isset($_POST['name']) ? $_POST['name'] : '';
 $password = isset($_POST['password']) ? $_POST['password'] : '';

$query="SELECT * FROM registereduser WHERE username'".$username."' and password='".$password."'";

$result=$connect->query($query);
$row = $result->fetch_assoc();
if($row)
{
 echo $row['content'];
}
echo "no results founded";

?>