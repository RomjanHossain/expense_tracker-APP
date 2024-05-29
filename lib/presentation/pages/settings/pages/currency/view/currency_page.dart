import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/currency/cubit/currency_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/currency/widgets/currency_body.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';

/// {@template currency_page}
/// A description for CurrencyPage
/// {@endtemplate}
class CurrencyPage extends StatelessWidget {
  /// {@macro currency_page}
  const CurrencyPage({super.key});

  /// The static route for CurrencyPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CurrencyPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrencyCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode(context)
              ? ExpenseTrackerColors.dark
              : ExpenseTrackerColors.light,
          title: const Text('Currency'),
        ),
        body: const CurrencyView(),
      ),
    );
  }
}

/// {@template currency_view}
/// Displays the Body of CurrencyView
/// {@endtemplate}
class CurrencyView extends StatelessWidget {
  /// {@macro currency_view}
  const CurrencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CurrencyBody();
  }
}
