(function(){
	validar_usuario(0);
	//VALIDAR USUARIO
    function validar_usuario(seleccion){
		$.ajax({
			type:'POST',
			url: 'Models/eco_tercero_eco_usuario.php',
			data: {seleccion},
			success:function(reponse){
				if(reponse == "Existe")

					swal({
						position:'center',
						title:'Usuario no disponible',
						icon : 'error',
						timer:1500
					});
				}else{
					var seleccion = 1;
					$.ajax({
						type:'POST',
						url: 'Models/eco_tercero_eco_usuario.php',
						data: {seleccion},
						success:function(reponse){

						}	
					});
				}		
		});
	}	

}())