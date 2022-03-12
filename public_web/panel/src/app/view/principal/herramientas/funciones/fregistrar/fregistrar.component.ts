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
  public entrada : string = 'S' 
  public esquemaEntrada : string = '' 
  public salida : string = 'S' 
  public esquemaSalida : string = '' 


  public contenido : string = '' 

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

  codeMirrorOptions: any = {
    theme: 'idea',
    mode: 'text/x-idn',
    lineNumbers: true,
    lineWrapping: true,
    foldGutter: true,
    gutters: ['CodeMirror-linenumbers', 'CodeMirror-foldgutter', 'CodeMirror-lint-markers'],
    autoCloseBrackets: true,
    matchBrackets: true,
    lint: true,
    indentUnit: 2,
    tabSize: 2,
    indentWithTabs: true
  };
  codeMOEsquemaJson: any = {
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


  constructor(  private comunicacionesService : ComunicacionesService,
    private apiService : ApiService, 
    private modalService: NgbModal, 
    private ngWizardService: NgWizardService,               
    private toastrService: ToastrService,
    private ngxService: NgxUiLoaderService) {
     

  }

  setEditorContent(event) {
    // console.log(event, typeof event);
    console.log(this.contenido);
  }

  ngOnInit(): void {
  }

  cambiarModo(){
    var idioma = 'text/x-idn'
    switch (this.lenguaje)  {
      case "GO":
        idioma = 'text/x-go'
        break;
      case "PHP":
        idioma = 'text/x-php'
        break;
      case "RDN":
        idioma = 'text/x-idn'
        break;    
    }
    
    this.codeMirrorOptions.mode = idioma
    
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
