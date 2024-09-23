// Mocks generated by Mockito 5.4.4 from annotations
// in absence_manager/test/features/settings/application/settings_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:absence_manager/features/core/domain/failure.dart' as _i6;
import 'package:absence_manager/features/settings/domain/app_settings.dart'
    as _i2;
import 'package:absence_manager/features/settings/domain/i_settings_repository.dart'
    as _i3;
import 'package:fpdart/fpdart.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAppSettings_0 extends _i1.SmartFake implements _i2.AppSettings {
  _FakeAppSettings_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ISettingsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockISettingsRepository extends _i1.Mock
    implements _i3.ISettingsRepository {
  MockISettingsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i5.Either<_i6.Failure, _i5.Unit>> saveSettings(
          _i2.AppSettings? settings) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveSettings,
          [settings],
        ),
        returnValue: _i4.Future<_i5.Either<_i6.Failure, _i5.Unit>>.value(
            _i7.dummyValue<_i5.Either<_i6.Failure, _i5.Unit>>(
          this,
          Invocation.method(
            #saveSettings,
            [settings],
          ),
        )),
      ) as _i4.Future<_i5.Either<_i6.Failure, _i5.Unit>>);

  @override
  _i4.Future<_i2.AppSettings> getSettings() => (super.noSuchMethod(
        Invocation.method(
          #getSettings,
          [],
        ),
        returnValue: _i4.Future<_i2.AppSettings>.value(_FakeAppSettings_0(
          this,
          Invocation.method(
            #getSettings,
            [],
          ),
        )),
      ) as _i4.Future<_i2.AppSettings>);
}
