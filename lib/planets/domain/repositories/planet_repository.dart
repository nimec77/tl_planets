import 'package:tl_planets/planets/domain/entities/planet.dart';
import 'package:tl_planets/planets/domain/enums/planet_id.dart';

abstract class PlanetRepository {
  List<Planet> getPlanets();

  Planet getPlanetByPlanetId(PlanetId planetId);
}
