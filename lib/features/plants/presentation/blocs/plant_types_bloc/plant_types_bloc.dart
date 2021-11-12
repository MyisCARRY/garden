import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/core/usecase/usecase.dart';
import 'package:garden/features/plants/domain/usecases/get_plant_types_usecase.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_event.dart';
import 'package:garden/features/plants/presentation/blocs/plant_types_bloc/plant_types_state.dart';

class PlantTypesBloc extends Bloc<PlantTypesEvent, PlantTypesState> {
  PlantTypesBloc({
    required this.getPlantTypesUsecase,
  }) : super(const PlantTypesState.loading());

  final GetPlantTypesUsecase getPlantTypesUsecase;

  @override
  Stream<PlantTypesState> mapEventToState(PlantTypesEvent event) async* {
    yield* event.when(load: _load);
  }

  Stream<PlantTypesState> _load() async* {
    yield const PlantTypesState.loading();
    final result = await getPlantTypesUsecase(NoParams());
    yield result.fold(
      (failure) => PlantTypesState.error(failure),
      (data) => data.isEmpty ? const PlantTypesState.empty() : PlantTypesState.data(data),
    );
  }
}
