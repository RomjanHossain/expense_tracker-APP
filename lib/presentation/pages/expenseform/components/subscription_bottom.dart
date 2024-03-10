import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/expenseform_bloc.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SubscriptionBottomSheet extends StatelessWidget {
  const SubscriptionBottomSheet({super.key});
  InputDecoration dropdownInputDecoration(String hintText) => InputDecoration(
        isDense: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: ExpenseTrackerColors.violet,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: ExpenseTrackerColors.light60,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: ExpenseTrackerColors.light60,
          ),
        ),
        hintText: hintText,
        hintStyle: ExpenseTrackerTextStyle.body2.copyWith(
          color: ExpenseTrackerColors.light20,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpenseformBloc, ExpenseformState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: 300.h,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ).h,
          decoration: const BoxDecoration(
            // color: ExpenseTrackerColors.blue,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start, // start
            children: [
              Text(
                'Start of subscription',
                style: ExpenseTrackerTextStyle.body3.copyWith(
                  color: isDarkMode(context)
                      ? ExpenseTrackerColors.light20
                      : ExpenseTrackerColors.dark25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              //NOTE: row of the frequency dropdown (subscriptionsFrequency), months dropdown (calendermotns) and date dropdown according to the month selected
              Row(
                children: [
                  // frequency dropdown
                  Expanded(
                    child: DropdownButtonFormField(
                      dropdownColor: ExpenseTrackerColors.violet,
                      focusColor: isDarkMode(context)
                          ? ExpenseTrackerColors.dark75
                          : ExpenseTrackerColors.light,
                      decoration: dropdownInputDecoration(
                        'Frequency',
                      ),
                      style: TextStyle(
                        // color: ExpenseTrackerColors.dark50,
                        color: isDarkMode(context)
                            ? ExpenseTrackerColors.light
                            : ExpenseTrackerColors.dark,
                      ),
                      // value: 'Daily',
                      onChanged: (value) {
                        context.read<ExpenseformBloc>().add(
                              ChangeSubType(
                                value.toString(),
                              ),
                            );
                        debugPrint(
                          'value : $value ${state.expenseFormEntity.subType}',
                        );
                      },
                      items: SubscriptionsFrequency.values
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                getSucriptionFrequencyText(e),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  width10,
                  // a text box to pick a date
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: ExpenseTrackerColors.violet20,
                          ),
                        ),
                        child: Text(
                          DateFormat('dd MMM, yyyy').format(
                            state.expenseFormEntity.subStart ?? DateTime.now(),
                          ),
                        ),
                      ),
                      onTap: () async {
                        // show a date picker
                        final date = await showDatePicker(
                          context: context,
                          confirmText: 'Set',
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(
                              days: 365 * 10,
                            ),
                          ),
                        );
                        if (date != null) {
                          if (!context.mounted) {
                            return;
                          }
                          context.read<ExpenseformBloc>().add(
                                ChangeSubStart(
                                  date,
                                ),
                              );
                        }
                      },
                    ),
                  ),
                ],
              ),
              // end of subscription (date picker)
              Text(
                'End of subscription Date',
                style: ExpenseTrackerTextStyle.body3.copyWith(
                  // color: ExpenseTrackerColors.dark25,
                  color: isDarkMode(context)
                      ? ExpenseTrackerColors.light20
                      : ExpenseTrackerColors.dark25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // date picker for the end of subscription (not a dropdown)
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: ExpenseTrackerColors.violet20,
                    ),
                  ),
                  child: Text(
                    DateFormat('dd MMM, yyyy').format(
                      state.expenseFormEntity.subEnd ?? DateTime.now(),
                    ),
                  ),
                ),
                onTap: () async {
                  // show a date picker
                  final date = await showDatePicker(
                    context: context,
                    confirmText: 'Set',
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(
                        days: 365 * 10,
                      ),
                    ),
                  );
                  if (date != null) {
                    if (!context.mounted) {
                      return;
                    }
                    // check if the end date is before the start date
                    if (date.isBefore(
                      state.expenseFormEntity.subStart ?? DateTime.now(),
                    )) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'End date cannot be before start date',
                          ),
                        ),
                      );
                      return;
                    }
                    context.read<ExpenseformBloc>().add(
                          ChangeSubEnd(
                            date,
                          ),
                        );
                  }
                },
              ),

              ElevatedButton(
                onPressed: () {
                  debugPrint(
                    'sub end date : ${state.expenseFormEntity.subEnd}',
                  );
                  debugPrint('start :${state.expenseFormEntity.subStart}');
                  // debugPrint(
                  //   'sub start : ${state.expenseFormEntity.subStartDay}',
                  // );
                  debugPrint('sub type : ${state.expenseFormEntity.subType}');
                  // debugPrint('sub end : ${state.isExpense}');

                  // the startDate and endDate cannot be same and frequency cannot be null
                  if (state.expenseFormEntity.subStart ==
                      state.expenseFormEntity.subEnd) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Start and end date cannot be same',
                        ),
                      ),
                    );
                    return;
                  }
                  if (state.expenseFormEntity.subType == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please select a frequency',
                        ),
                      ),
                    );
                    return;
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Next'),
              ),
            ],
          ),
        );
      },
    );
  }
}
