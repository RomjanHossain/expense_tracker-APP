import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'app_home_page_event.dart';
part 'app_home_page_state.dart';

class AppHomePageBloc extends Bloc<AppHomePageEvent, AppHomePageState> {
  AppHomePageBloc() : super(const AppHomePageInitial()) {
    on<CustomAppHomePageEvent>(_onCustomAppHomePageEvent);
  }

  FutureOr<void> _onCustomAppHomePageEvent(
    CustomAppHomePageEvent event,
    Emitter<AppHomePageState> emit,
  ) {
    // TODO: Add Logic
  }
}
