// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/settings/pages/notification/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationState', () {
    test('supports value equality', () {
      expect(
        NotificationState(),
        equals(
          const NotificationState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const NotificationState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const notificationState = NotificationState(
            customProperty: 'My property',
          );
          expect(
            notificationState.copyWith(),
            equals(notificationState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const notificationState = NotificationState(
            customProperty: 'My property',
          );
          final otherNotificationState = NotificationState(
            customProperty: 'My property 2',
          );
          expect(notificationState, isNot(equals(otherNotificationState)));

          expect(
            notificationState.copyWith(
              customProperty: otherNotificationState.customProperty,
            ),
            equals(otherNotificationState),
          );
        },
      );
    });
  });
}
