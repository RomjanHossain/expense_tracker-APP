import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/bloc.dart';
import 'package:flutter/material.dart';

/// {@template transaction_graph_page_body}
/// Body of the TransactionGraphPagePage.
///
/// Add what it does
/// {@endtemplate}
class TransactionGraphPageBody extends StatelessWidget {
  /// {@macro transaction_graph_page_body}
  const TransactionGraphPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionGraphPageBloc, TransactionGraphPageState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
