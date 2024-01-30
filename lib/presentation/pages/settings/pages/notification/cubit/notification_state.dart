part of 'notification_cubit.dart';

/// {@template notification}
/// NotificationState description
/// {@endtemplate}
class NotificationState extends Equatable {
  /// {@macro notification}
  const NotificationState({
    this.expenseAlert = false,
    this.budgetAlert = false,
    this.tipsAlert = false,
  });

  /// expense alert
  final bool expenseAlert;

  /// budget
  final bool budgetAlert;

  /// tips & articles
  final bool tipsAlert;

  @override
  List<Object> get props => [
        expenseAlert,
        budgetAlert,
        tipsAlert,
      ];

  /// Creates a copy of the current NotificationState with property changes
  NotificationState copyWith({
    bool? expenseAlert,
    bool? budgetAlert,
    bool? tipsAlert,
  }) {
    return NotificationState(
      expenseAlert: expenseAlert ?? this.expenseAlert,
      budgetAlert: budgetAlert ?? this.budgetAlert,
      tipsAlert: tipsAlert ?? this.tipsAlert,
    );
  }
}

/// {@template notification_initial}
/// The initial state of NotificationState
/// {@endtemplate}
class NotificationInitial extends NotificationState {
  /// {@macro notification_initial}
  const NotificationInitial() : super();
}
