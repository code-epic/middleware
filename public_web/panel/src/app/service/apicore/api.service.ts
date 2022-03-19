import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';



export interface IAPICore{
  id            ?:  string
  concurrencia  ?:  boolean
  ruta          ?:  string
  funcion       ?:  string
  parametros    ?:  string
  protocolo     ?:  string
  retorna       ?:  boolean
  migrar        ?:  false
  modulo        ?:  string
  relacional    ?:  boolean
  valores       ?:  any
  coleccion     ?:  string
  version       ?:  string
  http          ?:  number
  https         ?:  number
  consumidores  ?:  string
  puertohttp    ?:  number
  puertohttps   ?:  number
  driver        ?:  string
  query         ?:  string
  metodo        ?:  string
  tipo          ?:  string
  prioridad     ?:  string
  logs          ?:  boolean
  descripcion   ?:  string
  entorno       ?:  string
  cache         ?:  number
  estatus       ?:  boolean
  categoria     ?:  string
  entradas      ?:  string
  salidas       ?:  string
  funcionalidad ?:  string
}

export interface ObjectoGenerico {
  idw : number,
  nomb : string,
  obse : string
}

@Injectable({
  providedIn: 'root'
})
export class ApiService {
   //Dirección Get para servicios en la página WEB
   URL =  environment.API;

   hash = ':c521f27fb1b3311d686d511b668e5bd4'

   httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + sessionStorage.getItem('token') })
  };

  constructor(private router: Router, private http : HttpClient) {
    
  }

  Guardar(xAPI : IAPICore, sApi : string) : Observable<any>{
    console.log(xAPI);
    var url = this.URL + sApi + this.hash;
    return this.http.post<any>(url, xAPI, this.httpOptions);
  }

  Listar() : Observable<any>{
    var url = this.URL + 'listar';
    return this.http.get<any>(url, this.httpOptions);
  }
  
  //Ejecutar Api generales
  Ejecutar(xAPI : IAPICore) : Observable<any>{
    var url = this.URL + "crud" + this.hash;
    // if( xAPI.valores  != undefined ){
    //     xAPI.valores = JSON.parse(xAPI.parametros);
    // } 
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
