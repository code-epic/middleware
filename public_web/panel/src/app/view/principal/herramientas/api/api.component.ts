import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';

import { ApiService, IAPICore } from '../../../../service/apicore/api.service';
import { ComunicacionesService } from '../../../../service/comunicaciones/comunicaciones.service';

import { BotonComponent } from './componente/boton/boton.component';
import { AccionComponent } from './componente/accion/accion.component';

import JSONFormatter from 'json-formatter-js';


declare var $: any;

@Component({
  selector: 'app-api',
  templateUrl: './api.component.html',
  styleUrls: ['./api.component.scss']
})

export class ApiComponent implements OnInit {
  columnDefs = [
    { field: "#", cellRendererFramework: BotonComponent, width: 40},
    { field: "protocolo", width: 80},
    { field: "metodo", width: 80},
    { field: "funcion"},
    { field: "entorno"},
    { field: "driver", width: 90},
    { field: "#", cellRendererFramework: AccionComponent, width: 40},
  ];

  duracion = `<b>Duración:</b> 00.00.00 seg &nbsp; <b>Peso:</b> 0.00 KB<hr>`
    
  rowData: any
  modulo : string = '0'
  modulos: []
  
  archivo : string = '0'
  archivos: []
  
  driver : string = '0'
  drivers: any

  codigo : string = ''
  funcion : string = ''

  http = 0
  https = 0
  consumidores : string = '0'
  puertohttp : string = '0'
  puertohttps : string = '0'
  tipo : string = '0'
  relacional : boolean = false
  xrelacional  : boolean  = false
  coleccion : string = ''
  metodo : string = '0'
  consulta: string = ''
  version: string = ''


  closeResult : string  = '';
  xparametro : string = '';

  query : string   = '';



  descripcion: string = ''
  prioridad : string = '0'
  log : boolean = false
  cache : string = '0'
  entorno : string = 'desarrollo'
  concurrencia : boolean = false
  retorna : boolean = true
  xruta: string = ''

  divCodigofuente = 'none'
  divConsultang = 'none'
  divArchivosng = 'none' 

  loading : boolean = false

  public xAPI : IAPICore = {
    funcion: '',
    parametros: '',
    relacional: false,
    concurrencia : false,
    protocolo: '',
    ruta : '',
    version: '',
    retorna : false,
    migrar : false,
    modulo : '',
    valores : {},
    coleccion : '',
    http : 0,
    https : 0,
    consumidores : '',
    puertohttp : 0,
    puertohttps : 0,
    driver : '',
    query : '',
    metodo : '',
    tipo : '',
    prioridad : '',
    entorno: '',
    logs : false,
    cache: 0,
    estatus: false
  };

  paginationPageSize = 25;

  constructor(private comunicacionesService : ComunicacionesService,
    private apiService : ApiService, 
    private ruta: Router, 
    private modalService: NgbModal, 
    private toastrService: ToastrService) {
  }

  ngOnInit(): void {
    //document.getElementById('duracion').innerHTML = this.duracion;
   
    this.ListarApis()
    this.CargarModulos()
    this.CargarDrivers()
  }

  ListarApis(){
    this.apiService.Listar().subscribe(
      (data) => {
       this.rowData = data
       
      },
      (error) => {
        console.log(error)
      }
     );
  }
  
  async CargarDrivers(){
    this.xAPI.funcion = "LESBDrivers";
    this.xAPI.valores = null;
    await this.comunicacionesService.ListarConexiones().subscribe(
      (data) => {            
        this.drivers = data
        this.apiService.Ejecutar(this.xAPI).subscribe(
          (data) => {
              data.forEach(e => {
                this.drivers.push(e)                
              });
          },
          (error) => { console.log(error) }
        )
      },
      (error) => { console.log(error) }
    )
    
  }

  async CargarModulos(){
    await this.apiService.ListarModulos().subscribe(
      (data)=>{
        this.modulos = data;
      },
      (errot)=>{
        this.modulos = [];
      }
    )
  }

  async CargarArchivos(){
    await this.apiService.ListarArchivos(this.modulo).subscribe(
      (data)=>{
        this.archivos = data;
      },
      (errot)=>{
        this.archivos = [];
      }
    )
  }
  
  async ProcesarArchivos(){
    var jsonG = {
      "modulo": this.modulo,
      "archivo": this.archivo
    };
    await this.apiService.ProcesarArchivos(jsonG).subscribe(
      (data)=>{
        data.rs.forEach(el => {
          this.codigo = el;
        });
        this.funcion = data.msj;
        document.getElementById('duracion').innerHTML = `<b>Duración:</b> <font color="blue">${data.txtduracion} </font>&nbsp; <b>Peso:</b> <font color="blue">${data.peso}</font><hr>`
      },
      (errot)=>{
        this.archivos = [];
      }
    )

  }

  ConsultarFuncion(e){
    var id = e.target.id
    this.query = ''
    document.getElementById("xrs").innerHTML = ''
    this.rowData.forEach(api => {      
      if (api.id == id) {
        this.query = api.query
        var entorno = api.entorno=="produccion"?"/v1/api/crud":"/devel/api/crud"
        this.xruta =  entorno + ":" + api.id
        this.xAPI = api
      }
    });

  }

  LimpiarFormulario(){
    this.http = 0
    this.https = 0
    this.consumidores = '0'
    this.puertohttp = '0'
    this.puertohttps = '0'
    this.tipo = '0'
    this.relacional = false
    this.xrelacional = false
    this.funcion = ''
    this.driver = '0'
    this.metodo = '0'
    this.coleccion = ''
    this.consulta = ''
    this.descripcion = ''
    this.prioridad = '0'
    this.log = false
    this.cache = '0'
    this.entorno = 'desarrollo'
    this.version = ''
    this.concurrencia = false
    this.retorna = true
  }

  Obtener() : IAPICore{


    this.xAPI.funcion = this.funcion
    this.xAPI.puertohttp = parseInt(this.puertohttp)
    this.xAPI.puertohttps = parseInt(this.puertohttps)
    this.xAPI.tipo = this.tipo
    if (this.consulta == ""){
      this.xAPI.relacional = this.relacional?true:false
    }else{
      this.xAPI.relacional = this.xrelacional?true:false
    }
    
    this.xAPI.modulo = this.modulo
    this.xAPI.driver = this.driver
    this.xAPI.protocolo = parseInt(this.puertohttps)== 0?'HTTP':'HTTPS'
    this.xAPI.query = this.consulta
    this.xAPI.descripcion = this.descripcion
    this.xAPI.prioridad = this.prioridad
    this.xAPI.metodo = this.metodo
    this.xAPI.consumidores = this.consumidores
    this.xAPI.logs = this.log?true:false
    this.xAPI.concurrencia = this.concurrencia?true:false
    this.xAPI.coleccion = this.coleccion
    this.xAPI.retorna = this.retorna?true:false
    this.xAPI.valores = null
    this.xAPI.entorno = this.entorno
    this.xAPI.ruta = this.xruta
    this.xAPI.cache = parseInt(this.cache)
    this.xAPI.estatus = true
    this.xAPI.version = this.version
    return this.xAPI

  }

  async Guardar() {
    var jsonG = {};
    var sApi = 'gapihtml';
    this.loading = true;
    

    if (this.archivo == "0"){
     jsonG = {
        "coleccion": "apicore",
        "relacional": this.relacional?true:false,
        "tipo": 'INSERT',
        "entorno": 'produccion',
        "valores": this.Obtener()
      };
      sApi = 'crud';
    }else{
      jsonG = {
        "modulo": this.modulo,
        "archivo": this.archivo,
        "ApiCore": this.Obtener()
      };
    }
    

    await this.apiService.Guardar(jsonG, sApi).subscribe(
      (data)=>{
        this.LimpiarFormulario()
        this.toastrService.success(
          'Tu (API) ha sido registrada codigo: ' + data.InsertedID,
          `Code-Epic ESB`
        );
        this.loading = false;
        this.ListarApis()

      },
      (errot)=>{
        this.toastrService.error(
          'Fallo la conexión, con el API',
          `Code-Epic ESB`
        );
        this.loading = false;
      }
    )
  }

  SeleccionarChk(obj : any){
    if( obj != "0"){
      this.http = 1; 
    }else{
      this.http = 0;
    }
  }

  SeleccionarChks(obj : any){
    if( obj != "0"){
      this.https = 1; 
    }else{
      this.https = 0;
    }
  }

  onTipo(e){
    this._divInit()
    switch (this.tipo) {
      case 'CODIGO':
        this.divCodigofuente = ''
        this.divArchivosng = ''
        break;
      case 'ARCHIVO':
        
        break;
      case 'LOGICA':
        this.divCodigofuente = ''
        this.divArchivosng = ''
        break;
      case 'CONSULTA':
        this.divConsultang = ''
        break;
      case 'INTERFAZ':
        
        break;
    
      default:

        break;
    }
  }

  _divInit(){
    this.divCodigofuente = 'none'
    this.divConsultang = 'none' 
    this.divArchivosng = 'none'
    
  }

  async ejecutarApi(){

    this.xAPI.parametros = this.xparametro;
    await this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        const formatter = new JSONFormatter(data);
        document.getElementById("xrs").appendChild(formatter.render());
      },
      (error) => {
        //this.resultado = error;
        console.log(error)
      }
    )
  }
 
}
