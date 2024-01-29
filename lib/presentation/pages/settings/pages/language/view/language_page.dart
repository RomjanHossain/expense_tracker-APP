import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/language/widgets/language_body.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';

/// {@template language_page}
/// A description for LanguagePage
/// {@endtemplate}
class LanguagePage extends StatelessWidget {
  /// {@macro language_page}
  const LanguagePage({super.key});

  /// The static route for LanguagePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LanguagePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode(context)
            ? ExpenseTrackerColors.dark
            : ExpenseTrackerColors.light,
        title: const Text('Language'),
      ),
      body: const LanguageView(),
    );
  }
}

/// {@template language_view}
/// Displays the Body of LanguageView
/// {@endtemplate}
class LanguageView extends StatelessWidget {
  /// {@macro language_view}
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LanguageBody();
  }
}
