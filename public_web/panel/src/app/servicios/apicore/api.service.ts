import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';


export interface IAPICore{
  concurrencia ?: boolean;
  ruta ?: string;
  funcion ?: string;
  parametros ?: string;
  protocolo?: string;
  retorna ?: boolean;
  migrar ?: false;
  modulo ?: string;
  relacional ?: boolean;
  valores ?: any;
  coleccion ?: string;
  http ?: number;
  https ?: number;
  consumidores ?: string;
  puertohttp ?: number;
  puertohttps ?: number;
  driver ?:string;
  query ?: string;
  metodo ?: string;
  tipo ?: string;
  prioridad ?: string;
  logs ?: boolean;
  descripcion?: string;
  entorno?: string;
  cache ?: number;
  estatus?: boolean;
}


@Injectable({
  providedIn: 'root'
})
export class ApiService {
   //Dirección Get para servicios en la página WEB
   URL =  '/v1/api/';

   httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + sessionStorage.getItem('token') })
  };

  constructor(private router: Router, private http : HttpClient) {
   
  }

  Guardar(xAPI : IAPICore, sApi : string) : Observable<any>{
    console.log(xAPI);
    var url = this.URL + sApi;
    return this.http.post<any>(url, xAPI, this.httpOptions);
  }

  Listar() : Observable<any>{
    var url = this.URL + 'listar';
    //console.log(url, this.httpOptions);
    return this.http.get<any>(url, this.httpOptions);
  }
  
  //Ejecutar Api generales
  Ejecutar(xAPI : IAPICore) : Observable<any>{
    var url = this.URL + "crud";
    if( xAPI.valores  != undefined ){
        xAPI.valores = JSON.parse(xAPI.parametros);
    } 
    console.info("Ejecucion ", xAPI);
    return this.http.post<any>(url, xAPI, this.httpOptions);
  }

  //ListarModulos
  ListarModulos() : Observable<any>{
    var url = this.URL + "lmodulos";
    return this.http.get<any>(url, this.httpOptions )
  }

  //ListarArchivos
  ListarArchivos(id : string) : Observable<any>{
    var url = this.URL + "larchivos/" + id;
    return this.http.get<any>(url, this.httpOptions )
  }

  //ListarArchivos
  ProcesarArchivos(obj : any) : Observable<any>{
    var url = this.URL + "phtml";
    return this.http.post<any>(url, obj, this.httpOptions )
  }



}
