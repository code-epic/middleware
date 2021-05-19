/*!
	* ESBEpicTechnologies v1.0.0 (https://esbepictechnologies.io)
	* Copyright 2020-2021 CodeEpicTechnologies <http://codeepictechnologies.com>
	* Licensed under MIT (https://github.com/gesaodin/esbepic/blob/master/LICENSE)
	*/
	class ESBDrivers{		
		constructor (){
			 this.driver = "";
			 this.host = "";
			 this.puerto = "";
			 this.usuario = "";
			 this.clave = "";
			 this.basedatos = "";
			 this.url = "";
			 this.descripcion = "";
			 this.id = "";
			 this.estatus = "";

		}		
		//Función permite obtener los datos del formulario
		Obtener(){
			 this.driver = $("#txtDriver").val();
			 this.host = $("#txtHost").val();
			 this.puerto = $("#txtPuerto").val();
			 this.usuario = $("#txtUsuario").val();
			 this.clave = $("#txtClave").val();
			 this.basedatos = $("#txtBaseDatos").val();
			 this.url = $("#txtUrl").val();
			 this.descripcion = $("#txtDescripcion").val();
			 this.id = $("#txtId").val();
			 this.estatus = $("#booEstatus").val();

			return this;
		}
		Limpiar(){
			  $("#txtDriver").val("");
			  $("#txtHost").val("");
			  $("#txtPuerto").val("");
			  $("#txtUsuario").val("");
			  $("#txtClave").val("");
			  $("#txtBaseDatos").val("");
			  $("#txtUrl").val("");
			  $("#txtDescripcion").val("");
			  $("#txtId").val("");
			  $("#booEstatus").val("");

		}
		//Cargar un documento mediante API de conexion
		async Cargar(id){
			var apic = new ApiCore();
			apic.funcion = "RESBDrivers";
			apic.coleccion = "sys-drivers";
			apic.query = "{\"id\": id }";
			var promesa =  await CargarAPI({
				metodo : "POST",
				sURL: conn.URL + "crud",
				valores :  apic
			}).then(function (xhRequest) {
				json = xhRequest.responseText;
				console.log(json);
			});
		}
		//Salvar documento mediante API de conexion
		async Salvar(){
			var obj = this.Obtener();
			var apic = new ApiCore();
			apic.funcion = "CESBDrivers";
			apic.coleccion = "sys-drivers";
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
			apic.funcion = "LESBDrivers";
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
			var db = await Drivers.Listar();
			console.log(db);
			$("#" + id).jsGrid({
				width: "100%",
				height: "500px",
				filtering: false,
				editing: false,
				sorting: true,
				paging: true,
				data: db,
				fields: [
					{ name: "id", type: "text", title: "ID",  width: 35,},
					{ name: "descripcion", type: "text", title: "Descripcion",}
				]
			});
		}
	};
	let Drivers = new  ESBDrivers();