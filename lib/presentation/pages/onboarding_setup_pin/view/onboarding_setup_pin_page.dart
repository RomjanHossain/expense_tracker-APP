import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/onboarding_setup_pin/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/onboarding_setup_pin/widgets/onboarding_setup_pin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template onboarding_setup_pin_page}
/// A description for OnboardingSetupPinPage
/// {@endtemplate}
class OnboardingSetupPinPage extends StatelessWidget {
  /// {@macro onboarding_setup_pin_page}
  const OnboardingSetupPinPage({super.key});

  /// The static route for OnboardingSetupPinPage
  static Route<dynamic> route() {
    // return MaterialPageRoute<dynamic>(
    //   allowSnapshotting: false,
    //   barrierDismissible: true,
    //   fullscreenDialog: true,
    //   maintainState: false,
    //   builder: (_) => const OnboardingSetupPinPage(),
    // );
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OnboardingSetupPinPage(),
      transitionDuration: 2.seconds,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // ignore: prefer_int_literals
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingSetupPinBloc(),
      child: const Scaffold(
        backgroundColor: ExpenseTrackerColors.violet,
        body: OnboardingSetupPinView(),
      ),
    );
  }
}

/// {@template onboarding_setup_pin_view}
/// Displays the Body of OnboardingSetupPinView
/// {@endtemplate}
class OnboardingSetupPinView extends StatelessWidget {
  /// {@macro onboarding_setup_pin_view}
  const OnboardingSetupPinView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingSetupPinBody();
  }
}
