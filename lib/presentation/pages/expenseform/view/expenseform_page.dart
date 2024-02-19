import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/expenseform/widgets/expenseform_body.dart';
import 'package:expense_tracker/services/animation/page_animation.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/material.dart';

/// {@template expenseform_page}
/// A description for ExpenseformPage
/// {@endtemplate}
class ExpenseformPage extends StatelessWidget {
  /// {@macro expenseform_page}
  const ExpenseformPage({required this.expenseType, super.key});

  final ExpenseType expenseType;

  /// The static route for ExpenseformPage
  static Route<dynamic> route(ExpenseType expenseType) {
    // return MaterialPageRoute<dynamic>(builder: (_) => const ExpenseformPage());
    return PageAnimation.sharedAxisTransitionPageWrapper(
      ExpenseformPage(expenseType: expenseType),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: expenseType == ExpenseType.income
          ? ExpenseTrackerColors.green
          : expenseType == ExpenseType.expense
              ? ExpenseTrackerColors.red
              : ExpenseTrackerColors.blue,
      appBar: AppBar(
        backgroundColor: expenseType == ExpenseType.income
            ? ExpenseTrackerColors.green
            : expenseType == ExpenseType.expense
                ? ExpenseTrackerColors.red
                : ExpenseTrackerColors.blue,
        title: Text(
          expenseType == ExpenseType.income
              ? 'Income'
              : expenseType == ExpenseType.expense
                  ? 'Expense'
                  : 'Transfer',
          style: ExpenseTrackerTextStyle.body1.copyWith(
            fontWeight: FontWeight.w500,
            color: ExpenseTrackerColors.light,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: ExpenseTrackerColors.light,
          ),
        ),
      ),
      body: ExpenseformView(
        expenseType: expenseType,
      ),
    );
  }
}

/// {@template expenseform_view}
/// Displays the Body of ExpenseformView
/// {@endtemplate}
class ExpenseformView extends StatelessWidget {
  /// {@macro expenseform_view}
  const ExpenseformView({required this.expenseType, super.key});
  final ExpenseType expenseType;
  @override
  Widget build(BuildContext context) {
    return ExpenseformBody(
      expenseType: expenseType,
    );
  }
}
