// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/borrow_or_lend_page/bloc/bloc.dart';

void main() {
  group('BorrowOrLendPageState', () {
    test('supports value equality', () {
      expect(
        BorrowOrLendPageState(),
        equals(
          const BorrowOrLendPageState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const BorrowOrLendPageState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const borrowOrLendPageState = BorrowOrLendPageState(
            customProperty: 'My property',
          );
          expect(
            borrowOrLendPageState.copyWith(),
            equals(borrowOrLendPageState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const borrowOrLendPageState = BorrowOrLendPageState(
            customProperty: 'My property',
          );
          final otherBorrowOrLendPageState = BorrowOrLendPageState(
            customProperty: 'My property 2',
          );
          expect(borrowOrLendPageState, isNot(equals(otherBorrowOrLendPageState)));

          expect(
            borrowOrLendPageState.copyWith(
              customProperty: otherBorrowOrLendPageState.customProperty,
            ),
            equals(otherBorrowOrLendPageState),
          );
        },
      );
    });
  });
}
