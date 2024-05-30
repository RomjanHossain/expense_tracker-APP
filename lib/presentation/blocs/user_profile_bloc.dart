import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/isar_instance.dart';
import 'package:expense_tracker/data/models/isar_entity/user/user_entity_isar.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(const UserProfileState()) {
    on<GetUserProfile>((event, emit) async {
      // ignore: no_leading_underscores_for_local_identifiers
      final _isr = IsarInstance();
      final usr = await _isr.getUser();
      usr.fold(
        (user) => emit(UserProfileState(user)),
        (e) => emit(const UserProfileState()),
      );
    });
  }
}
