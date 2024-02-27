import 'dart:async';
import 'package:bloc/bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

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

  // change the state
  void changeState(int value) {
    emit(value);
  }
}
