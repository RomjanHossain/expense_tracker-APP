import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/domain/repositories/drift_repository.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(const UserProfileState()) {
    on<GetUserProfile>((event, emit) async {
      // ignore: no_leading_underscores_for_local_identifiers
      // final _isr = IsarInstance();
      final db = DriftRepository();
      final usr = await db.getUser();
      usr.fold(
        (user) => emit(UserProfileState(user)),
        (e) => emit(const UserProfileState()),
      );
    });
  }
}
