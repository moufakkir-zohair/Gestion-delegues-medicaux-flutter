
<?php

    include("C:/wamp64/www/backend/connection.php");



	$conn=ouvrirconnexion();
	$sql=$conn->query("select *from doctor");
	
	$resu=array();
	while($row = $sql->fetchAll()){
		$resu=$row;
	}

    echo json_encode($resu);
?>