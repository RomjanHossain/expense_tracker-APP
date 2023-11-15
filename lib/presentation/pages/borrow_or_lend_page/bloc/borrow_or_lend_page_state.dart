part of 'borrow_or_lend_page_bloc.dart';

/// {@template borrow_or_lend_page_state}
/// BorrowOrLendPageState description
/// {@endtemplate}
class BorrowOrLendPageState extends Equatable {
  /// {@macro borrow_or_lend_page_state}
  const BorrowOrLendPageState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current BorrowOrLendPageState with property changes
  BorrowOrLendPageState copyWith({
    String? customProperty,
  }) {
    return BorrowOrLendPageState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template borrow_or_lend_page_initial}
/// The initial state of BorrowOrLendPageState
/// {@endtemplate}
class BorrowOrLendPageInitial extends BorrowOrLendPageState {
  /// {@macro borrow_or_lend_page_initial}
  const BorrowOrLendPageInitial() : super();
}
