import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cerrar',
  templateUrl: './cerrar.component.html',
  styleUrls: ['./cerrar.component.scss']
})
export class CerrarComponent implements OnInit {

  constructor(private ruta : Router) { }

  ngOnInit(): void {
  }

  cerrar(){
    sessionStorage.removeItem("token")
    this.ruta.navigate(["", ""])
  }
}
