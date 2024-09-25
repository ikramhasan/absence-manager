// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalendarStateInitial value) initial,
    required TResult Function(CalendarStateLoading value) loading,
    required TResult Function(CalendarStateSuccess value) success,
    required TResult Function(CalendarStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarStateInitial value)? initial,
    TResult? Function(CalendarStateLoading value)? loading,
    TResult? Function(CalendarStateSuccess value)? success,
    TResult? Function(CalendarStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarStateInitial value)? initial,
    TResult Function(CalendarStateLoading value)? loading,
    TResult Function(CalendarStateSuccess value)? success,
    TResult Function(CalendarStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CalendarStateInitialImplCopyWith<$Res> {
  factory _$$CalendarStateInitialImplCopyWith(_$CalendarStateInitialImpl value,
          $Res Function(_$CalendarStateInitialImpl) then) =
      __$$CalendarStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CalendarStateInitialImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$CalendarStateInitialImpl>
    implements _$$CalendarStateInitialImplCopyWith<$Res> {
  __$$CalendarStateInitialImplCopyWithImpl(_$CalendarStateInitialImpl _value,
      $Res Function(_$CalendarStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CalendarStateInitialImpl implements CalendarStateInitial {
  const _$CalendarStateInitialImpl();

  @override
  String toString() {
    return 'CalendarState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalendarStateInitial value) initial,
    required TResult Function(CalendarStateLoading value) loading,
    required TResult Function(CalendarStateSuccess value) success,
    required TResult Function(CalendarStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarStateInitial value)? initial,
    TResult? Function(CalendarStateLoading value)? loading,
    TResult? Function(CalendarStateSuccess value)? success,
    TResult? Function(CalendarStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarStateInitial value)? initial,
    TResult Function(CalendarStateLoading value)? loading,
    TResult Function(CalendarStateSuccess value)? success,
    TResult Function(CalendarStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CalendarStateInitial implements CalendarState {
  const factory CalendarStateInitial() = _$CalendarStateInitialImpl;
}

/// @nodoc
abstract class _$$CalendarStateLoadingImplCopyWith<$Res> {
  factory _$$CalendarStateLoadingImplCopyWith(_$CalendarStateLoadingImpl value,
          $Res Function(_$CalendarStateLoadingImpl) then) =
      __$$CalendarStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CalendarStateLoadingImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$CalendarStateLoadingImpl>
    implements _$$CalendarStateLoadingImplCopyWith<$Res> {
  __$$CalendarStateLoadingImplCopyWithImpl(_$CalendarStateLoadingImpl _value,
      $Res Function(_$CalendarStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CalendarStateLoadingImpl implements CalendarStateLoading {
  const _$CalendarStateLoadingImpl();

  @override
  String toString() {
    return 'CalendarState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalendarStateInitial value) initial,
    required TResult Function(CalendarStateLoading value) loading,
    required TResult Function(CalendarStateSuccess value) success,
    required TResult Function(CalendarStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarStateInitial value)? initial,
    TResult? Function(CalendarStateLoading value)? loading,
    TResult? Function(CalendarStateSuccess value)? success,
    TResult? Function(CalendarStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarStateInitial value)? initial,
    TResult Function(CalendarStateLoading value)? loading,
    TResult Function(CalendarStateSuccess value)? success,
    TResult Function(CalendarStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CalendarStateLoading implements CalendarState {
  const factory CalendarStateLoading() = _$CalendarStateLoadingImpl;
}

/// @nodoc
abstract class _$$CalendarStateSuccessImplCopyWith<$Res> {
  factory _$$CalendarStateSuccessImplCopyWith(_$CalendarStateSuccessImpl value,
          $Res Function(_$CalendarStateSuccessImpl) then) =
      __$$CalendarStateSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CalendarStateSuccessImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$CalendarStateSuccessImpl>
    implements _$$CalendarStateSuccessImplCopyWith<$Res> {
  __$$CalendarStateSuccessImplCopyWithImpl(_$CalendarStateSuccessImpl _value,
      $Res Function(_$CalendarStateSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CalendarStateSuccessImpl implements CalendarStateSuccess {
  const _$CalendarStateSuccessImpl();

  @override
  String toString() {
    return 'CalendarState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarStateSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Failure failure) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Failure failure)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalendarStateInitial value) initial,
    required TResult Function(CalendarStateLoading value) loading,
    required TResult Function(CalendarStateSuccess value) success,
    required TResult Function(CalendarStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarStateInitial value)? initial,
    TResult? Function(CalendarStateLoading value)? loading,
    TResult? Function(CalendarStateSuccess value)? success,
    TResult? Function(CalendarStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarStateInitial value)? initial,
    TResult Function(CalendarStateLoading value)? loading,
    TResult Function(CalendarStateSuccess value)? success,
    TResult Function(CalendarStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CalendarStateSuccess implements CalendarState {
  const factory CalendarStateSuccess() = _$CalendarStateSuccessImpl;
}

/// @nodoc
abstract class _$$CalendarStateErrorImplCopyWith<$Res> {
  factory _$$CalendarStateErrorImplCopyWith(_$CalendarStateErrorImpl value,
          $Res Function(_$CalendarStateErrorImpl) then) =
      __$$CalendarStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$CalendarStateErrorImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$CalendarStateErrorImpl>
    implements _$$CalendarStateErrorImplCopyWith<$Res> {
  __$$CalendarStateErrorImplCopyWithImpl(_$CalendarStateErrorImpl _value,
      $Res Function(_$CalendarStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$CalendarStateErrorImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$CalendarStateErrorImpl implements CalendarStateError {
  const _$CalendarStateErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'CalendarState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarStateErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarStateErrorImplCopyWith<_$CalendarStateErrorImpl> get copyWith =>
      __$$CalendarStateErrorImplCopyWithImpl<_$CalendarStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CalendarStateInitial value) initial,
    required TResult Function(CalendarStateLoading value) loading,
    required TResult Function(CalendarStateSuccess value) success,
    required TResult Function(CalendarStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CalendarStateInitial value)? initial,
    TResult? Function(CalendarStateLoading value)? loading,
    TResult? Function(CalendarStateSuccess value)? success,
    TResult? Function(CalendarStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CalendarStateInitial value)? initial,
    TResult Function(CalendarStateLoading value)? loading,
    TResult Function(CalendarStateSuccess value)? success,
    TResult Function(CalendarStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CalendarStateError implements CalendarState {
  const factory CalendarStateError(final Failure failure) =
      _$CalendarStateErrorImpl;

  Failure get failure;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarStateErrorImplCopyWith<_$CalendarStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
