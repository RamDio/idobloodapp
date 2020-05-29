<?php
 include 'connection.php'

 $queryresult=$con->query("SELECT * FROM tbluser WHERE username='yami' ");

 $result=array();

 while($fetchdata=$queryresult->fetch_assoc()){
     $result[] $fetchdata;
 }


 echo json_encode($result);
?>