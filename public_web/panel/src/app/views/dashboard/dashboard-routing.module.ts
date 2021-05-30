import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ApiComponent } from './apicore/api/api.component';
import { ConexionComponent } from './conexiones/conexion/conexion.component';

import { DashboardComponent } from './dashboard.component';
import { DriverComponent } from './drivers/driver/driver.component';
import { EventoComponent } from './monitor/eventos/evento/evento.component';
import { MonitorComponent } from './monitor/monitor/monitor.component';
import { SistemaComponent } from './sistemas/sistema/sistema.component';

const routes: Routes = [
  {
    path: '',
    component: DashboardComponent,
    data: {
      title: 'Principal'
    }
  },
  {
    path: 'conexiones',
    component: ConexionComponent,
    data: {
      title: 'Conexiones'
    }
  },
  {
    path: 'apicore',
    component: ApiComponent,
    data: {
      title: 'Api Core'
    }
  },
  {
    path: 'driver',
    component: DriverComponent,
    data: {
      title: 'Drivers'
    }
  },
  {
    path: 'monitor',
    component: MonitorComponent,
    data: {
      title: 'Monitor'
    }
  },
  {
    path: 'sistema',
    component: SistemaComponent,
    data: {
      title: 'Aplicaciones'
    }
  },
  {
    path: 'evento',
    component: EventoComponent,
    data: {
      title: 'Evento'
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule {}
