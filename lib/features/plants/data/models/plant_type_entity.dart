import 'package:floor/floor.dart';
import 'package:garden/core/helper/floor_tables.dart';

@Entity(tableName: FloorTables.plantType)
class PlantTypeEntity {
  PlantTypeEntity({
    required this.name,
    this.id,
  });

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
}
