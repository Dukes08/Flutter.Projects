import 'package:flutter/material.dart';
import 'package:widget_app/config/router/app_router.dart';
import 'package:widget_app/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Para la configuración de la rutas creadas en la carpeta router
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Material App',
      theme: AppTheme(selectedColor: 0).getTheme(),
    );
  }
}
