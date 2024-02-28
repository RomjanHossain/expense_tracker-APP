import 'package:expense_tracker/data/models/isar_entity/user/user_entity_isar.dart';
import 'package:expense_tracker/data/repositories/user/user_repo.dart';
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

  @override
  Future<void> deleteUser(int userID) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> getUser() async {
    final ins = await instance;
    final user = await ins.userEntitys.get(1);
    return user;
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    final ins = await instance;
    final usr = await ins.userEntitys.where().idEqualTo(1).findFirst();

    /// PERF: (for updating user)
    if (usr?.name == user.name ||
        usr?.pin == user.pin ||
        usr?.imageUrl == user.imageUrl) {}
    usr?.name = user.name;
    usr?.pin = user.pin;
    usr?.imageUrl = user.imageUrl;

    // saving the user
    await ins.writeTxn(() => ins.userEntitys.put(usr!));
  }

  @override
  Future<void> updateUser(UserEntity user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
