import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';
import { ApiService, IAPICore } from '../../../../service/apicore/api.service';
import { RegistrarComponent } from './registrar/registrar.component'

import JSONFormatter from 'json-formatter-js';


declare var $: any;

@Component({
  selector: 'app-api',
  templateUrl: './api.component.html',
  styleUrls: ['./api.component.scss']
})

export class ApiComponent implements OnInit {


  @ViewChild(RegistrarComponent) registraApi: RegistrarComponent

  public focus;


  public developer = []
  public testing = []
  public quality = []
  public production = []
  public tabPosicion = 0

  lst = []

  lengthOfi = 0;
  pageSizeOfi = 10;
  pageSizeOptions: number[] = [5, 10, 25, 100];
 
  sectionConsultar = ''
  sectionRegistar = 'none'

  data : any;
  resultado: any;
  xresultado: any;
  xparametro : string = ''
  closeResult : string  = ''
  xAPI : IAPICore;
  xentorno : string = ''
  pageEvent : any
  valores : string = ''

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


  constructor(
    private apiService : ApiService, 
    private ruta: Router, 
    private modalService: NgbModal, 
    private toastrService: ToastrService) {
  }

  ngOnInit(): void {
    //document.getElementById('duracion').innerHTML = this.duracion;
   
    this.ListarApis()
   
  }

  seleccionEditor(e){
    
  }

  setEditorContent(event) {
    this.xparametro = ''
    
  }

  seccionRegistrar( valor ){
    if (valor != '') {
      this.sectionConsultar = ''
      this.sectionRegistar = 'none'
    }else{
      this.sectionConsultar = 'none'
      this.sectionRegistar = ''

    }
  }

  ListarApis(){
    this.apiService.Listar().subscribe(
      (data) => {
        data.forEach(e => {
          switch (e.entorno) {
            case "desarrollo":
              this.developer.push(e)
              break;
            case "calidad":
              this.quality.push(e)
              break;
            case "produccion":
              this.production.push(e)
              break;
            default:
              break;
          }
        });
        this.CargarListadoAPI(0)
      },
      (error) => {
        console.log(error)
      }
     );
  }

  CargarListadoAPI(e){
    this.tabPosicion = e
    this.lengthOfi = 0;
    this.pageSizeOfi = 10;
    this.pageSizeOptions = [5, 10, 25, 100];
    this.recorrerElementos(0)
  }

  pageChangeEvent(e){
    
    this.recorrerElementos(e.pageIndex+1)
  }

  //recorrerElementos para paginar listados
  recorrerElementos(posicion : number){
    if (posicion > 1) posicion = posicion * 10
    switch (this.tabPosicion) {
      case 0:
        this.lengthOfi = this.developer.length
        this.lst = this.developer.slice(posicion, posicion + this.pageSizeOfi)
        break;
      case 1:
        this.lengthOfi = this.quality.length
        this.lst = this.quality.slice(posicion, posicion + this.pageSizeOfi)
        break;
      case 2:
        this.lengthOfi = this.production.length
        this.lst = this.production.slice(posicion, posicion + this.pageSizeOfi)
        break;
      default:
        break;
    }
  }

 



  activarFormulario(content, item) {
    
    console.log(item)

    this.modalService.open(content, {
      centered: true, 
      size: 'lg', 
      ariaLabelledBy: 'modal-basic-title'
    }).result.then(
      (result) => {
        this.closeResult = `Closed with: ${result}`;
      }, (reason) => {
        this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
    var api = item.entorno=="produccion"?"/v1/":"/devel/"
    this.xentorno =  api + "api/crud:" + item.id;
    this.data = item
  }
 
  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'backdrop';
    } else {
      return `with: ${reason}`;
    }
  }

  async ejecutarApi(){

    this.xAPI = this.data;
    this.xAPI.parametros = this.xparametro
    this.xAPI.valores = this.valores
    console.log(this.xAPI);
    await this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {        
        const formatter = new JSONFormatter(data);
        document.getElementById("xrs").appendChild(formatter.render());       
      },
      (error) => {
        this.resultado = error;
      }
    )
  }



}
