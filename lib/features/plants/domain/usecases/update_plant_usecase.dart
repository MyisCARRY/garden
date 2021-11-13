import 'package:dartz/dartz.dart';
import 'package:garden/core/error/failures.dart';
import 'package:garden/core/usecase/usecase.dart';
import 'package:garden/features/plants/data/models/plant_entity.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/domain/repositories/local_plant_repository.dart';

class UpdatePlantUsecase extends Usecase<NoParams, Plant> {
  UpdatePlantUsecase({
    required this.repository,
  });

  final LocalPlantRepository repository;

  @override
  Future<Either<Failure, NoParams>> call(Plant param) async {
    final result = await repository.updatePlant(PlantEntity.fromPlant(param));
    return result.bind((_) => Right(NoParams()));
  }
}
