import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ChartsModule } from 'ng2-charts';
import { AuthGuardGuard } from '../../service/seguridad/auth-guard.guard';
import { EventosComponent } from './aplicaciones/eventos/eventos.component';
import { MenuComponent } from './aplicaciones/menu/menu.component';
import { SotfwareComponent } from './aplicaciones/sotfware/sotfware.component';
import { ApiComponent } from './herramientas/api/api.component';
import { FuncionesComponent } from './herramientas/funciones/funciones.component';
import { CerrarComponent } from './opciones/cerrar/cerrar.component';
import { PrincipalComponent } from './principal.component';
import { ComunicacionesComponent } from './redes/comunicaciones/comunicaciones.component';
import { ConexionesComponent } from './redes/conexiones/conexiones.component';
import { MonitoreoComponent } from './redes/monitoreo/monitoreo.component';


export const routes: Routes = [
  {
    path: 'principal',
    component: PrincipalComponent,
    canActivate:[AuthGuardGuard],
    data: {
      title: 'Login'
    }
  },
  {
    path: 'redes',
    data: {
      title: 'Redes'
    },
    children: [
      {
        path: 'comunicaciones',
        component: ComunicacionesComponent,
        canActivate:[AuthGuardGuard],
      },
      {
        path: 'conexiones',
        component: ConexionesComponent,
        canActivate:[AuthGuardGuard]
      },
      {
        path: 'monitoreo',
        component: MonitoreoComponent,
        canActivate:[AuthGuardGuard]
      }
    ]
  },
  {
    path: 'herramientas',
    data: {
      title: 'Herramientas'
    },
    children: [
      {
        path: 'api',
        component: ApiComponent,
        canActivate:[AuthGuardGuard],
      },
      {
        path: 'funciones',
        component: FuncionesComponent,
        canActivate:[AuthGuardGuard],
      }
    ]
  },
  {
    path: 'aplicaciones',
    data: {
      title: 'Aplicaciones'
    },
    children: [
      {
        path: 'instalar',
        component: SotfwareComponent,
        canActivate:[AuthGuardGuard],
      },
      {
        path: 'menu',
        component: MenuComponent,
        canActivate:[AuthGuardGuard]
      },
      {
        path: 'monitoreo',
        component: MonitoreoComponent,
        canActivate:[AuthGuardGuard]
      },
      {
        path: 'eventos',
        component: EventosComponent,
        canActivate:[AuthGuardGuard]
      }
    ]
  },
  {
    path: 'opciones',
    data: {
      title: 'Opciones'
    },
    children: [
      {
        path: 'cerrar',
        component: CerrarComponent,
        canActivate:[AuthGuardGuard],
      }
    ]
  },
  { path: '**', component: PrincipalComponent }
];

@NgModule({
  imports: [
    ChartsModule,
    RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PrincipalRoutingModule { }
