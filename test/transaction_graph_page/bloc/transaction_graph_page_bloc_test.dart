// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionGraphPageBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          TransactionGraphPageBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final transactionGraphPageBloc = TransactionGraphPageBloc();
      expect(transactionGraphPageBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<TransactionGraphPageBloc, TransactionGraphPageState>(
      'CustomTransactionGraphPageEvent emits nothing',
      build: TransactionGraphPageBloc.new,
      act: (bloc) => bloc.add(const CustomTransactionGraphPageEvent()),
      expect: () => <TransactionGraphPageState>[],
    );
  });
}
