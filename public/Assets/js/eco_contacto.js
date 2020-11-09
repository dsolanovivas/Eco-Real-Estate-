(function(){
	seleccionar_contactor(1);
	var seleccion = 0;
	//insertar datos
	/*$.ajax({
		type:'POST',
		url: 'Models/eco_contacto.php',
		data: {seleccion},
		success:function(reponse){
			alert(reponse);
		}		

	});*/

	//SELECCIONAR DATOS DE LA TABLA ECO_CONTACTO
	function seleccionar_contactor(seleccion){

	$.ajax({
		type:'POST',
		url: 'Models/eco_contacto.php',
		data: {seleccion},
		success:function(reponse){
			if(reponse == ''){
				alert("no hay nada");
			}else{
				alert(reponse);
			}
		}		

	});
}

}());



