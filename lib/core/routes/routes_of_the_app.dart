import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/account_page/account_page.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/view/app_home_page_page.dart';
import 'package:expense_tracker/presentation/pages/expenseform/view/expenseform_page.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/page/successfully_account_created.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/view/onboarding_account_setup_page.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup_intro/view/onboarding_account_setup_intro_page.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_setup_pin/view/onboarding_setup_pin_page.dart';
import 'package:expense_tracker/presentation/pages/onboarding/view/onboarding_page.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/language/language.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/view/theme_page.dart';
import 'package:expense_tracker/presentation/pages/settings/view/settings_page.dart';
import 'package:expense_tracker/presentation/pages/splash_screen/view/splash_screen_page.dart';
import 'package:expense_tracker/services/animation/page_transitions.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/cupertino.dart';
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

    ///! Onboarding Screen (apps intro)
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
        ///! OnboardingSetupPinPage
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

        ///! OnboardingAccountSetupIntroPage
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
          routes: [
            ///! OnboardingAccountSetupPage
            GoRoute(
              path: 'account-setup',
              name: 'account-setup',
              pageBuilder: (context, state) => CustomTransitionPage(
                child: const OnboardingAccountSetupPage(),
                transitionDuration: 500.milliseconds,
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
              routes: [
                ///! SuccessfullyAccountCreated
                GoRoute(
                  path: 'successfully-account-created',
                  name: 'successfully-account-created',
                  pageBuilder: (context, state) => CustomTransitionPage(
                    child: const SuccessfullyAccountCreated(),
                    transitionDuration: 500.milliseconds,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SharedAxisTransition(
                        fillColor: ExpenseTrackerColors.light20,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.scaled,
                        child: child,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        //! APPS home page
        GoRoute(
          path: 'home',
          name: 'home',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const AppHomePagePage(),
            transitionDuration: 1.seconds,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: PageTransitions().fromCenterToBottom(animation),
                child: child,
              );
            },
          ),
          // routes of fab
          routes: [
            ///! income
            GoRoute(
              path: 'income',
              name: 'income',
              pageBuilder: (context, state) {
                final type = state.extra! as ExpenseType;
                return CustomTransitionPage(
                  child: ExpenseformPage(
                    expenseType: type,
                  ),
                  transitionDuration: 1.seconds,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: PageTransitions().fromCenterToBottom(animation),
                      child: child,
                    );
                  },
                );
              },
            ),

            ///! expense
            GoRoute(
              path: 'expense',
              name: 'expense',
              pageBuilder: (context, state) {
                final type = state.extra! as ExpenseType;
                return CustomTransitionPage(
                  child: ExpenseformPage(
                    expenseType: type,
                  ),
                  transitionDuration: 1.seconds,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: PageTransitions().fromCenterToBottom(animation),
                      child: child,
                    );
                  },
                );
              },
            ),
            //! transfer
            GoRoute(
              path: 'transfer',
              name: 'transfer',
              pageBuilder: (context, state) {
                final type = state.extra! as ExpenseType;
                return CustomTransitionPage(
                  child: ExpenseformPage(
                    expenseType: type,
                  ),
                  transitionDuration: 1.seconds,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: PageTransitions().fromCenterToBottom(animation),
                      child: child,
                    );
                  },
                );
              },
            ),
          ],
          onExit: (context) async {
            return false;
          },
        ),

        ///! SettingsPage
        GoRoute(
          path: 'settings',
          name: 'settings',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const SettingsPage(),
            transitionDuration: 500.milliseconds,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              debugPrint('imaging settings from context');
              return CupertinoPageTransition(
                // position: PageTransitions().fromCenterToBottom(animation),
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,
                linearTransition: true,
                child: child,
              );
            },
          ),
          routes: [
            ///! ThemePage
            GoRoute(
              path: 'theme',
              name: 'theme',
              pageBuilder: (context, state) => CustomTransitionPage(
                child: const ThemePage(),
                transitionDuration: 500.milliseconds,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return CupertinoPageTransition(
                    primaryRouteAnimation: animation,
                    secondaryRouteAnimation: secondaryAnimation,
                    linearTransition: true,
                    child: child,
                  );
                },
              ),
            ),

            ///! CurrencyPage
            GoRoute(
              path: 'currency',
              name: 'currency',
              pageBuilder: (context, state) => CustomTransitionPage(
                child: const ThemePage(),
                transitionDuration: 500.milliseconds,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return CupertinoPageTransition(
                    primaryRouteAnimation: animation,
                    secondaryRouteAnimation: secondaryAnimation,
                    linearTransition: true,
                    child: child,
                  );
                },
              ),
            ),

            ///! LanguagePage
            GoRoute(
              path: 'language',
              name: 'language',
              pageBuilder: (context, state) => CustomTransitionPage(
                child: const LanguagePage(),
                transitionDuration: 500.milliseconds,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return CupertinoPageTransition(
                    primaryRouteAnimation: animation,
                    secondaryRouteAnimation: secondaryAnimation,
                    linearTransition: true,
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),

        ///! AccountPage
        GoRoute(
          path: 'account',
          name: 'account',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const AccountPage(),
            transitionDuration: 1.seconds,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return CupertinoPageTransition(
                // position: PageTransitions().fromCenterToBottom(animation),
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: secondaryAnimation,
                linearTransition: true,
                child: child,
              );
            },
          ),
        ),
      ],
    ),
  ],
);