// ignore_for_file: prefer_int_literals

import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/view/app_home_page_page.dart';
import 'package:expense_tracker/presentation/pages/splash_screen/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template splash_screen_body}
/// Body of the SplashScreenPage.
///
/// Add what it does
/// {@endtemplate}
class SplashScreenBody extends StatefulWidget {
  /// {@macro splash_screen_body}
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _movementController;
  late Animation<double> _shrinkController;
  // late Animation<double> _movementController;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: 3.5.seconds,
      vsync: this,
    );
    _shrinkController = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0,
        0.4,
        curve: Curves.easeInCubic,
      ),
    );
    _movementController = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0,
        0.4,
        // curve: Curves.easeOutCirc,
      ),
    );
    _shrinkController.isCompleted
        ? _animationController.reverse()
        : _animationController.forward();
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 4), () {
      // Navigator.pushReplacement(
      //   context,
      //   CupertinoPageRoute(
      //     builder: (context) => const SplashScreen2(),
      //   ),
      // );
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AppHomePagePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
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
    final screenSize = MediaQuery.sizeOf(context);
    return BlocBuilder<SplashScreenBloc, SplashScreenState>(
      builder: (context, state) {
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, c) {
            return Center(
              child: Container(
                width: Tween(begin: screenSize.width, end: 120.0)
                    .animate(_shrinkController)
                    .value,
                height: Tween(begin: screenSize.height, end: 120.0)
                    .animate(_shrinkController)
                    .value,
                // height: screenSize.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Tween(begin: 0.0, end: 32.0)
                        .animate(_shrinkController)
                        .value,
                  ),
                  color: ExpenseTrackerColors.primary,
                ),
                child: Stack(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  alignment: Tween(
                    begin: Alignment.centerLeft,
                    end: Alignment.center,
                  ).animate(_movementController).value,

                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Tween(begin: 0.0, end: 32.0)
                              .animate(_shrinkController)
                              .value,
                        ),
                        color: ExpenseTrackerColors.primary,
                      ),
                    ),
                    SlideTransition(
                      position: Tween(
                        begin: const Offset(-1, 0),
                        end: const Offset(0.0, 0.0),
                      ).animate(_movementController),
                      child: AnimatedOpacity(
                        opacity:
                            (1 - _movementController.value).clamp(0.0, 1.0),
                        duration: const Duration(milliseconds: 600),
                        child: Text(
                          'Expense\nTracker',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
