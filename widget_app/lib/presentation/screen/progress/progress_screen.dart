import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circular Progress Indicator'),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(height: 20),
          Text('Circular Indicator Controlado'),
          SizedBox(height: 10),
          _ControlledProgressIndicator()
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    // permite cambiar el valor del value de los progress a medida que pasa el tiempo de ejcucion
    return StreamBuilder<double>(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          // la forma en que va a ir cargando
          return (value * 2) / 100;
          // takewhile indica la condicion de parada del progress
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          // valor que se obtiene del streambuilder para que los progress vayan cargando
          final progressValue = snapshot.data ?? 0;
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: Colors.black12,
                    value: progressValue),
                SizedBox(width: 20),
                Expanded(child: LinearProgressIndicator(value: progressValue))
              ],
            ),
          );
        });
  }
}
