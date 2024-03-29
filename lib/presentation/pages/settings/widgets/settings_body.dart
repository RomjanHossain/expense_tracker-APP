import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/language/cubit/language_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// {@template settings_body}
/// Body of the SettingsPage.
///
/// Add what it does
/// {@endtemplate}
class SettingsBody extends StatelessWidget {
  /// {@macro settings_body}
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = [
      'Currency',
      'Language',
      'Theme',
      'Security',
      'Notification',
    ];
    final other = [
      'About',
      'Help',
    ];

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Column(
          children: [
            for (final x in settings)
              ListTile(
                onTap: () {
                  switch (x) {
                    case 'Currency':
                      GoRouter.of(context).pushNamed('currency');
                    case 'Theme':
                      GoRouter.of(context).pushNamed('theme');
                    case 'Language':
                      GoRouter.of(context).pushNamed('language');
                    case 'Security':
                      GoRouter.of(context).pushNamed('security');
                    case 'Notification':
                      GoRouter.of(context).pushNamed('notification');
                    case 'About':
                      context.pushNamed('about');
                    case 'Help':
                      context.pushNamed('help');
                    default:
                      context.pushNamed('help');
                  }
                },
                title: Text(x),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TrailingText(x: x),
                    const Icon(
                      Icons.navigate_next,
                      color: ExpenseTrackerColors.violet,
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 0.02.sh,
            ),
            for (final x in other)
              ListTile(
                onTap: () {
                  switch (x) {
                    case 'About':
                      context.pushNamed('about');
                    case 'Help':
                      context.pushNamed('help');
                    default:
                      context.pushNamed('help');
                  }
                },
                title: Text(x),
                trailing: const Icon(
                  Icons.navigate_next,
                  color: ExpenseTrackerColors.violet,
                ),
              ),
          ],
        );
      },
    );
  }
}

class TrailingText extends StatefulWidget {
  const TrailingText({
    required this.x,
    super.key,
  });

  final String x;

  @override
  State<TrailingText> createState() => _TrailingTextState();
}

class _TrailingTextState extends State<TrailingText> {
  String trailing = '';
  String getTrailing() {
    final themeState = context.watch<ThemeCubit>().state;
    final languageState = context.watch<LanguageCubit>().state;
    switch (widget.x) {
      case 'Currency':
        return 'USD';
      case 'Language':
        // return 'English';
        switch (languageState) {
          case LanguageBangla():
            return 'Bangla';
          case LanguageEnglish():
            return 'English';
          default:
            return 'English';
        }
      case 'Theme':
        switch (themeState) {
          case ThemeLight():
            return 'Light';
          case ThemeDark():
            return 'Dark';
          default:
            return 'System';
        }
      case 'Security':
        return 'Pin';
      case 'Notification':
        return 'Expense Alert';
      default:
        return 'USD';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getTrailing(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: ExpenseTrackerColors.light20,
      ),
    );
  }
}
