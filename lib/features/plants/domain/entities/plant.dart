import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';
import 'package:garden/features/plants/domain/entities/plant_type_enum.dart';

part 'plant.freezed.dart';

@freezed
abstract class Plant with _$Plant {
  const factory Plant({
    required String name,
    required PlantTypeEnum type,
    required DateTime plantingDate,
  }) = _Plant;

  factory Plant.fromEntity(PlantEntity entity) {
    return Plant(
      name: entity.name,
      type: EnumToString.fromString(PlantTypeEnum.values, entity.type) ?? PlantTypeEnum.other,
      plantingDate: DateTime.parse(entity.plantingDate),
    );
  }

  const Plant._(); // Added constructor

  String get emblem => name.isEmpty ? '' : name[0] + name[name.length - 1];
}
