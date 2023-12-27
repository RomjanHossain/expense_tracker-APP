import 'package:expense_tracker/presentation/pages/onboarding/onboarding.dart';
import 'package:expense_tracker/services/animation/page_animation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashService {
  Future<void> loginOrGoHome(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final keepLogin = prefs.getBool('keepLoggedIn');
    final firstRun = prefs.getBool('firstRun');

    if (firstRun == null) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement<void, void>(
          context,
          // _createRoute(),
          PageAnimation.fromCenterToBottom(
            const OnboardingPage(),
            duration: const Duration(
              seconds: 3,
              milliseconds: 500,
            ),
          ),
        );
      });
    } else if (keepLogin == false) {
      Future.delayed(const Duration(seconds: 2), () {
        // Navigator.pushReplacement<void, void>(
        //   context,
        //   MaterialPageRoute<void>(
        //     builder: (BuildContext context) => const MyHomePage(),
        //   ),
        // );
      });
    } else {
      final pass = prefs.getString('pin');
      //Whether login failed or succeded, go to home page
      if (!context.mounted) return;
      // await Navigator.pushReplacement<void, void>(
      //   context,
      //   MaterialPageRoute<void>(
      //     builder: (BuildContext context) => const MyHomePage(),
      //   ),
      // );
    }
  }
}
