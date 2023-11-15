part of 'borrow_or_lend_page_bloc.dart';

abstract class BorrowOrLendPageEvent  extends Equatable {
  const BorrowOrLendPageEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_borrow_or_lend_page_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomBorrowOrLendPageEvent extends BorrowOrLendPageEvent {
  /// {@macro custom_borrow_or_lend_page_event}
  const CustomBorrowOrLendPageEvent();
}
