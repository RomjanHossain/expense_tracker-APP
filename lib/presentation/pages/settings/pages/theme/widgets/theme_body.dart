import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/components/checkmark_circle.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';

/// {@template theme_body}
/// Body of the ThemePage.
///
/// Add what it does
/// {@endtemplate}
class ThemeBody extends StatelessWidget {
  /// {@macro theme_body}
  const ThemeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                context.read<ThemeCubit>().useLightTheme();
              },
              title: const Text('Light'),
              trailing: state is ThemeLight ? const CheckMark() : null,
            ),
            ListTile(
              title: const Text('Dark'),
              onTap: () {
                context.read<ThemeCubit>().useDarkTheme();
              },
              trailing: state is ThemeDark ? const CheckMark() : null,
            ),
            ListTile(
              title: const Text('System'),
              onTap: () {
                context.read<ThemeCubit>().useSystemTheme();
              },
              trailing: state is ThemeSystem ? const CheckMark() : null,
            ),
          ],
        );
      },
    );
  }
}
