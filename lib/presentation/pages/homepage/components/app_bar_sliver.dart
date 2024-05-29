import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/homepage_bloc.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/account_balance_card.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/dropdown_months.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AccountBalanceSliverAppBar extends StatelessWidget {
  const AccountBalanceSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: 250.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(20).r,
              bottomRight: const Radius.circular(20).r,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                if (isDarkMode(context)) ...[
                  ExpenseTrackerColors.violet60,
                  ExpenseTrackerColors.violet40,
                ] else ...[
                  const Color(0x0ffff6e5),
                  const Color(0xffF8EDD8),
                ],
              ],
            ),
          ),
          child: BlocConsumer<HomepageBloc, HomepageState>(
            buildWhen: (previous, current) =>
                previous.accountBalance != current.accountBalance ||
                previous.income != current.income ||
                previous.expense != current.expense,
            builder: (context, state) {
              return AccountBalanceAndCardofIE(
                accountBalance: state.accountBalance,
                income: state.income,
                expense: state.expense,
              );
            },
            listener: (context, state) {},
          ),
        ),
      ),
      title: width > 265 ? const DropdownMonths() : null,
      leading: Center(
        child: CircleAvatar(
          radius: 25.r,
          backgroundColor: ExpenseTrackerColors.violet80,
          child: CircleAvatar(
            radius: 22.r,
            backgroundColor: ExpenseTrackerColors.light,
          ),
        ),
      ),
      actions: [
        SvgPicture.asset(
          ExpenseAssets.notificationIcon,
          color: ExpenseTrackerColors.violet,
          height: 24.h,
        ),
      ],
    );
  }
}
