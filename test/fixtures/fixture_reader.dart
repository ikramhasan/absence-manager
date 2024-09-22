import 'dart:io';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

String localDataFixture(String name) =>
    File('lib/features/absence/data/$name').readAsStringSync();
