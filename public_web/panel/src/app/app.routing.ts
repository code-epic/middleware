import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

// Import Containers
import { DefaultLayoutComponent } from './containers';
import { AuthGuardGuard } from './servicios/seguridad/auth-guard.guard';
import { LoginComponent } from './views/login/login.component';
import { RegistrarComponent } from './views/registrar/registrar/registrar.component';



export const routes: Routes = [
  {
    path: '',
    component: LoginComponent,
    canActivate:[AuthGuardGuard],
    data: {
      title: 'Login'
    }
  },
  {
    path: 'login',
    component: LoginComponent,
    data: {
      title: 'Login'
    }
  },
  {
    path: 'registrar',
    component: RegistrarComponent,
    data: {
      title: 'Registrarse'
    }
  },
  {
  path: 'principal',
  component: DefaultLayoutComponent,
  data: {
    title: 'Escritorio'
  },
  children: [
    {
      path: '',
      loadChildren: () => import('./views/dashboard/dashboard.module').then(m => m.DashboardModule),
      canActivate:[AuthGuardGuard]
    }
  ]
  }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
