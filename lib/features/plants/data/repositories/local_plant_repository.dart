import 'package:garden/core/error/failures.dart';
import 'package:garden/core/error/repository_request_handler.dart';
import 'package:garden/core/helper/consts.dart';
import 'package:garden/core/helper/type_aliases.dart';
import 'package:garden/features/plants/data/datasources/local_plant_datasource.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';
import 'package:garden/features/plants/data/models/plant_type_entity.dart';
import 'package:garden/features/plants/domain/repositories/local_plant_repository.dart';

class LocalPlantRepositoryImpl extends LocalPlantRepository {
  LocalPlantRepositoryImpl({
    required this.datasource,
  });

  final LocalPlantDatasource datasource;

  @override
  FutureFailable<List<PlantEntity>> getPlantsPage(int page) async {
    // if we uncomment Future.delayed we will see that pagination works fine
    // await Future.delayed(const Duration(seconds: 2));
    return RepositoryRequestHandler<List<PlantEntity>>()(
      request: () => datasource.getPlantsPage(page, Consts.plantListPageSize),
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

  @override
  FutureFailable<List<PlantTypeEntity>> getPlantTypes() {
    return RepositoryRequestHandler<List<PlantTypeEntity>>()(
      request: datasource.getPlantTypes,
      defaultFailure: GetPlantTypesFailure(),
    );
  }

  @override
  FutureFailable<void> updatePlant(PlantEntity plant) {
    return RepositoryRequestHandler<void>()(
      request: () => datasource.updatePlant(plant),
      defaultFailure: UpdatePlantFailure(),
    );
  }
}
