<?php 



	$user = 'root';
	$pass = '';
	$server = 'localhost';
	$db = 'eco_real_estate';


	$connect = mysqli_connect($server,  $user, $pass, $db);

	if($connect){
		//echo "Conectados";
	}




?>