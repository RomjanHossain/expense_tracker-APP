// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/borrow_or_lend_page/borrow_or_lend_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BorrowOrLendPageBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => BorrowOrLendPageBloc(),
          child: MaterialApp(home: BorrowOrLendPageBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
