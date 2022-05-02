import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { environment } from '../../../environments/environment';
import { CodeEpic, Configuracion } from 'code.epic.module'


export interface IUsuario {
  nombre: string,
  cedula: string,
  tipo: string,
  componente: string,
  clave: string,
  correo: string,
}

export interface IToken {
  token: string,
}

export interface UClave {
  login: string,
  clave: string,
  nueva: string,
  repetir: string,
  correo: string,
}

@Injectable({
  providedIn: 'root'
})



export class LoginService {
  //Dirección Get para servicios en la página WEB
  urlGet = '';

  public Epic: CodeEpic = new CodeEpic

  constructor(private router: Router, private http: HttpClient) {
    //environment.Url +
    this.urlGet = environment.API;
    var cf: Configuracion = {
      host: '',
      base: environment.API,
      puerto: '',
      token: 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc3VhcmlvIjp7ImlkIjoiNjBmOTdhZGVlMTM3MTZjNzUxZDE2MWE3IiwiY2VkdWxhIjoiMTcxNjE4MzciLCJub21icmUiOiJNYWlrb2wgRWNoZW5pcXVlIiwidXN1YXJpbyI6IkRFVjAwMSIsImNvcnJlbyI6IiIsImZlY2hhY3JlYWNpb24iOiIwMDAxLTAxLTAxVDAwOjAwOjAwWiIsImVzdGF0dXMiOjAsInRva2VuIjoiQXV0b3JpemFkbyIsIlBlcmZpbCI6eyJkZXNjcmlwY2lvbiI6IkRldmVsb3BtZW50In0sIkZpcm1hRGlnaXRhbCI6eyJkaXJlY2Npb25tYWMiOiIqIiwiZGlyZWNjaW9uaXAiOiIqIiwidGllbXBvIjoiMjAyMS0wNy0xNlQxOTowNzowNS44NTFaIn0sIkFwbGljYWNpb24iOlt7ImlkIjoiSVAtMDAxIiwibm9tYnJlIjoiQ29yZSBQb3N0YWwgVmVuZXpvbGFubyIsInVybCI6Imh0dHA6Ly9sb2NhbGhvc3Q6MjI4Ni9hcHAvaXBvc3RlbD90az0kMCIsIm9yaWdlbiI6IiIsImNvbWVudGFyaW8iOiJVc3VhcmlvIElwb3N0ZWwiLCJ2ZXJzaW9uIjoiVjEuMC4wLjAiLCJhdXRvciI6Ik1haWtvbCBFY2hlbmlxdWUiLCJSb2wiOnsiaWQiOiIiLCJub21icmUiOiIiLCJkZXNjcmlwY2lvbiI6IiIsIk1lbnUiOlt7Imljb25vIjoiZmFzIGZhLXRydWNrIiwibm9tYnJlIjoiT1BQIiwiZGVzY3JpcGNpb24iOiJPZmljaW5hIFBvc3RhbCBQcml2YWRhIiwiY2xhc2UiOiJ0cm4iLCJjb2xvciI6ImJnLXdhcm5pbmciLCJTdWJNZW51IjpbeyJpY29ubyI6ImZhcyBmYS1zaGlwcGluZy1mYXN0Iiwibm9tYnJlIjoiQnV6b24iLCJhY2Npb24iOiJDYXJnYXJVcmwoJ2N1ZXJwbycsICdpbmMvYnV6b24vYmFuZGVqYScpIiwiY2xhc2UiOiJidXpvbiIsImNvbG9yIjoiYmctd2FybmluZyIsIlByaXZpbGVnaW9zIjpbeyJub21icmUiOiJwZW5kaWVudGVzIiwiZGVzY3JpcGNpb24iOiJQZW5kaWVudGVzIiwiYWNjaW9uIjoiUGVuZGllbnRlcygpIiwiZGlyZWN0aXZhIjoiIn0seyJub21icmUiOiJwcm9jZXNhZG9zIiwiZGVzY3JpcGNpb24iOiJQcm9jZXNhZG9zIiwiYWNjaW9uIjoiUHJvY2VzYWRvcygpIiwiZGlyZWN0aXZhIjoiIn0seyJub21icmUiOiJjb25jaWxpYWRvcyIsImRlc2NyaXBjaW9uIjoiQ29uY2lsaWFkb3MiLCJhY2Npb24iOiJDb25jaWxpYWRvcygpIiwiZGlyZWN0aXZhIjoiIn1dfV19LHsiaWNvbm8iOiJmYXMgZmEtdHJ1Y2siLCJub21icmUiOiJDZW50cm8gTmFjaW9uYWwiLCJkZXNjcmlwY2lvbiI6IkNlbnRybyBOYWNpb25hbCBDb250cm9sIiwiY2xhc2UiOiJ0cm4iLCJjb2xvciI6ImJnLXByaW1hcnkiLCJTdWJNZW51IjpbeyJpY29ubyI6ImZhcyBmYS1zaGlwcGluZy1mYXN0Iiwibm9tYnJlIjoiT2ZpY2luYSBQb3N0YWwiLCJhY2Npb24iOiJDYXJnYXJVcmwoJ2N1ZXJwbycsICdpbmMvY25jL3JlZ2lzdHJvJykiLCJjbGFzZSI6Im9wdCIsImNvbG9yIjoiYmctc3VjY2VzcyIsIlByaXZpbGVnaW9zIjpbeyJub21icmUiOiJhY3R1YWxpemFyIiwiZGVzY3JpcGNpb24iOiJBY3R1YWxpemFyIiwiYWNjaW9uIjoiQWN0dWFsaXphck9QVCgpIiwiZGlyZWN0aXZhIjoiIn0seyJub21icmUiOiJyZXBvcnRlIiwiZGVzY3JpcGNpb24iOiJSZXBvcnRlcyIsImFjY2lvbiI6IlJlcG9ydGVzKCkiLCJkaXJlY3RpdmEiOiIifV19XX1dfX1dfSwiZXhwIjoxNjUxMTg2NzIwLCJpc3MiOiJDb2RlLUVwaWMgVGVjaG5vbG9naWVzIFN5c3RlbSJ9.jrzJeM54_GTgWIamMcztiTOCKpI9_AvrHp1O8Y_U1mE5OFwe7BrCGdN-iak5JtQOxXqqjtjrXLGxSeXg0c6-25XGTfTDyjHZWiaYLCROMG2SnaCXgtFSDt0vGn0MzeNJlthl5Ka5Cys24Qkb6CfMGzdVNiiHEmBBSdUn7llFsQA'
    }

    this.Epic.Instalar(cf)
      .then((rs) => {
        console.log(rs.data);
        console.log(rs.status);
        console.log(rs.statusText);
        //console.log(rs.headers);
        //console.log(rs.config);
      })
    // const wk = this.Epic.workFlow



  }

  getLogin(user: string, clave: string): Observable<IToken> {
    var usuario = {
      "nombre": user,
      "clave": clave,
    };
    var url = this.urlGet + 'wusuario/login';
    console.info(url)
    return this.http.post<IToken>(url, usuario);
  }

  makeUser(user: IUsuario): Observable<any> {
    var url = this.urlGet + 'identicacion';
    return this.http.post<any>(url, user);
  }

  logout() {
    this.router.navigate(['login']);
    sessionStorage.removeItem("token");
    sessionStorage.removeItem("id");
  }

  getUserDecrypt() {
    var e = sessionStorage.getItem("token");
    var s = e.split(".");
    return JSON.parse(atob(s[1]));
  }
}
