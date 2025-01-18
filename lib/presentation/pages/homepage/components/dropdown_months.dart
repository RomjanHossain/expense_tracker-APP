import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/all_months.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/homepage_bloc.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DropdownMonths extends StatelessWidget {
  const DropdownMonths({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomepageBloc, HomepageState>(
      buildWhen: (previous, current) =>
          previous.currentMonth != current.currentMonth,
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(20).r,
            dropdownColor: isDarkMode(context)
                ? ExpenseTrackerColors.violet60
                : ExpenseTrackerColors.violet20,
            alignment: Alignment.center,
            elevation: 0,
            style: ExpenseTrackerTextStyle.body3.copyWith(
              color: ExpenseTrackerColors.dark50,
            ),
            icon: SvgPicture.asset(
              ExpenseAssets.arrowDownIcon,
              color: ExpenseTrackerColors.violet,
              height: 20.h,
            ),
            value: calanderMonths.elementAt(state.currentMonth),
            items: calanderMonths
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
            onChanged: (String? value) {
              final currentMonth = DateTime.now().month;
              if (value != null) {
                if (currentMonth > calanderMonths.indexOf(value)) {
                  context
                      .read<HomepageBloc>()
                      .add(ChangeTheMonth(calanderMonths.indexOf(value)));
                }
              }
            },
          ),
        );
      },
      listener: (context, state) {
        debugPrint(
          'Current month ${state.currentMonth} : ${calanderMonths.elementAt(state.currentMonth)}',
        );
        debugPrint(
          'total balance :${state.accountBalance}, income: ${state.income}, expense: ${state.expense}',
        );
      },
    );
  }
}
