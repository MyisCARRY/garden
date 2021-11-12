import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_form_event.freezed.dart';

@freezed
class PlantFormEvent with _$PlantFormEvent {
  const factory PlantFormEvent.changeName(String name) = _ChangeName;
  const factory PlantFormEvent.changeDate(DateTime date) = _ChangeDate;
  const factory PlantFormEvent.changeType(String type) = _ChangeType;
}
