import 'package:expense_tracker/presentation/pages/borrow_or_lend_page/bloc/bloc.dart';
import 'package:flutter/material.dart';

/// {@template borrow_or_lend_page_body}
/// Body of the BorrowOrLendPagePage.
///
/// Add what it does
/// {@endtemplate}
class BorrowOrLendPageBody extends StatelessWidget {
  /// {@macro borrow_or_lend_page_body}
  const BorrowOrLendPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BorrowOrLendPageBloc, BorrowOrLendPageState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
