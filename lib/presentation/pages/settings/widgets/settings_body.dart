import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
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
    Future<String> getTrailing(String x) async {
      final settingsLocalDataSourcePref = SettingsLocalDataSourcePref();
      switch (x) {
        case 'Currency':
          return 'USD';
        case 'Language':
          return 'English';
        case 'Theme':
          return settingsLocalDataSourcePref.getTheme();
        case 'Security':
          return 'Pin';
        case 'Notification':
          return 'Expense Alert';
        default:
          return 'USD';
      }
    }

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
                    default:
                      context.pushNamed('currency');
                  }
                },
                title: Text(x),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FutureBuilder<String>(
                      future: getTrailing(x),
                      key: Key(x),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ExpenseTrackerColors.light20,
                          ),
                        );
                      },
                    ),
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
