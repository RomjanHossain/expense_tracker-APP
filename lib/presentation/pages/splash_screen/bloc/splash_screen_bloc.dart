import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(const SplashScreenInitial()) {
    on<CustomSplashScreenEvent>(_onCustomSplashScreenEvent);
  }

  FutureOr<void> _onCustomSplashScreenEvent(
    CustomSplashScreenEvent event,
    Emitter<SplashScreenState> emit,
  ) {
    // TODO: Add Logic
  }
}
