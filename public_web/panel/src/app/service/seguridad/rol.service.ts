import { Injectable } from '@angular/core';



export interface IRol{
  nombre: string,
  descripcion: string,
  Menu : Menu[], 
}


export interface Aplicacion{
  id ?: string,
  nombre: string,
  url: string,
  comentario: string,
  version: string,
  autor: string,
  Rol ?: IRol
}

export interface Modulo{
  nombre: string,
  descripcion: string,
  Privilegios ?: Privilegios[],
  Menu : Menu[], 
 
}


export interface SubMenu{
  url: string,
  js: string,
  icono: string,
  descripcion: string,
  nombre: string,
  accion: string,
  clase: string,
  color: string,
  Privilegios ?: Privilegios[]
  //SubMenu: []
}

export interface Menu{
  url: string,
  js: string,
  icono: string,
  descripcion: string,
  nombre: string,
  accion: string,
  clase: string,
  color: string,
  Privilegios ?: Privilegios[],
  SubMenu ?: SubMenu[]
}

export interface Privilegios{
  metodo: string,
  descripcion: string,
  accion: string,
  directivas: string
}



@Injectable({
  providedIn: 'root'
})
export class RolService {

  constructor() { }
}
