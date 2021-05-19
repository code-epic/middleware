package webscraper

/**
* Las clases del servicio por ORM
* CESB + Clase: Obtener objeto
* SESB + Clase: Salvar un objeto
* LESB + Clase: Listar la clase Global
 */
func codigoClase(cf CodigoFuente) string {
	return `/*!
	* ESBEpicTechnologies v1.0.0 (https://esbepictechnologies.io)
	* Copyright 2020-2021 CodeEpicTechnologies <http://codeepictechnologies.com>
	* Licensed under MIT (https://github.com/gesaodin/esbepic/blob/master/LICENSE)
	*/
	class ESB` + cf.Nombre + `{		
		constructor (){
` + cf.Constructor + `
		}		
		//Función permite obtener los datos del formulario
		Obtener(){
` + cf.Obtener + `
			return this;
		}
		Limpiar(){
` + cf.Limpiar + `
		}
		//Cargar un documento mediante API de conexion
		async Cargar(id){
			var apic = new ApiCore();
			apic.funcion = "RESB` + cf.Nombre + `";
			apic.coleccion = "` + cf.Coleccion + `";
			apic.query = "{\"` + cf.ClavePrincipal + `\": id }";
			var promesa =  await CargarAPI({
				metodo : "POST",
				sURL: conn.URL + "crud",
				valores :  apic
			}).then(function (xhRequest) {
				json = xhRequest.responseText;
			});
		}
		//Salvar documento mediante API de conexion
		async Salvar(){
			var obj = this.Obtener();
			var apic = new ApiCore();
			apic.funcion = "CESB` + cf.Nombre + `";
			apic.coleccion = "` + cf.Coleccion + `";
			apic.relacional = false;
			apic.valores = obj;
			var promesa = await CargarAPI({
				metodo : "POST",
				sURL: conn.URL + "crud",
				valores :  apic
			}).then(function (xhRequest) {
				json = xhRequest.responseText;
			});
		}
		//Listar documentos generales
		async Listar(){
			var jsonG = {};
			var apic = new ApiCore();
			apic.funcion = "LESB` + cf.Nombre + `";
			var promesa = await CargarAPI({
				metodo : "POST",
				sURL: conn.URL + "crud",
				valores :  apic
			}).then(function (xhRequest) {
				jsonG = JSON.parse(xhRequest.responseText);
			});
			return jsonG;
		}
		//Funcion para crear tablas por jsGrid
		async CrearGrid(id){

		}
	};
	let ` + cf.Nombre + ` = new  ESB` + cf.Nombre + `();`
}
