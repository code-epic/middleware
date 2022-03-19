import { Component, OnInit, ViewChild, Output, EventEmitter } from '@angular/core';
import { EstadosComponent } from './estados/estados.component';
import { RegistrarWorkflowComponent } from './registrar-workflow/registrar-workflow.component';
import { TransicionesComponent } from './transiciones/transiciones.component';


@Component({
  selector: 'app-workflow',
  templateUrl: './workflow.component.html',
  styleUrls: ['./workflow.component.scss'],
})
export class WorkflowComponent implements OnInit {

  @Output() newItemEvent = new EventEmitter<any>();
  idWData = "Padre le envia dinero al Hijo"

  @ViewChild(RegistrarWorkflowComponent) registrarWorkFlow: RegistrarWorkflowComponent
  @ViewChild(EstadosComponent) estadosWorkFlow: EstadosComponent
  @ViewChild(TransicionesComponent) transicionesWorkFlow: TransicionesComponent

  
  constructor() { }
  

  ngOnInit(): void {
  }


}
