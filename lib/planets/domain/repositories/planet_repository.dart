import 'package:dartz/dartz.dart';
import 'package:tl_planets/planets/domain/entities/planet.dart';
import 'package:tl_planets/planets/domain/enums/planet_id.dart';
import 'package:tl_planets/planets/domain/failures/planet_failure.dart';

abstract class PlanetRepository {
  Future<Either<PlanetFailure, List<Planet>>> getPlanets();

  Future<Either<PlanetFailure, Planet>> getPlanetByPlanetId(PlanetId planetId);
}
