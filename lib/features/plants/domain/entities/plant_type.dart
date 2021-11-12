import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garden/features/plants/data/models/plant_type_entity.dart';

part 'plant_type.freezed.dart';

@freezed
class PlantType with _$PlantType {
  const factory PlantType({
    required String name,
  }) = _PlantType;

  factory PlantType.fromEntity(PlantTypeEntity entity) {
    return PlantType(name: entity.name);
  }
}
