import 'package:expense_tracker/core/helper/custom_types.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';

abstract class AccountTblUsecases {
  // get list of all accounts
  ResultFuture<List<Account>> getListOfAccount();

  // open an account
  ResultFuture<int> openAnAccount(AccountsCompanion account);
  // update account balance
  ResultFuture<void> updateAccountBalance(int walletID, double newBalance);
  // get a single account from account table
  ResultFuture<Account> getSingleAccount(int walletID);
}
