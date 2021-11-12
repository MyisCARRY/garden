// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plant_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlantFormEventTearOff {
  const _$PlantFormEventTearOff();

  _ChangeName changeName(String name) {
    return _ChangeName(
      name,
    );
  }

  _ChangeDate changeDate(DateTime date) {
    return _ChangeDate(
      date,
    );
  }

  _ChangeType changeType(String type) {
    return _ChangeType(
      type,
    );
  }
}

/// @nodoc
const $PlantFormEvent = _$PlantFormEventTearOff();

/// @nodoc
mixin _$PlantFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) changeName,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(String type) changeType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? changeName,
    TResult Function(DateTime date)? changeDate,
    TResult Function(String type)? changeType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? changeName,
    TResult Function(DateTime date)? changeDate,
    TResult Function(String type)? changeType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeType value) changeType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeType value)? changeType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeType value)? changeType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantFormEventCopyWith<$Res> {
  factory $PlantFormEventCopyWith(
          PlantFormEvent value, $Res Function(PlantFormEvent) then) =
      _$PlantFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlantFormEventCopyWithImpl<$Res>
    implements $PlantFormEventCopyWith<$Res> {
  _$PlantFormEventCopyWithImpl(this._value, this._then);

  final PlantFormEvent _value;
  // ignore: unused_field
  final $Res Function(PlantFormEvent) _then;
}

/// @nodoc
abstract class _$ChangeNameCopyWith<$Res> {
  factory _$ChangeNameCopyWith(
          _ChangeName value, $Res Function(_ChangeName) then) =
      __$ChangeNameCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class __$ChangeNameCopyWithImpl<$Res> extends _$PlantFormEventCopyWithImpl<$Res>
    implements _$ChangeNameCopyWith<$Res> {
  __$ChangeNameCopyWithImpl(
      _ChangeName _value, $Res Function(_ChangeName) _then)
      : super(_value, (v) => _then(v as _ChangeName));

  @override
  _ChangeName get _value => super._value as _ChangeName;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_ChangeName(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeName implements _ChangeName {
  const _$_ChangeName(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'PlantFormEvent.changeName(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeName &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  _$ChangeNameCopyWith<_ChangeName> get copyWith =>
      __$ChangeNameCopyWithImpl<_ChangeName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) changeName,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(String type) changeType,
  }) {
    return changeName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? changeName,
    TResult Function(DateTime date)? changeDate,
    TResult Function(String type)? changeType,
  }) {
    return changeName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? changeName,
    TResult Function(DateTime date)? changeDate,
    TResult Function(String type)? changeType,
    required TResult orElse(),
  }) {
    if (changeName != null) {
      return changeName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeType value) changeType,
  }) {
    return changeName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeType value)? changeType,
  }) {
    return changeName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeType value)? changeType,
    required TResult orElse(),
  }) {
    if (changeName != null) {
      return changeName(this);
    }
    return orElse();
  }
}

abstract class _ChangeName implements PlantFormEvent {
  const factory _ChangeName(String name) = _$_ChangeName;

  String get name;
  @JsonKey(ignore: true)
  _$ChangeNameCopyWith<_ChangeName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChangeDateCopyWith<$Res> {
  factory _$ChangeDateCopyWith(
          _ChangeDate value, $Res Function(_ChangeDate) then) =
      __$ChangeDateCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$ChangeDateCopyWithImpl<$Res> extends _$PlantFormEventCopyWithImpl<$Res>
    implements _$ChangeDateCopyWith<$Res> {
  __$ChangeDateCopyWithImpl(
      _ChangeDate _value, $Res Function(_ChangeDate) _then)
      : super(_value, (v) => _then(v as _ChangeDate));

  @override
  _ChangeDate get _value => super._value as _ChangeDate;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_ChangeDate(
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ChangeDate implements _ChangeDate {
  const _$_ChangeDate(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'PlantFormEvent.changeDate(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeDate &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  _$ChangeDateCopyWith<_ChangeDate> get copyWith =>
      __$ChangeDateCopyWithImpl<_ChangeDate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) changeName,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(String type) changeType,
  }) {
    return changeDate(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? changeName,
    TResult Function(DateTime date)? changeDate,
    TResult Function(String type)? changeType,
  }) {
    return changeDate?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? changeName,
    TResult Function(DateTime date)? changeDate,
    TResult Function(String type)? changeType,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeType value) changeType,
  }) {
    return changeDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeType value)? changeType,
  }) {
    return changeDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeType value)? changeType,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(this);
    }
    return orElse();
  }
}

abstract class _ChangeDate implements PlantFormEvent {
  const factory _ChangeDate(DateTime date) = _$_ChangeDate;

  DateTime get date;
  @JsonKey(ignore: true)
  _$ChangeDateCopyWith<_ChangeDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChangeTypeCopyWith<$Res> {
  factory _$ChangeTypeCopyWith(
          _ChangeType value, $Res Function(_ChangeType) then) =
      __$ChangeTypeCopyWithImpl<$Res>;
  $Res call({String type});
}

/// @nodoc
class __$ChangeTypeCopyWithImpl<$Res> extends _$PlantFormEventCopyWithImpl<$Res>
    implements _$ChangeTypeCopyWith<$Res> {
  __$ChangeTypeCopyWithImpl(
      _ChangeType _value, $Res Function(_ChangeType) _then)
      : super(_value, (v) => _then(v as _ChangeType));

  @override
  _ChangeType get _value => super._value as _ChangeType;

  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_ChangeType(
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeType implements _ChangeType {
  const _$_ChangeType(this.type);

  @override
  final String type;

  @override
  String toString() {
    return 'PlantFormEvent.changeType(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeType &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  _$ChangeTypeCopyWith<_ChangeType> get copyWith =>
      __$ChangeTypeCopyWithImpl<_ChangeType>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) changeName,
    required TResult Function(DateTime date) changeDate,
    required TResult Function(String type) changeType,
  }) {
    return changeType(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? changeName,
    TResult Function(DateTime date)? changeDate,
    TResult Function(String type)? changeType,
  }) {
    return changeType?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? changeName,
    TResult Function(DateTime date)? changeDate,
    TResult Function(String type)? changeType,
    required TResult orElse(),
  }) {
    if (changeType != null) {
      return changeType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeName value) changeName,
    required TResult Function(_ChangeDate value) changeDate,
    required TResult Function(_ChangeType value) changeType,
  }) {
    return changeType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeType value)? changeType,
  }) {
    return changeType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeName value)? changeName,
    TResult Function(_ChangeDate value)? changeDate,
    TResult Function(_ChangeType value)? changeType,
    required TResult orElse(),
  }) {
    if (changeType != null) {
      return changeType(this);
    }
    return orElse();
  }
}

abstract class _ChangeType implements PlantFormEvent {
  const factory _ChangeType(String type) = _$_ChangeType;

  String get type;
  @JsonKey(ignore: true)
  _$ChangeTypeCopyWith<_ChangeType> get copyWith =>
      throw _privateConstructorUsedError;
}
