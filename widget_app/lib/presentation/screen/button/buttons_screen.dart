import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/presentation/screen/home/home_screen.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      // para regresar a la ruta anterior
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          }),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 20),
        // el wrap lo que hace es que cuando se llega al limite derecho el sigueinte elemento se posiciona debajo
        child: Wrap(
          // espacio entre los elementos
          spacing: 10,
          // direccion de los elementos en el wrap
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            // si se coloca null en el onpressed el boton sale desabilitado
            ElevatedButton(onPressed: null, child: const Text('Elevated')),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon'),
            ),

            FilledButton(onPressed: () {}, child: Text('Filled button')),
            FilledButton.icon(
              onPressed: () {},
              label: Text('Filled icon button'),
              icon: Icon(Icons.ac_unit_rounded),
            )
          ],
        ),
      ),
    );
  }
}
