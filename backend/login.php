<?php

include("connection.php");


$Email=$_POST['Email'];
$Password=$_POST['Password'];

$count=ouvrirconnexion()->query("select count(id) from delegue where email='" . $Email .  "' and password='" . $Password .  "'")->fetch();


if($count[0]==1){
	echo json_encode("Success");
}else{
	echo json_encode("Error");
}


?>