import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/bloc.dart';
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
    return BlocProvider(
      create: (context) => ExpenseformBloc(),
      child: Scaffold(
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
          centerTitle: true,
          title: Text(
            expenseType == ExpenseType.income
                ? 'Income'
                : expenseType == ExpenseType.expense
                    ? 'Expense'
                    : 'Transfer',
            style: ExpenseTrackerTextStyle.regular1.copyWith(
              fontWeight: FontWeight.w500,
              color: ExpenseTrackerColors.white,
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: ExpenseTrackerColors.white,
            ),
          ),
        ),
        body: ExpenseformView(expenseType: expenseType,),
      ),
    );
  }
}

/// {@template expenseform_view}
/// Displays the Body of ExpenseformView
/// {@endtemplate}
class ExpenseformView extends StatelessWidget {
  /// {@macro expenseform_view}
  const ExpenseformView({super.key, required this.expenseType});
  final ExpenseType expenseType;
  @override
  Widget build(BuildContext context) {
    return  ExpenseformBody(expenseType: expenseType,);
  }
}