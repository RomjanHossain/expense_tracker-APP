import 'package:expense_tracker/data/models/isar_entity/create_account/create_account_isar.dart';
import 'package:expense_tracker/data/models/isar_entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/data/models/isar_entity/income_entity/income_entity.dart';
import 'package:expense_tracker/data/models/isar_entity/transfer_entity/transfer_entity.dart';
import 'package:expense_tracker/data/models/isar_entity/user/user_entity_isar.dart';
import 'package:expense_tracker/data/repositories/account_setup/accoutn_setup_repo.dart';
import 'package:expense_tracker/data/repositories/expense_repo/expense_repo.dart';
import 'package:expense_tracker/data/repositories/income_repo/income_repo.dart';
import 'package:expense_tracker/data/repositories/transfer_repo/transfer_repo.dart';
import 'package:expense_tracker/data/repositories/user/user_repo.dart';
import 'package:flutter/rendering.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

part 'iisar_instance.dart';

/// {@template isar_instance}
/// IsarInstance description
/// {@endtemplate}
class IsarInstance
    implements
        IIsarInstance,
        UserRepository,
        AccountSetupRepo,
        IncomeRepo,
        ExpenseRepo,
        TransferRepo {
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
          AccountEntitySchema,
          // For income, expense and transfer
          IncomeIsarEntitySchema,
          ExpenseIsarEntitySchema,
          TransferEntitySchema,
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

  //WARN: this section is for the user(profile) section
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
          'updating user where one of the value is not null ${user.name} ${user.imageUrl} ${user.pin}',);
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

  //WARN: this section is for the account setup section
  @override
  Future<bool> deleteDaAccount(int id) async {
    final ins = await instance;
    return ins.writeTxn(() => ins.accountEntitys.delete(id));
  }

  // @override
  // Future<void> editAnAccount(int id) async {}

  @override
  Future<int> openAnAccount(AccountEntity accountEntity) async {
    final ins = await instance;
    return ins.writeTxn(() => ins.accountEntitys.put(accountEntity));
  }

  @override
  Future<int> updateTheAccount(int id, AccountEntity accountEntity) async {
    final ins = await instance;
    final currentAccount = await ins.accountEntitys.get(id);
    if (currentAccount != null) {
      currentAccount
        ..accountTypeImg = accountEntity.accountTypeImg
        ..accountType = accountEntity.accountType
        ..accountBalance = accountEntity.accountBalance
        ..accountName = accountEntity.accountName;
      return ins.writeTxn(() => ins.accountEntitys.put(currentAccount));
    }
    return 0;
  }

  @override
  Future<List<AccountEntity>> getListOfAccount() async {
    final ins = await instance;
    return ins.accountEntitys.where().findAll();
  }

  //WARN: expense section
  @override
  Future<int> createAnExpense(ExpenseIsarEntity expenseEntity) async {
    final ins = await instance;
    return ins.writeTxn(() => ins.expenseIsarEntitys.put(expenseEntity));
  }

  @override
  Future<List<ExpenseIsarEntity>> getListOfExpense() async {
    final ins = await instance;
    return ins.expenseIsarEntitys.where().findAll();
  }

  @override
  Future<int> updateTheExpense(int id, ExpenseIsarEntity expenseEntity) async {
    final ins = await instance;
    final currentExpense = await ins.expenseIsarEntitys.get(id);
    if (currentExpense != null) {
      currentExpense
        ..ammount = expenseEntity.ammount
        ..createdDate = expenseEntity.createdDate
        ..walletId = expenseEntity.walletId
        ..repeatType = expenseEntity.repeatType
        ..startDate = expenseEntity.startDate
        ..endDate = expenseEntity.endDate
        ..isRepeat = expenseEntity.isRepeat
        ..attachment = expenseEntity.attachment
        ..description = expenseEntity.description;
      return ins.writeTxn(() => ins.expenseIsarEntitys.put(currentExpense));
    } else {
      return 0;
    }
  }

  @override
  Future<bool> deleteAnExpense(int id) async {
    final ins = await instance;
    return ins.writeTxn(() => ins.expenseIsarEntitys.delete(id));
  }

  //WARN: income section
  @override
  Future<int> updateTheIncome(int id, IncomeIsarEntity incomeEntity) async {
    final ins = await instance;
    final currentIncome = await ins.incomeIsarEntitys.get(id);

    if (currentIncome != null) {
      currentIncome
        ..ammount = incomeEntity.ammount
        ..createdDate = incomeEntity.createdDate
        ..walletId = incomeEntity.walletId
        ..repeatType = incomeEntity.repeatType
        ..startDate = incomeEntity.startDate
        ..endDate = incomeEntity.endDate
        ..isRepeat = incomeEntity.isRepeat
        ..attachment = incomeEntity.attachment
        ..description = incomeEntity.description;
      return ins.writeTxn(() => ins.incomeIsarEntitys.put(currentIncome));
    } else {
      return 0;
    }
  }

  @override
  Future<int> createAnIncome(IncomeIsarEntity incomeEntity) async {
    final ins = await instance;
    return ins.writeTxn(() => ins.incomeIsarEntitys.put(incomeEntity));
  }

  @override
  Future<List<IncomeIsarEntity>> getListOfIncome() async {
    final ins = await instance;
    return ins.incomeIsarEntitys.where().findAll();
  }

  @override
  Future<bool> deleteAnIncome(int id) async {
    final ins = await instance;
    return ins.writeTxn(() => ins.incomeIsarEntitys.delete(id));
  }

//WARN: transfer section
  @override
  Future<int> createAnTransfer(TransferEntity transferEntity) async {
    final ins = await instance;
    return ins.writeTxn(() => ins.transferEntitys.put(transferEntity));
  }

  @override
  Future<bool> deleteAnTransfer(int id) async {
    final ins = await instance;
    return ins.writeTxn(() => ins.transferEntitys.delete(id));
  }

  @override
  Future<List<TransferEntity>> getListOfTransfer() async {
    final ins = await instance;
    return ins.transferEntitys.where().findAll();
  }

  @override
  Future<int> updateTheTransfer(int id, TransferEntity transferEntity) async {
    final ins = await instance;
    final currentTransfer = await ins.transferEntitys.get(id);
    if (currentTransfer != null) {
      currentTransfer
        ..ammount = transferEntity.ammount
        ..createdDate = transferEntity.createdDate
        ..attachment = transferEntity.attachment
        ..description = transferEntity.description
        ..fromID = transferEntity.fromID
        ..to = transferEntity.to;
      return ins.writeTxn(() => ins.transferEntitys.put(currentTransfer));
    } else {
      return 0;
    }
  }
}
