import 'dart:async';

import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/data/models/drifts/create_account/create_ac_drift.dart';

// import 'package:expense_tracker/data/models/isar_entity/create_account/create_account_isar.dart';

abstract class AccountSetupRepo {
  //NOTE: get list of account
  Future<List<Accounts>> getListOfAccount();
  //NOTE: create an account
  Future<int> openAnAccount(Accounts accountEntity);
  // //NOTE: edit an account
  // Future<void> editAnAccount(int id);
  //NOTE: delete an account
  Future<bool> deleteDaAccount(int id);
  //NOTE: update the account
  Future<int> updateTheAccount(int id, AccountsCompanion accountEntity);
}
