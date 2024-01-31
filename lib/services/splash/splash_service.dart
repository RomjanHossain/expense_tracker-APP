import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashService {
  Future<void> loginOrGoHome(BuildContext context) async {
    debugPrint('Login or go home');
    final prefs = SettingsLocalDataSourcePref();
    final firstRun = await prefs.isFirstRun();

    if (firstRun) {
      debugPrint('First run');
      Future.delayed(const Duration(seconds: 3), () {
        context.pushNamed('onboarding');
      });
    } else {
      debugPrint('Not first run');
      //Whether login failed or succeded, go to home page
      if (!context.mounted) return;
      Future.delayed(const Duration(seconds: 3), () {
        context.pushNamed('setup-pin');
      });
    }
  }
}
