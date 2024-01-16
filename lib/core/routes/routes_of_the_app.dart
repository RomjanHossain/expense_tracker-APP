import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup_intro/view/onboarding_account_setup_intro_page.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_setup_pin/view/onboarding_setup_pin_page.dart';
import 'package:expense_tracker/presentation/pages/onboarding/view/onboarding_page.dart';
import 'package:expense_tracker/presentation/pages/splash_screen/view/splash_screen_page.dart';
import 'package:expense_tracker/services/animation/page_transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

final routeOfTheApp = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    /// Splash Screen (apps intro)
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreenPage(),
    ),

    /// Onboarding Screen (apps intro)
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingPage(),
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const OnboardingPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: PageTransitions().fromCenterToBottom(animation),
            child: child,
          );
        },
      ),
      routes: [
        /// OnboardingSetupPinPage
        GoRoute(
          path: 'setup-pin',
          name: 'setup-pin',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const OnboardingSetupPinPage(),
            transitionDuration: 2.seconds,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
          ),
        ),

        /// OnboardingAccountSetupIntroPage
        GoRoute(
          path: 'account-setup-intro',
          name: 'account-setup-intro',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const OnboardingAccountSetupIntroPage(),
            transitionDuration: 2.seconds,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeThroughTransition(
                fillColor: ExpenseTrackerColors.light20,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
          ),
        ),
      ],
    ),
  ],
);
