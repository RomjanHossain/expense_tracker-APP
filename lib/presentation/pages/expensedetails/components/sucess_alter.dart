import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessfullyDeleted extends StatelessWidget {
  const SuccessfullyDeleted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: isDarkMode(context)
          ? ExpenseTrackerColors.dark
          : ExpenseTrackerColors.light,
      elevation: 0,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        // vertical: 20.h,
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        // vertical: 20.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // a success icon in a circularavater
            CircleAvatar(
              backgroundColor: ExpenseTrackerColors.violet,
              radius: 20.r,
              child: Icon(
                CupertinoIcons.checkmark_alt,
                color: ExpenseTrackerColors.light,
                size: 20.r,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'The transaction has been removed successfully',
              style: ExpenseTrackerTextStyle.body3.copyWith(
                color: isDarkMode(context)
                    ? ExpenseTrackerColors.light
                    : ExpenseTrackerColors.dark,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
