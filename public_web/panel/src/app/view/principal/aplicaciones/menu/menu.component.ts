import { Component, OnInit } from '@angular/core';
import { NgbModal, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { IAPICore } from '../../../../service/apicore/api.service';
import { SoftwareService } from '../../../../service/aplicaciones/software.service';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent implements OnInit {

  columnDefsAcc = [
    { field: "#", width: 50},
    { field: "Nombre"},
    { field: "Funcion"},
    { field: "EndPoint"},
  ];

  columnDefsSub = [
    { field: "#", width: 50},
    { field: "Nombre"},
    { field: "Clase"},
    { field: "Estatus"},
  ];

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

  aplicacion :string = ""
  rowDataAcc: any
  rowDataSub: any
  closeResult : string  = '';
  lstApps = []

  keyword = 'name';
  dataModulo = [];
  modulo : string = ""
  menu : string = "" //id
  menuid : string = ""
  accionid : string = ""
  xmenu : string = "" //nombre
  xnombre : string = "" //nombre
  xurl  : string = ""
  xjs  : string = ""
  xcss : string = ""
  xcolor: string = ""
  xestatus : string = "1"

  metodo: string = ""
  nombre: string = ""
  funcion: string = ""
  endpoint : string = ""
  directiva : string = ""
  

  divSubAcciones = 'none'

  constructor(private modalService: NgbModal, private softwareService : SoftwareService) { }

  ngOnInit(): void {
    
    this.lstAplicaciones()


  }


  async lstAplicaciones(){
    this.xAPI.funcion = "LstAplicaciones";
    this.xAPI.valores = null;
    await this.softwareService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        
        this.lstApps = data
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
    this.softwareService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        data.forEach(e => {          
          this.dataModulo.push({id: e.id, name: e.nomb + " | " + e.descr });  
        });             
      },
      (error) => {
        console.log(error)
      }
    )
  }




  selectEventModulo(item) {
    this.modulo = item.id;
    this.consultarMenu()
  }
  selectEventMenu(item) {
    this.menu = item.id;
    this.xmenu = item.name;
  }

  selectEventUrl(item) {
    console.log(item)
    this.xurl = item.name;
  }


  consultarMenu(){
    
    this.xAPI.funcion = "LstMenus";
    this.xAPI.parametros = this.modulo;
    
    

    this.softwareService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        console.log(data);
      },
      (error) => {
        console.log(error)
      }
    )
  }

  GuardarMenu(){
    this.xAPI.funcion = "AgregarMenu";

    this.xAPI.parametros = this.xurl + "," + this.xjs + ",icon-test,"+ this.xnombre + ","
    this.xAPI.parametros +=  this.xcss + "," + this.xcolor + "," + this.xestatus + "," + this.modulo
    this.dataModulo = [];
    console.log(this.xAPI)
    
    this.softwareService.Ejecutar(this.xAPI).subscribe(
      (data) => {
       console.info(data)     
      },
      (error) => {
        console.log(error)
      }
    )
  }





  AccionesGuardar(){
    this.xAPI.funcion = "AgregarAccion";

    this.xAPI.parametros = this.endpoint + "," + this.nombre + ","+ this.funcion + "," + this.directiva 
    
    
    
    this.softwareService.Ejecutar(this.xAPI).subscribe(
      (data) => {
       console.info(data) 
        
      },
      (error) => {
        console.log(error)
      }
    )
  }

  MenuAccionGuardar(){
    this.xAPI.funcion = "AgregarAccionMenu";

    this.xAPI.parametros = this.menuid + "," + this.accionid
    this.softwareService.Ejecutar(this.xAPI).subscribe(
      (data) => {
       console.info(data) 

      },
      (error) => {
        console.log(error)
      }
    )
  }

  modalAccion(content){
    this.modalService.open(content, {centered: true, size: 'lg', ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;

    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
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


}
