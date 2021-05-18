
<?php

    include("../connection.php");
	

	
	$conn=ouvrirconnexion();
	
	$resu=array();
		
	$Email=$_POST['Email'];
	
	//Admin
	
	$sql1=$conn->query("select count(*)  from doctor");
	$resu[0]=$sql1->fetch()['0'];
	
    $sql2=$conn->query("select count(*) as nbre_delegue from delegue");
	$resu[1]=$sql2->fetch()['0'];	
	
	$sql3=$conn->query("select count(*) as nbre_medicament from medicament");
	$resu[2]=$sql3->fetch()['0'];
	
	//delegue
	
	$sql1=$conn->query("select count(*)  from rapport where id=(select id from delegue where email='".$Email."')");
	$resu[3]=$sql1->fetch()['0'];
	
    $sql2=$conn->query("select count(*) from commande id=(select id from delegue where email='".$Email."')");
	$resu[4]=$sql2->fetch()['0'];	
	
	$sql3=$conn->query("select count(*) from voyage id=(select id from delegue where email='".$Email."')");
	$resu[5]=$sql3->fetch()['0'];
	
	$sql4=$conn->query("select count(*) from events id=(select id from delegue where email='".$Email."')");
	$resu[6]=$sql4->fetch()['0'];
	
	
    echo json_encode($resu);
?>