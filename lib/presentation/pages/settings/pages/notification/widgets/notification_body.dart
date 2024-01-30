import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/notification/cubit/cubit.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';

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
        final tileTitle = ExpenseTrackerTextStyle.body1.copyWith(
          color: isDarkMode(context)
              ? ExpenseTrackerColors.light80
              : ExpenseTrackerColors.dark25,
        );
        final tileSubtitle = ExpenseTrackerTextStyle.small.copyWith(
          color: ExpenseTrackerColors.light20,
        );
        return Column(
          children: [
            ListTile(
              title: Text(
                'Expense Alert',
                style: tileTitle,
              ),
              subtitle: Text(
                'Get notification about you’reexpense',
                style: tileSubtitle,
              ),
              isThreeLine: true,
              trailing: Switch(
                  value: state.expenseAlert,
                  onChanged: (v) {
                    context.read<NotificationCubit>().setExpenseAlert(v);
                  }),
            ),
            ListTile(
              title: Text(
                'Budget',
                style: tileTitle,
              ),
              subtitle: Text(
                'Get notification when you’re budget exceeding the limit',
                style: tileSubtitle,
              ),
              isThreeLine: true,
              trailing: Switch(
                  value: state.budgetAlert,
                  onChanged: (v) {
                    context.read<NotificationCubit>().setBudgetAlert(v);
                  }),
            ),
            ListTile(
              title: Text('Tips & Articles', style: tileTitle),
              subtitle: Text(
                'Small & useful pieces of pratical financial advice',
                style: tileSubtitle,
              ),
              isThreeLine: true,
              trailing: Switch(
                  value: state.tipsAlert,
                  onChanged: (v) {
                    context.read<NotificationCubit>().setTipsAlert(v);
                  }),
            ),
          ],
        );
      },
    );
  }
}
