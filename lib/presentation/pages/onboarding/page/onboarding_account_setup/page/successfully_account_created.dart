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
    // after 1.5 seconds, navigate to the next page
    Future.delayed(1.5.seconds, () {
      context.goNamed('home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              ExpenseAssets.successIcon,
              height: 120,
              color: ExpenseTrackerColors.green,
            ).animate().scale(
                  duration: 1.5.seconds,
                ),
          ),
          Text(
            'You Are all Set!',
            style: ExpenseTrackerTextStyle.title2,
          ).animate(delay: 0.5.seconds),
        ],
      ),
    );
  }
}
