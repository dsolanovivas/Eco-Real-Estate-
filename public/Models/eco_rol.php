<?php 

	require('../conexion.php');


	$json = array();


	$query_1 = mysqli_prepare($connect,"SELECT id_rol, rol FROM eco_rol");
	mysqli_stmt_execute($query_1);
	mysqli_stmt_store_result($query_1);
	mysqli_stmt_bind_result($query_1, $id_rol, $rol);

	while($row = mysqli_stmt_fetch($query_1)){

		$json[]=array(

			'id_rol'=>$id_rol,
			'rol'=>$rol
		);
	}

	$convert = json_encode($json);

	echo $convert;

	mysqli_close($connect);
?>