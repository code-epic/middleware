import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { NgWizardConfig, NgWizardService, StepChangedArgs, StepValidationArgs, STEP_STATE, THEME } from 'ng-wizard';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { ApiService, IAPICore } from '../../../../service/apicore/api.service';
import { SoftwareService } from '../../../../service/aplicaciones/software.service';
import { ComunicacionesService } from '../../../../service/comunicaciones/comunicaciones.service';

@Component({
  selector: 'app-sotfware',
  templateUrl: './sotfware.component.html',
  styleUrls: ['./sotfware.component.scss']
})

export class SotfwareComponent implements OnInit {
 
  stepStates = {
    normal: STEP_STATE.normal,
    disabled: STEP_STATE.disabled,
    error: STEP_STATE.error,
    hidden: STEP_STATE.hidden
  };
 
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
  };
  stlFile = "none"
  hosts = []
  
  nombre: string  = ''  
  app: string = ''
  tipo : string = '0'
  host : string = '0'
  version: string  = ''  
  sistemaoperativo : string = '0'
  basedatos : string = '0'
  lenguaje: string  = '0'  
  descripcion: string  = ''  
  
  
  xnombre: string  = ''
  
  closeResult : string  = ''
  rowDataAPI = []
  columnDefsAPI = [
    { field: "funcion"},
    { field: "descripcion"},
    { field: "entorno"},
  ];

  rowData = []
  xrowData = []
  dataApp = []
  keyword = 'name'
  columnDefs = [
    { field: "Nombre"},
    { field: "Funcion"},
    { field: "Descripcion"},
    { field: "Parametros"},
    { field: "Isd"},
  ];

  
  
  private gridApi
  private gridColumnApi
  private defaultColDef
  private rowSelection
  public API
  public xparametro

  public xAPI : IAPICore = {
    funcion: '',
    relacional: false,
    concurrencia : false,
    retorna : false,
    migrar : false,
    parametros: '',
    modulo : '',
    valores : {},
    logs : false,
    cache: 0,
    estatus: false
  };



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
  }

  ngOnInit(): void {
    this.ListarIP()
    this.ListarApis()
    this.lstAplicaciones()
  }


  async lstAplicaciones(){
    this.xAPI.funcion = "LstAplicaciones";
    this.xAPI.valores = null;

    await this.softwareService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        console.log(data)
        data.forEach(e => {          
          this.dataApp.push({id: e.id, name: e.nomb + " | " + e.vers });  
        });             
      },
      (error) => {
        console.log(error)
      }
    )
  }

  selectEventModulo(e){

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

  onSelectionChanged() {
    var selectedRows = this.gridApi.getSelectedRows();
    this.API = selectedRows[0]
    
  }

  async AsignarAPI(){
    console.log ( this.xparametro)
    this.API.nombre = this.xnombre
    this.API.parametros = this.xparametro
    console.log(this.API)
    this.rowData.push(this.API)
    this.xnombre = ''
    this.xparametro = ''
  }

  activarFormulario(content){
    if(this.xnombre == ''){
      this.toastrService.info(
        'Debe definir un nombre para la prueba',
        `Code-Epic ESB`
      )
      return false
    }
    this.modalService.open(content, {centered: true, size: 'lg', ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;

    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
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
    this.stlFile = "none"
    if (this.tipo == "2") this.stlFile = ""
    
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
    console.log(args.step);
  }
 
  
 
  isValidFunctionReturnsBoolean(args: StepValidationArgs) {
    var valor = true;
    if(this.app == ''){
    //   this.ngWizardService.next();
    // }else{
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
