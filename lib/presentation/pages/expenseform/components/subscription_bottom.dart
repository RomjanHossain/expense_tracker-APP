import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/all_months.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/expenseform_bloc.dart';
import 'package:expense_tracker/presentation/pages/expenseform/widgets/expenseform_body.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        hintStyle: ExpenseTrackerTextStyle.regular2.copyWith(
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
                style: ExpenseTrackerTextStyle.regular2.copyWith(
                  color: ExpenseTrackerColors.dark25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // row of the frequency dropdown (subscriptionsFrequency), months dropdown (calendermotns) and date dropdown according to the month selected
              Row(
                children: [
                  // frequency dropdown
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        8,
                      ),
                      child: DropdownButtonFormField(
                        decoration: dropdownInputDecoration(
                          'Frequency',
                        ),
                        style: const TextStyle(
                          color: ExpenseTrackerColors.dark50,
                        ),
                        // value: 'Daily',
                        onChanged: (value) {
                          context.read<ExpenseformBloc>().add(
                                ChangeSubType(
                                  value.toString(),
                                ),
                              );
                          debugPrint(
                              'value : $value ${state.expenseFormEntity.subType}');
                        },
                        items: subscriptionsFrequency
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  // months dropdown
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        8,
                      ),
                      child: DropdownButtonFormField(
                        decoration: dropdownInputDecoration(
                          'Month',
                        ),
                        // value: 'January',
                        onChanged: (value) {
                          context.read<ExpenseformBloc>().add(
                                ChangeSubStartMonth(
                                  value.toString(),
                                ),
                              );
                        },
                        items: calanderMonths
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  // date dropdown
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        8,
                      ),
                      child: DropdownButtonFormField(
                        decoration: dropdownInputDecoration(
                          'Date',
                        ),

                        // value: '1',
                        onChanged: (value) {
                          context.read<ExpenseformBloc>().add(
                                ChangeSubStart(
                                  value.toString(),
                                ),
                              );
                        },
                        items: List.generate(
                          31,
                          (index) => DropdownMenuItem(
                            value: '${index + 1}',
                            child: Text(
                              '${index + 1}',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // end of subscription (date picker)
              Text(
                'End of subscription',
                style: ExpenseTrackerTextStyle.regular2.copyWith(
                  color: ExpenseTrackerColors.dark25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // date picker for the end of subscription (not a dropdown)
              Row(
                children: [
                  Text('Date'),
                  Expanded(
                    child: GestureDetector(
                      child: Text('date'),
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
                                ChangeSubEnd(
                                  date,
                                ),
                              );
                        }
                      },
                    ),
                  ),
                ],
              ),
              PrimaryButton(
                onPress: () {
                  debugPrint(
                      'sub end date : ${state.expenseFormEntity.subEnd}');
                  debugPrint('mon :${state.expenseFormEntity.subStartMonth}');
                  debugPrint(
                      'sub start : ${state.expenseFormEntity.subStartDay}');
                  debugPrint('sub type : ${state.expenseFormEntity.subType}');
                  // debugPrint('sub end : ${state.isExpense}');
                },
                text: 'Next',
              ),
            ],
          ),
        );
      },
    );
  }
}
