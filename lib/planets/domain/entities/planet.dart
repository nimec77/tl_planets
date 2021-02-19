import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tl_planets/planets/domain/enums/planet_id.dart';

part 'planet.freezed.dart';

@freezed
abstract class Planet with _$Planet {
  const factory Planet({
    required String id,
    required PlanetId planetId,
    required String name,
    required String image,
    @Default('') String description,
  }) = _Planet;
}
