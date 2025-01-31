// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitoring_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonitoringFilterModel {
  String get date => throw _privateConstructorUsedError;
  MonitoringTypeEnum get type => throw _privateConstructorUsedError;
  bool get isKiloWall => throw _privateConstructorUsedError;
  bool get forceUpdate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonitoringFilterModelCopyWith<MonitoringFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringFilterModelCopyWith<$Res> {
  factory $MonitoringFilterModelCopyWith(MonitoringFilterModel value,
          $Res Function(MonitoringFilterModel) then) =
      _$MonitoringFilterModelCopyWithImpl<$Res, MonitoringFilterModel>;
  @useResult
  $Res call(
      {String date,
      MonitoringTypeEnum type,
      bool isKiloWall,
      bool forceUpdate});
}

/// @nodoc
class _$MonitoringFilterModelCopyWithImpl<$Res,
        $Val extends MonitoringFilterModel>
    implements $MonitoringFilterModelCopyWith<$Res> {
  _$MonitoringFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? isKiloWall = null,
    Object? forceUpdate = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MonitoringTypeEnum,
      isKiloWall: null == isKiloWall
          ? _value.isKiloWall
          : isKiloWall // ignore: cast_nullable_to_non_nullable
              as bool,
      forceUpdate: null == forceUpdate
          ? _value.forceUpdate
          : forceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonitoringFilterModelImplCopyWith<$Res>
    implements $MonitoringFilterModelCopyWith<$Res> {
  factory _$$MonitoringFilterModelImplCopyWith(
          _$MonitoringFilterModelImpl value,
          $Res Function(_$MonitoringFilterModelImpl) then) =
      __$$MonitoringFilterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      MonitoringTypeEnum type,
      bool isKiloWall,
      bool forceUpdate});
}

/// @nodoc
class __$$MonitoringFilterModelImplCopyWithImpl<$Res>
    extends _$MonitoringFilterModelCopyWithImpl<$Res,
        _$MonitoringFilterModelImpl>
    implements _$$MonitoringFilterModelImplCopyWith<$Res> {
  __$$MonitoringFilterModelImplCopyWithImpl(_$MonitoringFilterModelImpl _value,
      $Res Function(_$MonitoringFilterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? type = null,
    Object? isKiloWall = null,
    Object? forceUpdate = null,
  }) {
    return _then(_$MonitoringFilterModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MonitoringTypeEnum,
      isKiloWall: null == isKiloWall
          ? _value.isKiloWall
          : isKiloWall // ignore: cast_nullable_to_non_nullable
              as bool,
      forceUpdate: null == forceUpdate
          ? _value.forceUpdate
          : forceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MonitoringFilterModelImpl implements _MonitoringFilterModel {
  const _$MonitoringFilterModelImpl(
      {required this.date,
      required this.type,
      required this.isKiloWall,
      required this.forceUpdate});

  @override
  final String date;
  @override
  final MonitoringTypeEnum type;
  @override
  final bool isKiloWall;
  @override
  final bool forceUpdate;

  @override
  String toString() {
    return 'MonitoringFilterModel(date: $date, type: $type, isKiloWall: $isKiloWall, forceUpdate: $forceUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitoringFilterModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isKiloWall, isKiloWall) ||
                other.isKiloWall == isKiloWall) &&
            (identical(other.forceUpdate, forceUpdate) ||
                other.forceUpdate == forceUpdate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, type, isKiloWall, forceUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoringFilterModelImplCopyWith<_$MonitoringFilterModelImpl>
      get copyWith => __$$MonitoringFilterModelImplCopyWithImpl<
          _$MonitoringFilterModelImpl>(this, _$identity);
}

abstract class _MonitoringFilterModel implements MonitoringFilterModel {
  const factory _MonitoringFilterModel(
      {required final String date,
      required final MonitoringTypeEnum type,
      required final bool isKiloWall,
      required final bool forceUpdate}) = _$MonitoringFilterModelImpl;

  @override
  String get date;
  @override
  MonitoringTypeEnum get type;
  @override
  bool get isKiloWall;
  @override
  bool get forceUpdate;
  @override
  @JsonKey(ignore: true)
  _$$MonitoringFilterModelImplCopyWith<_$MonitoringFilterModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
