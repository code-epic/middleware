import { Component, OnInit } from '@angular/core';
import { ApiService, IAPICore, ObjectoGenerico } from '../../../../../service/apicore/api.service';
import Swal from 'sweetalert2';
import { WorkflowService } from '../../../../../service/workflow/workflow.service';


@Component({
  selector: 'app-estados',
  templateUrl: './estados.component.html',
  styleUrls: ['./estados.component.scss']
})
export class EstadosComponent implements OnInit {

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


  public xObj : ObjectoGenerico = {
    nomb: '',
    obse: '',
    idw: 0
  }

  xidW : number = 0

  rowEstado : []


  constructor( private apiService : ApiService,
    private wkf : WorkflowService ) { }

  ngOnInit(): void {
    this.wkf.msjText$.subscribe(e => {
      this.lstEstados(e)
      this.xidW = parseInt(e)
    })
  }

  lstEstados(idw : string) : any {
    this.xAPI.funcion = 'Wk_SEstado'
    this.xAPI.parametros = idw
    this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        this.rowEstado = data.Cuerpo
      },
      (err) => {
        console.error(err)
      }
    )
  }

  deleteEstado(id: any) {
    Swal.fire({
      title: 'Esta seguro?',
      text: "de eliminar este registro!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si, Eliminarlo!'
    }).then((result) => {
      if (result.isConfirmed) {
        this.xAPI.funcion = 'Wk_DEstado'
        this.xAPI.parametros = id
        this.apiService.Ejecutar(this.xAPI).subscribe(
          (data) => {
            console.log(data)
          },
          (err) => {
            console.error(err)
          }
        )
      }
    }) 
  }

  Guardar(): any {
    this.xAPI.funcion = 'Wk_IEstados'
    this.xObj.idw = this.xidW
    this.xAPI.valores = JSON.stringify(this.xObj)
    this.apiService.Ejecutar(this.xAPI).subscribe(
      (data) => {
        console.log(data)
      },
      (err) => {
        console.error(err)
      }
    ) 
  }

}
