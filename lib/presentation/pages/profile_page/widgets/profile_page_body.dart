import 'dart:typed_data';

import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/presentation/blocs/user_profile_bloc.dart';
import 'package:expense_tracker/presentation/pages/account_page/account/view/account_page.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
        final iconWithTitle = [
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
              /*NOTE: Profile top section (photo/name/edit) */
              BlocBuilder<UserProfileBloc, UserProfileState>(
                builder: (BuildContext context, UserProfileState state) {
                  final name = state.user?.name;
                  return Row(
                    children: [
                      ///! profile photo
                      CircleAvatar(
                        backgroundColor: ExpenseTrackerColors.violet,
                        radius: 33.r,
                        child: CircleAvatar(
                          radius: 31.r,
                          backgroundColor: ExpenseTrackerColors.light,
                          child: CircleAvatar(
                            radius: 27.r,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: state.user != null
                                  ? state.user!.imageUrl != null
                                      ? SvgPicture.memory(
                                          Uint8List.fromList(
                                            state.user!.imageUrl!,
                                          ),
                                          fit: BoxFit.cover,
                                        )
                                      : Container()
                                  : Container(),
                            ),
                          ),
                        ),
                      ),

                      ///! username
                      Expanded(
                        child: Padding(
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
                                '$name',
                                maxLines: 2,
                                style: ExpenseTrackerTextStyle.title2.copyWith(
                                  color: isDarkMode(context)
                                      ? ExpenseTrackerColors.light60
                                      : ExpenseTrackerColors.dark75,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.pencil,
                        ),
                      ),
                    ],
                  );
                },
              ),
              /*profile bottom section (account/settings/export/import/logout)*/
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
                  color: isDarkMode(context)
                      ? ExpenseTrackerColors.dark
                      : ExpenseTrackerColors.light,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    for (final i in iconWithTitle) ...[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ListTile(
                          onTap: () {
                            switch (i.$2) {
                              case 'Account':
                                Navigator.push(
                                  context,
                                  AccountPage.route(),
                                );
                              case 'Settings':
                                context.pushNamed(
                                  'settings',
                                );
                              case 'Export Data':
                                context.pushNamed(
                                  'export-data',
                                );
                              case 'Import Data':
                              /*
                              This will be a alert box for importing data
                               */
                              // context.pushNamed(
                              //   'import-data',
                              // );
                              case 'Logout':
                                // show a snack bar for logout
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Logout'),
                                  ),
                                );
                              // context.pushNamed(
                              //   'logout',
                              // );

                              default:
                                context.pushNamed(
                                  'settings',
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
                      Divider(
                        indent: 0.1.sw,
                        endIndent: 0.1.sw,
                        thickness: 1,
                        height: 0.01.sh,
                        // color: theme.brightness == Brightness.dark
                        //     ? const Color(0xff222222)
                        //     : const Color(0xfff6f6f6),
                      ),
                    ],
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
