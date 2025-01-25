import 'package:expense_tracker/core/helper/custom_types.dart';

abstract class BalanceTblUsecases {
  // get single user (in our database there should be one user. not more then that)
  ResultFuture<double> getTotalBalanceMonthly(int month);

  // create user (i don't know why i called it setUser)
  Future<double> getTotalIncome(int month);
  // user can only updates their pin
  Future<bool> updateUser(String pin);
}
