// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/settings/pages/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationPage', () {
    group('route', () {
      test('is routable', () {
        expect(NotificationPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders NotificationView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: NotificationPage()));
      expect(find.byType(NotificationView), findsOneWidget);
    });
  });
}
