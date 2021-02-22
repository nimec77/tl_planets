import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:tl_planets/planets/domain/constants.dart';
import 'package:tl_planets/planets/domain/entities/planet.dart';
import 'package:tl_planets/planets/domain/enums/planet_id.dart';
import 'package:tl_planets/planets/domain/failures/planet_failure.dart';
import 'package:tl_planets/planets/domain/repositories/planet_repository.dart';

class GetPlanetsWithObligatory {
  final PlanetRepository planetRepository;

  final _random = Random();

  GetPlanetsWithObligatory({required this.planetRepository});

  // Future<Either<PlanetFailure, List<Planet>>> getPlanets(PlanetId obligatoryPlanetId) async {
  //   return Task(() => planetRepository.getPlanets())
  //       .map((planets) =>
  //           State((List<Planet> planets) => Tuple2(planetRepository.getPlanetByPlanetId(obligatoryPlanetId), planets)))
  //       .flatMap(
  //         (state) => Task(() => planetRepository.getPlanetByPlanetId(obligatoryPlanetId)),
  //       )
  //       .map((planet) {
  //     return const Right<PlanetFailure, List<Planet>>([]);
  //   }).run();
  // }

  Future<Either<PlanetFailure, List<Planet>>> call(PlanetId obligatoryPlanetId) async {
    final eitherPlanets = await planetRepository.getPlanets();
    if (eitherPlanets.isLeft()) {
      return eitherPlanets;
    }
    final planets = eitherPlanets | [];
    if (planets.length < kPlanetsListSize) {
      return const Left(PlanetFailure.wrongLength());
    }
    final eitherPlanet = await planetRepository.getPlanetByPlanetId(obligatoryPlanetId);
    return eitherPlanet.map((planet) {
      final randoms = List.generate(planets.length, (index) => index)
        ..shuffle()
        ..sublist(0, kPlanetsListSize);
      final randomPlanets = randoms.map((index) => planets[index]).toList();
      final obligatoryPlanet = eitherPlanet | const Planet.empty();
      if (!randomPlanets.contains(obligatoryPlanet)) {
        randomPlanets[_random.nextInt(kPlanetsListSize)] = obligatoryPlanet;
      }
      return randomPlanets;
    });
  }
}
