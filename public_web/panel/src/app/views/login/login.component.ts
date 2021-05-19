import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import {NgForm} from '@angular/forms';
import { IToken, LoginService } from '../../servicios/seguridad/login.service';


@Component({
  selector: 'app-dashboard',
  templateUrl: 'login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit{ 
  redirectDelay: number;
  showMessages: any;
  strategy: string;
  errors: string[];
  messages: string[];
  usuario : string;
  clave: string;

  submitted: boolean;
  rememberMe: boolean;

  loading = false;
  isHidden: boolean = true;
  public iToken: IToken = {
    token: '',
  };

  public itk: IToken;
  private index: number = 0;
  
  constructor(private router: Router, private loginService: LoginService, private toastrService: ToastrService){
    if (sessionStorage.getItem("token") != undefined ){
      this.router.navigate(['principal']);
    }
  }

  ngOnInit() {
    
  }


  async login(position, status){
    this.loading = true;
    await this.loginService.getLogin(this.usuario, this.clave).subscribe(
      (data) => { // Success
        this.itk = data;
        sessionStorage.setItem("token", this.itk.token );
        this.loading = false;
        this.isHidden = false;
        this.router.navigate(['principal']);
        
      },
      (error) => {
        this.loading = false;
        this.isHidden = false;

        this.toastrService.show(
          'Error al acceder a los datos de conexion',
          `Bus Empresarial`
        );
      }
    );
  }


}
