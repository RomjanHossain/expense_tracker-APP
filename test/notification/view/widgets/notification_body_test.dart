// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/settings/pages/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => NotificationCubit(),
          child: MaterialApp(home: NotificationBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
