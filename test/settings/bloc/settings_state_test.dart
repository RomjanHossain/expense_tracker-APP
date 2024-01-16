// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';

void main() {
  group('SettingsState', () {
    test('supports value equality', () {
      expect(
        SettingsState(),
        equals(
          const SettingsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const SettingsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const settingsState = SettingsState(
            customProperty: 'My property',
          );
          expect(
            settingsState.copyWith(),
            equals(settingsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const settingsState = SettingsState(
            customProperty: 'My property',
          );
          final otherSettingsState = SettingsState(
            customProperty: 'My property 2',
          );
          expect(settingsState, isNot(equals(otherSettingsState)));

          expect(
            settingsState.copyWith(
              customProperty: otherSettingsState.customProperty,
            ),
            equals(otherSettingsState),
          );
        },
      );
    });
  });
}
