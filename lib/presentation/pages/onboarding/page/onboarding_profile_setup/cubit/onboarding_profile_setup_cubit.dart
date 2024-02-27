import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'onboarding_profile_setup_state.dart';

class OnboardingProfileSetupCubit extends Cubit<String> {
  OnboardingProfileSetupCubit() : super('');

  void changeName(String value) {
    emit(value);
  }
}
