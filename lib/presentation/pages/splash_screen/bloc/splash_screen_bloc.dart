import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:expense_tracker/services/splash/splash_services.dart';
part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(const SplashScreenInitial()) {
    on<CustomSplashScreenEvent>(_onCustomSplashScreenEvent);
  }
  final SplashServices splashServices = SplashServices();
  FutureOr<void> _onCustomSplashScreenEvent(
    CustomSplashScreenEvent event,
    Emitter<SplashScreenState> emit,
  ) async {
    print("BLock cloe");
    final result = await splashServices.loginOrGoHome();
    // wait for 3 second
    await Future<void>.delayed(const Duration(seconds: 3)).then((_) {
      switch (result) {
        case SplashScreenStatusEnum.onboarding:
          emit(const SplashScreenOnboarding());
        case SplashScreenStatusEnum.setupProfile:
          emit(const SplashScreenSetupProfile());
        case SplashScreenStatusEnum.setupPin:
          emit(const SplashScreenSetupPin());
      }
    });
  }
}
