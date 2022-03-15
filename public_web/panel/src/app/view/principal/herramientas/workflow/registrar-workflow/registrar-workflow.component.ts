import { Component, OnInit } from '@angular/core';
import { ApiService, IAPICore } from '../../../../../service/apicore/api.service';



@Component({
  selector: 'app-registrar-workflow',
  templateUrl: './registrar-workflow.component.html',
  styleUrls: ['./registrar-workflow.component.scss']
})
export class RegistrarWorkflowComponent implements OnInit {

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

  lstApps = []
  dataModulo = []
  aplicacion :string = ''

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

}
