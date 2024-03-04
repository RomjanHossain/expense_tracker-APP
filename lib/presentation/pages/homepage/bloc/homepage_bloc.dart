import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/utils/utils_.dart';
part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(const HomepageInitial()) {
    on<CustomHomepageEvent>(_onCustomHomepageEvent);
  }

  FutureOr<void> _onCustomHomepageEvent(
    CustomHomepageEvent event,
    Emitter<HomepageState> emit,
  ) {
    // TODO: Add Logic
  }
}
