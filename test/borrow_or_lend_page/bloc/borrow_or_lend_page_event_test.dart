// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/borrow_or_lend_page/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BorrowOrLendPageEvent', () {  
    group('CustomBorrowOrLendPageEvent', () {
      test('supports value equality', () {
        expect(
          CustomBorrowOrLendPageEvent(),
          equals(const CustomBorrowOrLendPageEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomBorrowOrLendPageEvent(),
          isNotNull,
        );
      });
    });
  });
}
