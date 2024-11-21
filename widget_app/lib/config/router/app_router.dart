import 'package:go_router/go_router.dart';
import 'package:widget_app/presentation/screen/button/buttons_screen.dart';
import 'package:widget_app/presentation/screen/cards/cards_screen.dart';
import 'package:widget_app/presentation/screen/home/home_screen.dart';

// Para el manejo de rutas del proyecto

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);
