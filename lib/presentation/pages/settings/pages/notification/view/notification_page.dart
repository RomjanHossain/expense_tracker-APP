import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/notification/cubit/cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/notification/widgets/notification_body.dart';

/// {@template notification_page}
/// A description for NotificationPage
/// {@endtemplate}
class NotificationPage extends StatelessWidget {
  /// {@macro notification_page}
  const NotificationPage({super.key});

  /// The static route for NotificationPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const NotificationPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
        ),
        body: NotificationView(),
      ),
    );
  }
}

/// {@template notification_view}
/// Displays the Body of NotificationView
/// {@endtemplate}
class NotificationView extends StatelessWidget {
  /// {@macro notification_view}
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NotificationBody();
  }
}
