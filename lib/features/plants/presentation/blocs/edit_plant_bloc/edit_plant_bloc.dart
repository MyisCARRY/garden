import 'package:any_animated_button/any_animated_button.dart';
import 'package:dartz/dartz.dart';
import 'package:garden/core/error/failures.dart';
import 'package:garden/core/usecase/usecase.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/domain/usecases/update_plant_usecase.dart';

class EditPlantBloc extends AnyAnimatedButtonBloc<Plant, NoParams, Failure> {
  EditPlantBloc({
    required this.updatePlantUsecase,
  });

  final UpdatePlantUsecase updatePlantUsecase;

  @override
  Future<Either<Failure, NoParams>> asyncAction(Plant input) {
    return updatePlantUsecase(input);
  }
}
