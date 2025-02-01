// NOTE: All enums are here

// Enum: SplashScreenStatus
enum SplashScreenStatusEnum {
  onboarding,
  enterPin,
}

//NOTE: success or fail
enum ExpenseformStatus { success, fail }

///* home page segmented buttons enum(today, week, month, year)
enum SegmentedButtonsData { today, week, month, year }

///& types of expenses enum (income, expense, transfer)
enum ExpenseType { income, expense, transfer }

// only income and expense type
enum ExpenseType2 { income, expense }

// Enum: AccountType
enum AccountType {
  bank,
  creditCard,
  mobileBanking,
  wallet,
  cash,
  other,
}

// chart type
enum ChartType {
  line,
  pie,
}

enum SubscriptionsFrequency {
  daily,
  weekly,
  monthly,
  yearly,
}

//NOTE: sort type
enum SortType {
  highest,
  lowest,
  newest,
  oldest,
}
