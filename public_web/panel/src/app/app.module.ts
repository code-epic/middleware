import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { LocationStrategy, HashLocationStrategy, JsonPipe } from '@angular/common';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { PerfectScrollbarModule } from 'ngx-perfect-scrollbar';
import { PERFECT_SCROLLBAR_CONFIG } from 'ngx-perfect-scrollbar';
import { PerfectScrollbarConfigInterface } from 'ngx-perfect-scrollbar';
const DEFAULT_PERFECT_SCROLLBAR_CONFIG: PerfectScrollbarConfigInterface = {
  suppressScrollX: true
};
import { AppComponent } from './app.component';
// Import containers
import { DefaultLayoutComponent } from './containers';
import { LoginComponent } from './views/login/login.component';

const APP_CONTAINERS = [
  DefaultLayoutComponent
];

import {
  AppAsideModule,
  AppBreadcrumbModule,
  AppHeaderModule,
  AppFooterModule,
  AppSidebarModule,
} from '@coreui/angular';

// Import routing module
import { AppRoutingModule } from './app.routing';

// Import 3rd party components
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { ChartsModule } from 'ng2-charts';
import { ToastrModule } from 'ngx-toastr';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AuthGuardGuard } from '../app/servicios/seguridad/auth-guard.guard';
import { RegistrarComponent } from './views/registrar/registrar/registrar.component'
import { CarouselModule } from 'ngx-bootstrap/carousel';
import { BasicoComponent } from './views/registrar/base/basico/basico.component';
import { AgGridModule } from 'ag-grid-angular';
import { BotonComponent } from './views/dashboard/apicore/api/componente/boton/boton.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import {PrettyJsonModule} from 'angular2-prettyjson';
import { EstatusComponent } from './views/dashboard/conexiones/conexion/componente/estatus/estatus.component';
import { ScanComponent } from './views/dashboard/conexiones/conexion/componente/scan/scan.component';
import { NgxLoadingModule } from 'ngx-loading';
import { ArchwizardModule } from 'angular-archwizard';

import { NgWizardModule, NgWizardConfig, THEME } from 'ng-wizard';
import { MonitorestatusComponent } from './views/dashboard/monitor/monitor/monitorestatus/monitorestatus.component';
 
const ngWizardConfig: NgWizardConfig = {
  theme: THEME.default
};
 

@NgModule({
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    NgWizardModule.forRoot(ngWizardConfig),
    AppAsideModule,
    CarouselModule.forRoot(),
    AppBreadcrumbModule.forRoot(),
    AppFooterModule,
    AppHeaderModule,
    HttpClientModule,
    AppSidebarModule,
    PerfectScrollbarModule,
    BsDropdownModule.forRoot(),
    TabsModule.forRoot(),
    ToastrModule.forRoot(),
    AgGridModule.withComponents([]),
    FormsModule,
    ChartsModule,
    PrettyJsonModule,
    ArchwizardModule,
    NgbModule,
    NgxLoadingModule.forRoot({})
  ],
  declarations: [
    AppComponent,
    ...APP_CONTAINERS,
    LoginComponent,
    RegistrarComponent,
    BasicoComponent,
    BotonComponent,
    EstatusComponent,
    MonitorestatusComponent,
    ScanComponent,
  ],
  providers: [{
    provide: [LocationStrategy, AuthGuardGuard, JsonPipe],
    useClass: HashLocationStrategy,
  }],
  entryComponents:[BotonComponent, EstatusComponent,ScanComponent, MonitorestatusComponent,],
  bootstrap: [ AppComponent ]
})
export class AppModule { }
