import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoveBudgetSheet extends StatelessWidget {
  const RemoveBudgetSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: ExpenseTrackerColors.light,
        color: !isDarkMode(context)
            ? ExpenseTrackerColors.light
            : ExpenseTrackerColors.dark,
        borderRadius: BorderRadius.circular(30.r),
      ),
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Remove this budget?',
            style: ExpenseTrackerTextStyle.title3.copyWith(
              fontWeight: FontWeight.bold,
              color: !isDarkMode(context)
                  ? ExpenseTrackerColors.dark
                  : ExpenseTrackerColors.light,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Are you sure do you wanna remove this budget?',
            style: ExpenseTrackerTextStyle.body1.copyWith(
              color: ExpenseTrackerColors.light20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // cancel
              Expanded(
                child: SecondaryButton(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  text: 'Cancel',
                ),
              ),
              SizedBox(width: 10.w),
              // delete
              Expanded(
                child: PrimaryButton(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  text: 'Delete',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
