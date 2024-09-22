import 'package:absence_manager/features/core/domain/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Failure', () {
    test('should create a Failure instance with given code and message', () {
      const failure = Failure(code: 404, message: 'Not Found');

      expect(failure.code, 404);
      expect(failure.message, 'Not Found');
    });

    test(
        '.none() factory should create a Failure instance with code 0 and '
        'empty message', () {
      final failure = Failure.none();

      expect(failure.code, 0);
      expect(failure.message, '');
    });
  });
}
