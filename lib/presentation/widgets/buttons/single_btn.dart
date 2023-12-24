import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.text,
    required this.cb,
    super.key,
    this.big = false,
  });

  const Button.big({
    required this.text,
    required this.cb,
    super.key,
    this.big = true,
  });

  const Button.operation({
    required this.text,
    required this.cb,
    super.key,
    this.big = false,
  });

  final String text;
  final bool big;
  final void Function(String) cb;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ExpenseTrackerColors.violet,
          borderRadius: BorderRadius.circular(16),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.white.withOpacity(0.24),
          //     blurRadius: 1,
          //     spreadRadius: 1,
          //   ),
          // ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
          ),
          child: Text(
            text,
            style: ExpenseTrackerTextStyle.title1.copyWith(
              color: ExpenseTrackerColors.light80,
              // fontWeight: FontWeight.w600,
              fontSize: 48,
            ),
            // style: ExpenseTrackerTextStyle.headline2.copyWith(
            //   color: color,
            //   fontWeight: FontWeight.w600,
            // ),
          ),
          onPressed: () => cb(text),
        ),
      ),
    );
  }
}
