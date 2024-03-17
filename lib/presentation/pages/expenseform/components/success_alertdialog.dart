import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:flutter/material.dart';

class SuccessAlertDialog extends StatelessWidget {
  const SuccessAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ExpenseTrackerColors.light,
      insetPadding: const EdgeInsets.all(10),
      // title: const Text('Success'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_sharp,
            color: ExpenseTrackerColors.violet,
            size: 48,
          ),
          Text(
            'Transaction has been successfully added',
            style: ExpenseTrackerTextStyle.small,
          ),
        ],
      ),
      // actions: [
      //   TextButton(
      //     onPressed: () {
      //       // Navigator.of(context).pop();
      //       // Navigator.of(context).pop();
      //     },
      //     child: const Text('Ok'),
      //   ),
      // ],
    );
  }
}
