import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/security/cubit/security_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/security/widgets/security_body.dart';
import 'package:flutter/material.dart';

/// {@template security_page}
/// A description for SecurityPage
/// {@endtemplate}
class SecurityPage extends StatelessWidget {
  /// {@macro security_page}
  const SecurityPage({super.key});

  /// The static route for SecurityPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SecurityPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SecurityCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Security'),
        ),
        body: const SecurityView(),
      ),
    );
  }
}

/// {@template security_view}
/// Displays the Body of SecurityView
/// {@endtemplate}
class SecurityView extends StatelessWidget {
  /// {@macro security_view}
  const SecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SecurityBody();
  }
}
