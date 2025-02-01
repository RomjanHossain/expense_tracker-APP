import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';

import 'package:flutter/material.dart';

class SuccessAlertDialog extends StatelessWidget {
  const SuccessAlertDialog({
    required this.status,
    super.key,
  });

  final ExpenseformStatus status;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ExpenseTrackerColors.light,
      insetPadding: const EdgeInsets.all(10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (status == ExpenseformStatus.success)
            const Icon(
              Icons.check_circle_sharp,
              color: ExpenseTrackerColors.violet,
              size: 48,
            )
          else
            const Icon(
              Icons.error_sharp,
              color: ExpenseTrackerColors.red,
              size: 48,
            ),
          Text(
            'Transaction has been successfully added',
            style: ExpenseTrackerTextStyle.small,
          ),
        ],
      ),
    );
  }
}
