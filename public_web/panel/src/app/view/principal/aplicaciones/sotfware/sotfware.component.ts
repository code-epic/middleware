import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { timeStamp } from 'console';
import { NgWizardConfig, NgWizardService, StepChangedArgs, StepValidationArgs, STEP_STATE, THEME } from 'ng-wizard';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { ApiService, IAPICore } from '../../../../service/apicore/api.service';
import { IAplicacion, SoftwareService } from '../../../../service/aplicaciones/software.service';
import { ComunicacionesService } from '../../../../service/comunicaciones/comunicaciones.service';

@Component({
  selector    : 'app-sotfware',
  templateUrl : './sotfware.component.html',
  styleUrls   : ['./sotfware.component.scss']
})

export class SotfwareComponent implements OnInit {
 
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
        { text: 'Finalizar', class: 'btn btn-info', event: () => { alert("Finished!!!"); } }
      ],
    }
  }

  public gridApi
  public gridColumnApi
  public defaultColDef
  public rowSelection
  public API
  public xparametro

  public xAPI : IAPICore = {
    id            : '',
    funcion       : '',
    relacional    : false,
    concurrencia  : false,
    retorna       : false,
    migrar        : false,
    parametros    : '',
    modulo        : '',
    valores       : null,
    logs          : false,
    cache         : 0,
    estatus       : false
  };

  public iApp : IAplicacion = {
    id    : '',
    type  : '0',
    serv  : '0',
    nomb  : '',
    vers  : '',
    sope  : '0',  //Sistema Operativo
    db    : '0',  //Base de datos
    idio  : '0',  //Lenguaje de Programacion
    obse  : '',   //Comentarios del sistemaoperativo
    user  : '',   //Rol creador del sistema
  }

  public bProbar : boolean = false

  stlFile   = "none"
  hosts     = []

  nombreapp     : string  = ''
  xnombreapi    : string  = ''
  xnombrecon    : string  = ''
  funcion       : string  = ''
  xparametroapi : string  = ''
  
  closeResult   : string  = ''
  rowDataAPI    = []
  columnDefsAPI = [
    { field: "funcion", filter: 'agTextColumnFilter'},
    { field: "descripcion"},
    { field: "entorno"},
    { field: "id"},
  ];

  rowData     = []
  dataApp     = []
  keyword     = 'name'
  columnDefs  = [
    { field: "nombre"},
    { field: "funcion"},
    { field: "descripcion"},
    { field: "parametros"},
    { field: "id"},
  ];

  constructor(private apiService : ApiService,
              private modalService: NgbModal, 
              private comunicacionesService : ComunicacionesService, 
              private ruta: Router,  
              private ngWizardService: NgWizardService,               
              private toastrService: ToastrService,
              private softwareService : SoftwareService) {

    this.defaultColDef = {
      flex: 1,
      minWidth: 100,
    };
    this.rowSelection = 'single';
    this.iApp.user = 'administrador';
  }

  ngOnInit(): void {
    this.ListarIP()
    this.ListarApis()
    this.lstAplicaciones()
  }

  async ListarIP(){
    
    await this.comunicacionesService.Listar().subscribe(
      (data) => {
        
        this.hosts = data
      },
      (error) => {
        console.log(error)
      }
    )
  }
  async lstAplicaciones(){
    this.xAPI.funcion = "LstAplicaciones";
    this.xAPI.valores = null;

    await this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        //console.log(data)
        data.Cuerpo.forEach(e => {          
          this.dataApp.push({id: e.id, name: e.nomb + " | " + e.vers });  
        });             
      },
      (error) => {
        console.log(error)
      }
    )
  }

  selectEventModulo(e){
    console.log(e)
    this.iApp.id = e.id;
    this.nombreapp = e.name;
    this.consultarAplicacion()    
  }

  onFocusedModulo(item) {
    this.iApp.id = ''
    this.nombreapp = ''
    this.iApp.type = '' 
    this.iApp.serv = ''
    this.iApp.vers = ''
    this.iApp.sope = ''
    this.iApp.db = ''
    this.iApp.idio = ''
    this.iApp.obse = ''
  }

  obtenerParametros(){
    var nombre = this.iApp.nomb;
    if (typeof this.iApp.nomb  === 'object') nombre = this.nombreapp
    
    this.xAPI.parametros = this.iApp.type + "," + this.iApp.serv + "," + nombre + "," + this.iApp.vers + "," + this.iApp.sope + ","
    this.xAPI.parametros += this.iApp.db + "," + this.iApp.idio + "," + this.iApp.obse + "," + this.iApp.user 
    
  }

  async consultarAplicacion(){
    this.xAPI.funcion = "SEC_CAplicacion" //Consultar Aplicacion del sistema 
    this.xAPI.parametros = this.iApp.id
    await this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        var xapp : IAplicacion
        xapp = data.Cuerpo[0]
        this.iApp = xapp;

      },
      (error) => {
        console.log(error)
      }
    )
  }
  
  async guardarAplicacion(){
    this.obtenerParametros()
    if(this.iApp.id != ''){
      this.xAPI.funcion = "ActualizarAplicacion"
      this.xAPI.parametros += "," + this.iApp.id
    } else{ 
      this.xAPI.funcion = "AgregarAplicacion"    
    }
    await this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        console.log(data)
        var msj = "Actualizado"
        if(this.xAPI.funcion == "AgregarAplicacion") {
          this.iApp.id = data.msj;
          var msj = "Agregado"
        }

        this.toastrService.success(
          'Se ha ' + msj + ' el registro con exito ',
          `CodeEpic Middleware`
        );
      },
      (error) => {
        console.log(error)
      }
    )
   

  }

  async listarAppAPI(){
    this.xAPI.funcion = "LstAppApi"
    this.xAPI.parametros = this.iApp.id
    this.rowData = []

    await this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {        
        data.Cuerpo.forEach(v => {
          this.rowData.push({
            nombre: v.nomb,
            funcion: v.func,
            descripcion: v.descr,
            parametros: v.param,
            id: v.idfunc 
          });
        });
      },
      (error) => {
        console.log(error)
      }
    )
  }

  /**
   * Control de acceso a las API
   */
  onSelectionChanged(e) {
    var selectedRows = this.gridApi.getSelectedRows();
    this.xAPI = selectedRows[0]
    //console.log( this.xAPI );
    this.bProbar = true
  }
 
  async ProbarAPI(){
    this.xAPI.parametros = this.xparametro;
    await this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        this.toastrService.success(
          'la api funciona bien',
          `CodeEpic Middleware`
        )
      },
      (error) => {
        console.log(error)
      }
    )
  }

  async GuardarApi(){
    const regex = /,/i;
    var parametros = this.xparametroapi.replace(regex, ':')

    this.xAPI.parametros = this.xnombreapi + ',' + this.xAPI.id + ',' + this.xAPI.funcion + ','   + this.xAPI.descripcion + ','
    this.xAPI.parametros += parametros + ',' + this.xAPI.estatus  + ',' + this.iApp.id
    this.xAPI.funcion = 'AgregarAppApi'

    console.log( this.xAPI )
    await this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
       
        this.toastrService.success(
          'la api ha sido asociada con exito ',
          `CodeEpic Middleware`
        )
        this.rowData.push( {
          nombre: this.xnombreapi,
          funcion: this.xAPI.funcion,
          descripcion: this.xAPI.descripcion,
          parametros: this.xparametroapi,
          id: this.xAPI.id 
        } )
        this.xparametroapi = ''
        this.xnombreapi = ''
      },
      (error) => {
        console.log(error)
      }
    )
  }


  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }

  onGridReady(e : any){
    this.gridApi = e.api;
    this.gridColumnApi = e.columnApi;
  }


  async AsignarAPI(){
    this.rowData.push(this.API)
  }

  activarFormulario(content){
    if(this.xnombreapi === ''){
      this.toastrService.info(
        'Debe definir un nombre para la prueba',
        `Code-Epic ESB`
      )
      return false
    }
    this.bProbar = false
    this.modalService.open(content, {centered: true, size: 'lg', ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;

    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }

 

  ListarApis(){
    this.apiService.Listar().subscribe(
      (data) => {
       this.rowDataAPI = data;
      },
      (error) => {
        console.log(error)
      }
     );
  }

  selTipo(){
    this.stlFile = this.iApp.type === '2'?"":"none"
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
    var valor = true;
    
    if(this.iApp.nomb != ''){ 
       this.guardarAplicacion()
       this.listarAppAPI()
    }else{
      this.toastrService.warning(
        'Debe registrar o seleccionar una aplicacion ',
        `CodeEpic Middleware`
      );
      valor = false
    }
    return valor;
  }
 
  isValidFunctionReturnsObservable(args: StepValidationArgs) {
    return of(true);
  }


 

}
