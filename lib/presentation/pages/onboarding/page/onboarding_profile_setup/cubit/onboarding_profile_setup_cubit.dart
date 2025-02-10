import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/domain/repositories/drift_repository.dart';
import 'package:flutter/widgets.dart';
part 'onboarding_profile_setup_state.dart';

class OnboardingProfileSetupCubit extends Cubit<OnboardingProfileSetupState> {
  OnboardingProfileSetupCubit() : super(const OnboardingProfileSetupInitial());

  Future<void> saveProfile(String name, String pin, String? imageURL) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final drift = DriftRepository();
    emit(const OnboardingProfileSetupLoading());
    debugPrint('Name from saveProfile: $name');
    debugPrint('pin from saveProfile: $pin');
    // debugPrint('image from saveProfiel: $imageURL');
    final newUser2 = ProfileCompanion.insert(
      name: name,
      pin: Value(pin),
      imageUrl: Value(imageURL),
    );
    final isSuccess = await drift.setUser(newUser2);
    if (isSuccess == -1) {
      debugPrint('Error saving profile');
      emit(const OnboardingProfileSetupError());
      return;
    }
    debugPrint('Name from saveProfile(usr): $name');
    // debugPrint('image from saveProfiel(usr): $imageURL');
    emit(const OnboardingProfileSetupSuccess());
  }

  // change the name
  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  // change the pin
  void changePin(String pin) {
    emit(state.copyWith(pin: pin));
  }

  // change the image
  void changeImage(Uint8List image) {
    emit(state.copyWith(image: image));
  }
}
