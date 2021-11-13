import 'package:equatable/equatable.dart';
import 'package:garden/generated/l10n.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [errorMessage];

  String get _errorMessage;

  int get _errorCode;

  String get errorMessage => '$_errorMessage \nec_$_errorCode';
}

abstract class LocalPlantFailure extends Failure {}

class InsertPlantFailure extends LocalPlantFailure {
  @override
  int get _errorCode => 100;

  @override
  String get _errorMessage => S.current.insertPlantFailure;
}

class GetPlantsFailure extends LocalPlantFailure {
  @override
  int get _errorCode => 101;

  @override
  String get _errorMessage => S.current.getPlantsFailure;
}

class GetPlantTypesFailure extends LocalPlantFailure {
  @override
  int get _errorCode => 102;

  @override
  String get _errorMessage => S.current.getPlantTypesFailure;
}

class UpdatePlantFailure extends LocalPlantFailure {
  @override
  int get _errorCode => 103;

  @override
  String get _errorMessage => S.current.updatePlantFailure;
}
