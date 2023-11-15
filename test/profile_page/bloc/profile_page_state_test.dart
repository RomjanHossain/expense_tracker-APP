// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';

void main() {
  group('ProfilePageState', () {
    test('supports value equality', () {
      expect(
        ProfilePageState(),
        equals(
          const ProfilePageState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ProfilePageState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const profilePageState = ProfilePageState(
            customProperty: 'My property',
          );
          expect(
            profilePageState.copyWith(),
            equals(profilePageState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const profilePageState = ProfilePageState(
            customProperty: 'My property',
          );
          final otherProfilePageState = ProfilePageState(
            customProperty: 'My property 2',
          );
          expect(profilePageState, isNot(equals(otherProfilePageState)));

          expect(
            profilePageState.copyWith(
              customProperty: otherProfilePageState.customProperty,
            ),
            equals(otherProfilePageState),
          );
        },
      );
    });
  });
}
