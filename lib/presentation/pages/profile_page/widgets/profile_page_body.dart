import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/account_page/account_page.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template profile_page_body}
/// Body of the ProfilePagePage.
///
/// Add what it does
/// {@endtemplate}
class ProfilePageBody extends StatelessWidget {
  /// {@macro profile_page_body}
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageBloc, ProfilePageState>(
      builder: (context, state) {
        final _iconWithTitle = [
          (Icons.wallet, 'Account'),
          (Icons.settings, 'Settings'),
          (CupertinoIcons.tray_arrow_up_fill, 'Export Data'),
          (CupertinoIcons.tray_arrow_down_fill, 'Import Data'),
          (Icons.logout, 'Logout'),
        ];
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.05.sw,
            vertical: 0.05.sh,
          ),
          child: ListView(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: ExpenseTrackerColors.violet,
                    radius: 33.r,
                    child: CircleAvatar(
                      radius: 31.r,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 27.r,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvJaoIeJQU_V9rL_ZII61whWyqSFbmMgTgwQ&usqp=CAU',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.05.sw,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: ExpenseTrackerTextStyle.small.copyWith(
                            color: ExpenseTrackerColors.light20,
                          ),
                        ),
                        Text(
                          'Iriana Saliha',
                          style: ExpenseTrackerTextStyle.title2.copyWith(
                            color: ExpenseTrackerColors.dark75,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.pencil,
                    ),
                  ),
                ],
              ),
              Container(
                // height: 0.579.sh,
                margin: EdgeInsets.symmetric(
                  vertical: 0.05.sh,
                ),
                padding: EdgeInsets.symmetric(
                  // horizontal: 0.05.sw,
                  vertical: 0.05.sh,
                ),
                decoration: BoxDecoration(
                  color: ExpenseTrackerColors.light,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    for (final i in _iconWithTitle)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            switch (i.$2) {
                              case 'Account':
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute<AccountPage>(
                                    builder: (_) => const AccountPage(),
                                  ),
                                );
                              case 'Settings':
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute<SettingsPage>(
                                    builder: (_) => const SettingsPage(),
                                  ),
                                );
                              default:
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute<SettingsPage>(
                                    builder: (_) => const SettingsPage(),
                                  ),
                                );
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          leading: Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: i.$2 == 'Logout'
                                  ? ExpenseTrackerColors.red20
                                  : ExpenseTrackerColors.violet20,
                              borderRadius: BorderRadius.circular(10).r,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              i.$1,
                              size: 25.h,
                              color: i.$2 == 'Logout'
                                  ? ExpenseTrackerColors.red
                                  : ExpenseTrackerColors.violet,
                            ),
                          ),
                          // color: ExpenseTrackerColors.violet,
                          title: Text(i.$2),
                        ),
                      ),
                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
