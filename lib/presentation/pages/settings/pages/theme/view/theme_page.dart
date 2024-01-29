import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/widgets/theme_body.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template theme_page}
/// A description for ThemePage
/// {@endtemplate}
class ThemePage extends StatelessWidget {
  /// {@macro theme_page}
  const ThemePage({super.key});

  /// The static route for ThemePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ThemePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode(context)
            ? ExpenseTrackerColors.dark
            : ExpenseTrackerColors.light,
        title: const Text('Theme'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop('hola');
          },
        ),
      ),
      body: const ThemeView(),
    );
  }
}

/// {@template theme_view}
/// Displays the Body of ThemeView
/// {@endtemplate}
class ThemeView extends StatelessWidget {
  /// {@macro theme_view}
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeBody();
  }
}
