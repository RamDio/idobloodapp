<?php

require('connection.php');

$makeQuery ="SELECT * FROM user";
$statement=$connection->prepare($makeQuery);

$statement->execute();
$myarray=array();

while ($resultsFrom = $statement ->fetch()){

    array_push(
        $myarray,array(
            "id"=>$resultsFrom['id'],
            "name"=>$resultsFrom['name'],
            "email"=>$resultsFrom['email']
        )
        );
}
echo json_encode($myarray);





?>