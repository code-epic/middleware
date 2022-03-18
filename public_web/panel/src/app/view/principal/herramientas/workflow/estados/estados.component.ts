import { Component, OnInit } from '@angular/core';
import { ApiService, IAPICore, ObjectoGenerico } from '../../../../../service/apicore/api.service';

@Component({
  selector: 'app-estados',
  templateUrl: './estados.component.html',
  styleUrls: ['./estados.component.scss']
})
export class EstadosComponent implements OnInit {


  public xAPI : IAPICore = {
    funcion : '',
    coleccion : '',
    valores : ''
  }


  public xObj : ObjectoGenerico = {
    nomb: '',
    obse: ''
  }
  constructor( private apiService : ApiService) { }

  ngOnInit(): void {
  }

  Guardar(): any {

    this.xAPI.funcion = 'Wk_IEstados'
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
