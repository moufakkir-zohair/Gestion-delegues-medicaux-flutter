
<?php

    include("C:/wamp64/www/backend/connection.php");


    $Nom_medi=$_POST['Nom_medi'];
	$Date_Exp=$_POST['Date_Exp'];
	$Quantite=$_POST['Quantite'];
	$Prix=$_POST['Prix'];
	$Code=$_POST['Code'];
	$documentation=$_POST['documentation'];

	
	
	$conn=ouvrirconnexion();
	$sql="insert into medicament(Code,Nom_medi,Date_Exp,Quantite,Prix,documentation) values ('" . $Code . "','" . $Nom_medi . "','" . $Date_Exp . "','" . $Quantite . "','" . $Prix . "','" . $documentation . "')";
	if($conn->exec($sql)){
		echo json_encode("Success");
	}else{
		echo json_encode("Echec");
	}
	
?>