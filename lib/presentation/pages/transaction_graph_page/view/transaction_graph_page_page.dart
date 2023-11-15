import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/widgets/transaction_graph_page_body.dart';

/// {@template transaction_graph_page_page}
/// A description for TransactionGraphPagePage
/// {@endtemplate}
class TransactionGraphPagePage extends StatelessWidget {
  /// {@macro transaction_graph_page_page}
  const TransactionGraphPagePage({super.key});

  /// The static route for TransactionGraphPagePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const TransactionGraphPagePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionGraphPageBloc(),
      child: const Scaffold(
        body: TransactionGraphPageView(),
      ),
    );
  }    
}

/// {@template transaction_graph_page_view}
/// Displays the Body of TransactionGraphPageView
/// {@endtemplate}
class TransactionGraphPageView extends StatelessWidget {
  /// {@macro transaction_graph_page_view}
  const TransactionGraphPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TransactionGraphPageBody();
  }
}
