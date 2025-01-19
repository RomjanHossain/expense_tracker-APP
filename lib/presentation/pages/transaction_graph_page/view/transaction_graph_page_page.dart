import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/widgets/transaction_graph_page_body.dart';
import 'package:flutter/material.dart';

class TransactionGraphPagePage extends StatelessWidget {
  const TransactionGraphPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionGraphPageBloc()
        ..add(const InitTransactionGraphPageEvent()),
      child: const Scaffold(
        body: TransactionGraphPageView(),
      ),
    );
  }
}

class TransactionGraphPageView extends StatelessWidget {
  const TransactionGraphPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TransactionGraphPageBody();
  }
}
