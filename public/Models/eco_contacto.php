<?php 

	require('../conexion.php');

	$seleccion = $_POST['seleccion'];



	if($seleccion == 0){
			
		/*
		$nombres = $_POST['nombres'];
		$apellidos = $_POST['apellidos'];
		$identificacion = $_POST['identificacion'];
		$id_usuario = $_POST['id_usuario'];
		$mensaje = $_POST['mensaje'];	

		//INSERCCIÓN A LA DB

		$query_1 = mysqli_prepare($connect, "INSERT INTO eco_contacto(nombres, apellidos, identificacion, id_usuario, 
											 mensaje) VALUES (?,?,?,?,?) ");
		mysqli_stmt_bind_param($query_1, 'sssis', $nombres, $apellidos, $identificacion, $id_usuario, $mensaje);
		mysqli_stmt_execute($query_1);

		if($query_1){
			echo "Creado";
		}else{
			echo "Error";
		}
		*/

	}
	else{
		
		$json = array();

		$query_2 = mysqli_prepare($connect,"SELECT id_contacto, nombres, apellidos, identificacion, id_usuario, mensaje, fecha_creacion FROM eco_contacto ORDER BY fecha_creacion DESC");
		mysqli_stmt_execute($query_2);
		mysqli_stmt_store_result($query_2);
		mysqli_stmt_bind_result($query_2, $id_contacto, $nombres, $apellidos, $identificacion, $id_usuario, $mensaje, $fecha_creacion);

		while($row = mysqli_stmt_fetch($query_2)){
			$json[] = array(
				'id_contacto'=>$id_contacto,
				'nombres'=>$nombres,
				'apellidos'=>$apellidos,
				'identificacion'=>$identificacion,
				'id_usuario'=>$id_usuario,
				'mensaje'=>$mensaje,
				'fecha_creacion'=>$fecha_creacion
			);
		}

		$convert = json_encode($json);

		echo $convert;
	}

	mysqli_close($connect);
?>