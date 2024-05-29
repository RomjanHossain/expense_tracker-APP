import 'package:expense_tracker/core/helper/custom_types.dart';
import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
import 'package:flutter/material.dart';

/// An interface for SplashServices
sealed class ISplashServices {
  ResultFuture<SplashScreenStatusEnum> loginOrGoHome();
}

class SplashServices implements ISplashServices {
  /// {@macro splash_services}
  factory SplashServices() {
    return _instance;
  }

  const SplashServices._();
  static const SplashServices _instance = SplashServices._();

  @override
  ResultFuture<SplashScreenStatusEnum> loginOrGoHome() async {
    debugPrint('Login or go home');
    final prefs = SettingsLocalDataSourcePref();
    final firstRun = await prefs.isFirstRun();
    final username = await prefs.getUsername();
    //! NOTE: Wait 3 sec then navigate to the next page
    if (firstRun) {
      return SplashScreenStatusEnum.onboarding;
    } else if (username.isEmpty) {
      return SplashScreenStatusEnum.setupProfile;
    } else {
      return SplashScreenStatusEnum.setupPin;
    }
  }
}
