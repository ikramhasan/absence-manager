import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure({
    required int code,
    required String message,
  }) = _Failure;

  factory Failure.none() => const _Failure(
        code: 0,
        message: '',
      );
}
