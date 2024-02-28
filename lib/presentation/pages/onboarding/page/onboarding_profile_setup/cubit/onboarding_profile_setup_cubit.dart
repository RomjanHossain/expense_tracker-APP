import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/isar_instance.dart';
import 'package:expense_tracker/data/models/isar_entity/user/user_entity_isar.dart';
part 'onboarding_profile_setup_state.dart';

class OnboardingProfileSetupCubit extends Cubit<OnboardingProfileSetupState> {
  OnboardingProfileSetupCubit() : super(const OnboardingProfileSetupInitial());

  IsarInstance isar = IsarInstance();
  void saveProfile(String name, String imageURL) {
    emit(const OnboardingProfileSetupLoading());
    final newUser = UserEntity()
      ..name = name
      ..imageUrl = imageURL;
    isar.saveUser(newUser);
    emit(const OnboardingProfileSetupSuccess());
  }

  // change the name
  void changeName(String name) {
    emit(state.copyWith(name: name));
  }
}
