import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.text,
    required this.cb,
    super.key,
    this.big = false,
    // this.isOperation = false, // Added for operation styling if needed
  });

  final String text;
  final bool big;
  // final bool isOperation;
  final void Function(String) cb;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: Padding(
        // Use Padding for margins
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                ExpenseTrackerColors.violet, // Set background color directly
            foregroundColor:
                ExpenseTrackerColors.light80, // Set text color directly
            textStyle: ExpenseTrackerTextStyle.title1.copyWith(
              fontSize: 48,
            ),
            shape: RoundedRectangleBorder(
              // Use shape for rounded corners
              borderRadius: BorderRadius.circular(16),
            ),
            // Add elevation or other visual properties as needed
            // elevation: 2,
          ),
          onPressed: () => cb(text),
          child: Text(text),
        ),
      ),
    );
  }
}

class ArrowButton extends StatelessWidget implements Button {
  const ArrowButton({
    required this.cb, // cb is now required
    super.key,
  });

  @override
  final void Function(String) cb; // cb function

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ExpenseTrackerColors.violet,
            foregroundColor: ExpenseTrackerColors.light80,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16), // Adjust padding for icon size
          ),
          onPressed: () => cb('arrow'),
          child: const Icon(
            Icons.arrow_forward,
            size: 40,
            color: ExpenseTrackerColors.light80,
          ),
        ),
      ),
    );
  }

  @override
  bool get big => false;

  @override
  String get text => '';
}
