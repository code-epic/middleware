import { INavData } from '@coreui/angular';

export const navItems: INavData[] = [
  {
    title: true,
    name: 'General'
  },
  {
    name: 'Telecomunicaciones',
    url: '/principal/conexiones',
    icon: 'icon-star'
  },
  {
    name: 'Conexiones',
    url: '/principal/driver',
    icon: 'icon-puzzle'
  },
  {
    name: 'API REST-FULL',
    url: '/principal/apicore',
    icon: 'icon-speedometer'
  },
  {
    name: 'Sistemas',
    url: '/principal/sistema',
    icon: 'icon-speedometer'
  },
  {
    name: 'Operatividad',
    url: '/icons',
    icon: 'icon-star',
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
    icon: 'icon-star',
    children: [
      {
        name: 'CoreUI Icons',
        url: '/icons/coreui-icons',
        icon: 'icon-star',
        badge: {
          variant: 'success',
          text: 'NEW'
        }
      },
      {
        name: 'Flags',
        url: '/icons/flags',
        icon: 'icon-star'
      },
      {
        name: 'Font Awesome',
        url: '/icons/font-awesome',
        icon: 'icon-star',
        badge: {
          variant: 'secondary',
          text: '4.7'
        }
      },
      {
        name: 'Simple Line Icons',
        url: '/icons/simple-line-icons',
        icon: 'icon-star'
      }
    ]
  }
];
