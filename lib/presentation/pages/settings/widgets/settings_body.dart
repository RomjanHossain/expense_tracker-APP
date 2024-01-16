import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/currency/view/currency_page.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/view/theme_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      Navigator.push(
                        context,
                        CupertinoPageRoute<CurrencyPage>(
                          builder: (_) => const CurrencyPage(),
                        ),
                      );
                    case 'Theme':
                      Navigator.push(
                        context,
                        CupertinoPageRoute<ThemePage>(
                          builder: (_) => const ThemePage(),
                        ),
                      );
                    default:
                      Navigator.push(
                        context,
                        CupertinoPageRoute<CurrencyPage>(
                          builder: (_) => const CurrencyPage(),
                        ),
                      );
                  }
                },
                title: Text(x),
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('USD'),
                    Icon(
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
