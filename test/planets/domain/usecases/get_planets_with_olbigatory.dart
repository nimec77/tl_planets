import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tl_planets/planets/domain/entities/planet.dart';
import 'package:tl_planets/planets/domain/enums/planet_id.dart';
import 'package:tl_planets/planets/domain/failures/planet_failure.dart';
import 'package:tl_planets/planets/domain/repositories/planet_repository.dart';
import 'package:tl_planets/planets/domain/usecases/get_planets_with_obligatory.dart';

import 'get_planets_with_olbigatory.mocks.dart';

@GenerateMocks([PlanetRepository])
void main() {
  late MockPlanetRepository mockPlanetRepository;
  late GetPlanetsWithObligatory getPlanetsWithObligatory;

  setUp(() {
    mockPlanetRepository = MockPlanetRepository();
    getPlanetsWithObligatory = GetPlanetsWithObligatory(planetRepository: mockPlanetRepository);
  });

  test('should get random planets with obligatory planet', () async {
    when(mockPlanetRepository.getPlanets()).thenAnswer((_) async => const Right([]));

    final result = await getPlanetsWithObligatory(PlanetId.saturn);

    expect(result, const Right<PlanetFailure, List<Planet>>([]));
    verify(mockPlanetRepository.getPlanets());
    verifyNoMoreInteractions(mockPlanetRepository);
  });
}