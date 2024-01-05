import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:flutter/material.dart';

/// primary button
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({required this.onPress, required this.text, super.key});
  final String text;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        foregroundColor: ExpenseTrackerColors.white,
        backgroundColor: ExpenseTrackerColors.violet,
        shape: const RoundedRectangleBorder(
          borderRadius: ExpenseTrackerTheme.borderRadiusSmall,
        ),
      ),
      onPressed: onPress,
      child: Text(text),
    );
  }
}

// secondary button
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({required this.onPress, required this.text, super.key});
  final String text;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: ExpenseTrackerColors.violet,
        backgroundColor: ExpenseTrackerColors.violet20,
        shape: const RoundedRectangleBorder(
          borderRadius: ExpenseTrackerTheme.borderRadiusSmall,
        ),
      ),
      onPressed: onPress,
      child: Text(text),
    );
  }
}
