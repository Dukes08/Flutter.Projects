import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/presentation/screen/home/home_screen.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    // El clear es por si se le da click varias veces no aparezcan todos sino que aparezca uno y se oculte en el anterior
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = const SnackBar(
      content: Text('Hola Mundo'),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      // obligar a la persona que seleccione uno de los botones, no puede clickear afuera
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Seguro?'),
        content: Text('lorem lorem lorem lorem lorem lorem'),
        actions: [
          TextButton(
            onPressed: () {
              // cerrar dialago usando go-router
              context.pop();
            },
            child: Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {},
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbar Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                // para ver la licencias de la aplicacion
                showAboutDialog(
                    context: context,
                    children: [Text('lorem ipsum lorem ipsummm')]);
              },
              child: Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: Text('Dialog'),
            )
          ],
        ),
      ),
      // El extended me permite agregar icono y el label
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Mostrar Snackbar'),
          icon: Icon(Icons.remove_red_eye_outlined),
          onPressed: () {
            // se llama a la funcion para mostrar el snackbar
            showCustomSnackbar(context);
          }),
    );
  }
}
