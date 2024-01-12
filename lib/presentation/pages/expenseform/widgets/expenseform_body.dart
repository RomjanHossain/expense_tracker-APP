import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_expense_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_income_method_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_expense_method.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_income_methods.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/expenseform/components/attachment_picker.dart';
import 'package:expense_tracker/presentation/pages/expenseform/components/subscription_bottom.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

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

  String getFormateDate(DateTime date) =>
      DateFormat('dd MMM, yyyy').format(date);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpenseformBloc, ExpenseformState>(
      listener: (context, state) {},
      builder: (context, state) {
        // 29 Dec, 2025 (datetime format)

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

            AnimatedContainer(
              padding: const EdgeInsets.all(15),
              height: widget.expenseType == ExpenseType.income ||
                      widget.expenseType == ExpenseType.expense
                  ? state.expenseFormEntity.subStart != null
                      ? MediaQuery.of(context).size.height * 0.7
                      : MediaQuery.of(context).size.height * 0.6
                  : MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: ExpenseTrackerColors.light,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              duration: 500.milliseconds,
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
                                    hintStyle:
                                        ExpenseTrackerTextStyle.body2.copyWith(
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
                                    hintStyle:
                                        ExpenseTrackerTextStyle.body2.copyWith(
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
                        hintStyle: ExpenseTrackerTextStyle.body2.copyWith(
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
                            if (state.expenseFormEntity.isExpense) ...[
                              const TextSpan(text: ', '),
                              TextSpan(
                                text: 'set your own time',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // show a bottom modal sheet

                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (context) {
                                        //! TODO: show
                                        return const SubscriptionBottomSheet();
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
                        value: state.expenseFormEntity.isExpense,
                        onChanged: (value) {
                          context.read<ExpenseformBloc>().add(
                                ChangeRepeat(value),
                              );
                        },
                      ),
                    ),
                  //!!! TODO: show subscription
                  if (state.expenseFormEntity.isExpense &&
                      state.expenseFormEntity.subStart != null) ...[
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text('Freqency'),
                              // Text('${state.expenseFormEntity.subType} - ${state.expenseFormEntity.subStart?getFormateDate(state.expenseFormEntity.subStart):""}'),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: '${state.expenseFormEntity.subType} - ',
                                  style: ExpenseTrackerTextStyle.tiny.copyWith(
                                    color: ExpenseTrackerColors.light20,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: state.expenseFormEntity.subStart !=
                                              null
                                          ? DateFormat('MMMM dd').format(
                                              state.expenseFormEntity.subStart!,
                                            )
                                          : '',
                                      style:
                                          ExpenseTrackerTextStyle.tiny.copyWith(
                                        color: ExpenseTrackerColors.light20,
                                        // decoration: TextDecoration.underline,
                                        // decorationColor:
                                        //     ExpenseTrackerColors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // end date
                        Expanded(
                          child: Column(
                            children: [
                              const Text('End After'),
                              Text(
                                state.expenseFormEntity.subStart != null
                                    ? getFormateDate(
                                        state.expenseFormEntity.subStart!,
                                      )
                                    : '',
                                style: ExpenseTrackerTextStyle.tiny.copyWith(
                                  color: ExpenseTrackerColors.light20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SecondaryButton(
                            text: 'Edit',
                            onPress: () => showModalBottomSheet<void>(
                              context: context,
                              builder: (context) =>
                                  const SubscriptionBottomSheet(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
                          debugPrint(
                            'Repeat: ${state.expenseFormEntity.isExpense}',
                          );
                          showDialog<void>(
                            context: context,
                            builder: (context) => const SuccessAlertDialog(),
                          );
                          Future.delayed(
                            const Duration(seconds: 3),
                            () {
                              // reset the form
                              context.read<ExpenseformBloc>().add(
                                    ResetExpenseForm(),
                                  );
                              // textcontroller clear
                              _accountBalanceController.clear();
                              _descriptionController.clear();
                              imageFieldController.clear();
                              _fromFieldController.clear();
                              _toFieldController.clear();
                              // pop the dialog
                              Navigator.of(context).pop();
                            },
                          );
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

class SuccessAlertDialog extends StatelessWidget {
  const SuccessAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ExpenseTrackerColors.light,
      insetPadding: const EdgeInsets.all(10),
      // title: const Text('Success'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_sharp,
            color: ExpenseTrackerColors.violet,
            size: 48,
          ),
          Text(
            'Transaction has been successfully added',
            style: ExpenseTrackerTextStyle.small,
          ),
        ],
      ),
      // actions: [
      //   TextButton(
      //     onPressed: () {
      //       // Navigator.of(context).pop();
      //       // Navigator.of(context).pop();
      //     },
      //     child: const Text('Ok'),
      //   ),
      // ],
    );
  }
}

const subscriptionsFrequency = [
  'Daily',
  'Weekly',
  'Monthly',
  'Yearly',
  // 'Lifetime',
];
