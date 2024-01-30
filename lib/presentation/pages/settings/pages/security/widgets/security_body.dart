import 'dart:io';

import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/security/cubit/security_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/components/checkmark_circle.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

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
              trailing: state.securityPin ? const CheckMark() : null,
            ),
            ListTile(
              onTap: () async {
                var canAuthenticate = false;
                if (Platform.isAndroid) {
                  final auth = LocalAuthentication();
                  final canAuthenticateWithBiometrics =
                      await auth.canCheckBiometrics;
                  canAuthenticate = canAuthenticateWithBiometrics ||
                      await auth.isDeviceSupported();
                }
                // context.read<CurrencyCubit>().useDollarCurrency();
                // show a snackbar
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(canAuthenticate
                        ? 'Fingerprint feature is not available right now'
                        : 'Fingerprint is not available'),
                  ),
                );
              },
              title: const Text('Fingerprint'),
              trailing: state.securityFingerprint ? const CheckMark() : null,
            ),
          ],
        );
      },
    );
  }
}
