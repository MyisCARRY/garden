import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';

part 'plant.freezed.dart';

@freezed
class Plant with _$Plant {
  const factory Plant({
    required String name,
    required String type,
    required DateTime plantingDate,
    int? id,
  }) = _Plant;

  factory Plant.fromEntity(PlantEntity entity) {
    return Plant(
      id: entity.id,
      name: entity.name,
      type: entity.type,
      plantingDate: DateTime.parse(entity.plantingDate),
    );
  }

  factory Plant.empty() {
    return Plant(
      name: '',
      type: '',
      plantingDate: DateTime.now(),
    );
  }

  const Plant._(); // Added constructor

  String get emblem => name.isEmpty ? '' : name[0] + name[name.length - 1];
}
