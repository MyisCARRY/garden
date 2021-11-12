// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plant_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlantTypeTearOff {
  const _$PlantTypeTearOff();

  _PlantType call({required String name}) {
    return _PlantType(
      name: name,
    );
  }
}

/// @nodoc
const $PlantType = _$PlantTypeTearOff();

/// @nodoc
mixin _$PlantType {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlantTypeCopyWith<PlantType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantTypeCopyWith<$Res> {
  factory $PlantTypeCopyWith(PlantType value, $Res Function(PlantType) then) =
      _$PlantTypeCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$PlantTypeCopyWithImpl<$Res> implements $PlantTypeCopyWith<$Res> {
  _$PlantTypeCopyWithImpl(this._value, this._then);

  final PlantType _value;
  // ignore: unused_field
  final $Res Function(PlantType) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PlantTypeCopyWith<$Res> implements $PlantTypeCopyWith<$Res> {
  factory _$PlantTypeCopyWith(
          _PlantType value, $Res Function(_PlantType) then) =
      __$PlantTypeCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$PlantTypeCopyWithImpl<$Res> extends _$PlantTypeCopyWithImpl<$Res>
    implements _$PlantTypeCopyWith<$Res> {
  __$PlantTypeCopyWithImpl(_PlantType _value, $Res Function(_PlantType) _then)
      : super(_value, (v) => _then(v as _PlantType));

  @override
  _PlantType get _value => super._value as _PlantType;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_PlantType(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PlantType implements _PlantType {
  const _$_PlantType({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'PlantType(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlantType &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  _$PlantTypeCopyWith<_PlantType> get copyWith =>
      __$PlantTypeCopyWithImpl<_PlantType>(this, _$identity);
}

abstract class _PlantType implements PlantType {
  const factory _PlantType({required String name}) = _$_PlantType;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$PlantTypeCopyWith<_PlantType> get copyWith =>
      throw _privateConstructorUsedError;
}
