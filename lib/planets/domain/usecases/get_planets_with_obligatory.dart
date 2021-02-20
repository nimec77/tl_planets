import 'package:dartz/dartz.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:tl_planets/planets/domain/constants.dart';
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

  // final state = State<int, String>((a) => Tuple2('2', a));
  // final t = state.value(1);
  //
  // final planetState = State((Planet planet) => Tuple2(planetRepository.getPlanetByPlanetId(PlanetId.saturn), planet));
  //
  // Task(() => Future.value(state));

  List<Planet> getRandomPlanets(List<Planet> planets, Planet planet) {
    final randoms = List.generate(planets.length, (index) => index)
      ..shuffle()
      ..sublist(0, kPlanetsListSize);
    final randomPlanets = randoms.map((index) => planets[index]).toList();
    if (!randomPlanets.contains(planet)) {
      randomPlanets[randomInt(kPlanetsListSize)] = planet;
    }

    return randomPlanets;
  }

  // Future<Either<PlanetFailure, List<Planet>>> get2(PlanetId planetId) {
  //   Task(() => planetRepository.getPlanets())
  //   .map((eitherPlanets) async {
  //     final eitherPlanet = await planetRepository.getPlanetByPlanetId(planetId);
  //     return eitherPlanets.bind((planets) => eitherPlanet.map((planet) => getRandomPlanets(planets, planet)));
  //   });
  // }

  Future<Either<PlanetFailure, List<Planet>>> getPlanets(PlanetId obligatoryPlanetId) async {
    return Task(() => planetRepository.getPlanets())
        .map((planets) =>
            State((List<Planet> planets) => Tuple2(planetRepository.getPlanetByPlanetId(obligatoryPlanetId), planets)))
        .flatMap(
          (state) => Task(() => planetRepository.getPlanetByPlanetId(obligatoryPlanetId)),
        )
        .map((planet) {
      return const Right<PlanetFailure, List<Planet>>([]);
    }).run();
  }

  Future<Either<PlanetFailure, List<Planet>>> call(PlanetId obligatoryPlanetId) async {
    final eitherPlanets = await planetRepository.getPlanets();
    if (eitherPlanets.isLeft()) {
      return eitherPlanets;
    }
    final eitherPlanet = await planetRepository.getPlanetByPlanetId(obligatoryPlanetId);
    if (eitherPlanet.isLeft()) {
      return eitherPlanets.map((_) => []);
    }
    final planets = eitherPlanets | [];
    final randoms = List.generate(planets.length, (index) => index)
      ..shuffle()
      ..sublist(0, kPlanetsListSize);
    final randomPlanets = randoms.map((index) => planets[index]).toList();
    final obligatoryPlanet = eitherPlanet | const Planet.empty();
    if (!randomPlanets.contains(obligatoryPlanet)) {
      randomPlanets[randomInt(kPlanetsListSize)] = obligatoryPlanet;
    }
    return Right(randomPlanets);
  }
}
