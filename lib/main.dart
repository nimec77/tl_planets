import 'package:flutter/material.dart';
import 'package:tl_planets/planets/domain/enums/planet_id.dart';

import 'planets/domain/entities/planet.dart';

void main() {
  runApp(PlantesApp());
}

class PlantesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const earth = Planet(id: 'earth', planetId: PlanetId.earth, name: 'Earth', image: 'image');
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
          child: Text(earth.toJson().toString(), style: Theme.of(context).textTheme.headline6),
        ),
      ),
    );
  }
}
