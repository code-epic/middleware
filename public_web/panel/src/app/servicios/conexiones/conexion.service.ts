import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';



export interface Conexion{
  id ?: string
  host ?: string
  mac ?: string
  tipo ?: string
  descripcion ?: string
  estatus ?: boolean
}
export interface IConexion{
  coleccion ?: string
  objeto ?: Conexion
}

@Injectable({
  providedIn: 'root'
})
export class ConexionService {
   //Dirección Get para servicios en la página WEB
   URL =  '/v1/api/';

   httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + sessionStorage.getItem('token') })
  };

  constructor(private router: Router, private http : HttpClient) { 

  }

  Guardar(xCon : IConexion, sApi : string) : Observable<any>{
    console.log(xCon);
    var url = this.URL + sApi;
    return this.http.post<any>(url, xCon, this.httpOptions);
  }

  Listar() : Observable<any>{
    var url = this.URL + 'lcoleccion/sys-conection';
    return this.http.get<any>(url, this.httpOptions);
  }

  ListarDrivers() : Observable<any>{
    var url = this.URL + 'drivers';
    return this.http.get<any>(url, this.httpOptions);
  }

  ScanMac(sip : string) : Observable<any>{
    var url = this.URL + 'sh';
    var xCon = {
      script: "getmac.sh",
      flag: "",
      ip: sip
    }
    return this.http.post<any>(url, xCon, this.httpOptions);
  }

  ScanNmap(sip : string) : Observable<any>{
    var url = this.URL + 'sh';
    var xCon = {
      script: "getscan.sh",
      flag: "",
      ip: sip
    }
    return this.http.post<any>(url, xCon, this.httpOptions);
  }

  

}
