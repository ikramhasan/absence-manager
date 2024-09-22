import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
/// A class representing a failure with a specific code and message.
class Failure with _$Failure {
  /// Creates a [Failure] instance with the given [code] and [message].
  ///
  /// [code] is the error code associated with the failure.
  /// [message] is a description of the failure.
  const factory Failure({
    required int code,
    required String message,
  }) = _Failure;

  /// Creates a [Failure] instance representing no failure.
  ///
  /// This factory returns a [Failure] with a code of 0 and an empty message.
  factory Failure.none() => const _Failure(
        code: 0,
        message: '',
      );
}
