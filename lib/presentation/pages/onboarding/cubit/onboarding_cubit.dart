import 'dart:async';
import 'package:bloc/bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  /// A description for yourCustomFunction
  FutureOr<void> changeIndex() async {
    // change index 1..3 after 1 second preiodically
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (state < 2) {
        emit(state + 1);
      } else {
        emit(0);
        // cancel the timer
        timer.cancel();
      }
    });
  }
  // change the state 
  void changeState(int value) {
    emit(value);
  }
}
