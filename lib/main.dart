import 'package:flutter/material.dart';

void main() {
  runApp(PlantesApp());
}

class PlantesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Планеты солнечной системы',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Планеты солнечной системы'),
        ),
        body: Center(
          child: Text('Hi!', style: Theme.of(context).textTheme.headline6),
        ),
      ),
    );
  }
}
