import 'package:go_router/go_router.dart';
import 'package:widget_app/presentation/screen/animated/animated_screen.dart';
import 'package:widget_app/presentation/screen/app_tutorial/app_tutorial_screen.dart';
import 'package:widget_app/presentation/screen/button/buttons_screen.dart';
import 'package:widget_app/presentation/screen/cards/cards_screen.dart';
import 'package:widget_app/presentation/screen/home/home_screen.dart';
import 'package:widget_app/presentation/screen/progress/progress_screen.dart';
import 'package:widget_app/presentation/screen/snackbar/snackbar_screen.dart';
import 'package:widget_app/presentation/screen/ui_controls/ui_controls_screen.dart';

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
    GoRoute(
      path: '/progress',
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/snackbars',
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: '/animated',
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: '/ui-controls',
      builder: (context, state) => const UiControlsScreen(),
    ),
    GoRoute(
      path: '/tutorial',
      builder: (context, state) => const AppTutorialScreen(),
    ),
  ],
);
