import 'package:garden/core/error/failures.dart';
import 'package:garden/core/error/repository_request_handler.dart';
import 'package:garden/core/helper/type_aliases.dart';
import 'package:garden/features/plants/data/datasources/local_plant_datasource.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';
import 'package:garden/features/plants/domain/repositories/local_plant_repository.dart';

class LocalPlantRepositoryImpl extends LocalPlantRepository {
  LocalPlantRepositoryImpl({
    required this.datasource,
  });

  final LocalPlantDatasource datasource;

  @override
  FutureFailable<List<PlantEntity>> getAllPlants() async {
    return RepositoryRequestHandler<List<PlantEntity>>()(
      request: datasource.getAllPlants,
      defaultFailure: GetPlantsFailure(),
    );
  }

  @override
  FutureFailable<void> insertPlant(PlantEntity plant) async {
    return RepositoryRequestHandler<void>()(
      request: () => datasource.insertPlant(plant),
      defaultFailure: InsertPlantFailure(),
    );
  }
}
