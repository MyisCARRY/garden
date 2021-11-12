import 'package:floor/floor.dart';
import 'package:garden/core/helper/floor_tables.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';

@Entity(tableName: FloorTables.plant)
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
      type: plant.type,
      plantingDate: plant.plantingDate.toIso8601String(),
    );
  }

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String type;
  final String plantingDate;
}
