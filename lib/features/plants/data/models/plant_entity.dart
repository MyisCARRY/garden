import 'package:enum_to_string/enum_to_string.dart';
import 'package:floor/floor.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';

@Entity(tableName: 'plant')
class PlantEntity {
  PlantEntity({
    required this.name,
    required this.type,
    required this.plantingDate,
    this.id,
  });

  factory PlantEntity.fromPlant(Plant plant) {
    return PlantEntity(
      name: plant.name,
      type: EnumToString.convertToString(plant.type),
      plantingDate: plant.plantingDate.toIso8601String(),
    );
  }

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String type;
  final String plantingDate;
}
