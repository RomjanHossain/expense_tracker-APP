import 'package:expense_tracker/core/helper/custom_types.dart';
import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:expense_tracker/data/datasources/local/isar_instance.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
import 'package:expense_tracker/data/models/isar_entity/user/user_entity_isar.dart';

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
    final isar = IsarInstance();
    final usr = await isar.getUser();
    return usr.fold(
      (UserEntity l) {
        return SplashScreenStatusEnum.enterPin;
      },
      (Exception r) {
        return SplashScreenStatusEnum.onboarding;
      },
    );
  }
}
