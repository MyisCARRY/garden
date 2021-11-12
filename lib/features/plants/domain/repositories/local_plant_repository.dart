import 'package:garden/core/helper/type_aliases.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';

abstract class LocalPlantRepository {
  FutureFailable<void> insertPlant(PlantEntity plant);

  FutureFailable<List<PlantEntity>> getAllPlants();
}
