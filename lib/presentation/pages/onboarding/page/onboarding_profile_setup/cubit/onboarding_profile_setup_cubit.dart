import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/isar_instance.dart';
import 'package:expense_tracker/data/models/isar_entity/user/user_entity_isar.dart';
import 'package:flutter/widgets.dart';
part 'onboarding_profile_setup_state.dart';

class OnboardingProfileSetupCubit extends Cubit<OnboardingProfileSetupState> {
  OnboardingProfileSetupCubit() : super(const OnboardingProfileSetupInitial());

  Future<void> saveProfile(String name, Uint8List? imageURL) async {
    // final localPref = SettingsLocalDataSourcePref();
    // ignore: no_leading_underscores_for_local_identifiers
    final _isar = IsarInstance();
    // await localPref.setupUsername(name);
    emit(const OnboardingProfileSetupLoading());
    debugPrint('Name from saveProfile: $name');
    debugPrint('image from saveProfiel: $imageURL');
    final newUser = UserEntity()
      ..name = name
      ..imageUrl = imageURL;
    await _isar.saveUser(newUser);

    debugPrint('Name from saveProfile(usr): ${newUser.name}');
    debugPrint('image from saveProfiel(usr): ${newUser.imageUrl}');
    emit(const OnboardingProfileSetupSuccess());
  }

  // change the name
  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  // change the image
  void changeImage(Uint8List image) {
    emit(state.copyWith(image: image));
  }
}
