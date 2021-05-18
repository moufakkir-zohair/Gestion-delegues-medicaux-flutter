
<?php

    include("../connection.php");

    $email=$_POST['email'];
	$resu=array();
     
	
	$conn=ouvrirconnexion();
	
	$sql=$conn->query("select * from delegue where email='".$email."'");
	$resu[0]=$sql->fetchAll();
	
	$sql1=$conn->query("select count(*)  from doctor");
	$resu[1]=$sql1->fetch()['0'];
	
    $sql2=$conn->query("select count(*) as nbre_delegue from delegue");
	$resu[2]=$sql2->fetch()['0'];	
	
	$sql3=$conn->query("select count(*) as nbre_medicament from medicament");
	$resu[3]=$sql3->fetch()['0'];
	
	//delegue
	
	$sql4=$conn->query("select count(id)  from rapport where delegue=(select id from delegue where email='".$email."')");
	$resu[4]=$sql4->fetch()['0'];
	
    $sql5=$conn->query("select count(id)   from FicheCommande where delegue=(select id from delegue where email='".$email."')");
	$resu[5]=$sql5->fetch()['0'];	
	
	$sql6=$conn->query("select count(id) from voyage where delegue=(select id from delegue where email='".$email."')");
	$resu[6]=$sql6->fetch()['0'];
	
	$sql7=$conn->query("select count(id) from events where delegue=(select id from delegue where email='".$email."')");
	$resu[7]=$sql7->fetch()['0'];
	

	

    echo json_encode($resu);
?>