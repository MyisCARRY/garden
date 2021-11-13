import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';
import 'package:garden/features/plants/presentation/blocs/plant_form_bloc/plant_form_event.dart';
import 'package:garden/features/plants/presentation/blocs/plant_form_bloc/plant_form_state.dart';

class PlantFormBloc extends Bloc<PlantFormEvent, PlantFormState> {
  PlantFormBloc({this.initialPlant})
      : super(PlantFormState.data(
          plant: initialPlant ?? Plant.empty(),
          isValid: _isValid(initialPlant ?? Plant.empty()),
        )) {
    _plant = initialPlant ?? Plant.empty();
  }

  final Plant? initialPlant;
  late Plant _plant;

  PlantFormState get _data => PlantFormState.data(plant: _plant, isValid: _isValid(_plant));

  static bool _isValid(Plant plant) => plant.name.isNotEmpty && plant.type.isNotEmpty;

  @override
  Stream<PlantFormState> mapEventToState(PlantFormEvent event) async* {
    yield* event.when(
      changeName: _changeName,
      changeDate: _changeDate,
      changeType: _changeType,
    );
  }

  Stream<PlantFormState> _changeName(String newName) async* {
    _plant = _plant.copyWith(name: newName);
    yield _data;
  }

  Stream<PlantFormState> _changeDate(DateTime newDate) async* {
    _plant = _plant.copyWith(plantingDate: newDate);
    yield _data;
  }

  Stream<PlantFormState> _changeType(String newType) async* {
    _plant = _plant.copyWith(type: newType);
    yield _data;
  }
}
