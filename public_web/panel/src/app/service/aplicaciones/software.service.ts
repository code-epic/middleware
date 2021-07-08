
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IAPICore } from '../apicore/api.service';

export interface IAplicaion {
  id ?: string
  type ?: string
  serv ?: string
  nomb ?: string
  vers ?: string
}
@Injectable({
  providedIn: 'root'
})

export class SoftwareService {
  URL =  '/v1/api/';

  

  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + sessionStorage.getItem('token') })
  };
  constructor(private http : HttpClient) {
   
  }


  
  Ejecutar(xapi : IAPICore) : Observable<any>{
    var url = this.URL + 'crud';
    return this.http.post<any>(url, xapi, this.httpOptions );
  }




}
