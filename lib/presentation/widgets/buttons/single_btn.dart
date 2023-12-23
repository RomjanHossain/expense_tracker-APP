import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.text,
    required this.cb,
    super.key,
    this.big = false,
    this.color = Default,
  });

  const Button.big({
    required this.text,
    required this.cb,
    super.key,
    this.big = true,
    this.color = Default,
  });

  const Button.operation({
    required this.text,
    required this.cb,
    super.key,
    this.big = false,
    this.color = Operation,
  });
  static const Dark = Color.fromARGB(255, 145, 145, 145);
  static const Default = Color.fromARGB(255, 40, 40, 40);
  static const Operation = Color.fromARGB(255, 13, 203, 250);

  final String text;
  final bool big;
  final Color color;
  final void Function(String) cb;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ExpenseTrackerColors.charcoal,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.24),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
          ),
          child: Text(
            text,
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
