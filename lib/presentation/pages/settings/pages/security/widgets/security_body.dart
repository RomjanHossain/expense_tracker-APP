import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/security/cubit/security_cubit.dart';
import 'package:flutter/material.dart';

/// {@template security_body}
/// Body of the SecurityPage.
///
/// Add what it does
/// {@endtemplate}
class SecurityBody extends StatelessWidget {
  /// {@macro security_body}
  const SecurityBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecurityCubit, SecurityState>(
      builder: (context, state) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                // context.read<CurrencyCubit>().useDollarCurrency();
              },
              title: const Text('PIN'),
              trailing: state is CurrencyDollar ? const CheckMark() : null,
            ),
            ListTile(
              onTap: () {
                // context.read<CurrencyCubit>().useDollarCurrency();
              },
              title: const Text('Fingerprint'),
              // trailing: state is CurrencyDollar ? const CheckMark() : null,
            ),
          ],
        );
      },
    );
  }
}
