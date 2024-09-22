// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'absence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Absence _$AbsenceFromJson(Map<String, dynamic> json) {
  return _Absence.fromJson(json);
}

/// @nodoc
mixin _$Absence {
  String get admitterNote => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get crewId => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get memberNote => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  Type get type => throw _privateConstructorUsedError;
  DateTime? get rejectedAt => throw _privateConstructorUsedError;
  int? get admitterId => throw _privateConstructorUsedError;
  DateTime? get confirmedAt => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  /// Serializes this Absence to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbsenceCopyWith<Absence> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsenceCopyWith<$Res> {
  factory $AbsenceCopyWith(Absence value, $Res Function(Absence) then) =
      _$AbsenceCopyWithImpl<$Res, Absence>;
  @useResult
  $Res call(
      {String admitterNote,
      DateTime createdAt,
      int crewId,
      DateTime startDate,
      DateTime endDate,
      int id,
      String memberNote,
      int userId,
      Type type,
      DateTime? rejectedAt,
      int? admitterId,
      DateTime? confirmedAt,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AbsenceCopyWithImpl<$Res, $Val extends Absence>
    implements $AbsenceCopyWith<$Res> {
  _$AbsenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admitterNote = null,
    Object? createdAt = null,
    Object? crewId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? id = null,
    Object? memberNote = null,
    Object? userId = null,
    Object? type = null,
    Object? rejectedAt = freezed,
    Object? admitterId = freezed,
    Object? confirmedAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      admitterNote: null == admitterNote
          ? _value.admitterNote
          : admitterNote // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      crewId: null == crewId
          ? _value.crewId
          : crewId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      memberNote: null == memberNote
          ? _value.memberNote
          : memberNote // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      admitterId: freezed == admitterId
          ? _value.admitterId
          : admitterId // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AbsenceImplCopyWith<$Res> implements $AbsenceCopyWith<$Res> {
  factory _$$AbsenceImplCopyWith(
          _$AbsenceImpl value, $Res Function(_$AbsenceImpl) then) =
      __$$AbsenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String admitterNote,
      DateTime createdAt,
      int crewId,
      DateTime startDate,
      DateTime endDate,
      int id,
      String memberNote,
      int userId,
      Type type,
      DateTime? rejectedAt,
      int? admitterId,
      DateTime? confirmedAt,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AbsenceImplCopyWithImpl<$Res>
    extends _$AbsenceCopyWithImpl<$Res, _$AbsenceImpl>
    implements _$$AbsenceImplCopyWith<$Res> {
  __$$AbsenceImplCopyWithImpl(
      _$AbsenceImpl _value, $Res Function(_$AbsenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admitterNote = null,
    Object? createdAt = null,
    Object? crewId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? id = null,
    Object? memberNote = null,
    Object? userId = null,
    Object? type = null,
    Object? rejectedAt = freezed,
    Object? admitterId = freezed,
    Object? confirmedAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_$AbsenceImpl(
      admitterNote: null == admitterNote
          ? _value.admitterNote
          : admitterNote // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      crewId: null == crewId
          ? _value.crewId
          : crewId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      memberNote: null == memberNote
          ? _value.memberNote
          : memberNote // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      admitterId: freezed == admitterId
          ? _value.admitterId
          : admitterId // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsenceImpl implements _Absence {
  const _$AbsenceImpl(
      {required this.admitterNote,
      required this.createdAt,
      required this.crewId,
      required this.startDate,
      required this.endDate,
      required this.id,
      required this.memberNote,
      required this.userId,
      required this.type,
      this.rejectedAt,
      this.admitterId,
      this.confirmedAt,
      this.user});

  factory _$AbsenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbsenceImplFromJson(json);

  @override
  final String admitterNote;
  @override
  final DateTime createdAt;
  @override
  final int crewId;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final int id;
  @override
  final String memberNote;
  @override
  final int userId;
  @override
  final Type type;
  @override
  final DateTime? rejectedAt;
  @override
  final int? admitterId;
  @override
  final DateTime? confirmedAt;
  @override
  final User? user;

  @override
  String toString() {
    return 'Absence(admitterNote: $admitterNote, createdAt: $createdAt, crewId: $crewId, startDate: $startDate, endDate: $endDate, id: $id, memberNote: $memberNote, userId: $userId, type: $type, rejectedAt: $rejectedAt, admitterId: $admitterId, confirmedAt: $confirmedAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsenceImpl &&
            (identical(other.admitterNote, admitterNote) ||
                other.admitterNote == admitterNote) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.crewId, crewId) || other.crewId == crewId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memberNote, memberNote) ||
                other.memberNote == memberNote) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.rejectedAt, rejectedAt) ||
                other.rejectedAt == rejectedAt) &&
            (identical(other.admitterId, admitterId) ||
                other.admitterId == admitterId) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      admitterNote,
      createdAt,
      crewId,
      startDate,
      endDate,
      id,
      memberNote,
      userId,
      type,
      rejectedAt,
      admitterId,
      confirmedAt,
      user);

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsenceImplCopyWith<_$AbsenceImpl> get copyWith =>
      __$$AbsenceImplCopyWithImpl<_$AbsenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsenceImplToJson(
      this,
    );
  }
}

abstract class _Absence implements Absence {
  const factory _Absence(
      {required final String admitterNote,
      required final DateTime createdAt,
      required final int crewId,
      required final DateTime startDate,
      required final DateTime endDate,
      required final int id,
      required final String memberNote,
      required final int userId,
      required final Type type,
      final DateTime? rejectedAt,
      final int? admitterId,
      final DateTime? confirmedAt,
      final User? user}) = _$AbsenceImpl;

  factory _Absence.fromJson(Map<String, dynamic> json) = _$AbsenceImpl.fromJson;

  @override
  String get admitterNote;
  @override
  DateTime get createdAt;
  @override
  int get crewId;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  int get id;
  @override
  String get memberNote;
  @override
  int get userId;
  @override
  Type get type;
  @override
  DateTime? get rejectedAt;
  @override
  int? get admitterId;
  @override
  DateTime? get confirmedAt;
  @override
  User? get user;

  /// Create a copy of Absence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbsenceImplCopyWith<_$AbsenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
