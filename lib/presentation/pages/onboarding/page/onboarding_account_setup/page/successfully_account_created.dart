import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/view/app_home_page_page.dart';
import 'package:expense_tracker/services/animation/page_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class SuccessfullyAccountCreated extends StatefulWidget {
  const SuccessfullyAccountCreated({super.key});

  /// The static route for SuccessfullyAccountCreated
  static Route<dynamic> route() {
    return PageAnimation.sharedAxisTransitionPageWrapper(
      const SuccessfullyAccountCreated(),
    );
  }

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
      Navigator.of(context).pushAndRemoveUntil(
        AppHomePagePage.route(duration: 1.seconds),
        (route) => false,
      );
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
