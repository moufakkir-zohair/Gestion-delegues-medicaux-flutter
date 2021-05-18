
<?php

    include("C:/wamp64/www/backend/connection.php");


    $Nom_medi=$_POST['Nom_medi'];
	$Date_Exp=$_POST['Date_Exp'];
	$Quantite=$_POST['Quantite'];
	$Prix=$_POST['Prix'];
	$Code=$_POST['Code'];
	
	
	$conn=ouvrirconnexion();
	$sql= "update medicament set  Nom_medi='" . $Nom_medi . "',Date_Exp='" . $Date_Exp . "',Quantite='" . $Quantite . "',Prix='" . $Prix . "' where Code='" . $Code . "'";
	if($conn->query($sql)){
		echo json_encode("Success");
	}else{
		echo json_encode("Echec");
	}
	
?>