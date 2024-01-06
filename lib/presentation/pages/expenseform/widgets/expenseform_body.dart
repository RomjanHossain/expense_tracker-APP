import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/all_months.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_expense_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_income_method_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_expense_method.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_income_methods.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/expenseform/components/attachment_picker.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// {@template expenseform_body}
/// Body of the ExpenseformPage.
///
/// Add what it does
/// {@endtemplate}
class ExpenseformBody extends StatefulWidget {
  /// {@macro expenseform_body}
  const ExpenseformBody({required this.expenseType, super.key});
  final ExpenseType expenseType;

  @override
  State<ExpenseformBody> createState() => _ExpenseformBodyState();
}

class _ExpenseformBodyState extends State<ExpenseformBody> {
  final _accountBalanceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _transformController = TextEditingController();
  final _transtoController = TextEditingController();
  final imageFieldController = TextEditingController();
  final _fromFieldController = TextEditingController();
  final _toFieldController = TextEditingController();
  @override
  void dispose() {
    _accountBalanceController.dispose();
    _descriptionController.dispose();
    imageFieldController.dispose();
    _transformController.dispose();
    _transtoController.dispose();
    _fromFieldController.dispose();
    _toFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseformBloc, ExpenseformState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                'How much?',
                style: ExpenseTrackerTextStyle.title3.copyWith(
                  color: ExpenseTrackerColors.light80.withOpacity(0.64),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _accountBalanceController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: ExpenseTrackerTextStyle.titleX.copyWith(
                  color: ExpenseTrackerColors.light80,
                ),
                onSubmitted: (value) {
                  // context.read<OnboardingAccountSetupBloc>().add(
                  //       AddBalanceEvent(
                  //         double.parse(_accountBalanceController.text),
                  //       ),
                  //     );
                },
                onEditingComplete: () {
                  // context.read<OnboardingAccountSetupBloc>().add(
                  //       AddBalanceEvent(
                  //         double.parse(_accountBalanceController.text),
                  //       ),
                  //     );
                },
                onChanged: (value) {
                  // context.read<OnboardingAccountSetupBloc>().add(
                  //       AddBalanceEvent(
                  //         double.parse(_accountBalanceController.text),
                  //       ),
                  //     );
                },
                decoration: InputDecoration(
                  hintText: '0.00',
                  prefixIcon: const Icon(
                    Icons.attach_money,
                    color: ExpenseTrackerColors.light80,
                    size: 64,
                  ),
                  hintStyle: ExpenseTrackerTextStyle.titleX.copyWith(
                    color: ExpenseTrackerColors.light80,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            // the form

            Container(
              padding: const EdgeInsets.all(15),
              height: widget.expenseType == ExpenseType.income ||
                      widget.expenseType == ExpenseType.expense
                  ? MediaQuery.of(context).size.height * 0.6
                  : MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: ExpenseTrackerColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.expenseType == ExpenseType.income ||
                      widget.expenseType == ExpenseType.expense)
                    const ExpenseMethodsDropdown(),
                  if (widget.expenseType == ExpenseType.transfer)
                    Stack(
                      children: [
                        Row(
                          children: [
                            // from **
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ).h,
                                child: TextField(
                                  controller: _fromFieldController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: ExpenseTrackerColors.violet,
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: ExpenseTrackerColors.light60,
                                      ),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                        color: ExpenseTrackerColors.light60,
                                      ),
                                    ),
                                    hintText: 'From',
                                    hintStyle: ExpenseTrackerTextStyle.regular2
                                        .copyWith(
                                      color: ExpenseTrackerColors.light20,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //**to */
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ).h,
                                child: TextField(
                                  controller: _toFieldController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: ExpenseTrackerColors.violet,
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: ExpenseTrackerColors.light60,
                                      ),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                        color: ExpenseTrackerColors.light60,
                                      ),
                                    ),
                                    hintText: 'To',
                                    hintStyle: ExpenseTrackerTextStyle.regular2
                                        .copyWith(
                                      color: ExpenseTrackerColors.light20,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: ExpenseTrackerColors.light80,
                              borderRadius: BorderRadius.circular(50).r,
                              border: Border.all(
                                color: ExpenseTrackerColors.light60,
                                width: 2,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ).h,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                            ).h,
                            child: SvgPicture.asset(
                              ExpenseAssets.transactionColorIcon,
                              // color: ExpenseTrackerColors.violet,
                            ),
                          ),
                        ),
                      ],
                    ),
                  //* description
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ).h,
                    child: TextField(
                      controller: _descriptionController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
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
                        hintText: 'Description',
                        hintStyle: ExpenseTrackerTextStyle.regular2.copyWith(
                          color: ExpenseTrackerColors.light20,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      style: const TextStyle(
                        color: ExpenseTrackerColors.dark50,
                      ),
                    ),
                  ),
                  //! wallet (place holder)
                  //*** [TODO: wallet from db]
                  if (widget.expenseType == ExpenseType.income ||
                      widget.expenseType == ExpenseType.expense)
                    const IncomeMehodsDropdown(),
                  //* attachment filed with dotted border
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ).h,
                    child: AttachmentPicker(
                      selectIMGController: imageFieldController,
                    ),
                  ),
                  if (widget.expenseType == ExpenseType.income ||
                      widget.expenseType == ExpenseType.expense)
                    //* repeat */
                    ListTile(
                      title: const Text(
                        'Repeat',
                        style: TextStyle(
                          color: ExpenseTrackerColors.dark25,
                        ),
                      ),
                      // subtitle:  Text(
                      //   'Repeat transaction',
                      //   style: TextStyle(
                      //     color: ExpenseTrackerColors.light20,
                      //   ),
                      // ),
                      subtitle: RichText(
                        text: TextSpan(
                          text: 'Repeat transaction',
                          style: ExpenseTrackerTextStyle.tiny.copyWith(
                            color: ExpenseTrackerColors.light20,
                          ),
                          children: [
                            if (state.isExpense) ...[
                              const TextSpan(text: ', '),
                              TextSpan(
                                text: 'set your own time',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // show a bottom modal sheet
                                    showBottomSheet(
                                      context: context,
                                      builder: (context) {
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start, // start
                                            children: [
                                              Text(
                                                'Start of subscription',
                                                style: ExpenseTrackerTextStyle
                                                    .regular2
                                                    .copyWith(
                                                  color: ExpenseTrackerColors
                                                      .dark25,
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                        8,
                                                      ),
                                                      child: DropdownButton(
                                                        // value: 'Daily',
                                                        onChanged: (value) {
                                                          context
                                                              .read<
                                                                  ExpenseformBloc>()
                                                              .add(
                                                                ChangeSubType(
                                                                  value
                                                                      .toString(),
                                                                ),
                                                              );
                                                        },
                                                        items:
                                                            subscriptionsFrequency
                                                                .map(
                                                                  (e) =>
                                                                      DropdownMenuItem(
                                                                    value: e,
                                                                    child:
                                                                        Text(e),
                                                                  ),
                                                                )
                                                                .toList(),
                                                      ),
                                                    ),
                                                  ),
                                                  // months dropdown
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                        8,
                                                      ),
                                                      child: DropdownButton(
                                                        // value: 'January',
                                                        onChanged: (value) {
                                                          context
                                                              .read<
                                                                  ExpenseformBloc>()
                                                              .add(
                                                                ChangeSubStartMonth(
                                                                  value
                                                                      .toString(),
                                                                ),
                                                              );
                                                        },
                                                        items: calanderMonths
                                                            .map(
                                                              (e) =>
                                                                  DropdownMenuItem(
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                        8,
                                                      ),
                                                      child: DropdownButton(
                                                        // value: '1',
                                                        onChanged: (value) {
                                                          context
                                                              .read<
                                                                  ExpenseformBloc>()
                                                              .add(
                                                                ChangeSubStart(
                                                                  value
                                                                      .toString(),
                                                                ),
                                                              );
                                                        },
                                                        items: List.generate(
                                                          31,
                                                          (index) =>
                                                              DropdownMenuItem(
                                                            value:
                                                                '${index + 1}',
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
                                                style: ExpenseTrackerTextStyle
                                                    .regular2
                                                    .copyWith(
                                                  color: ExpenseTrackerColors
                                                      .dark25,
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
                                                      child: Text('Select'),
                                                      onTap: () async {
                                                        // show a date picker
                                                        final date =
                                                            await showDatePicker(
                                                          context: context,
                                                          confirmText: 'Set',
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime.now(),
                                                          lastDate:
                                                              DateTime.now()
                                                                  .add(
                                                            const Duration(
                                                              days: 365 * 10,
                                                            ),
                                                          ),
                                                        );
                                                        if (date != null) {
                                                          if (!context
                                                              .mounted) {
                                                            return;
                                                          }
                                                          context
                                                              .read<
                                                                  ExpenseformBloc>()
                                                              .add(
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
                                                onPress: () {},
                                                text: 'Next',
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                style: ExpenseTrackerTextStyle.tiny.copyWith(
                                  color: ExpenseTrackerColors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: ExpenseTrackerColors.blue,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      trailing: Switch(
                        value: state.isExpense,
                        onChanged: (value) {
                          context.read<ExpenseformBloc>().add(
                                ChangeRepeat(value),
                              );
                        },
                      ),
                    ),
                  //! ** a submit button */
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: PrimaryButton(
                      onPress: () {
                        debugPrint(
                          'Money Amount: ${_accountBalanceController.text}',
                        );
                        if (widget.expenseType == ExpenseType.transfer) {
                          debugPrint('From: ${_fromFieldController.text}');
                          debugPrint('To: ${_toFieldController.text}');
                          debugPrint(
                            'Description: ${_descriptionController.text}',
                          );
                          debugPrint(
                            'Attachment: ${imageFieldController.text}',
                          );
                        } else {
                          debugPrint(
                            'Expense: ${context.read<DropdownExpenseMethodCubit>().state}',
                          );
                          debugPrint(
                            'Description: ${_descriptionController.text}',
                          );
                          debugPrint(
                            'Income Source: ${context.read<DropdownIncomeMethodCubit>().state}',
                          );
                          debugPrint(
                            'attachment: ${imageFieldController.text}',
                          );
                          debugPrint('Repeat: ${state.isExpense}');
                        }
                      },
                      text: 'Continue',
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

const subscriptionsFrequency = [
  'Daily',
  'Weekly',
  'Monthly',
  'Yearly',
  'Lifetime',
];
