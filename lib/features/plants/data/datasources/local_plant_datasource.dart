import 'package:floor/floor.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';
import 'package:garden/features/plants/data/models/plant_type_entity.dart';

@dao
abstract class LocalPlantDatasource {
  @insert
  Future<void> insertPlant(PlantEntity plant);

  // pages start from 0
  @Query('SELECT * FROM plant WHERE name LIKE :pattern ORDER BY id LIMIT :size OFFSET :page*:size')
  Future<List<PlantEntity>> searchPlantsPage(int page, int size, String pattern);

  @Query('SELECT * FROM plant_type')
  Future<List<PlantTypeEntity>> getPlantTypes();

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updatePlant(PlantEntity plant);
}
