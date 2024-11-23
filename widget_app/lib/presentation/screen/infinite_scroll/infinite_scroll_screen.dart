import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/router/app_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  // para conocer si el componente esta montado o no, para permitir eliminarlo del contexto una vez de destruya, se usa cuando se trabaja async
  bool isMounted = true;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //  cada vez que se interactua con el scroll se ejecuta
    scrollController.addListener(() {
      // scrollController.position.pixels indica los pixeles que se han desplazado, se le suma 500 para hacer el reloading un poco antes de alcanzar el final
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    // si ya se estan cargando imagenes no cargues mas
    if (isLoading) return;
    // cuando se empiecen a cargar
    isLoading = true;
    setState(() {});
    // esperar dos segundos antes de ejecturar el agregador de imagenes
    await Future.delayed(Duration(seconds: 2));
    addFiveImages();
    // cuando se se termine de cargar agregar mas
    isLoading = false;
    // si ya no esta montado no ejecuta nada para no generar errores
    if (!isMounted) return;
    setState(() {});
    // hacer una animacion cuando se carguen las imagenes para mostrarle al usuario que puede hacer scroll
    moveScrollToBottom();
  }

  // Funcion para agregar mas imagenes al array de images y asi obtener el infinte scroll
  void addFiveImages() {
    final lastId = imagesIds.last;
    // con la ultima posicion se van agregando las demas 5+1, 5+2, etc
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    // verificar que este montado
    if (!isMounted) return;
    isLoading = false;
    final lastId = imagesIds.last;
    // borrar todo lo que esta en el array
    imagesIds.clear();
    // iniciar una nueva serie de imagenes agarrando el ultimo id +1 para que las nueva sigan ese orden
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  void moveScrollToBottom() {
    if ((scrollController.position.pixels + 100) <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      // mover 120 pixeles
      scrollController.position.pixels + 120,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // el mediaquery permite remover el spacio que toma el notch
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        // para el pull to refresh
        child: RefreshIndicator(
          onRefresh: () => onRefresh(),
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              // el fadeinimage permite mostrar una imagen mientras se cargan las que se quieren mostrar
              return FadeInImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(infinite: true, child: Icon(Icons.refresh_outlined))
            : Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
