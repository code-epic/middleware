import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ApiService } from '../../../../../../service/apicore/api.service';

@Component({
  selector: 'app-accion',
  templateUrl: './accion.component.html',
  styleUrls: ['./accion.component.scss']
})
export class AccionComponent implements OnInit {
  
  data : any;
  constructor( private modalService: NgbModal, private apiService: ApiService) { }

  agInit(params){
    this.data = params.data;
    
  }

  ngOnInit(): void {
  }
  

}
