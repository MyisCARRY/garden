import 'package:floor/floor.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';

@dao
abstract class LocalPlantDatasource {
  @insert
  Future<void> insertPlant(PlantEntity plant);

  // pages start from 0
  @Query('SELECT * FROM plant ORDER BY id LIMIT :size OFFSET :page*:size')
  Future<List<PlantEntity>> getPlantsPage(int page, int size);
}
