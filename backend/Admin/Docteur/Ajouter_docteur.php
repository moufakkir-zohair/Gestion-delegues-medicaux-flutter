
<?php

   include("C:/wamp64/www/backend/connection.php");


    $nom=$_POST['nom'];
	$prenom=$_POST['prenom'];
	$email=$_POST['email'];
	$Numero_tele=$_POST['Numero_tele'];
	$specialite=$_POST['specialite'];
	$adresse=$_POST['adresse'];
	
	$conn=ouvrirconnexion();
	$sql="insert into doctor(nom,prenom,email,Numero_tele,specialite,adresse) values ('" . $nom . "','" . $prenom .  "','" . $email .  "','" .$Numero_tele . "','" .$specialite . "','" .$adresse . "')";
	if($conn->exec($sql)){
		echo json_encode("Success");
	}else{
		echo json_encode("Echec");
	}
	
?>