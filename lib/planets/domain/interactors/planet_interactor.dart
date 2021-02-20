import 'package:dartz/dartz.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:tl_planets/planets/domain/constants.dart';
import 'package:tl_planets/planets/domain/entities/planet.dart';
import 'package:tl_planets/planets/domain/enums/planet_id.dart';
import 'package:tl_planets/planets/domain/failures/planet_failure.dart';
import 'package:tl_planets/planets/domain/repositories/planet_repository.dart';

class PlanetInteractor {
  final PlanetRepository planetRepository;

  PlanetInteractor({required this.planetRepository});

  Either<PlanetFailure, List<Planet>> getPlanets(PlanetId obligatoryPlanetId) => planetRepository.getPlanets().fold(
        (planetFailure) => Left(planetFailure),
        (planets) => planetRepository.getPlanetByPlanetId(obligatoryPlanetId).fold(
          (planetFailure) => Left(planetFailure),
          (obligatoryPlanet) {
            List<int> randoms = List.generate(planets.length, (index) => index)..shuffle();
            randoms = randoms.sublist(0, kPlanetsListSize);
            final randomPlanets = randoms.map((index) => planets[index]).toList();
            if (!randomPlanets.contains(obligatoryPlanet)) {
              randomPlanets[randomInt(kPlanetsListSize)] = obligatoryPlanet;
            }
            return Right(randomPlanets);
          },
        ),
      );
}
