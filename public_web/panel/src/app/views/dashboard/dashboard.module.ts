import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';

import { DashboardComponent } from './dashboard.component';
import { DashboardRoutingModule } from './dashboard-routing.module';
import { CarouselModule } from 'ngx-bootstrap/carousel';
import { ApiComponent } from './apicore/api/api.component';
import { AgGridModule } from 'ag-grid-angular';
import { DriverComponent } from './drivers/driver/driver.component';
import { CommonModule } from '@angular/common';
import { ConexionComponent } from './conexiones/conexion/conexion.component';
import { NgxLoadingModule } from 'ngx-loading';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { ArchwizardModule } from 'angular-archwizard';
import { NgWizardModule, NgWizardConfig, THEME } from 'ng-wizard';
import { MonitorComponent } from './monitor/monitor/monitor.component';
import { EventoComponent } from './monitor/eventos/evento/evento.component';
import { SistemaComponent } from './sistemas/sistema/sistema.component';
 
const ngWizardConfig: NgWizardConfig = {
  theme: THEME.default
};
 
 
@NgModule({
  imports: [
    FormsModule,
    CommonModule,
    NgWizardModule.forRoot(ngWizardConfig),
    DashboardRoutingModule,
    ChartsModule,
    CarouselModule.forRoot(),
    TabsModule.forRoot(),
    BsDropdownModule,
    AgGridModule.withComponents([]),
    ArchwizardModule,
    NgxLoadingModule.forRoot({})
  ],
  declarations: [ DashboardComponent, ApiComponent, DriverComponent, ConexionComponent, MonitorComponent, EventoComponent, SistemaComponent ]
})
export class DashboardModule { }
