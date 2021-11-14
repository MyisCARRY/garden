import 'package:garden/core/helper/type_aliases.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';
import 'package:garden/features/plants/data/models/plant_type_entity.dart';
import 'package:garden/features/plants/domain/entities/search_param.dart';

abstract class LocalPlantRepository {
  FutureFailable<void> insertPlant(PlantEntity plant);

  FutureFailable<List<PlantEntity>> getPlantsPage(SearchParam param);

  FutureFailable<List<PlantTypeEntity>> getPlantTypes();

  FutureFailable<void> updatePlant(PlantEntity plant);
}
