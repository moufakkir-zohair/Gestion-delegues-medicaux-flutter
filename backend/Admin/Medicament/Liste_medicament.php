
<?php

    include("C:/wamp64/www/backend/connection.php");



	$conn=ouvrirconnexion();
	$sql=$conn->query("select Code,Nom_medi,DATE_FORMAT(Date_Exp, '%Y-%m-%d %H:%i') as Date_Exp,Quantite,Prix ,documentation from medicament");
	
	$resu=array();
	while($row = $sql->fetchAll()){
		$resu=$row;
	}

    echo json_encode($resu);
?>