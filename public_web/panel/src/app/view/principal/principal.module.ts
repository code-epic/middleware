import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ChartsModule } from 'ng2-charts';
import { FormsModule } from '@angular/forms';
import { AgGridModule } from 'ag-grid-angular';
import { AngularFileUploaderModule } from 'angular-file-uploader';
import { AutocompleteLibModule } from 'angular-ng-autocomplete';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { NgxUiLoaderModule,  NgxUiLoaderConfig } from "ngx-ui-loader";
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { NgWizardModule, NgWizardConfig, THEME } from 'ng-wizard';

//PRINCIPAL
import { PrincipalRoutingModule } from './principal-routing.module';
import { PrincipalComponent } from './principal.component';

//REDES
import { ComunicacionesComponent } from './redes/comunicaciones/comunicaciones.component';
import { ConexionesComponent } from './redes/conexiones/conexiones.component';
import { MonitoreoComponent } from './redes/monitoreo/monitoreo.component';
import { MonitorestatusComponent } from './redes/monitoreo/monitorestatus/monitorestatus.component';
import { EstatusComponent } from './redes/comunicaciones/componente/estatus/estatus.component';
import { ScanComponent } from './redes/comunicaciones/componente/scan/scan.component';

//APLICACIONES
import { SotfwareComponent } from './aplicaciones/sotfware/sotfware.component';
import { MenuComponent } from './aplicaciones/menu/menu.component';
import { SubmenuComponent } from './aplicaciones/menu/submenu/submenu.component';
import { PaqueteComponent } from './aplicaciones/sotfware/paquete/paquete.component';
import { EventosComponent } from './aplicaciones/eventos/eventos.component';

//HERRAMIENTAS
import { ApiComponent } from './herramientas/api/api.component';
import { GraphqlComponent } from './herramientas/graphql/graphql.component';
import { UsuarioComponent } from './seguridad/usuario/usuario.component';
import { BotonComponent } from './herramientas/api/componente/boton/boton.component';
import { FuncionesComponent } from './herramientas/funciones/funciones.component';
import { CerrarComponent } from './opciones/cerrar/cerrar.component';



import { MatListModule } from '@angular/material/list';
import { MatButtonModule } from '@angular/material/button';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatTabsModule } from '@angular/material/tabs';
import { MatPaginatorModule } from '@angular/material/paginator';
import { RegistrarComponent } from './herramientas/api/registrar/registrar.component';
import { FregistrarComponent } from './herramientas/funciones/fregistrar/fregistrar.component';
import { CodemirrorModule } from '@ctrl/ngx-codemirror';

//import { NgxEditorModule } from 'ngx-editor';

const ngWizardConfig: NgWizardConfig = {
  theme: THEME.default
};

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
    EventosComponent,
    FuncionesComponent,
    CerrarComponent,
    //NgxEditorModule,
    RegistrarComponent,
    FregistrarComponent
  
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
    MatListModule,
    MatButtonModule,
    MatDividerModule,
    MatIconModule,
    MatExpansionModule,
    MatTabsModule,
    MatPaginatorModule,
    CodemirrorModule
  ]
})
export class PrincipalModule { }
