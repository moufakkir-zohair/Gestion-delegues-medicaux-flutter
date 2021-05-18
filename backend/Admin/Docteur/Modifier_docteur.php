
<?php

    include("C:/wamp64/www/backend/connection.php");

    $nom=$_POST['nom'];
	$prenom=$_POST['prenom'];
	$email=$_POST['email'];
	$Numero_tele=$_POST['Numero_tele'];
	$specialite=$_POST['specialite'];
	$adresse=$_POST['adresse'];
	$id=$_POST['id'];
	
	
	$conn=ouvrirconnexion();
	$sql= "update doctor set  nom='" . $nom . "',prenom='" . $prenom . "',email='" . $email . "',Numero_tele='" . $Numero_tele . "',specialite='" . $specialite. "' ,adresse='" . $adresse. "' where id=$id ";
	if($conn->query($sql)){
		echo json_encode("Success");
	}else{
		echo json_encode("Echec");
	}
	
?>