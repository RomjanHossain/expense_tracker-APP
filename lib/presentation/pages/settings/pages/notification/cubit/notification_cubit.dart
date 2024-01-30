import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationInitial());

  final SettingsLocalDataSourcePref _settingsLocalDataSourcePref =
      SettingsLocalDataSourcePref();

  /// get notification
  Future<void> getNotification() async {
    final notification = await _settingsLocalDataSourcePref.getNotification();
    /*  
    0: No notification
    1: Expense Alert
    3: Budget Alert
    7: Tips&Articles

    if it returens 0 then every value is false,
    if its 1 then expenseAlert is true,
    if its 3 then budgetAlert is true,
    if its 7 then tipsAlert is true,

    and if its 4 then expenseAlert and budgetAlert is true
    and if its 8 then expenseAlert and tipsAlert is true
    and if its 10 then budgetAlert and tipsAlert is true
    and if its 11 then expenseAlert, budgetAlert and tipsAlert is true
    */
    switch (notification) {
      case 0:
        emit(const NotificationState());
      case 1:
        emit(const NotificationState(expenseAlert: true));
      case 3:
        emit(const NotificationState(budgetAlert: true));
      case 7:
        emit(const NotificationState(tipsAlert: true));
      case 4:
        emit(
          const NotificationState(
            expenseAlert: true,
            budgetAlert: true,
          ),
        );
      case 8:
        emit(
          const NotificationState(
            expenseAlert: true,
            tipsAlert: true,
          ),
        );
      case 10:
        emit(
          const NotificationState(
            budgetAlert: true,
            tipsAlert: true,
          ),
        );
      case 11:
        emit(
          const NotificationState(
            expenseAlert: true,
            budgetAlert: true,
            tipsAlert: true,
          ),
        );
      default:
        emit(const NotificationState());
    }
  }

  // set notification (expense alert)
  Future<void> setExpenseAlert(bool alert) async {
    final i =await _settingsLocalDataSourcePref.getNotification();
    if (alert) {
      await _settingsLocalDataSourcePref.setNotification(i + 1);
      emit(
        state.copyWith(
          expenseAlert: alert,
        ),
      );
    } else {
   await   _settingsLocalDataSourcePref.setNotification(i - 1);
      emit(
        state.copyWith(
          expenseAlert: alert,
        ),
      );
    }
  }

  // set notification (budget alert)
  Future<void> setBudgetAlert(bool alert) async {
    final i =await _settingsLocalDataSourcePref.getNotification();
    if (alert) {
      await _settingsLocalDataSourcePref.setNotification(i + 3);
      emit(
        state.copyWith(
          budgetAlert: alert,
        ),
      );
    } else {
      await _settingsLocalDataSourcePref.setNotification(i - 3);
      emit(
        state.copyWith(
          budgetAlert: alert,
        ),
      );
    }
  }
  // set notification (tips alert)
  Future<void> setTipsAlert(bool alert) async {
    final i =await _settingsLocalDataSourcePref.getNotification();
    if (alert) {
      await _settingsLocalDataSourcePref.setNotification(i + 7);
      emit(
        state.copyWith(
          tipsAlert: alert,
        ),
      );
    } else {
      await _settingsLocalDataSourcePref.setNotification(i - 7);
      emit(
        state.copyWith(
          tipsAlert: alert,
        ),
      );
    }
  }
}
