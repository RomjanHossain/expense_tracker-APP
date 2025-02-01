import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/presentation/pages/expenseform/widgets/expenseform_body.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/bloc.dart';
import 'package:expense_tracker/services/animation/page_animation.dart';
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
    return PageAnimation.sharedAxisTransitionPageWrapper(
      ExpenseformPage(expenseType: expenseType),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expenseData = _getExpenseData(expenseType);

    return PopScope(
      onPopInvokedWithResult: (isPop, data) {
        if (isPop) {
          context.read<HomepageBloc>().add(const InitCalander());
          Navigator.pop(context, data);
        }
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: expenseData['color'] as Color,
        appBar: _buildAppBar(context, expenseData),
        body: ExpenseformView(expenseType: expenseType),
      ),
    );
  }

  /// Returns a map containing the color and title based on the expense type.
  Map<String, dynamic> _getExpenseData(ExpenseType expenseType) {
    switch (expenseType) {
      case ExpenseType.income:
        return {
          'color': ExpenseTrackerColors.green,
          'title': 'Income',
        };
      case ExpenseType.expense:
        return {
          'color': ExpenseTrackerColors.red,
          'title': 'Expense',
        };
      case ExpenseType.transfer:
        return {
          'color': ExpenseTrackerColors.blue,
          'title': 'Transfer',
        };
    }
  }

  /// Builds the AppBar with dynamic properties based on expense type.
  AppBar _buildAppBar(BuildContext context, Map<String, dynamic> expenseData) {
    return AppBar(
      backgroundColor: expenseData['color'] as Color,
      title: Text(
        expenseData['title'].toString(),
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
