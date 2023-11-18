// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/transaction_graph_page/transaction_graph_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionGraphPageBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => TransactionGraphPageBloc(),
          child: MaterialApp(home: TransactionGraphPageBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
