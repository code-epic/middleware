import { INavData } from '@coreui/angular';

export const navItems: INavData[] = [
  {
    title: true,
    name: 'General'
  },
  {
    name: 'Telecomunicaciones',
    url: '/principal/conexiones',
    icon: 'icon-cloud-upload'
  },
  {
    name: 'Conexiones',
    url: '/principal/driver',
    icon: 'icon-globe'
  },
  {
    name: 'API REST-FULL',
    url: '/principal/apicore',
    icon: 'icon-note'
  },
  {
    name: 'Aplicaciones',
    url: '/icons',
    icon: 'icon-grid',
    children: [
      {
        name: 'Instalar',
        url: '/principal/sistema',
        icon: 'icon-drawer'
      },
      {
        name: 'Definir Menu',
        url: '/principal/menu',
        icon: 'icon-list',
      },
      
    ]
  },
  {
    name: 'Operatividad',
    icon: 'icon-eye',
    url: '/icons',
    children: [
      {
        name: 'Monitoreo',
        url: '/principal/monitor',
        icon: 'icon-speedometer'
      },
      {
        name: 'Eventos',
        url: '/principal/evento',
        icon: 'icon-star',
      },
      
    ]
  },
  {
    name: 'Seguridad',
    url: '/icons',
    icon: 'icon-lock',
    children: [
      {
        name: 'Usuarios',
        url: '/icons/coreui-icons',
        icon: 'icon-people',
        badge: {
          variant: 'success',
          text: 'NEW'
        }
      }
    ]
  }
];
