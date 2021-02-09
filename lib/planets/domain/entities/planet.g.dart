// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Planet _$_$_PlanetFromJson(Map<String, dynamic> json) {
  return _$_Planet(
    id: json['id'] as String,
    planetId: _$enumDecodeNullable(_$PlanetIdEnumMap, json['planetId']),
    name: json['name'] as String,
    image: json['image'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$_$_PlanetToJson(_$_Planet instance) => <String, dynamic>{
      'id': instance.id,
      'planetId': _$PlanetIdEnumMap[instance.planetId],
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PlanetIdEnumMap = {
  PlanetId.mercury: 'mercury',
  PlanetId.venus: 'venus',
  PlanetId.earth: 'earth',
  PlanetId.mars: 'mars',
  PlanetId.jupiter: 'jupiter',
  PlanetId.saturn: 'saturn',
  PlanetId.uranus: 'uranus',
  PlanetId.neptune: 'neptune',
};
