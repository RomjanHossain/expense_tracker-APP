import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(const HomepageInitial()) {
    on<CustomHomepageEvent>(_onCustomHomepageEvent);
    on<ChangeTheFreq>(_changetheFreq);
  }

  FutureOr<void> _onCustomHomepageEvent(
    CustomHomepageEvent event,
    Emitter<HomepageState> emit,
  ) {
    // TODO: Add Logic
  }
  //NOTE: change the freq
  FutureOr<void> _changetheFreq(
    ChangeTheFreq event,
    Emitter<HomepageState> emit,
  ) {
    if (event.se != state.se) {
      emit(state.copyWith(se: event.se));
    }
  }
}
