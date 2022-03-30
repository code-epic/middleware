
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IAPICore } from '../apicore/api.service';




/**
 * INSERT INTO `SEC_001_Aplicacion`( `type`, `serv`, `nomb`, `vers`, `sope`, `db`, `idio`, `obse`, `user`) 
 * VALUES ('$0','$1','$2','$3','$4','$5','$6','$7','$8');
 */
export interface IAplicacion {
  id ?: string
  type ?: string
  serv ?: string
  nomb ?: string
  vers ?: string
  sope ?: string //Sistema Operativo
  db ?: string //Base de datos
  idio ?: string //Lenguaje de Programacion
  obse ?: string //Comentarios del sistemaoperativo
  user ?: string //Rol creador del sistema
}

/**
 * 
 */
export interface IAApi {
  id    ?: string
  nomb  ?: string
  func  ?: string
  descr ?: string
  param ?: string
  esta  ?: number
  idapp  : number
}

@Injectable({
  providedIn: 'root'
})

export class SoftwareService {


  constructor() {
   
  }

 


}
