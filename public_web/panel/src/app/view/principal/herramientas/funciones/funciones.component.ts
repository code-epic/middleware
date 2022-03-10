import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';
import { ApiService, IAPICore } from '../../../../service/apicore/api.service';

import JSONFormatter from 'json-formatter-js';


declare var $: any;
import { FregistrarComponent } from './fregistrar/fregistrar.component'

@Component({
  selector: 'app-funciones',
  templateUrl: './funciones.component.html',
  styleUrls: ['./funciones.component.scss']
})
export class FuncionesComponent implements OnInit {

  lst = []
  public focus;
  lengthOfi = 0;
  pageSizeOfi = 10;
  pageSizeOptions: number[] = [5, 10, 25, 100];
 
  sectionConsultar = ''
  sectionRegistar = 'none'

  contenido = ''

  data : any;
  @ViewChild(FregistrarComponent) fregistraApi: FregistrarComponent

  constructor( private apiService : ApiService, 
    private ruta: Router, 
    private modalService: NgbModal, 
    private toastrService: ToastrService) { 


    }

  ngOnInit(): void {
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

}
