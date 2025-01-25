import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SuccessfullyAccountCreated extends StatefulWidget {
  const SuccessfullyAccountCreated({super.key});

  @override
  State<SuccessfullyAccountCreated> createState() =>
      _SuccessfullyAccountCreatedState();
}

class _SuccessfullyAccountCreatedState
    extends State<SuccessfullyAccountCreated> {
  @override
  void initState() {
    super.initState();
    // Navigate to the home screen after 1.5*2 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        GoRouter.of(context)
            .pushReplacementNamed('home'); // Check the current location
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Success Icon
                Semantics(
                  label: 'Success Icon',
                  child: SvgPicture.asset(
                    ExpenseAssets.successIcon,
                    height: 120,
                    color: ExpenseTrackerColors.green,
                  ).animate().scale(
                        duration: 1.5.seconds,
                      ),
                ),
                const SizedBox(height: 20),
                // Success Message
                Text(
                  'You Are All Set!',
                  style: ExpenseTrackerTextStyle.title2.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ).animate(delay: 0.5.seconds).fadeIn(duration: 0.5.seconds),
                const SizedBox(height: 10),
                // Additional Message (Optional)
                Text(
                  'Your account has been created successfully.\nRedirecting to the home screen...',
                  style: ExpenseTrackerTextStyle.body2.copyWith(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ).animate(delay: 0.7.seconds).fadeIn(duration: 0.5.seconds),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
