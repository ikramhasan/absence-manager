import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true, createToJson: false)

/// A class representing a generic API response.
class ApiResponse<T> with _$ApiResponse<T> {
  /// Creates an [ApiResponse] instance with the given [message] and [payload].
  ///
  /// [message] is a description of the response.
  /// [payload] is the data returned by the API.
  const factory ApiResponse({
    required String message,
    required List<T> payload,
  }) = _ApiResponse;

  /// Creates an [ApiResponse] instance from a JSON object.
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJson,
  ) {
    return _$ApiResponseFromJson(json, fromJson);
  }

  /// Creates an empty [ApiResponse] instance.
  factory ApiResponse.empty() => const _ApiResponse(
        message: '',
        payload: [],
      );
}
