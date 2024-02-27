// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SettingsEvent', () {  
    group('CustomSettingsEvent', () {
      test('supports value equality', () {
        expect(
          CustomSettingsEvent(),
          equals(const CustomSettingsEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomSettingsEvent(),
          isNotNull,
        );
      });
    });
  });
}
