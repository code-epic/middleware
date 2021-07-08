import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

// Import Containers
import { DefaultLayoutComponent } from './containers';
import { AuthGuardGuard } from './service/seguridad/auth-guard.guard';
import { LoginComponent } from './view/login/login/login.component';


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
      title: 'Login Page'
    }
  },
  // {
  //   path: 'register',
  //   component: LoginComponent,
  //   data: {
  //     title: 'Register Page'
  //   }
  // },
  //  {
  //    path: '',
  //   component: DefaultLayoutComponent,
  //   data: {
  //     title: 'Home'
  //    },
  //    children: [
  //      {
  //       path: 'base',
  //       loadChildren: () => import('./views/base/base.module').then(m => m.BaseModule)
  //     },
  //     {
  //       path: 'buttons',
  //       loadChildren: () => import('./views/buttons/buttons.module').then(m => m.ButtonsModule)
  //     },
  //     {
  //       path: 'charts',
  //       loadChildren: () => import('./views/chartjs/chartjs.module').then(m => m.ChartJSModule)
  //     },
  //     {
  //       path: 'dashboard',
  //       loadChildren: () => import('./views/dashboard/dashboard.module').then(m => m.DashboardModule)
  //     },
  //     {
  //       path: 'icons',
  //       loadChildren: () => import('./views/icons/icons.module').then(m => m.IconsModule)
  //     },
  //     {
  //       path: 'notifications',
  //       loadChildren: () => import('./views/notifications/notifications.module').then(m => m.NotificationsModule)
  //     },
  //     {
  //       path: 'theme',
  //       loadChildren: () => import('./views/theme/theme.module').then(m => m.ThemeModule)
  //     },
  //     {
  //       path: 'widgets',
  //       loadChildren: () => import('./views/widgets/widgets.module').then(m => m.WidgetsModule)
  //      }
  //    ]
  //  },
  {
    path: 'principal',
    component: DefaultLayoutComponent,
    data: {
      title: 'Escritorio'
    },
    children: [
      {
        path: '',
        loadChildren: () => import('./view/principal/principal.module').then(m => m.PrincipalModule),
        canActivate:[AuthGuardGuard]
      }
    ]
    },
  { path: '**', component: LoginComponent }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes, { relativeLinkResolution: 'legacy' }) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
