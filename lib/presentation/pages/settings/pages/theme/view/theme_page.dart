import 'package:expense_tracker/presentation/pages/app_home_page/app_home_page.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/cubit/theme_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/widgets/theme_body.dart';
import 'package:flutter/material.dart';

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
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit()..getTheme(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Theme'),
        ),
        body: const ThemeView(),
      ),
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
