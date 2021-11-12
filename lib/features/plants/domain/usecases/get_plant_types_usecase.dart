import 'package:dartz/dartz.dart';
import 'package:garden/core/error/failures.dart';
import 'package:garden/core/usecase/usecase.dart';
import 'package:garden/features/plants/domain/entities/plant_type.dart';
import 'package:garden/features/plants/domain/repositories/local_plant_repository.dart';

class GetPlantTypesUsecase extends Usecase<List<PlantType>, NoParams> {
  GetPlantTypesUsecase({
    required this.repository,
  });

  final LocalPlantRepository repository;

  @override
  Future<Either<Failure, List<PlantType>>> call(NoParams param) async {
    final result = await repository.getPlantTypes();
    return result.bind((data) => Right(data.map((entity) => PlantType.fromEntity(entity)).toList()));
  }
}
