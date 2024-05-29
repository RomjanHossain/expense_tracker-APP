import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/about/widgets/about_body.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';

/// {@template about_page}
/// A description for AboutPage
/// {@endtemplate}
class AboutPage extends StatelessWidget {
  /// {@macro about_page}
  const AboutPage({super.key});

  /// The static route for AboutPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AboutPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode(context)
            ? ExpenseTrackerColors.dark
            : ExpenseTrackerColors.light,
        title: const Text('About'),
      ),
      body: const AboutView(),
    );
  }
}

/// {@template about_view}
/// Displays the Body of AboutView
/// {@endtemplate}
class AboutView extends StatelessWidget {
  /// {@macro about_view}
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AboutBody();
  }
}
