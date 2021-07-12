import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PrincipalRoutingModule } from './principal-routing.module';
import { PrincipalComponent } from './principal.component';

import { ComunicacionesComponent } from './redes/comunicaciones/comunicaciones.component';
import { ConexionesComponent } from './redes/conexiones/conexiones.component';

import { SotfwareComponent } from './aplicaciones/sotfware/sotfware.component';
import { MenuComponent } from './aplicaciones/menu/menu.component';

import { ApiComponent } from './herramientas/api/api.component';
import { GraphqlComponent } from './herramientas/graphql/graphql.component';

import { UsuarioComponent } from './seguridad/usuario/usuario.component';
import { ChartsModule } from 'ng2-charts';
import { FormsModule } from '@angular/forms';
import { AgGridModule } from 'ag-grid-angular';
import { NgxUiLoaderModule,  NgxUiLoaderConfig } from "ngx-ui-loader";
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { MonitoreoComponent } from './redes/monitoreo/monitoreo.component';
import { MonitorestatusComponent } from './redes/monitoreo/monitorestatus/monitorestatus.component';
import { EstatusComponent } from './redes/comunicaciones/componente/estatus/estatus.component';
import { ScanComponent } from './redes/comunicaciones/componente/scan/scan.component';




  const ngxUiLoaderConfig: NgxUiLoaderConfig = {
    "bgsColor": "#79c680",
    "bgsOpacity": 0.2,
    "bgsPosition": "center-center",
    "bgsSize": 60,
    "bgsType": "ball-spin-clockwise",
    "blur": 8,
    "delay": 0,
    "fastFadeOut": true,
    "fgsColor": "#1ea24a",
    "fgsPosition": "center-center",
    "fgsSize": 50,
    "fgsType": "ball-spin-clockwise",
    "gap": 24,
    "logoPosition": "center-center",
    "logoSize": 120,
    "logoUrl": "",
    "masterLoaderId": "master",
    "overlayBorderRadius": "0",
    "overlayColor": "rgba(40, 40, 40, 0.63)",
    "pbColor": "#79c680",
    "pbDirection": "ltr",
    "pbThickness": 3,
    "hasProgressBar": true,
    "text": "",
    "textColor": "#FFFFFF",
    "textPosition": "center-center",
    "maxTime": -1,
    "minTime": 300
  }

import { NgWizardModule, NgWizardConfig, THEME } from 'ng-wizard';

  const ngWizardConfig: NgWizardConfig = {
    theme: THEME.default
  };
   

import { AngularFileUploaderModule } from 'angular-file-uploader';
import {AutocompleteLibModule} from 'angular-ng-autocomplete';
import { BotonComponent } from './herramientas/api/componente/boton/boton.component';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { NgbModule  } from '@ng-bootstrap/ng-bootstrap';
import { SubmenuComponent } from './aplicaciones/menu/submenu/submenu.component';
import { PaqueteComponent } from './aplicaciones/sotfware/paquete/paquete.component';



@NgModule({
  declarations: [
    PrincipalComponent,
    ComunicacionesComponent,
    EstatusComponent,
    ScanComponent,
    ConexionesComponent,
    SotfwareComponent,
    MenuComponent,
    ApiComponent,
    MonitorestatusComponent,
    GraphqlComponent,
    UsuarioComponent,
    MonitoreoComponent,
    BotonComponent,
    SubmenuComponent,
    PaqueteComponent,
  
  ],
  imports: [
    ChartsModule,
    CommonModule,
    FormsModule,
    TabsModule.forRoot(),
    BsDropdownModule.forRoot(),
    NgxUiLoaderModule.forRoot(ngxUiLoaderConfig),
    AgGridModule.withComponents([]),
    NgWizardModule.forRoot(ngWizardConfig),
    PrincipalRoutingModule,
    AngularFileUploaderModule,
    AutocompleteLibModule,
    NgbModule,
  ]
})
export class PrincipalModule { }
