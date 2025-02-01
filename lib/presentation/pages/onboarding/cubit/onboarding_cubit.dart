import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:expense_tracker/services/splash/splash_services.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  final SplashServices splashServices = SplashServices();

  /// A description for yourCustomFunction
  FutureOr<void> changeIndex() async {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (state < 2) {
        emit(state + 1);
      } else {
        timer.cancel();
        emit(0);
      }
    });
  }

  // goto pin screen
  Future<bool> goToPinScreen() async {
    final result = await splashServices.loginOrGoHome();
    if (result == SplashScreenStatusEnum.onboarding) {
      return false;
    }
    return true;
  }

  // change the state
  void changeState(int value) {
    emit(value);
  }
}
