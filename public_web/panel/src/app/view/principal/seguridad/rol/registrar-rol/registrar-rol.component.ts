import { Component, OnInit } from '@angular/core';
import { ApiService, IAPICore } from '../../../../../service/apicore/api.service';



@Component({
  selector: 'app-registrar-rol',
  templateUrl: './registrar-rol.component.html',
  styleUrls: ['./registrar-rol.component.scss']
})
export class RegistrarRolComponent implements OnInit {

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

  aplicacion :string = ''
  rowDataAcc: any
  rowDataSub: any
  closeResult : string  = ''
  lstApps = []

  keyword = 'name'
  dataModulo = []
  datamenu = []

  colormenu = "btn-success"
  modulo    : string = ''
  xmodulo   : string = ''
  moduloid  : string = ''
  menu      : string = '' //id
  menuid    : string = ''
  accionid  : string = ''
  xmenu     : string = '' //nombre
  xnombre   : string = '' //nombre
  xurl      : string = ''
  xjs       : string = ''
  xcss      : string = ''
  xcolor    : string = ''
  xicono    : string = ''
  
  xestatus  : string = '1'

  metodo    : string = '0'
  nombre    : string = ''
  funcion   : string = ''
  endpoint  : string = ''
  directiva : string = ''
  

  divSubAcciones = 'none'
  private bGuardar : boolean = false



  constructor(private apiService : ApiService) { }

  ngOnInit(): void {
    this.lstAplicaciones()
  }

  async lstAplicaciones(){
    this.xAPI.funcion = "LstAplicaciones";
    this.xAPI.valores = null;
    await this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        // console.info(data)
        this.lstApps = data.Cuerpo
      },
      (error) => {
        console.error(error)
      }
    )
  }

  selModulo() : void {
    this.xAPI.funcion = "LstModulos";
    this.xAPI.parametros = this.aplicacion;
    this.dataModulo = [];
    this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        data.Cuerpo.forEach(e => {          
          this.dataModulo.push({ id: e.id, name: e.nomb  })
        });             
      },
      (error) => {
        console.log(error)
      }
    )
  }

  selectEventModulo(item) {
    this.moduloid = item.id;
    this.modulo = item.name;
    this.consultarMenu()
  }

  onFocusedModulo(item) {
    this.moduloid = '';
    this.modulo = '';
  }

  onFocusedMenu(item) {
    if( this.moduloid == '' ) this.guardarModulo()
    this.menu =  ''
    this.menuid = ''
  }

  selectEventMenu(item) {
    this.menu =  item.name
    this.menuid = item.id
  }

  guardarModulo(){
    this.xAPI.parametros =  this.xmodulo + "," + this.aplicacion
    this.xAPI.funcion = "AgregarModulo"
    this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
       this.moduloid = data.msj
      },
      (error) => {
        console.log(error)
      }
    )
  }

  selectEventUrl(item) {
    this.xurl = item.name;
  }

  consultarMenu(acc : string = ''){
    this.xAPI.funcion = "LstMenus"
    
    this.xAPI.parametros = this.moduloid
    this.xnombre = this.menu
    this.datamenu = []
    this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        console.log(data)
        data.Cuerpo.forEach(e => {          
          this.datamenu.push({id: e.id, name: e.nomb });  
        });       
      },
      (error) => {
        console.log(error)
      }
    )
  }

  OMenuAccion(){
    this.bGuardar = true
    this.colormenu = "btn-warning"
    if ( this.menuid == '' ) {
      this.xnombre = this.menu
      this.colormenu = "btn-success"
      return
    }
    this.xAPI.funcion = "OMenuAccion"
    this.xAPI.parametros = this.menuid
    this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        var i = 0
        var lista = []
        data.Cuerpo.forEach(e => {    
          if(i == 0 ) {
            this.xnombre = e.nomb     
            this.xurl = e.url 
            this.xjs = e.js
            this.xcss = e.clase
            //this.xicon = e.icon
            //this.xcolor  = e.color
            this.xestatus = e.type
          }
          if ( e.endpoint != undefined ){
            lista.push(e)
          }
          console.log(e)
        });       
        
        this.rowDataAcc = lista;  
      },
      (error) => {
        console.log('')
      }
    )
  }


}
