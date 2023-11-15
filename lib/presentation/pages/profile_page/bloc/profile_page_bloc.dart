import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc() : super(const ProfilePageInitial()) {
    on<CustomProfilePageEvent>(_onCustomProfilePageEvent);
  }

  FutureOr<void> _onCustomProfilePageEvent(
    CustomProfilePageEvent event,
    Emitter<ProfilePageState> emit,
  ) {
    // TODO: Add Logic
  }
}
