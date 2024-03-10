part of 'homepage_bloc.dart';

/// {@template homepage_state}
/// HomepageState description
/// {@endtemplate}
class HomepageState extends Equatable {
  /// {@macro homepage_state}
  const HomepageState({
    this.se = SegmentedButtonsData.today,
    this.notification = 0,
    this.currentMonth = 0,
    this.accountBalance = 0.0,
    this.income = 0.0,
    this.expense = 0.0,
  });

  // accoutn balance
  final double accountBalance;
  //income and expense
  final double income;
  final double expense;

  /// A description for customProperty
  // final String customProperty;

  /// subscription Enums
  final SegmentedButtonsData se;

  /// notification
  final int notification;

  /// current month
  final int currentMonth;

  /// currentMonth

  @override
  List<Object> get props => [
        notification,
        currentMonth,
        se,
        income,
        expense,
        accountBalance,
      ];

  /// Creates a copy of the current HomepageState with property changes
  HomepageState copyWith({
    int? notification,
    int? currentMonth,
    SegmentedButtonsData? se,
    double? accountBalance,
    double? income,
    double? expense,
  }) {
    return HomepageState(
      se: se ?? this.se,
      notification: notification ?? this.notification,
      currentMonth: currentMonth ?? this.currentMonth,
      accountBalance: accountBalance ?? this.accountBalance,
      income: income ?? this.income,
      expense: expense ?? this.expense,
    );
  }
}

/// {@template homepage_initial}
/// The initial state of HomepageState
/// {@endtemplate}
class HomepageInitial extends HomepageState {
  /// {@macro homepage_initial}
  const HomepageInitial() : super();
}
