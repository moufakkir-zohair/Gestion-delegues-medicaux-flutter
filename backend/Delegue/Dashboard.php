
<?php

    include("../connection.php");
	
	$Email=$_POST['Email'];
	
	$conn=ouvrirconnexion();
	$resu=array();
	
	$sql1=$conn->query("select count(*)  from rapport where id=(select id from delegue where email='".$Email."')");
	$resu[0]=$sql1->fetch()['0'];
	
    $sql2=$conn->query("select count(id) as  from FicheCommande where delegue=(select id from delegue where email='".$Email."')");
	$resu[1]=$sql2->fetch()['0'];	
	
	$sql3=$conn->query("select count(id) from voyage where delegue=(select id from delegue where email='".$Email."')");
	$resu[2]=$sql3->fetch()['0'];
	
	$sql4=$conn->query("select count(id) from events where delegue=(select id from delegue where email='".$Email."')");
	$resu[3]=$sql4->fetch()['0'];
	
    echo json_encode($resu);
?>