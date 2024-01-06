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
          //     color: ExpenseTrackerColors.white.withOpacity(0.24),
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

class ArrowButton extends StatelessWidget implements Button {
  const ArrowButton({
    required this.cb,
    super.key,
  });

  final void Function(String) cb;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ExpenseTrackerColors.violet,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
          ),
          child: const Icon(
            Icons.arrow_forward,
            size: 40,
            color: ExpenseTrackerColors.light80,
          ),
          onPressed: () => cb('arrow'),
        ),
      ),
    );
  }

  @override
  // TODO: implement big
  bool get big => throw UnimplementedError();

  @override
  // TODO: implement text
  String get text => throw UnimplementedError();
}
