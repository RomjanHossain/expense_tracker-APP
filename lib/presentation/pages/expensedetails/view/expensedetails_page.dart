import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/cubit/cubit.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/widgets/expensedetails_body.dart';

/// {@template expensedetails_page}
/// A description for ExpensedetailsPage
/// {@endtemplate}
class ExpensedetailsPage extends StatelessWidget {
  /// {@macro expensedetails_page}
  const ExpensedetailsPage({super.key});

  /// The static route for ExpensedetailsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ExpensedetailsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpensedetailsCubit(),
      child: const Scaffold(
        body: ExpensedetailsView(),
      ),
    );
  }    
}

/// {@template expensedetails_view}
/// Displays the Body of ExpensedetailsView
/// {@endtemplate}
class ExpensedetailsView extends StatelessWidget {
  /// {@macro expensedetails_view}
  const ExpensedetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpensedetailsBody();
  }
}
