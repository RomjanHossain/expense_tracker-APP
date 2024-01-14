import 'package:expense_tracker/presentation/pages/borrow_or_lend_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/borrow_or_lend_page/widgets/borrow_or_lend_page_body.dart';
import 'package:flutter/material.dart';

/// {@template borrow_or_lend_page_page}
/// A description for BorrowOrLendPagePage
/// {@endtemplate}
class BudgetPage extends StatelessWidget {
  /// {@macro borrow_or_lend_page_page}
  const BudgetPage({super.key});

  /// The static route for BorrowOrLendPagePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const BudgetPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BorrowOrLendPageBloc(),
      child: const Scaffold(
        body: BorrowOrLendPageView(),
      ),
    );
  }
}

/// {@template borrow_or_lend_page_view}
/// Displays the Body of BorrowOrLendPageView
/// {@endtemplate}
class BorrowOrLendPageView extends StatelessWidget {
  /// {@macro borrow_or_lend_page_view}
  const BorrowOrLendPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BorrowOrLendPageBody();
  }
}
