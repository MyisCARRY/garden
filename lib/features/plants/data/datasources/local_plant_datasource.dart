import 'package:floor/floor.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';

@dao
abstract class LocalPlantDatasource {
  @insert
  Future<void> insertPlant(PlantEntity plant);

  @Query('SELECT * FROM plant')
  Future<List<PlantEntity>> getAllPlants();
}
