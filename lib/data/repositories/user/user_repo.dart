import 'package:expense_tracker/data/models/isar_entity/user/user_entity_isar.dart';

abstract class UserRepository {
  /// get user
  Future<UserEntity?> getUser();

  /// save
  Future<void> saveUser(UserEntity user);

  /// delete user
  Future<void> deleteUser(int userID);

  /// update user
  Future<void> updateUser(UserEntity user);
}
