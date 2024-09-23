// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_absence_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedAbsenceResponse _$PaginatedAbsenceResponseFromJson(
    Map<String, dynamic> json) {
  return _PaginatedAbsenceResponse.fromJson(json);
}

/// @nodoc
mixin _$PaginatedAbsenceResponse {
  List<Absence> get absences => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalAbsences => throw _privateConstructorUsedError;

  /// Serializes this PaginatedAbsenceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedAbsenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedAbsenceResponseCopyWith<PaginatedAbsenceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedAbsenceResponseCopyWith<$Res> {
  factory $PaginatedAbsenceResponseCopyWith(PaginatedAbsenceResponse value,
          $Res Function(PaginatedAbsenceResponse) then) =
      _$PaginatedAbsenceResponseCopyWithImpl<$Res, PaginatedAbsenceResponse>;
  @useResult
  $Res call(
      {List<Absence> absences,
      int currentPage,
      int totalPages,
      int totalAbsences});
}

/// @nodoc
class _$PaginatedAbsenceResponseCopyWithImpl<$Res,
        $Val extends PaginatedAbsenceResponse>
    implements $PaginatedAbsenceResponseCopyWith<$Res> {
  _$PaginatedAbsenceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedAbsenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absences = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalAbsences = null,
  }) {
    return _then(_value.copyWith(
      absences: null == absences
          ? _value.absences
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedAbsenceResponseImplCopyWith<$Res>
    implements $PaginatedAbsenceResponseCopyWith<$Res> {
  factory _$$PaginatedAbsenceResponseImplCopyWith(
          _$PaginatedAbsenceResponseImpl value,
          $Res Function(_$PaginatedAbsenceResponseImpl) then) =
      __$$PaginatedAbsenceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Absence> absences,
      int currentPage,
      int totalPages,
      int totalAbsences});
}

/// @nodoc
class __$$PaginatedAbsenceResponseImplCopyWithImpl<$Res>
    extends _$PaginatedAbsenceResponseCopyWithImpl<$Res,
        _$PaginatedAbsenceResponseImpl>
    implements _$$PaginatedAbsenceResponseImplCopyWith<$Res> {
  __$$PaginatedAbsenceResponseImplCopyWithImpl(
      _$PaginatedAbsenceResponseImpl _value,
      $Res Function(_$PaginatedAbsenceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedAbsenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absences = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalAbsences = null,
  }) {
    return _then(_$PaginatedAbsenceResponseImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedAbsenceResponseImpl implements _PaginatedAbsenceResponse {
  const _$PaginatedAbsenceResponseImpl(
      {required final List<Absence> absences,
      required this.currentPage,
      required this.totalPages,
      required this.totalAbsences})
      : _absences = absences;

  factory _$PaginatedAbsenceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedAbsenceResponseImplFromJson(json);

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
  String toString() {
    return 'PaginatedAbsenceResponse(absences: $absences, currentPage: $currentPage, totalPages: $totalPages, totalAbsences: $totalAbsences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedAbsenceResponseImpl &&
            const DeepCollectionEquality().equals(other._absences, _absences) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalAbsences, totalAbsences) ||
                other.totalAbsences == totalAbsences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_absences),
      currentPage,
      totalPages,
      totalAbsences);

  /// Create a copy of PaginatedAbsenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedAbsenceResponseImplCopyWith<_$PaginatedAbsenceResponseImpl>
      get copyWith => __$$PaginatedAbsenceResponseImplCopyWithImpl<
          _$PaginatedAbsenceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedAbsenceResponseImplToJson(
      this,
    );
  }
}

abstract class _PaginatedAbsenceResponse implements PaginatedAbsenceResponse {
  const factory _PaginatedAbsenceResponse(
      {required final List<Absence> absences,
      required final int currentPage,
      required final int totalPages,
      required final int totalAbsences}) = _$PaginatedAbsenceResponseImpl;

  factory _PaginatedAbsenceResponse.fromJson(Map<String, dynamic> json) =
      _$PaginatedAbsenceResponseImpl.fromJson;

  @override
  List<Absence> get absences;
  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  int get totalAbsences;

  /// Create a copy of PaginatedAbsenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedAbsenceResponseImplCopyWith<_$PaginatedAbsenceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
