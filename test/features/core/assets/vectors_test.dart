import 'dart:io';

import 'package:absence_manager/features/core/assets/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('vectors assets test', () {
    expect(File(Vectors.calendarOutline).existsSync(), isTrue);
    expect(File(Vectors.cogOutline).existsSync(), isTrue);
    expect(File(Vectors.peopleOutline).existsSync(), isTrue);
  });
}
