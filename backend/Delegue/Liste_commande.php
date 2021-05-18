
<?php

    include("../connection.php");
    $email=$_POST['email'];
	$conn=ouvrirconnexion();
	$sql=$conn->query("select f.id, delegue, adresse ,nom,prenom, DATE_FORMAT(date, '%d-%m-%Y') as date , path from fichecommande f , doctor d where delegue=(select id from delegue where email='".$email."') and f.destination=d.id");
	
	$resu=array();
	while($row = $sql->fetchAll()){
		$resu=$row;
	}

    echo json_encode($resu);
?>