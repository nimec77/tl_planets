import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tl_planets/planets/domain/enums/planet_id.dart';
import 'package:tl_planets/planets/domain/repositories/planet_repository.dart';
import 'package:tl_planets/planets/domain/usecases/get_planets_with_obligatory.dart';

class MockPlanetRepository extends Mock implements PlanetRepository {}

void main() {
  late MockPlanetRepository mockPlanetRepository;
  late GetPlanetsWithObligatory getPlanetsWithObligatory;

  setUp(() {
    mockPlanetRepository = MockPlanetRepository();
    getPlanetsWithObligatory = GetPlanetsWithObligatory(planetRepository: mockPlanetRepository);
  });

  test('should get random planets with obligatory planet', () async {
    // final mockPlanetRepository = MockPlanetRepository();
    // final getPlanetsWithObligatory = GetPlanetsWithObligatory(planetRepository: mockPlanetRepository);
    when(mockPlanetRepository.getPlanets()).thenAnswer((_) async => const Right([]));

    final result = await getPlanetsWithObligatory(PlanetId.saturn);

    expect(result, const Right([]));
    verify(mockPlanetRepository.getPlanets());
    verifyNoMoreInteractions(mockPlanetRepository);
  });
}
