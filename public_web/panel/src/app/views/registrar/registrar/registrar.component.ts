import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CarouselConfig } from 'ngx-bootstrap/carousel';

@Component({
  selector: 'app-dashboard',
  templateUrl: './registrar.component.html',
  styleUrls: ['./registrar.component.css'],
  providers: [
    { provide: CarouselConfig, useValue: { interval: 1500, noPause: false } },
  ]
})
export class RegistrarComponent implements OnInit {
  myInterval: number | false = 6000;
  lblcedula = '';
  componente = 'X';
  titular = 'X';
  
  constructor(private router: Router) { }

  ngOnInit(): void {
  }
  continuar(){
    this.router.navigate(['login']);
  }

  seleccionarTipo(valor : string){
    switch (valor) {
      case "TIT":
        this.lblcedula = 'Cédula del titular';
        break;
      case "SOB":
        this.lblcedula = 'Cédula del sobreviviente';
        break;
      case "SOB-TIT":
        this.lblcedula = 'Cédula del titular - sobreviviente ';
        break;
      default:
        break;
    }
  }
}
