
<?php

    include("../connection.php");
    $email=$_POST['email'];
	$conn=ouvrirconnexion();
	$sql=$conn->query("select * from events where delegue=(select id from delegue where email='".$email."')");
	
	$resu=array();
	while($row = $sql->fetchAll()){
		$resu=$row;
		
	}

    echo json_encode($resu);
?>