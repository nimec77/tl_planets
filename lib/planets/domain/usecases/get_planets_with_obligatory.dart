import 'package:dartz/dartz.dart';
import 'package:tl_planets/planets/domain/entities/planet.dart';
import 'package:tl_planets/planets/domain/enums/planet_id.dart';
import 'package:tl_planets/planets/domain/failures/planet_failure.dart';
import 'package:tl_planets/planets/domain/repositories/planet_repository.dart';

class GetPlanetsWithObligatory {
  final PlanetRepository planetRepository;

  GetPlanetsWithObligatory({required this.planetRepository});

  // Either<PlanetFailure, List<Planet>> getPlanets(PlanetId obligatoryPlanetId) => planetRepository.getPlanets().bind(
  //       (planets) => planetRepository.getPlanetByPlanetId(obligatoryPlanetId).map(
  //         (obligatoryPlanet) {
  //           final randoms = List.generate(planets.length, (index) => index)
  //             ..shuffle()
  //             ..sublist(0, kPlanetsListSize);
  //           final randomPlanets = randoms.map((index) => planets[index]).toList();
  //           if (!randomPlanets.contains(obligatoryPlanet)) {
  //             randomPlanets[randomInt(kPlanetsListSize)] = obligatoryPlanet;
  //           }
  //           return randomPlanets;
  //         },
  //       ),
  //     );
  Future<Either<PlanetFailure, List<Planet>>> call(PlanetId obligatoryPlanetId) async {
    return planetRepository.getPlanets();
  }
}
