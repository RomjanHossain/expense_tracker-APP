// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProfilePageEvent', () {  
    group('CustomProfilePageEvent', () {
      test('supports value equality', () {
        expect(
          CustomProfilePageEvent(),
          equals(const CustomProfilePageEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomProfilePageEvent(),
          isNotNull,
        );
      });
    });
  });
}
