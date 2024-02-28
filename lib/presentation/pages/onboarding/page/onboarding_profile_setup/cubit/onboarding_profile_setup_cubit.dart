import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'onboarding_profile_setup_state.dart';

class OnboardingProfileSetupCubit extends Cubit<OnboardingProfileSetupState> {
  OnboardingProfileSetupCubit() : super(const OnboardingProfileSetupInitial());

  void saveProfile(String name, String imageURL) {
    // save profile
    emit(const OnboardingProfileSetupSuccess());
  }
}
