import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/cubit/cubit.dart';

/// {@template expensedetails_body}
/// Body of the ExpensedetailsPage.
///
/// Add what it does
/// {@endtemplate}
class ExpensedetailsBody extends StatelessWidget {
  /// {@macro expensedetails_body}
  const ExpensedetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensedetailsCubit, ExpensedetailsState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
