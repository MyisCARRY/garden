import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_types_event.freezed.dart';

@freezed
class PlantTypesEvent with _$PlantTypesEvent {
  const factory PlantTypesEvent.load() = _Load;
}
