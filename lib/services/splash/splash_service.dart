import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashService {
  Future<void> loginOrGoHome(BuildContext context) async {
    debugPrint('Login or go home');
    final prefs = SettingsLocalDataSourcePref();
    final firstRun = await prefs.isFirstRun();
    final username = await prefs.getUsername();
    if (firstRun) {
      // debugPrint('First run');
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
    } else if (username.isEmpty) {
      if (!context.mounted) return;
      Future.delayed(const Duration(seconds: 3), () {
        context.pushNamed('setup-profile');
      });
    } else {
      // debugPrint('Not first run');
      //Whether login failed or succeded, go to home page
      if (!context.mounted) return;
      Future.delayed(const Duration(seconds: 3), () {
        context.pushNamed('setup-pin');
      });
    }
  }
}
