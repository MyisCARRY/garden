import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant.freezed.dart';

@freezed
abstract class Plant with _$Plant {
  const factory Plant({
    required String name,
    required String type,
    required DateTime plantingDate,
  }) = _Plant;

  const Plant._(); // Added constructor

  String get emblem => name.isEmpty ? '' : name[0] + name[name.length - 1];
}
