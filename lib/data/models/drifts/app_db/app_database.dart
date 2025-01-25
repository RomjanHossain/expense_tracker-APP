import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:expense_tracker/data/models/drifts/create_account/create_ac_drift.dart';
import 'package:expense_tracker/data/models/drifts/expense_entity/expense_drift.dart';
import 'package:expense_tracker/data/models/drifts/income_entity/income_drift.dart';
import 'package:expense_tracker/data/models/drifts/transfer_entity/transfer_drift.dart';
import 'package:expense_tracker/data/models/drifts/user/user_drift.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Profile, Accounts, Expenses, Incomes, Transfers])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Account>> getAllAccounts() => select(accounts).get();
  Future<int> insertAccount(Account account) => into(accounts).insert(account);

  Future<double> getTotalBalance() async {
    final allAccounts = await select(accounts).get();
    return allAccounts.fold<double>(
      0,
      (prev, element) => prev + (element.accountBalance),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}
