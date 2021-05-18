<?php

    include("C:/wamp64/www/backend/connection.php");

	$id=$_POST['id'];
	
	
	$conn=ouvrirconnexion();
	$sql="delete from delegue where id='".$id."'";
	if($conn->exec($sql)){
		echo json_encode("Success");
	}else{
		echo json_encode("Echec");
	}
	
?>