// ignore_for_file: prefer_int_literals

import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
      builder: (context, snapshot) {
        return Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: ExpenseTrackerColors.violet,
            ),
            alignment: Alignment.center,
          ),
        );
      },
      listener: (BuildContext context, SplashScreenState state) {
        if (state is SplashScreenOnboarding) {
          FlutterNativeSplash.remove();
          context.pushNamed('onboarding'); // Navigate to onboarding
        } else if (state is SplashScreenEnterPin) {
          FlutterNativeSplash.remove();
          context.pushNamed('setup-pin'); // Navigate to setup pin
        }
      },
    );
  }
}
