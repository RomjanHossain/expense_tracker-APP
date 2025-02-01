import 'package:expense_tracker/core/helper/custom_types.dart';
import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:expense_tracker/domain/repositories/drift_repository.dart';

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
    // final isar = IsarInstance();
    final drift = DriftRepository();
    final usr2 = await drift.getUser();
    // final usr = await isar.getUser();
    return usr2.fold(
      (l) {
        return SplashScreenStatusEnum.enterPin;
      },
      (Exception r) {
        return SplashScreenStatusEnum.onboarding;
      },
    );
  }
}
