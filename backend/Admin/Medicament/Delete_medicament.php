<?php

    include("C:/wamp64/www/backend/connection.php");

	$Code=$_POST['Code'];
	
	
	$conn=ouvrirconnexion();
	$sql="delete from medicament where Code='".$Code."'";
	if($conn->exec($sql)){
		echo json_encode("Success");
	}else{
		echo json_encode("Echec");
	}
	
?>