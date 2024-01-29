// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionGraphPageEvent', () {  
    group('CustomTransactionGraphPageEvent', () {
      test('supports value equality', () {
        expect(
          CustomTransactionGraphPageEvent(),
          equals(const CustomTransactionGraphPageEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomTransactionGraphPageEvent(),
          isNotNull,
        );
      });
    });
  });
}
