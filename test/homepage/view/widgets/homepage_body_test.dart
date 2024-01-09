// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/homepage/homepage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomepageBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => HomepageBloc(),
          child: MaterialApp(home: HomepageBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
