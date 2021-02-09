import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tl_planets/planets/domain/enums/planet_id.dart';

part 'planet.freezed.dart';
part 'planet.g.dart';

@freezed
abstract class Planet with _$Planet {
  const factory Planet({
    @required String id,
    @required PlanetId planetId,
    @required String name,
    @required String image,
    String description,
  }) = _Planet;

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);
}
