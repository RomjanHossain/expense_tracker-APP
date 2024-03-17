import 'dart:async';

import 'package:expense_tracker/data/models/isar_entity/create_account/create_account_isar.dart';

abstract class AccountSetupRepo {
  //NOTE: get list of account
  Future<List<AccountEntity>> getListOfAccount();
  //NOTE: create an account
  Future<int> openAnAccount(AccountEntity accountEntity);
  // //NOTE: edit an account
  // Future<void> editAnAccount(int id);
  //NOTE: delete an account
  Future<bool> deleteDaAccount(int id);
  //NOTE: update the account
  Future<int> updateTheAccount(int id, AccountEntity accountEntity);
}
