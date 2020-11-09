<?php 

	require('../conexion.php');
	$seleccion = $_POST['seleccion'];


	if($seleccion == 0){

		$query_1 = mysqli_prepare($connect,"SELECT id_usuario FROM eco_usuario WHERE usuario = ?");
		mysqli_stmt_bind_param($query_1, 's', $usuaro_valida);
		mysqli_stmt_execute($query_1);
		mysqli_stmt_store_result($query_1);
		mysqli_stmt_bind_param($query_1, $id_usuario);
		mysqli_stmt_fetch($query_1);

		if(mysqli_num_rows($query_1)>0){
			echo "Existe";
		}else{
			echo "Disponible";
		}


	}

	else if($seleccion == 1){

		//INSERTAR EN LA DB

		$query_1 = mysqli_prepare($connect,"INSERT  INTO eco_tercero(tipo_identificacion, primer_nombre, segundo_nombre, primer_apellido, 										segundo_apellido, correo, celular, direccion, tipo_persona) VALUES (?,?,?,?,?,?,?,?,?)");
		mysqli_stmt_bind_param($query_1, 'isssssssi', $tipo_id, $primer_nombre, $segundo_nombre, $primer_apellido, $segundo_apellido, $correo,
													  $celular,$direccion, $tipo_persona);
		mysqli_stmt_execute($query_1);

		$id_nuevo = mysqli_stmt_insert_id($query_1);

		if($query_1){
			
			$query_2 = mysqli_prepare($connect,"INSERT INTO eco_usuario (id_tercero, usuario, password, id_rol) VALUES (?,?,?,?)");
			mysqli_stmt_bind_param($query_2, 'issi', $id_nuevo, $usuario, $pass_md5 $rol);
			mysqli_stmt_execute($query_2);

			if($query_2){
				echo "Creado";
			}else{
				echo "Error";
			}

		}else{
			echo "Error";
		}
	}


	mysqli_close($connect);
?>
