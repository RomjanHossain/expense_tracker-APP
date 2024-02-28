import 'package:expense_tracker/data/models/isar_entity/user/user_entity_isar.dart';
import 'package:expense_tracker/data/repositories/user/user_repo.dart';
import 'package:flutter/rendering.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

part 'iisar_instance.dart';

/// {@template isar_instance}
/// IsarInstance description
/// {@endtemplate}
class IsarInstance implements IIsarInstance, UserRepository {
  /// {@macro isar_instance}
  factory IsarInstance() {
    return _instance;
  }

  const IsarInstance._();
  static const IsarInstance _instance = IsarInstance._();

  @override
  Future<Isar> get instance => openDatabase();

  // PERF: open the database only once
  Future<Isar> openDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [
          UserEntitySchema,
        ],
        directory: dir.path,
      );
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  // @override
  // Future<void> deleteUser(int userID) async{
  //   final ins = instance;
  //   await ins.then((value) => value.userEntitys.where().idEqualTo(userID).delete);
  // }

  @override // PERF: get the user
  Future<UserEntity?> getUser() async {
    final ins = await instance;
    final user = await ins.userEntitys.get(1);
    return user;
  }

  @override // PERF: save/update the user
  Future<void> saveUser(UserEntity user) async {
    debugPrint('Saving user nme: ${user.name}');
    debugPrint('Saving user img: ${user.imageUrl}');
    final ins = await instance;
    final count = await ins.userEntitys.where().count();
    // NOTE: for saving user for the first time
    if (count == 0) {
      debugPrint('User count: $count');
      await ins.writeTxn(() => ins.userEntitys.put(user));
      return;
    }
    final usr = await ins.userEntitys.where().idEqualTo(1).findFirst();

    // NOTE: (for updating users's few value)
    if (user.name != null || user.pin != null || user.imageUrl != null) {
      debugPrint(
          'updating user where one of the value is not null ${user.name} ${user.imageUrl} ${user.pin}');
      if (user.name != null) {
        usr?.name = user.name;
      }
      if (user.pin != null) {
        usr?.pin = user.pin;
      }
      if (user.imageUrl != null) {
        usr?.imageUrl = user.imageUrl;
      }
      debugPrint('user name: ${usr?.name}');
      debugPrint('user pin: ${usr?.pin}');
      debugPrint('user img: ${usr?.imageUrl}');
      // update the user
      await ins.writeTxn(() => ins.userEntitys.put(usr!));
    }
  }

  // @override
  // Future<void> updateUser(UserEntity user) {
  // }
}
