import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/currency/currency_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _settings = [
      'Currency',
      'Language',
      'Theme',
      'Security',
      'Notification',
    ];
    final _other = [
      'About',
      'Help',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          for (final x in _settings)
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
              trailing: Row(
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
          for (final x in _other)
            ListTile(
              title: Text(x),
              trailing: Icon(
                Icons.navigate_next,
                color: ExpenseTrackerColors.violet,
              ),
            ),
        ],
      ),
    );
  }
}
