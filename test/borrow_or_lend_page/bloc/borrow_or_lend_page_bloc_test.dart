// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/presentation/pages/borrow_or_lend_page/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BorrowOrLendPageBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          BorrowOrLendPageBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final borrowOrLendPageBloc = BorrowOrLendPageBloc();
      expect(borrowOrLendPageBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<BorrowOrLendPageBloc, BorrowOrLendPageState>(
      'CustomBorrowOrLendPageEvent emits nothing',
      build: BorrowOrLendPageBloc.new,
      act: (bloc) => bloc.add(const CustomBorrowOrLendPageEvent()),
      expect: () => <BorrowOrLendPageState>[],
    );
  });
}
