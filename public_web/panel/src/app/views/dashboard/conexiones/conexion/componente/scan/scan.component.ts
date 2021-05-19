import { Component, OnInit } from '@angular/core';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import JSONFormatter from 'json-formatter-js';
import { ConexionService } from '../../../../../../servicios/conexiones/conexion.service';

@Component({
  selector: 'app-scan',
  templateUrl: './scan.component.html',
  styleUrls: ['./scan.component.css']
})
export class ScanComponent implements OnInit {

  data : any
  closeResult = '';
  loading = false;
  xrs = ''

  constructor(private modalService: NgbModal, private conexionService : ConexionService) { }

  agInit(params){
    this.data = params.data
  }

  ngOnInit(): void {
  }

  activarFormulario(content) {
    var item = this.data;
    console.log(item);
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

  async ScanRed(){
    this.loading = true;
    
    await this.conexionService.ScanNmap(this.data.host).subscribe(
      (data)=>{
        console.log(data)
        this.xrs = data.msj
        this.loading = false;
      },
      (errot)=>{
        this.loading = false
        console.error(errot)
      }
    )
  }
}
