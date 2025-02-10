import 'package:expense_tracker/core/helper/custom_types.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/data/models/drifts/user/user_drift.dart';

abstract class UserRepository {
  /// get user
  ResultFutureOrException<Profile> getUser();

  /// save
  ResultFuture<void> saveUser(ProfileCompanion user);

  /// delete user
  // Future<void> deleteUser(int userID);

  /// update user
  // Future<void> updateUser(UserEntity user);
}
