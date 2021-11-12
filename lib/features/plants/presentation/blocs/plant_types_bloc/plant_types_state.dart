import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:garden/core/error/failures.dart';
import 'package:garden/features/plants/domain/entities/plant_type.dart';

part 'plant_types_state.freezed.dart';

@freezed
class PlantTypesState with _$PlantTypesState {
  const factory PlantTypesState.loading() = _Loading;

  const factory PlantTypesState.error(Failure failure) = _Error;

  const factory PlantTypesState.empty() = _Empty;

  const factory PlantTypesState.data(List<PlantType> types) = _Data;
}
