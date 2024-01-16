import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/pages/account_page/detail_account_page.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/onboarding_account_setup.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Account'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
                // color: ExpenseTrackerColors.violet,
                // borderRadius: BorderRadius.all(
                //   Radius.circular(20.r),
                // ),
                ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Account Balance',
                  style: ExpenseTrackerTextStyle.body3.copyWith(
                    color: ExpenseTrackerColors.light20,
                  ),
                ),
                Text(
                  '₦ 0.00',
                  style: ExpenseTrackerTextStyle.title1.copyWith(
                    color: ExpenseTrackerColors.dark75,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              for (final _ in [2, 3, 4, 5])
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) => const DetailAccountPage()),
                    );
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 5.h,
                  ),
                  leading: Container(
                    width: 50.w,
                    height: 50.h,
                    margin: EdgeInsets.only(
                      right: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: ExpenseTrackerColors.violet20,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Icon(Icons.wallet),
                  ),
                  title: Text(
                    'Wallet',
                    style: ExpenseTrackerTextStyle.title3.copyWith(
                      color: ExpenseTrackerColors.dark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    '₦ 0.00',
                    style: ExpenseTrackerTextStyle.title3.copyWith(
                      color: ExpenseTrackerColors.dark50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          )),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: OpenContainer(
          closedBuilder: (context, action) {
            return PrimaryButton(onPress: action, text: 'Add Account');
          },
          openBuilder: (context, action) {
            return const OnboardingAccountSetupPage();
          },
        ),
      ),
    );
  }
}
