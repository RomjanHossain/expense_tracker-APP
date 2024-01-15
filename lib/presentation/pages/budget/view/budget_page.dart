import 'package:expense_tracker/presentation/pages/budget/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/budget/widgets/budget_body.dart';
import 'package:flutter/material.dart';

/// {@template budget_page}
/// A description for BudgetPage
/// {@endtemplate}
class BudgetPage extends StatelessWidget {
  /// {@macro budget_page}
  const BudgetPage({super.key});

  /// The static route for BudgetPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const BudgetPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BudgetBloc(),
      child: const Scaffold(
        body: BudgetView(),
      ),
    );
  }
}

/// {@template budget_view}
/// Displays the Body of BudgetView
/// {@endtemplate}
class BudgetView extends StatelessWidget {
  /// {@macro budget_view}
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BudgetBody();
  }
}
