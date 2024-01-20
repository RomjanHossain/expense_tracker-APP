import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/expensereport/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/expensereport/widgets/expensereport_body.dart';
import 'package:expense_tracker/services/animation/page_animation.dart';
import 'package:flutter/material.dart';

/// {@template expensereport_page}
/// A description for ExpensereportPage
/// {@endtemplate}
class ExpensereportPage extends StatelessWidget {
  /// {@macro expensereport_page}
  const ExpensereportPage({super.key});

  /// The static route for ExpensereportPage
  static Route<dynamic> route() {
    // return MaterialPageRoute<dynamic>(builder: (_) => const ExpensereportPage());
    return PageAnimation.sharedAxisTransitionPageWrapper(
      const ExpensereportPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => ExpensereportBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.brightness == Brightness.light
              ? ExpenseTrackerColors.light
              : ExpenseTrackerColors.dark,
          title: Text(
            'Financial Report',
            style: ExpenseTrackerTextStyle.title3.copyWith(
              color: theme.brightness == Brightness.light
                  ? ExpenseTrackerColors.dark
                  : ExpenseTrackerColors.light,
            ),
          ),
        ),
        body: const ExpensereportView(),
      ),
    );
  }
}

/// {@template expensereport_view}
/// Displays the Body of ExpensereportView
/// {@endtemplate}
class ExpensereportView extends StatelessWidget {
  /// {@macro expensereport_view}
  const ExpensereportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpensereportBody();
  }
}
