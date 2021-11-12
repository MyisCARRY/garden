import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garden/features/plants/domain/entities/plant.dart';

part 'plant_form_state.freezed.dart';

@freezed
class PlantFormState with _$PlantFormState {
  const factory PlantFormState.data({
    required Plant plant,
    required bool isValid,
  }) = _Data;
}
