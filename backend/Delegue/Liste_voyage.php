
<?php

    include("../connection.php");

	$conn=ouvrirconnexion();
	$sql=$conn->query("select *from voyage");
	
	$resu=array();
	while($row = $sql->fetchAll()){
		$resu=$row;
	}

    echo json_encode($resu);
?>