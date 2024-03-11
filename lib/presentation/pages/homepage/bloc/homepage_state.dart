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
    this.todaysIEmodel = const [],
    this.weeklyIEmodel = const [],
    this.monthlyIEmodel = const [],
    this.yearlyIEmodel = const [],
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

  /// todays income and expense
  final List<IEmodel> todaysIEmodel;

  /// week income and expense
  final List<IEmodel> weeklyIEmodel;

  /// monthly income and expense
  final List<IEmodel> monthlyIEmodel;

  /// yearly income and expense
  final List<IEmodel> yearlyIEmodel;
// IEmodel

  @override
  List<Object> get props => [
        notification,
        currentMonth,
        se,
        income,
        expense,
        accountBalance,
        yearlyIEmodel,
        monthlyIEmodel,
        weeklyIEmodel,
        todaysIEmodel,
      ];

  /// Creates a copy of the current HomepageState with property changes
  HomepageState copyWith({
    int? notification,
    int? currentMonth,
    SegmentedButtonsData? se,
    double? accountBalance,
    double? income,
    double? expense,
    List<IEmodel>? todaysIEmodel,
    List<IEmodel>? weeklyIEmodel,
    List<IEmodel>? monthlyIEmodel,
    List<IEmodel>? yearlyIEmodel,
  }) {
    return HomepageState(
      se: se ?? this.se,
      notification: notification ?? this.notification,
      currentMonth: currentMonth ?? this.currentMonth,
      accountBalance: accountBalance ?? this.accountBalance,
      income: income ?? this.income,
      expense: expense ?? this.expense,
      todaysIEmodel: todaysIEmodel ?? this.todaysIEmodel,
      weeklyIEmodel: weeklyIEmodel ?? this.weeklyIEmodel,
      monthlyIEmodel: monthlyIEmodel ?? this.monthlyIEmodel,
      yearlyIEmodel: yearlyIEmodel ?? this.yearlyIEmodel,
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
