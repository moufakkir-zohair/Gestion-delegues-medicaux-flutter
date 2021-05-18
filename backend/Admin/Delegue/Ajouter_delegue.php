
<?php

    include("C:/wamp64/www/backend/connection.php");


    $nom=$_POST['nom'];
	$prenom=$_POST['prenom'];
	$email=$_POST['email'];
	$Numero_tele=$_POST['Numero_tele'];
	$password=$_POST['password'];
	
	
	$conn=ouvrirconnexion();
	$sql="insert into delegue(nom,prenom,email,Numero_tele,password,compte) values ('" . $nom . "','" . $prenom .  "','" . $email .  "','" .$Numero_tele . "','" .$password . "','Delegue')";
	if($conn->exec($sql)){
		echo json_encode("Success");
	}else{
		echo json_encode("Echec");
	}
	
?>