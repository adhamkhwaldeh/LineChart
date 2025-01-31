// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseEvent {
  MonitoringFilterModel get filter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MonitoringFilterModel filter) loadMonitoring,
    required TResult Function(MonitoringFilterModel filter)
        pollingForMonitoring,
    required TResult Function(MonitoringFilterModel filter)
        loadRemoteMonitoringOnly,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MonitoringFilterModel filter)? loadMonitoring,
    TResult? Function(MonitoringFilterModel filter)? pollingForMonitoring,
    TResult? Function(MonitoringFilterModel filter)? loadRemoteMonitoringOnly,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MonitoringFilterModel filter)? loadMonitoring,
    TResult Function(MonitoringFilterModel filter)? pollingForMonitoring,
    TResult Function(MonitoringFilterModel filter)? loadRemoteMonitoringOnly,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseEventLoadMonitoring value) loadMonitoring,
    required TResult Function(BaseEventPollingForMonitoring value)
        pollingForMonitoring,
    required TResult Function(BaseEventLoadRemoteMonitoringOnly value)
        loadRemoteMonitoringOnly,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseEventLoadMonitoring value)? loadMonitoring,
    TResult? Function(BaseEventPollingForMonitoring value)?
        pollingForMonitoring,
    TResult? Function(BaseEventLoadRemoteMonitoringOnly value)?
        loadRemoteMonitoringOnly,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseEventLoadMonitoring value)? loadMonitoring,
    TResult Function(BaseEventPollingForMonitoring value)? pollingForMonitoring,
    TResult Function(BaseEventLoadRemoteMonitoringOnly value)?
        loadRemoteMonitoringOnly,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseEventCopyWith<BaseEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseEventCopyWith<$Res> {
  factory $BaseEventCopyWith(BaseEvent value, $Res Function(BaseEvent) then) =
      _$BaseEventCopyWithImpl<$Res, BaseEvent>;
  @useResult
  $Res call({MonitoringFilterModel filter});

  $MonitoringFilterModelCopyWith<$Res> get filter;
}

/// @nodoc
class _$BaseEventCopyWithImpl<$Res, $Val extends BaseEvent>
    implements $BaseEventCopyWith<$Res> {
  _$BaseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as MonitoringFilterModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MonitoringFilterModelCopyWith<$Res> get filter {
    return $MonitoringFilterModelCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BaseEventLoadMonitoringImplCopyWith<$Res>
    implements $BaseEventCopyWith<$Res> {
  factory _$$BaseEventLoadMonitoringImplCopyWith(
          _$BaseEventLoadMonitoringImpl value,
          $Res Function(_$BaseEventLoadMonitoringImpl) then) =
      __$$BaseEventLoadMonitoringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MonitoringFilterModel filter});

  @override
  $MonitoringFilterModelCopyWith<$Res> get filter;
}

/// @nodoc
class __$$BaseEventLoadMonitoringImplCopyWithImpl<$Res>
    extends _$BaseEventCopyWithImpl<$Res, _$BaseEventLoadMonitoringImpl>
    implements _$$BaseEventLoadMonitoringImplCopyWith<$Res> {
  __$$BaseEventLoadMonitoringImplCopyWithImpl(
      _$BaseEventLoadMonitoringImpl _value,
      $Res Function(_$BaseEventLoadMonitoringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$BaseEventLoadMonitoringImpl(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as MonitoringFilterModel,
    ));
  }
}

/// @nodoc

class _$BaseEventLoadMonitoringImpl implements BaseEventLoadMonitoring {
  const _$BaseEventLoadMonitoringImpl(this.filter);

  @override
  final MonitoringFilterModel filter;

  @override
  String toString() {
    return 'BaseEvent.loadMonitoring(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseEventLoadMonitoringImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseEventLoadMonitoringImplCopyWith<_$BaseEventLoadMonitoringImpl>
      get copyWith => __$$BaseEventLoadMonitoringImplCopyWithImpl<
          _$BaseEventLoadMonitoringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MonitoringFilterModel filter) loadMonitoring,
    required TResult Function(MonitoringFilterModel filter)
        pollingForMonitoring,
    required TResult Function(MonitoringFilterModel filter)
        loadRemoteMonitoringOnly,
  }) {
    return loadMonitoring(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MonitoringFilterModel filter)? loadMonitoring,
    TResult? Function(MonitoringFilterModel filter)? pollingForMonitoring,
    TResult? Function(MonitoringFilterModel filter)? loadRemoteMonitoringOnly,
  }) {
    return loadMonitoring?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MonitoringFilterModel filter)? loadMonitoring,
    TResult Function(MonitoringFilterModel filter)? pollingForMonitoring,
    TResult Function(MonitoringFilterModel filter)? loadRemoteMonitoringOnly,
    required TResult orElse(),
  }) {
    if (loadMonitoring != null) {
      return loadMonitoring(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseEventLoadMonitoring value) loadMonitoring,
    required TResult Function(BaseEventPollingForMonitoring value)
        pollingForMonitoring,
    required TResult Function(BaseEventLoadRemoteMonitoringOnly value)
        loadRemoteMonitoringOnly,
  }) {
    return loadMonitoring(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseEventLoadMonitoring value)? loadMonitoring,
    TResult? Function(BaseEventPollingForMonitoring value)?
        pollingForMonitoring,
    TResult? Function(BaseEventLoadRemoteMonitoringOnly value)?
        loadRemoteMonitoringOnly,
  }) {
    return loadMonitoring?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseEventLoadMonitoring value)? loadMonitoring,
    TResult Function(BaseEventPollingForMonitoring value)? pollingForMonitoring,
    TResult Function(BaseEventLoadRemoteMonitoringOnly value)?
        loadRemoteMonitoringOnly,
    required TResult orElse(),
  }) {
    if (loadMonitoring != null) {
      return loadMonitoring(this);
    }
    return orElse();
  }
}

abstract class BaseEventLoadMonitoring implements BaseEvent {
  const factory BaseEventLoadMonitoring(final MonitoringFilterModel filter) =
      _$BaseEventLoadMonitoringImpl;

  @override
  MonitoringFilterModel get filter;
  @override
  @JsonKey(ignore: true)
  _$$BaseEventLoadMonitoringImplCopyWith<_$BaseEventLoadMonitoringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BaseEventPollingForMonitoringImplCopyWith<$Res>
    implements $BaseEventCopyWith<$Res> {
  factory _$$BaseEventPollingForMonitoringImplCopyWith(
          _$BaseEventPollingForMonitoringImpl value,
          $Res Function(_$BaseEventPollingForMonitoringImpl) then) =
      __$$BaseEventPollingForMonitoringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MonitoringFilterModel filter});

  @override
  $MonitoringFilterModelCopyWith<$Res> get filter;
}

/// @nodoc
class __$$BaseEventPollingForMonitoringImplCopyWithImpl<$Res>
    extends _$BaseEventCopyWithImpl<$Res, _$BaseEventPollingForMonitoringImpl>
    implements _$$BaseEventPollingForMonitoringImplCopyWith<$Res> {
  __$$BaseEventPollingForMonitoringImplCopyWithImpl(
      _$BaseEventPollingForMonitoringImpl _value,
      $Res Function(_$BaseEventPollingForMonitoringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$BaseEventPollingForMonitoringImpl(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as MonitoringFilterModel,
    ));
  }
}

/// @nodoc

class _$BaseEventPollingForMonitoringImpl
    implements BaseEventPollingForMonitoring {
  const _$BaseEventPollingForMonitoringImpl(this.filter);

  @override
  final MonitoringFilterModel filter;

  @override
  String toString() {
    return 'BaseEvent.pollingForMonitoring(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseEventPollingForMonitoringImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseEventPollingForMonitoringImplCopyWith<
          _$BaseEventPollingForMonitoringImpl>
      get copyWith => __$$BaseEventPollingForMonitoringImplCopyWithImpl<
          _$BaseEventPollingForMonitoringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MonitoringFilterModel filter) loadMonitoring,
    required TResult Function(MonitoringFilterModel filter)
        pollingForMonitoring,
    required TResult Function(MonitoringFilterModel filter)
        loadRemoteMonitoringOnly,
  }) {
    return pollingForMonitoring(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MonitoringFilterModel filter)? loadMonitoring,
    TResult? Function(MonitoringFilterModel filter)? pollingForMonitoring,
    TResult? Function(MonitoringFilterModel filter)? loadRemoteMonitoringOnly,
  }) {
    return pollingForMonitoring?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MonitoringFilterModel filter)? loadMonitoring,
    TResult Function(MonitoringFilterModel filter)? pollingForMonitoring,
    TResult Function(MonitoringFilterModel filter)? loadRemoteMonitoringOnly,
    required TResult orElse(),
  }) {
    if (pollingForMonitoring != null) {
      return pollingForMonitoring(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseEventLoadMonitoring value) loadMonitoring,
    required TResult Function(BaseEventPollingForMonitoring value)
        pollingForMonitoring,
    required TResult Function(BaseEventLoadRemoteMonitoringOnly value)
        loadRemoteMonitoringOnly,
  }) {
    return pollingForMonitoring(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseEventLoadMonitoring value)? loadMonitoring,
    TResult? Function(BaseEventPollingForMonitoring value)?
        pollingForMonitoring,
    TResult? Function(BaseEventLoadRemoteMonitoringOnly value)?
        loadRemoteMonitoringOnly,
  }) {
    return pollingForMonitoring?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseEventLoadMonitoring value)? loadMonitoring,
    TResult Function(BaseEventPollingForMonitoring value)? pollingForMonitoring,
    TResult Function(BaseEventLoadRemoteMonitoringOnly value)?
        loadRemoteMonitoringOnly,
    required TResult orElse(),
  }) {
    if (pollingForMonitoring != null) {
      return pollingForMonitoring(this);
    }
    return orElse();
  }
}

abstract class BaseEventPollingForMonitoring implements BaseEvent {
  const factory BaseEventPollingForMonitoring(
      final MonitoringFilterModel filter) = _$BaseEventPollingForMonitoringImpl;

  @override
  MonitoringFilterModel get filter;
  @override
  @JsonKey(ignore: true)
  _$$BaseEventPollingForMonitoringImplCopyWith<
          _$BaseEventPollingForMonitoringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BaseEventLoadRemoteMonitoringOnlyImplCopyWith<$Res>
    implements $BaseEventCopyWith<$Res> {
  factory _$$BaseEventLoadRemoteMonitoringOnlyImplCopyWith(
          _$BaseEventLoadRemoteMonitoringOnlyImpl value,
          $Res Function(_$BaseEventLoadRemoteMonitoringOnlyImpl) then) =
      __$$BaseEventLoadRemoteMonitoringOnlyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MonitoringFilterModel filter});

  @override
  $MonitoringFilterModelCopyWith<$Res> get filter;
}

/// @nodoc
class __$$BaseEventLoadRemoteMonitoringOnlyImplCopyWithImpl<$Res>
    extends _$BaseEventCopyWithImpl<$Res,
        _$BaseEventLoadRemoteMonitoringOnlyImpl>
    implements _$$BaseEventLoadRemoteMonitoringOnlyImplCopyWith<$Res> {
  __$$BaseEventLoadRemoteMonitoringOnlyImplCopyWithImpl(
      _$BaseEventLoadRemoteMonitoringOnlyImpl _value,
      $Res Function(_$BaseEventLoadRemoteMonitoringOnlyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$BaseEventLoadRemoteMonitoringOnlyImpl(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as MonitoringFilterModel,
    ));
  }
}

/// @nodoc

class _$BaseEventLoadRemoteMonitoringOnlyImpl
    implements BaseEventLoadRemoteMonitoringOnly {
  const _$BaseEventLoadRemoteMonitoringOnlyImpl(this.filter);

  @override
  final MonitoringFilterModel filter;

  @override
  String toString() {
    return 'BaseEvent.loadRemoteMonitoringOnly(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseEventLoadRemoteMonitoringOnlyImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseEventLoadRemoteMonitoringOnlyImplCopyWith<
          _$BaseEventLoadRemoteMonitoringOnlyImpl>
      get copyWith => __$$BaseEventLoadRemoteMonitoringOnlyImplCopyWithImpl<
          _$BaseEventLoadRemoteMonitoringOnlyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MonitoringFilterModel filter) loadMonitoring,
    required TResult Function(MonitoringFilterModel filter)
        pollingForMonitoring,
    required TResult Function(MonitoringFilterModel filter)
        loadRemoteMonitoringOnly,
  }) {
    return loadRemoteMonitoringOnly(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MonitoringFilterModel filter)? loadMonitoring,
    TResult? Function(MonitoringFilterModel filter)? pollingForMonitoring,
    TResult? Function(MonitoringFilterModel filter)? loadRemoteMonitoringOnly,
  }) {
    return loadRemoteMonitoringOnly?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MonitoringFilterModel filter)? loadMonitoring,
    TResult Function(MonitoringFilterModel filter)? pollingForMonitoring,
    TResult Function(MonitoringFilterModel filter)? loadRemoteMonitoringOnly,
    required TResult orElse(),
  }) {
    if (loadRemoteMonitoringOnly != null) {
      return loadRemoteMonitoringOnly(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseEventLoadMonitoring value) loadMonitoring,
    required TResult Function(BaseEventPollingForMonitoring value)
        pollingForMonitoring,
    required TResult Function(BaseEventLoadRemoteMonitoringOnly value)
        loadRemoteMonitoringOnly,
  }) {
    return loadRemoteMonitoringOnly(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseEventLoadMonitoring value)? loadMonitoring,
    TResult? Function(BaseEventPollingForMonitoring value)?
        pollingForMonitoring,
    TResult? Function(BaseEventLoadRemoteMonitoringOnly value)?
        loadRemoteMonitoringOnly,
  }) {
    return loadRemoteMonitoringOnly?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseEventLoadMonitoring value)? loadMonitoring,
    TResult Function(BaseEventPollingForMonitoring value)? pollingForMonitoring,
    TResult Function(BaseEventLoadRemoteMonitoringOnly value)?
        loadRemoteMonitoringOnly,
    required TResult orElse(),
  }) {
    if (loadRemoteMonitoringOnly != null) {
      return loadRemoteMonitoringOnly(this);
    }
    return orElse();
  }
}

abstract class BaseEventLoadRemoteMonitoringOnly implements BaseEvent {
  const factory BaseEventLoadRemoteMonitoringOnly(
          final MonitoringFilterModel filter) =
      _$BaseEventLoadRemoteMonitoringOnlyImpl;

  @override
  MonitoringFilterModel get filter;
  @override
  @JsonKey(ignore: true)
  _$$BaseEventLoadRemoteMonitoringOnlyImplCopyWith<
          _$BaseEventLoadRemoteMonitoringOnlyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
