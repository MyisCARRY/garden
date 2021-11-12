// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plant_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlantFormStateTearOff {
  const _$PlantFormStateTearOff();

  _Data data({required Plant plant, required bool isValid}) {
    return _Data(
      plant: plant,
      isValid: isValid,
    );
  }
}

/// @nodoc
const $PlantFormState = _$PlantFormStateTearOff();

/// @nodoc
mixin _$PlantFormState {
  Plant get plant => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Plant plant, bool isValid) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Plant plant, bool isValid)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Plant plant, bool isValid)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlantFormStateCopyWith<PlantFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantFormStateCopyWith<$Res> {
  factory $PlantFormStateCopyWith(
          PlantFormState value, $Res Function(PlantFormState) then) =
      _$PlantFormStateCopyWithImpl<$Res>;
  $Res call({Plant plant, bool isValid});

  $PlantCopyWith<$Res> get plant;
}

/// @nodoc
class _$PlantFormStateCopyWithImpl<$Res>
    implements $PlantFormStateCopyWith<$Res> {
  _$PlantFormStateCopyWithImpl(this._value, this._then);

  final PlantFormState _value;
  // ignore: unused_field
  final $Res Function(PlantFormState) _then;

  @override
  $Res call({
    Object? plant = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_value.copyWith(
      plant: plant == freezed
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as Plant,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $PlantCopyWith<$Res> get plant {
    return $PlantCopyWith<$Res>(_value.plant, (value) {
      return _then(_value.copyWith(plant: value));
    });
  }
}

/// @nodoc
abstract class _$DataCopyWith<$Res> implements $PlantFormStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  @override
  $Res call({Plant plant, bool isValid});

  @override
  $PlantCopyWith<$Res> get plant;
}

/// @nodoc
class __$DataCopyWithImpl<$Res> extends _$PlantFormStateCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object? plant = freezed,
    Object? isValid = freezed,
  }) {
    return _then(_Data(
      plant: plant == freezed
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as Plant,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Data implements _Data {
  const _$_Data({required this.plant, required this.isValid});

  @override
  final Plant plant;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'PlantFormState.data(plant: $plant, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            (identical(other.plant, plant) || other.plant == plant) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, plant, isValid);

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Plant plant, bool isValid) data,
  }) {
    return data(plant, isValid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Plant plant, bool isValid)? data,
  }) {
    return data?.call(plant, isValid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Plant plant, bool isValid)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(plant, isValid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements PlantFormState {
  const factory _Data({required Plant plant, required bool isValid}) = _$_Data;

  @override
  Plant get plant;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$DataCopyWith<_Data> get copyWith => throw _privateConstructorUsedError;
}
