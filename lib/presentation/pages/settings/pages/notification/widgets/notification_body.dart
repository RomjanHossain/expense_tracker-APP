import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/notification/cubit/cubit.dart';

/// {@template notification_body}
/// Body of the NotificationPage.
///
/// Add what it does
/// {@endtemplate}
class NotificationBody extends StatelessWidget {
  /// {@macro notification_body}
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
