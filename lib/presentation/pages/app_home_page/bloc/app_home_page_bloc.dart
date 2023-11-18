import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'app_home_page_event.dart';
part 'app_home_page_state.dart';

class AppHomePageBloc extends Bloc<AppHomePageEvent, AppHomePageState> {
  AppHomePageBloc() : super(const AppHomePageInitial()) {
    on<ChangeAppHomePageEvent>(_onChangeAppHomePageEvent);
  }

  FutureOr<void> _onChangeAppHomePageEvent(
    ChangeAppHomePageEvent event,
    Emitter<AppHomePageState> emit,
  ) {
    emit(state.copyWith(changeIndex: event.index));
  }
}
