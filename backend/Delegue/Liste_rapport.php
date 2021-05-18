
<?php

    include("../connection.php");

	$conn=ouvrirconnexion();
	$email="zouhirmoufakir1998@gmail.com";
	$sql=$conn->query("select id,Sujet, DATE_FORMAT(Date_creation, '%d-%m-%Y') as Date_creation,path from rapport where delegue=(select id from delegue where email='".$email."')");
	
	$resu=array();
	while($row = $sql->fetchAll()){
		$resu=$row;
	}

    echo json_encode($resu);
?>