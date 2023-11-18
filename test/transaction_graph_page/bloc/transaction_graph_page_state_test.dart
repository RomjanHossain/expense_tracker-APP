// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionGraphPageState', () {
    test('supports value equality', () {
      expect(
        TransactionGraphPageState(),
        equals(
          const TransactionGraphPageState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const TransactionGraphPageState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const transactionGraphPageState = TransactionGraphPageState(
            customProperty: 'My property',
          );
          expect(
            transactionGraphPageState.copyWith(),
            equals(transactionGraphPageState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const transactionGraphPageState = TransactionGraphPageState(
            customProperty: 'My property',
          );
          final otherTransactionGraphPageState = TransactionGraphPageState(
            customProperty: 'My property 2',
          );
          expect(transactionGraphPageState, isNot(equals(otherTransactionGraphPageState)));

          expect(
            transactionGraphPageState.copyWith(
              customProperty: otherTransactionGraphPageState.customProperty,
            ),
            equals(otherTransactionGraphPageState),
          );
        },
      );
    });
  });
}
