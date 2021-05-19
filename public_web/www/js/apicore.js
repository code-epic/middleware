
let _itemApi = {};

class ApiCore{
    constructor(){
        this.prioriodad = "alta";
        this.concurrencia = true;
        this.ruta = "";
        this.funcion = "";
        this.parametros = "";
        this.retorna = true;
        this.migrar = false;
        this.modulo = "";
        this.relacional = false;
        this.valores = {};
        this.coleccion = "";

        this.http = "";
        this.https = "";
        this.consumidores = "";
        this.puertohttp = "";
        this.puertohttps = "";
        this.driver = "";
        this.query = "";
        this.metodo = "";
        this.tipo = "";
        this.modulo = "";
        this.prioridad = "";
        this.log = "";
        this.retorno = "";
    }
  
    Obtener(){
        this.http = $("#chkhttp").val();
        this.https = $("#chkhttps").val();
        this.funcion = $("#txtFuncion").val();
        this.consumidores = $("#txtConsumidores").val();
        this.puertohttp = $("#cmbpuertohttp").val();
        this.puertohttps = $("#cmbpuertohttps").val();
        
        this.driver = $("#cmbDriver").val();
        this.metodo = $("#cmbMetodo").val();
        this.tipo = $("#cmbTipo").val();
        this.modulo = $("#cmbModulo").val();
        this.archivos = $("#cmbArchivos").val();
        this.prioridad = $("#cmbPrioridad").val();
        this.log = $("#cmbLog").val();
        this.concurrencia = $("#cmbConcurrencia").val();
        this.retorno = $("#cmbRetorno").val();
        this.query = $("#txtConsulta").val();
        return this;
    }
   
    Limpiar(){
        $("#chkhttp").val("");
        $("#chkhttps").val("");
        $("#txtFuncion").val("");
        $("#txtConsumidores").val("");
        $("#cmbpuertohttp").val("0");
        $("#cmbpuertohttps").val("0");
        $("#cmbTipo").val("");
        $("#cmbRelacional").val("");
        $("#cmbModulo").val("0");
        $("#cmbArchivos").val("0");
        $("#cmbDriver").val("0");
        $("#cmbMetodo").val("");
        $("#cmbPrioridad").val("");
        $("#cmbLog").val("");
        $("#cmbConcurrencia").val("");
        $("#cmbRetorno").val("");
        $("#txtCodigo").val("");
        $("#duracion").html(`<b>Duración:</b> 00.00.00 seg &nbsp; <b>Peso:</b> 0.00 KB<hr>`);
    }

    GenerarListado(){
        var promesa =  CargarAPI({
            metodo : "GET",
            sURL: conn.URL + "listar"
        });
        promesa.then(function (xhRequest) {
            var json = JSON.parse( xhRequest.responseText);
            CrearGrid(json)
        });
    }
    
    Salvar(){
        console.info("Iniciando respaldo...");
        var obj = this.Obtener();

        var jsonG = {
            "modulo": $("#cmbModulo").val(),
            "archivo": $("#cmbArchivos").val(),
            "ApiCore": obj
        };
        
        if (obj.driver == "0"){
            Util.Mensaje(
                `Debe seleccionar un drivers`, 
                'bg-warning',
                'Drivers',
                'code-epic'
            );
            return false;
        }

        var promesa =  CargarAPI({
            metodo : 'POST',
            valores: jsonG,
            sURL: conn.URL + "gapihtml"
        });
        promesa.then(function (xhRequest) {
            obj.Limpiar();
            console.log(xhRequest.responseText)
            var json =  JSON.parse(xhRequest.responseText);
            console.log(json);
            
            
        });
    }
}

function CrearGrid(db){
    $("#jsGridApi").jsGrid({
        width: "100%",
        height: "600px",
        filtering: false,
        editing: false,
        sorting: true,
        paging: true,
        data: db,
        fields: [
            {  width: 10,
                itemTemplate: function(_, item) {
                    if(item.estatus == false){
                        return $("<i style='color:#A40F0F' class='fas fa-screwdriver'>")
                    }else{
                        return $("<i style='color:#6ABE0B' class='fas fa-check-circle'>")
                    }
              	}
            },
            { name: "protocolo", type: "text", title: "Protocolo",  width: 35,},
            { name: "puerto", type: "text", title: "Puerto",  width: 25,},
            { name: "metodo", type: "text", title: "Metodo",  width: 30,},
            { name: "funcion", type: "text", title: "Funcion" },
            { name: "entorno", type: "text", title: "Ruta",
                itemTemplate: function(_, item) {
                    return item.entorno=="produccion"?"/v1/api/crud":"/devel/api/crud"
                }
            },
            { name: "driver", type: "text", title: "Driver" },
            {  width: 10,
                itemTemplate: function(_, item) {
                    return $("<i style='color:#1D9D36' class='fas fa-play'>")
                    	.on("click", function() {
                            var api = item.entorno=="produccion"?"/v1/api/crud":"/devel/api/crud"
                            var ruta = item.protocolo.toLowerCase() + "://" + conn.IP + ":" + item.puerto + api;
                            $("#txtParametro").val("");
                            $("#txtColeccion").val(item.coleccion);
                            
                            $("#txtPath").val(ruta);
                            $("#txtQuery").val(item.query);
                            $("#divConsulta").show();
                            $("#divParametro").hide();
                            if(item.parametros != undefined && item.parametros != ""){
                                $("#divParametro").show();
                                $("#divConsulta").hide();

                                var parametros = JSON.parse(item.parametros);
                                $("#txtParametro").val(JSON.stringify(parametros, null, 4));
                                
                            }
                            $("#codex").html(item.query);
                            $("#txtDatail").val("");
                            $('#result').html("");
                            $('#mdlApiEjecucion').modal('show');      
                            _itemApi = item;
                    	});
              	}
            }
        ]
    });
}

function EjecutarAPI(){
    
    var xAPI = new ApiCore();
    var api = _itemApi.entorno=="produccion"?"/v1/api/crud":"/devel/api/crud"
    var ruta = _itemApi.protocolo.toLowerCase() + "://" + conn.IP + ":" + _itemApi.puerto + api;

    xAPI.funcion = _itemApi.funcion;
    xAPI.modulo = _itemApi.modulo;
    xAPI.metodo = _itemApi.metodo;
    if( $("#txtParametro").val() != "" ){
        xAPI.valores = JSON.parse($("#txtParametro").val());
        xAPI.coleccion = $("#txtColeccion").val();
    }
    
    var promesa =  CargarAPI({
        metodo : 'POST',
        valores: xAPI,
        sURL: ruta
    });
    promesa.then(function (xhRequest) {
        var json =  JSON.parse(xhRequest.responseText);
        var valor = JSON.stringify(json, undefined, 2);
        //$("#txtDatail").val(valor);
        var node = new PrettyJSON.view.Node({
            el: $('#result'),
            data: json
          });
        node.expandAll();
    });
}

async function CargarDrivers(){
    $("#cmbDriver").html(`<option value="0">SELECCIONE</option>`);
    var elem = await Drivers.Listar();

    elem.forEach(e => {
        $("#cmbDriver").append(`<option value="${e.id}">${e.descripcion}</option>`);
    });
   
    
}

async function ListarModulos(){
    var jsonG = {};
    var promesa = await CargarAPI({
        metodo : "GET",
        sURL: conn.URL + "lmodulos"
    }).then(function (xhRequest) {
        jsonG = JSON.parse(xhRequest.responseText);
        //console.log(xhRequest.responseText)
    });
    //console.log(jsonG)
    var cant = jsonG.length;
    $("#cmbModulo").html(`<option value="0">SELECCIONE</option>`);
    for(var i = 0; i<cant; i++){
        $("#cmbModulo").append(`<option value="${jsonG[i]}">${jsonG[i].toUpperCase()}</option>`);
    }
}

async function ListarArchivos(){
    var jsonG = {};
    var promesa = await CargarAPI({
        metodo : "GET",
        sURL: conn.URL + "larchivos/" + $("#cmbModulo").val()
    }).then(function (xhRequest) {
        jsonG = JSON.parse(xhRequest.responseText);
    });
    $("#cmbArchivos").html(`<option value="0">SELECCIONE</option>`);
    var cant = jsonG.length;
    for(var i = 0; i<cant; i++){
        $("#cmbArchivos").append(`<option value="${jsonG[i]}">${jsonG[i]}</option>`);
    }
}

async function ProcesarArchivoHTML(){
    if($("#cmbArchivos").val() == "0"){
        return false;
    }
    var jsonG = {
        "modulo": $("#cmbModulo").val(),
        "archivo": $("#cmbArchivos").val()
    };

    var promesa = await CargarAPI({
        metodo : "POST",
        sURL: conn.URL + "phtml",
        valores: jsonG
    }).then(function (xhRequest) {
        //console.info(xhRequest.responseText);
        jsonG = JSON.parse(xhRequest.responseText);
        var rs = jsonG.rs;
        rs.forEach(el => {
           
            $("#txtCodigo").html(el);
        });
        console.log(jsonG.opt);
        console.log(JSON.parse(jsonG.opt));

        $("#txtFuncion").val(jsonG.msj);
        $("#duracion").html(`
        <b>Duración:</b> <font color="blue">${jsonG.txtduracion} </font>&nbsp; <b>Peso:</b> <font color="blue">${jsonG.peso}</font><hr>`)
        
            
    });


}

//ApiCoreSalvar
function ApiCoreSalvar(){
    var api = new ApiCore();
    api.Salvar();
    return false;
}

function SeleccionarChk(id){
    if($("#cmbpuertohttp").val() != "0"){
        $('#' + id).prop('checked',true); 
    }else{
        $('#' + id).prop('checked',false); 
    }
}