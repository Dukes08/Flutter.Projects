import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subtitle: 'Varios botones en flutter',
      link: '/buttons',
      icon: Icons.abc_outlined),
  MenuItem(
      title: 'Cards',
      subtitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicator',
      subtitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars',
      subtitle: 'Indicadores de pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated Container',
      subtitle: 'Statefull Widget Animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: 'UI Controls + Tiles',
      subtitle: 'UI controls',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Onboarding',
      subtitle: 'Pequeno tutorial',
      link: '/tutorial',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Infinite Scroll',
      subtitle: 'Lista infinita y pull to refresh',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
];
