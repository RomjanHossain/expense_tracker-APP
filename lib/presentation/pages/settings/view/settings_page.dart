import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/currency/cubit/currency_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/language/cubit/language_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/security/cubit/security_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/cubit/theme_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/widgets/settings_body.dart';
import 'package:flutter/material.dart';

/// {@template settings_page}
/// A description for SettingsPage
/// {@endtemplate}
class SettingsPage extends StatelessWidget {
  /// {@macro settings_page}
  const SettingsPage({super.key});

  /// The static route for SettingsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SettingsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: const SettingsView(),
      ),
    );
  }
}

/// {@template settings_view}
/// Displays the Body of SettingsView
/// {@endtemplate}
class SettingsView extends StatelessWidget {
  /// {@macro settings_view}
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsBody();
  }
}
