import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/splash_screen/bloc/bloc.dart';
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
  late Animation<double> _shrinkController;
  // late Animation<double> _movementController;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: 3.seconds,
      vsync: this,
    );
    // _movementController = CurvedAnimation(
    //   parent: _animationController,
    //   curve: const Interval(
    //     0.0,
    //     0.4,
    //     // curve: Curves.easeOutCirc,
    //   ),
    // );
    _shrinkController = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        0.4,
        curve: Curves.easeInCubic,
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
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return BlocBuilder<SplashScreenBloc, SplashScreenState>(
      builder: (context, state) {
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, c) {
            return Stack(
              // alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    // alignment: Alignment.center,
                    width: Tween(begin: screenSize.width, end: 120.0)
                        .animate(_shrinkController)
                        .value,
                    height: Tween(begin: screenSize.height, end: 120.0)
                        .animate(_shrinkController)
                        .value,
                    decoration: BoxDecoration(
                      color: ExpenseTrackerColors.primary,
                      borderRadius: BorderRadius.circular(
                        Tween(begin: 0.0, end: 24.0)
                            .animate(_shrinkController)
                            .value,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
