import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { NgWizardConfig, NgWizardService, StepChangedArgs, StepValidationArgs, STEP_STATE, THEME } from 'ng-wizard';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';


import JSONFormatter from 'json-formatter-js';
import { ApiService, IAPICore } from '../../../../../service/apicore/api.service';
import { ComunicacionesService } from '../../../../../service/comunicaciones/comunicaciones.service';
import { NgxUiLoaderService } from 'ngx-ui-loader';

@Component({
  selector: 'app-registrar',
  templateUrl: './registrar.component.html',
  styleUrls: ['./registrar.component.scss']
})
export class RegistrarComponent implements OnInit, OnDestroy {

  //editor: Editor;
  html: '';

  stepStates = {
    normal: STEP_STATE.normal,
    disabled: STEP_STATE.disabled,
    error: STEP_STATE.error,
    hidden: STEP_STATE.hidden
  }
 
  config: NgWizardConfig = {
    selected: 0,
    theme: THEME.arrows,
    lang: {
      next: 'Siguiente', 
      previous: 'Anterior' 
    },
    toolbarSettings: {
      toolbarExtraButtons: [
        { text: 'Guardar', class: 'btn btn-info', event: () => { this.Guardar() } }
      ],
    }
  }

  driver : string = '0'
 

  http = 0
  https = 0
  consumidores : string = '0'
  puertohttp : string = '0'
  puertohttps : string = '0'
  tipo : string = '0'
  relacional : boolean = false
  xrelacional  : boolean  = false
  xcondicion  : boolean  = true

  coleccion : string = ''
  metodo : string = '0'
  totalizar : string = '0'
  consulta: string = ''
  version: string = ''


  duracion = `<b>Duración:</b> 00.00.00 seg &nbsp; <b>Peso:</b> 0.00 KB<hr>`
    

  closeResult : string  = '';
  xparametro : string = '';

  

  descripcion: string = ''
  prioridad : string = '0'
  log : boolean = false
  cache : string = '0'
  entorno : string = 'desarrollo'
  concurrencia : boolean = false
  retorna : boolean = true
  xruta: string = ''
  entradas : string = ''
  salidas : string   = ''

  divCodigofuente = 'none'
  divConsultang = 'none'
  divArchivosng = 'none' 

  drivers: any

  modulo : string = '0'
  modulos: any
  
  archivo : string = '0'

  archivos: []

  lstDml: any = []

  Dml: any = [
    {"id" : "$values", "nombre":"VALUES", "tipo":"INSERTAR"},
    {"id" : "$set", "nombre":"SET", "tipo":"ACTUALIZAR"},
    {"id" : "$where", "nombre":"WHERE", "tipo":"ACTUALIZAR"},
    {"id" : "$where", "nombre":"WHERE", "tipo":"ELIMINAR"},
  ]
  
  codigo : string = ''
  funcion : string = ''
  query : string   = ''
  columna : string   = ''

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
    estatus: false,
    categoria : '',
    funcionalidad : '',
    entradas : '',
    salidas : ''
  };


  campo : string   = ''
  alias  : string   = ''
  tipodato : string   = ''
  tabla : string   = ''
  dml  : string   = ''
  defecto : string   = ''
  condicion  : string   = ''
  
  public DML : any = ["$values", "$set", "$where" ]
  //Listado general de entradas
  public IEntradas  = {
    "$values" : [],
    "$set" : [],
    "$where" : []
  } 

  public IEntrada  = [] //Detalles de la entrada


  xcategoria : string = 'S'
  xfuncionalidad : string = 'S'
  
  
  codeJson: any = {
    theme: 'idea',
    mode: 'application/ld+json',
    lineNumbers: true,
    lineWrapping: true,
    foldGutter: true,
    gutters: ['CodeMirror-linenumbers', 'CodeMirror-foldgutter', 'CodeMirror-lint-markers'],
    autoCloseBrackets: true,
    matchBrackets: true,
    lint: true
  };

  codeSQL: any = {
    theme: 'idea',
    mode: 'text/x-sql',
    lineNumbers: true,
    lineWrapping: true,
    foldGutter: true,
    gutters: ['CodeMirror-linenumbers', 'CodeMirror-foldgutter', 'CodeMirror-lint-markers'],
    autoCloseBrackets: true,
    matchBrackets: true,
    lint: true
  };


  constructor(
    private comunicacionesService : ComunicacionesService,
    private apiService : ApiService, 
    private modalService: NgbModal, 
    private ruta: Router,  
    private ngWizardService: NgWizardService,               
    private toastrService: ToastrService,
    private ngxService: NgxUiLoaderService
  ) { }

  ngOnInit(): void {
    //this.editor = new Editor();
    this.CargarModulos()
    this.CargarDrivers()
  }
  ngOnDestroy(): void {
    //this.editor.destroy();
  }




  setEditorContent(event) {
   //console.log(event)
    
  }

  //agregarEntrada a los elementos de la interfaz de una API
  async agregarEntrada(){

   

    var e = {
      campo : this.campo,
      defecto : this.defecto,
      alias : this.alias,
      tipo : this.tipodato
    }
    this.IEntradas[this.dml].push (e)
    
    var blAct = await this.selEntradas().then(e => {return e})
    console.log( this.metodo , blAct)
    if (this.metodo == "ACTUALIZAR" && blAct != true) {
      console.log("Es recomendable agragar un parametro para actualizar WHERE")
    }
    this.entradas = JSON.stringify( this.IEntrada, null, '\t' )

    this.selMetodo()
    this.clickRefresh(0)
    this.tipodato = '0'
    this.campo = ''
    this.alias = ''
    
    this.defecto = ''
   
  } 

  async selEntradas() : Promise<boolean> {
    var blAct = false //Actualizar
    var cond = ''
    this.IEntrada = []

    await this.DML.forEach(e => {
      if (this.IEntradas[e].length > 0) {
        if (e == "$where") {
          cond = this.condicion
          blAct = true
        }
        this.IEntrada.push ({
            "dml": e,
            "condicion" : cond,
            "entradas": this.IEntradas[e],
        })
      }
    })
   
    return blAct

   
  }


  clickRefresh(event) {
    this.codeJson = {
      theme: 'idea',
      mode: 'application/ld+json',
      lineNumbers: true,
      lineWrapping: true,
      foldGutter: true,
      gutters: ['CodeMirror-linenumbers', 'CodeMirror-foldgutter', 'CodeMirror-lint-markers'],
      autoCloseBrackets: true,
      matchBrackets: true,
      lint: true
    }
    
    this.codeSQL = {
      theme: 'idea',
      mode: 'text/x-sql',
      lineNumbers: true,
      lineWrapping: true,
      foldGutter: true,
      gutters: ['CodeMirror-linenumbers', 'CodeMirror-foldgutter', 'CodeMirror-lint-markers'],
      autoCloseBrackets: true,
      matchBrackets: true,
      lint: true
    }
     
  }

  selMetodo(){
    switch (this.metodo) {
      case "INSERTAR":
        this.consulta = `INSERT INTO ${this.tabla} $exec`
        break;
      case "ACTUALIZAR":
        this.consulta = `UPDATE ${this.tabla} $exec`
        break;
      case "DELETE":
        this.consulta = `DELETE FROM ${this.tabla} $exec`
        break;
      default:
        this.consulta = `SELECT * FROM `
        break;
    }
  }

  focusRefresh(event) {
    console.log(event)
  }
  
  isValidTypeBoolean: boolean = true;

  showPreviousStep(event?: Event) {
    this.ngWizardService.previous();
  }
 
  showNextStep(event?: Event) {
    
  }
 
  resetWizard(event?: Event) {
    this.ngWizardService.reset();
  }
 
  setTheme(theme: THEME) {
    this.ngWizardService.theme(theme);
  }
 
  stepChanged(args: StepChangedArgs) {
    //console.log(args.step);
  }
 
  
  isValidFunctionReturnsBoolean(args: StepValidationArgs) {
    var valor = false
    
    if( this.driver != '' && this.descripcion != '' && this.xfuncionalidad != 'S' ){ 
      valor = true
      //this.Guardar()
    }else{
      this.toastrService.warning(
        'Debe registrar todos los campos requeridos',
        `CodeEpic Middleware`
      );
    }
    return valor;
  }
 
  isValidFunctionReturnsObservable(args: StepValidationArgs) {
    return of(true);
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



  async CargarDrivers(){
    this.xAPI.funcion = "LESBDrivers";
    
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
        this.clickRefresh(0)
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
    this.xcategoria = ''
    this.xfuncionalidad = ''
    this.entradas = ''
    this.tabla = ''
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
    this.xAPI.categoria = this.xcategoria
    this.xAPI.funcionalidad = this.xfuncionalidad
    this.xAPI.entradas = this.entradas
    this.xAPI.salidas = this.salidas
    return this.xAPI

  }

  async Guardar() {

    this.Obtener()

    if(this.xAPI.funcionalidad == '' || this.xAPI.descripcion == '' ){ 
     this.toastrService.warning(
       'Debe registrar todos los campos requeridos',
       `CodeEpic Middleware`
     );
     return false
    }

    this.ngxService.startLoader("loader-registrar");
    var jsonG = {};
    var sApi = 'gapihtml';
    
    

    if (this.archivo == "0"){
     jsonG = {
        "coleccion": "apicore",
        "relacional": this.relacional?true:false,
        "tipo": 'INSERT',
        "entorno": 'produccion',
        "valores": this.xAPI
      };
      sApi = 'crud';
    }else{
      jsonG = {
        "modulo": this.modulo,
        "archivo": this.archivo,
        "ApiCore": this.xAPI
      };
    }
    

    await this.apiService.Guardar(jsonG, sApi).subscribe(
      (data)=>{
        this.LimpiarFormulario()
        this.toastrService.success(
          'Tu (API) ha sido registrada codigo: ' + data.InsertedID,
          `Code-Epic ESB`
        );
        this.ngxService.stopLoader("loader-registrar")
        this.ngWizardService.reset();

      },
      (errot)=>{
        this.ngxService.stopLoader("loader-registrar")
        this.toastrService.error(
          'Fallo la conexión, con el API',
          `Code-Epic ESB`
        );
        
      }
    )
  }

  seleccionarUrl(){
    var id = '{Hash}'
    
    this.xruta =  this.seleccionrEtorno(this.entorno) + ":" + id
    
  }

  seleccionrEtorno(key: string) : string{
    var entorno = ''
    switch (key) {
      case "produccion":
        entorno = '/v1/api/'
        break;
      case "calidad":
        entorno = '/qua/api/'
        break;
      default:
        entorno = '/dev/api/'
        break;
    }
    return entorno
  }

  onMetodo(ev){
    this.lstDml = []

    this.Dml.forEach(e => {
      if (e.tipo == this.metodo){
        this.lstDml.push(e)
      }
    });
  }

  onDml(ev){
    this.xcondicion = true
    console.log(this.dml)
    if (this.dml == "$where"){
      this.xcondicion = false
    }
    
  }

}
