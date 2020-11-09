(function(){

	//BUSCAR DATOS
	$.ajax({
		type:'POST',
		url: 'Models/eco_rol.php',
		success:function(reponse){
			alert(reponse);
		}		

	});

}())