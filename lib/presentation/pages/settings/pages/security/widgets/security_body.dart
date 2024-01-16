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
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
