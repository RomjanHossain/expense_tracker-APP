import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/all_months.dart';

class DropdownMonthsCubit extends Cubit<String> {
  DropdownMonthsCubit()
      : super(
          calanderMonths[DateTime.now().month - 1],
        );

  /// A description for yourCustomFunction
  FutureOr<void> changeMonth(String s) async {
    emit(s);
  }
}
