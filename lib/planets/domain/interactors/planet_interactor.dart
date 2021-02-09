import 'package:flutter/foundation.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:tl_planets/planets/domain/entities/planet.dart';
import 'package:tl_planets/planets/domain/enums/planet_id.dart';
import 'package:tl_planets/planets/domain/repositories/planet_repository.dart';

import '../constants.dart';

class PlanetInteractor {
  final PlanetRepository planetRepository;

  PlanetInteractor({@required this.planetRepository}) : assert(planetRepository != null);

  List<Planet> getPlanets(PlanetId obligatoryPlanetId) {
    final planets = planetRepository.getPlanets();
    final obligatoryPlanet = planetRepository.getPlanetByPlanetId(obligatoryPlanetId);
    List<int> randoms = List.generate(planets.length, (index) => index)..shuffle();
    randoms = randoms.sublist(0, kPlanetsListSize);
    final randomPlanets = randoms.map((index) => planets[index]).toList();
    if (!randomPlanets.contains(obligatoryPlanet)) {
      randomPlanets[randomInt(kPlanetsListSize)] = obligatoryPlanet;
    }

    return randomPlanets;
  }
}
