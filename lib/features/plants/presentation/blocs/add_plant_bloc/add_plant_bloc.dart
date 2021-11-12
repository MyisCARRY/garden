import 'package:any_animated_button/any_animated_button.dart';
import 'package:dartz/dartz.dart';
import 'package:garden/core/error/failures.dart';
import 'package:garden/core/usecase/usecase.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/domain/usecases/insert_plant_usecase.dart';

class AddPlantBloc extends AnyAnimatedButtonBloc<Plant, NoParams, Failure> {
  AddPlantBloc({
    required this.insertPlantUsecase,
  });

  final InsertPlantUsecase insertPlantUsecase;

  @override
  Future<Either<Failure, NoParams>> asyncAction(Plant input) {
    return insertPlantUsecase(input);
  }
}
