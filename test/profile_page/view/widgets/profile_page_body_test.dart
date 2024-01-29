// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProfilePageBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ProfilePageBloc(),
          child: MaterialApp(home: ProfilePageBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
