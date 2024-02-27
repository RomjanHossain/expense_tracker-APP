// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/createbudget/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreatebudgetState', () {
    test('supports value equality', () {
      expect(
        CreatebudgetState(),
        equals(
          const CreatebudgetState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CreatebudgetState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const createbudgetState = CreatebudgetState(
            customProperty: 'My property',
          );
          expect(
            createbudgetState.copyWith(),
            equals(createbudgetState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const createbudgetState = CreatebudgetState(
            customProperty: 'My property',
          );
          final otherCreatebudgetState = CreatebudgetState(
            customProperty: 'My property 2',
          );
          expect(createbudgetState, isNot(equals(otherCreatebudgetState)));

          expect(
            createbudgetState.copyWith(
              customProperty: otherCreatebudgetState.customProperty,
            ),
            equals(otherCreatebudgetState),
          );
        },
      );
    });
  });
}
