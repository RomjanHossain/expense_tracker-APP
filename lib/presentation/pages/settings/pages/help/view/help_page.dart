import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/help/widgets/help_body.dart';

/// {@template help_page}
/// A description for HelpPage
/// {@endtemplate}
class HelpPage extends StatelessWidget {
  /// {@macro help_page}
  const HelpPage({super.key});

  /// The static route for HelpPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HelpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode(context)
            ? ExpenseTrackerColors.dark
            : ExpenseTrackerColors.light,
        title: const Text('Help'),
      ),
      body: const HelpView(),
    );
  }
}

/// {@template help_view}
/// Displays the Body of HelpView
/// {@endtemplate}
class HelpView extends StatelessWidget {
  /// {@macro help_view}
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HelpBody();
  }
}
