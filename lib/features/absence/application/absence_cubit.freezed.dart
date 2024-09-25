// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'absence_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AbsenceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)
        loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)?
        loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AbsenceLoading value) loading,
    required TResult Function(AbsenceLoaded value) loaded,
    required TResult Function(AbsenceError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsenceLoading value)? loading,
    TResult? Function(AbsenceLoaded value)? loaded,
    TResult? Function(AbsenceError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsenceLoading value)? loading,
    TResult Function(AbsenceLoaded value)? loaded,
    TResult Function(AbsenceError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsenceStateCopyWith<$Res> {
  factory $AbsenceStateCopyWith(
          AbsenceState value, $Res Function(AbsenceState) then) =
      _$AbsenceStateCopyWithImpl<$Res, AbsenceState>;
}

/// @nodoc
class _$AbsenceStateCopyWithImpl<$Res, $Val extends AbsenceState>
    implements $AbsenceStateCopyWith<$Res> {
  _$AbsenceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AbsenceLoadingImplCopyWith<$Res> {
  factory _$$AbsenceLoadingImplCopyWith(_$AbsenceLoadingImpl value,
          $Res Function(_$AbsenceLoadingImpl) then) =
      __$$AbsenceLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AbsenceLoadingImplCopyWithImpl<$Res>
    extends _$AbsenceStateCopyWithImpl<$Res, _$AbsenceLoadingImpl>
    implements _$$AbsenceLoadingImplCopyWith<$Res> {
  __$$AbsenceLoadingImplCopyWithImpl(
      _$AbsenceLoadingImpl _value, $Res Function(_$AbsenceLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AbsenceLoadingImpl implements AbsenceLoading {
  const _$AbsenceLoadingImpl();

  @override
  String toString() {
    return 'AbsenceState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AbsenceLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)?
        loaded,
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
    required TResult Function(AbsenceLoading value) loading,
    required TResult Function(AbsenceLoaded value) loaded,
    required TResult Function(AbsenceError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsenceLoading value)? loading,
    TResult? Function(AbsenceLoaded value)? loaded,
    TResult? Function(AbsenceError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsenceLoading value)? loading,
    TResult Function(AbsenceLoaded value)? loaded,
    TResult Function(AbsenceError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AbsenceLoading implements AbsenceState {
  const factory AbsenceLoading() = _$AbsenceLoadingImpl;
}

/// @nodoc
abstract class _$$AbsenceLoadedImplCopyWith<$Res> {
  factory _$$AbsenceLoadedImplCopyWith(
          _$AbsenceLoadedImpl value, $Res Function(_$AbsenceLoadedImpl) then) =
      __$$AbsenceLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Absence> absences,
      int currentPage,
      int totalPages,
      int totalAbsences,
      bool hasMore,
      String? filterType,
      DateTime? filterDate});
}

/// @nodoc
class __$$AbsenceLoadedImplCopyWithImpl<$Res>
    extends _$AbsenceStateCopyWithImpl<$Res, _$AbsenceLoadedImpl>
    implements _$$AbsenceLoadedImplCopyWith<$Res> {
  __$$AbsenceLoadedImplCopyWithImpl(
      _$AbsenceLoadedImpl _value, $Res Function(_$AbsenceLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absences = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalAbsences = null,
    Object? hasMore = null,
    Object? filterType = freezed,
    Object? filterDate = freezed,
  }) {
    return _then(_$AbsenceLoadedImpl(
      absences: null == absences
          ? _value._absences
          : absences // ignore: cast_nullable_to_non_nullable
              as List<Absence>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalAbsences: null == totalAbsences
          ? _value.totalAbsences
          : totalAbsences // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      filterType: freezed == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as String?,
      filterDate: freezed == filterDate
          ? _value.filterDate
          : filterDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$AbsenceLoadedImpl implements AbsenceLoaded {
  const _$AbsenceLoadedImpl(
      {required final List<Absence> absences,
      required this.currentPage,
      required this.totalPages,
      required this.totalAbsences,
      required this.hasMore,
      this.filterType,
      this.filterDate})
      : _absences = absences;

  final List<Absence> _absences;
  @override
  List<Absence> get absences {
    if (_absences is EqualUnmodifiableListView) return _absences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_absences);
  }

  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final int totalAbsences;
  @override
  final bool hasMore;
  @override
  final String? filterType;
  @override
  final DateTime? filterDate;

  @override
  String toString() {
    return 'AbsenceState.loaded(absences: $absences, currentPage: $currentPage, totalPages: $totalPages, totalAbsences: $totalAbsences, hasMore: $hasMore, filterType: $filterType, filterDate: $filterDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsenceLoadedImpl &&
            const DeepCollectionEquality().equals(other._absences, _absences) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalAbsences, totalAbsences) ||
                other.totalAbsences == totalAbsences) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType) &&
            (identical(other.filterDate, filterDate) ||
                other.filterDate == filterDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_absences),
      currentPage,
      totalPages,
      totalAbsences,
      hasMore,
      filterType,
      filterDate);

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsenceLoadedImplCopyWith<_$AbsenceLoadedImpl> get copyWith =>
      __$$AbsenceLoadedImplCopyWithImpl<_$AbsenceLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(absences, currentPage, totalPages, totalAbsences, hasMore,
        filterType, filterDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(absences, currentPage, totalPages, totalAbsences,
        hasMore, filterType, filterDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)?
        loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(absences, currentPage, totalPages, totalAbsences, hasMore,
          filterType, filterDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AbsenceLoading value) loading,
    required TResult Function(AbsenceLoaded value) loaded,
    required TResult Function(AbsenceError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsenceLoading value)? loading,
    TResult? Function(AbsenceLoaded value)? loaded,
    TResult? Function(AbsenceError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsenceLoading value)? loading,
    TResult Function(AbsenceLoaded value)? loaded,
    TResult Function(AbsenceError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AbsenceLoaded implements AbsenceState {
  const factory AbsenceLoaded(
      {required final List<Absence> absences,
      required final int currentPage,
      required final int totalPages,
      required final int totalAbsences,
      required final bool hasMore,
      final String? filterType,
      final DateTime? filterDate}) = _$AbsenceLoadedImpl;

  List<Absence> get absences;
  int get currentPage;
  int get totalPages;
  int get totalAbsences;
  bool get hasMore;
  String? get filterType;
  DateTime? get filterDate;

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbsenceLoadedImplCopyWith<_$AbsenceLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AbsenceErrorImplCopyWith<$Res> {
  factory _$$AbsenceErrorImplCopyWith(
          _$AbsenceErrorImpl value, $Res Function(_$AbsenceErrorImpl) then) =
      __$$AbsenceErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$AbsenceErrorImplCopyWithImpl<$Res>
    extends _$AbsenceStateCopyWithImpl<$Res, _$AbsenceErrorImpl>
    implements _$$AbsenceErrorImplCopyWith<$Res> {
  __$$AbsenceErrorImplCopyWithImpl(
      _$AbsenceErrorImpl _value, $Res Function(_$AbsenceErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$AbsenceErrorImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  /// Create a copy of AbsenceState
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

class _$AbsenceErrorImpl implements AbsenceError {
  const _$AbsenceErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'AbsenceState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsenceErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsenceErrorImplCopyWith<_$AbsenceErrorImpl> get copyWith =>
      __$$AbsenceErrorImplCopyWithImpl<_$AbsenceErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)
        loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)?
        loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Absence> absences,
            int currentPage,
            int totalPages,
            int totalAbsences,
            bool hasMore,
            String? filterType,
            DateTime? filterDate)?
        loaded,
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
    required TResult Function(AbsenceLoading value) loading,
    required TResult Function(AbsenceLoaded value) loaded,
    required TResult Function(AbsenceError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AbsenceLoading value)? loading,
    TResult? Function(AbsenceLoaded value)? loaded,
    TResult? Function(AbsenceError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AbsenceLoading value)? loading,
    TResult Function(AbsenceLoaded value)? loaded,
    TResult Function(AbsenceError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AbsenceError implements AbsenceState {
  const factory AbsenceError(final Failure failure) = _$AbsenceErrorImpl;

  Failure get failure;

  /// Create a copy of AbsenceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbsenceErrorImplCopyWith<_$AbsenceErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
