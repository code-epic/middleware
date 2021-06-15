import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { NgWizardConfig, NgWizardService, StepChangedArgs, StepValidationArgs, STEP_STATE, THEME } from 'ng-wizard';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { ApiService } from '../../../../servicios/apicore/api.service';
import { ConexionService } from '../../../../servicios/conexiones/conexion.service';


@Component({
  selector: 'app-sistema',
  templateUrl: './sistema.component.html',
  styleUrls: ['./sistema.component.css']
})
export class SistemaComponent implements OnInit {
 
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

  hosts = []
  host : string = '0'
  tipo : string = '0'
  xnombre: string  = ''
  sistemaoperativo : string = '0'
  basedatos : string = '0'
  lenguaje : string = '0'
  closeResult : string  = ''
  rowDataAPI = []
  columnDefsAPI = [
    { field: "funcion"},
    { field: "descripcion"},
    { field: "entorno"},
  ];

  rowData = []
  xrowData = []
  columnDefs = [
    { field: "Nombre"},
    { field: "Funcion"},
    { field: "Descripcion"},
    { field: "Parametros"},
    { field: "Isd"},
  ];

  
  afuConfig = {
    multiple: false,
    formatsAllowed: ".zip, .tar, .war",
    maxSize: "100",
    uploadAPI:  {
      url:"https://example-file-upload-api",
      method:"POST",
      headers: {
     "Content-Type" : "text/plain;charset=UTF-8",
     "Authorization" : `Bearer ${this.lenguaje}`
      },
      params: {
        'page': '1'
      },
      responseType: 'blob',
    },
    theme: " attachPin", //dragNDrop
    hideProgressBar: false,
    hideResetBtn: true,
    hideSelectBtn: false,
    fileNameIndex: true,
    replaceTexts: {
      selectFileBtn: 'Seleccionar la aplicación que desea instalar, en formato (zip, tar, o war)',
      resetBtn: 'Limpiar Formulario',
      uploadBtn: 'Subir archivo',
      dragNDropBox: 'Arrastrar y soltar',
      attachPinBtn: 'Seleccionar Archivos...',
      afterUploadMsg_success: 'El archivo subio con exito!',
      afterUploadMsg_error: 'Fallo la carga del archivo!',
      sizeLimit: 'Limite del Archivo '
    }
};
  private gridApi
  private gridColumnApi
  private defaultColDef
  private rowSelection
  public API
  public xparametro


  constructor(private apiService : ApiService,
              private modalService: NgbModal, 
              private conexionService : ConexionService, 
              private ruta: Router,  
              private ngWizardService: NgWizardService, 
              private toastrService: ToastrService) {

                this.defaultColDef = {
                  flex: 1,
                  minWidth: 100,
                };
                this.rowSelection = 'single';
  }

  ngOnInit(): void {
    this.ListarIP()
    this.ListarApis()
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
    if(this.xnombre == ""){
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
    
    await this.conexionService.Listar().subscribe(
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

  showPreviousStep(event?: Event) {
    this.ngWizardService.previous();
  }
 
  showNextStep(event?: Event) {
    this.ngWizardService.next();
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
 
  isValidTypeBoolean: boolean = true;
 
  isValidFunctionReturnsBoolean(args: StepValidationArgs) {
    return true;
  }
 
  isValidFunctionReturnsObservable(args: StepValidationArgs) {
    return of(true);
  }


 

}
