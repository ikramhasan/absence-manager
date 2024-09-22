// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiResponse<T> {
  String get message => throw _privateConstructorUsedError;
  List<T> get payload => throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call({String message, List<T> payload});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? payload = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiResponseImplCopyWith(_$ApiResponseImpl<T> value,
          $Res Function(_$ApiResponseImpl<T>) then) =
      __$$ApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, List<T> payload});
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiResponseImpl<T>>
    implements _$$ApiResponseImplCopyWith<T, $Res> {
  __$$ApiResponseImplCopyWithImpl(
      _$ApiResponseImpl<T> _value, $Res Function(_$ApiResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? payload = null,
  }) {
    return _then(_$ApiResponseImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$ApiResponseImpl<T> implements _ApiResponse<T> {
  const _$ApiResponseImpl(
      {required this.message, required final List<T> payload})
      : _payload = payload;

  @override
  final String message;
  final List<T> _payload;
  @override
  List<T> get payload {
    if (_payload is EqualUnmodifiableListView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payload);
  }

  @override
  String toString() {
    return 'ApiResponse<$T>(message: $message, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_payload));

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<T, _$ApiResponseImpl<T>>(
          this, _$identity);
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  const factory _ApiResponse(
      {required final String message,
      required final List<T> payload}) = _$ApiResponseImpl<T>;

  @override
  String get message;
  @override
  List<T> get payload;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
