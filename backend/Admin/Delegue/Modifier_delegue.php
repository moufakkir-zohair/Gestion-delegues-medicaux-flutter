
<?php

    include("C:/wamp64/www/backend/connection.php");


    $nom=$_POST['nom'];
	$prenom=$_POST['prenom'];
	$email=$_POST['email'];
	$Numero_tele=$_POST['Numero_tele'];
	$password=$_POST['password'];
	$id=$_POST['id'];
	
	
	$conn=ouvrirconnexion();
	$sql= "update delegue set  nom='" . $nom . "',prenom='" . $prenom . "',email='" . $email . "',Numero_tele='" . $Numero_tele . "',password='" . $password . "' where id=$id ";
	if($conn->query($sql)){
		echo json_encode("Success");
	}else{
		echo json_encode("Echec");
	}
	
?>