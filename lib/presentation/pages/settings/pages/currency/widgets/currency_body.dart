import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/currency/cubit/currency_cubit.dart';
import 'package:flutter/material.dart';

/// {@template currency_body}
/// Body of the CurrencyPage.
///
/// Add what it does
/// {@endtemplate}
class CurrencyBody extends StatelessWidget {
  /// {@macro currency_body}
  const CurrencyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
