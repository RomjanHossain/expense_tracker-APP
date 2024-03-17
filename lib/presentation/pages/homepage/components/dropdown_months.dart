import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/all_months.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DropdownMonths extends StatefulWidget {
  const DropdownMonths({
    super.key,
  });

  @override
  State<DropdownMonths> createState() => _DropdownMonthsState();
}

class _DropdownMonthsState extends State<DropdownMonths> {
  String dpValue = calanderMonths[DateTime.now().month - 1];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
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

        value: dpValue,
        // value: dpValue,
        // hint: const Text('Select Month'),
        items: calanderMonths
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            dpValue = value.toString();
          });
        },
      ),
    );
  }
}
