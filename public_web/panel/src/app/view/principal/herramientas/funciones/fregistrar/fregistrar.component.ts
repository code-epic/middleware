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
  selector: 'app-fregistrar',
  templateUrl: './fregistrar.component.html',
  styleUrls: ['./fregistrar.component.scss']
})
export class FregistrarComponent implements OnInit {

  public nombre : string = ''
  public version : string = ''
  public lenguaje : string = 'S'
  public tipo : string = 'S'
  public categoria : string = 'S' 

  public contenido : string = 'S' 

  public descripcion : string = ''
  public retorno : string = ''

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


  constructor(  private comunicacionesService : ComunicacionesService,
    private apiService : ApiService, 
    private modalService: NgbModal, 
    private ngWizardService: NgWizardService,               
    private toastrService: ToastrService,
    private ngxService: NgxUiLoaderService) {
     

     }

  ngOnInit(): void {
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
    
    if( this.nombre != '' && this.descripcion != '' && this.lenguaje != 'S' ){ 
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


  async Guardar() {

    // this.Obtener()

    // if(this.xAPI.funcionalidad == '' || this.xAPI.descripcion == '' ){ 
    //  this.toastrService.warning(
    //    'Debe registrar todos los campos requeridos',
    //    `CodeEpic Middleware`
    //  );
    //  return false
    // }

    // this.ngxService.startLoader("loader-registrar");
    // var jsonG = {};
    // var sApi = 'gapihtml';
    
    

    // if (this.archivo == "0"){
    //  jsonG = {
    //     "coleccion": "apicore",
    //     "relacional": this.relacional?true:false,
    //     "tipo": 'INSERT',
    //     "entorno": 'produccion',
    //     "valores": this.xAPI
    //   };
    //   sApi = 'crud';
    // }else{
    //   jsonG = {
    //     "modulo": this.modulo,
    //     "archivo": this.archivo,
    //     "ApiCore": this.xAPI
    //   };
    }
}
