import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:expense_tracker/app/ui/src/theme.dart';
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
        return ThemeSwitcher.switcher(
          // clipper: ThemeSwitcher,
          builder: (_, ThemeSwitcherState switcher) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    // AppLocalizations.delegate.load(locale)
                    context.read<ThemeCubit>().useLightTheme();
                    switcher.changeTheme(
                      theme: ExpenseTrackerTheme.standard.copyWith(
                        brightness: Brightness.light,
                      ),
                    );
                  },
                  title: const Text('Light'),
                  trailing: state is ThemeLight ? const CheckMark() : null,
                ),
                ListTile(
                  title: const Text('Dark'),
                  onTap: () {
                    context.read<ThemeCubit>().useDarkTheme();
                    switcher.changeTheme(
                      theme: ExpenseTrackerTheme.darkTheme.copyWith(
                        brightness: Brightness.dark,
                      ),
                    );
                  },
                  trailing: state is ThemeDark ? const CheckMark() : null,
                ),
                ListTile(
                  title: const Text('System'),
                  onTap: () {
                    context.read<ThemeCubit>().useSystemTheme();
                    final isPlatformDark =
                        WidgetsBinding.instance.window.platformBrightness ==
                            Brightness.dark;
                    switcher.changeTheme(
                      theme: isPlatformDark
                          ? ExpenseTrackerTheme.darkTheme.copyWith(
                              brightness: Brightness.dark,
                            )
                          : ExpenseTrackerTheme.standard.copyWith(
                              brightness: Brightness.light,
                            ),
                    );
                  },
                  trailing: state is ThemeSystem ? const CheckMark() : null,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
