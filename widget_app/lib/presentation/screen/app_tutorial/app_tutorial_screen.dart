import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Exercitation voluptate cillum eu aute dolor irure aliquip.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Ullamco ullamco duis labore quis occaecat culpa laborum id incididunt.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Ea officia exercitation voluptate nostrud amet esse ut exercitation deserunt est enim est.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  // Controlador para gestionar el desplazamiento del PageView
  final PageController pageviewController = PageController();

  // Variable que indica si se ha alcanzado la última página del tutorial
  bool endReached = false;

  @override
  // Método que se llama una sola vez cuando se crea el estado del widget
  void initState() {
    super
        .initState(); // Llama al método initState de la clase base para asegurar la inicialización adecuada

    // Añade un listener al PageController para reaccionar a los cambios cada vez que se interactue con la página
    pageviewController.addListener(() {
      // Obtiene la página actual del PageController; si no hay página (momenot inicial de construccion del widget), se asigna 0
      final page = pageviewController.page ?? 0;

      // Verifica si no hemos alcanzado el final y si estamos cerca de la última página
      if (!endReached && page >= (slides.length - 1.5)) {
        // Si se cumplen las condiciones, actualiza el estado para indicar que se ha llegado al final
        setState(() {
          endReached =
              true; // Cambia el estado a true, lo que puede activar la visualización de un botón final
        });
      }
    });
  }

  @override
  // Método que se llama cuando el widget se destruye
  void dispose() {
    // Libera los recursos utilizados por el PageController para evitar fugas de memoria
    pageviewController.dispose();

    // Llama al método dispose de la clase base para asegurar la limpieza adecuada
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop(),
              )),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
