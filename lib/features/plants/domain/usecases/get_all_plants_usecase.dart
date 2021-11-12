import 'package:dartz/dartz.dart';
import 'package:garden/core/error/failures.dart';
import 'package:garden/core/usecase/usecase.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/domain/repositories/local_plant_repository.dart';

class GetAllPlantsUsecase extends Usecase<List<Plant>, NoParams> {
  GetAllPlantsUsecase({
    required this.repository,
  });

  final LocalPlantRepository repository;

  @override
  Future<Either<Failure, List<Plant>>> call(NoParams param) async {
    final result = await repository.getAllPlants();
    return result.bind((data) => Right(data.map((entity) => Plant.fromEntity(entity)).toList()));
  }
}
