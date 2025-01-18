// ignore_for_file: prefer_int_literals

import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/splash_screen/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template splash_screen_body}
/// Body of the SplashScreenPage.
///
/// Add what it does
/// {@endtemplate}
class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 3500), // Use const Duration
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic, // Combined curve for smoother animation
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context); // Use MediaQuery.of
    final textStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ); // Store text style outside AnimatedBuilder

    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
      builder: (context, state) {
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            final animationValue = _animation.value;
            final containerSize =
                Tween<double>(begin: screenSize.width, end: 120.0)
                    .transform(animationValue);
            final borderRadius =
                Tween<double>(begin: 0.0, end: 32.0).transform(animationValue);
            final opacity = (1 - animationValue).clamp(0.0, 1.0);
            final alignment = AlignmentTween(
              begin: Alignment.centerLeft,
              end: Alignment.center,
            ).transform(animationValue);

            return Center(
              child: Container(
                width: containerSize,
                height: containerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: ExpenseTrackerColors.violet,
                ),
                alignment: Alignment.center, // Center the Stack
                child: Stack(
                  alignment: alignment,
                  children: [
                    Hero(
                      tag: 'intro',
                      child: SizedBox(
                        // Use SizedBox for fixed size
                        height: 200,
                        width: 200,
                        child: DecoratedBox(
                          // Use DecoratedBox instead of Container if you only need decoration
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(borderRadius),
                            color: ExpenseTrackerColors.violet,
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: opacity,
                      child: Text(
                        'Expense\nTracker',
                        style: textStyle.copyWith(color: Colors.white),
                        textAlign: TextAlign
                            .center, // Center the text within the Opacity widget
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      listener: (BuildContext context, SplashScreenState state) {
        if (state is SplashScreenOnboarding) {
          context.pushNamed('onboarding');
        }
        if (state is SplashScreenEnterPin) {
          context.pushReplacementNamed('setup-pin');
        }
      },
    );
  }
}
