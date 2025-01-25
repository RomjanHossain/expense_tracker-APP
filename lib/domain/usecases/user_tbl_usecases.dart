import 'package:drift/drift.dart';
import 'package:expense_tracker/core/helper/custom_types.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';

abstract class UserTblUsecases {
  // get single user (in our database there should be one user. not more then that)
  ResultFutureOrException<ProfileData> getUser();

  // create user (i don't know why i called it setUser)
  ResultFuture<int> setUser(Insertable<ProfileData> pd);
  // user can only updates their pin
  Future<bool> updateUser(String pin);
}
