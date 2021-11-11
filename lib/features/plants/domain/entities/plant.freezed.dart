// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlantTearOff {
  const _$PlantTearOff();

  _Plant call(
      {required String name,
      required String type,
      required DateTime plantingDate}) {
    return _Plant(
      name: name,
      type: type,
      plantingDate: plantingDate,
    );
  }
}

/// @nodoc
const $Plant = _$PlantTearOff();

/// @nodoc
mixin _$Plant {
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get plantingDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlantCopyWith<Plant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantCopyWith<$Res> {
  factory $PlantCopyWith(Plant value, $Res Function(Plant) then) =
      _$PlantCopyWithImpl<$Res>;
  $Res call({String name, String type, DateTime plantingDate});
}

/// @nodoc
class _$PlantCopyWithImpl<$Res> implements $PlantCopyWith<$Res> {
  _$PlantCopyWithImpl(this._value, this._then);

  final Plant _value;
  // ignore: unused_field
  final $Res Function(Plant) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? plantingDate = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      plantingDate: plantingDate == freezed
          ? _value.plantingDate
          : plantingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$PlantCopyWith<$Res> implements $PlantCopyWith<$Res> {
  factory _$PlantCopyWith(_Plant value, $Res Function(_Plant) then) =
      __$PlantCopyWithImpl<$Res>;
  @override
  $Res call({String name, String type, DateTime plantingDate});
}

/// @nodoc
class __$PlantCopyWithImpl<$Res> extends _$PlantCopyWithImpl<$Res>
    implements _$PlantCopyWith<$Res> {
  __$PlantCopyWithImpl(_Plant _value, $Res Function(_Plant) _then)
      : super(_value, (v) => _then(v as _Plant));

  @override
  _Plant get _value => super._value as _Plant;

  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? plantingDate = freezed,
  }) {
    return _then(_Plant(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      plantingDate: plantingDate == freezed
          ? _value.plantingDate
          : plantingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Plant extends _Plant {
  const _$_Plant(
      {required this.name, required this.type, required this.plantingDate})
      : super._();

  @override
  final String name;
  @override
  final String type;
  @override
  final DateTime plantingDate;

  @override
  String toString() {
    return 'Plant(name: $name, type: $type, plantingDate: $plantingDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Plant &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.plantingDate, plantingDate) ||
                other.plantingDate == plantingDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, type, plantingDate);

  @JsonKey(ignore: true)
  @override
  _$PlantCopyWith<_Plant> get copyWith =>
      __$PlantCopyWithImpl<_Plant>(this, _$identity);
}

abstract class _Plant extends Plant {
  const factory _Plant(
      {required String name,
      required String type,
      required DateTime plantingDate}) = _$_Plant;
  const _Plant._() : super._();

  @override
  String get name;
  @override
  String get type;
  @override
  DateTime get plantingDate;
  @override
  @JsonKey(ignore: true)
  _$PlantCopyWith<_Plant> get copyWith => throw _privateConstructorUsedError;
}
