// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/homepage/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomepageEvent', () {  
    group('CustomHomepageEvent', () {
      test('supports value equality', () {
        expect(
          CustomHomepageEvent(),
          equals(const CustomHomepageEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomHomepageEvent(),
          isNotNull,
        );
      });
    });
  });
}
