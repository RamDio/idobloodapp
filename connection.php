<?php

try{
    $connection=new PDO('mysql:host=localhost;dbname=id12357317_idoblood','id12357317_root','00000');
    $connection ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    echo "ayay";
}catch(PDOException $exc){
echo $exc ->getMessage();
die("die too");
}

?>