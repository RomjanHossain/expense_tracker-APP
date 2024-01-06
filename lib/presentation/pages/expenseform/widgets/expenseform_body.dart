import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_expense_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_income_method_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_expense_method.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_income_methods.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/expenseform/components/attachment_picker.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
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
                      subtitle: const Text(
                        'Repeat transaction',
                        style: TextStyle(
                          color: ExpenseTrackerColors.light20,
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
                    padding: const EdgeInsets.all(8.0),
                    child: PrimaryButton(
                      onPress: () {
                        debugPrint(
                            'Money Amount: ${_accountBalanceController.text}');
                        if (widget.expenseType == ExpenseType.transfer) {
                          debugPrint('From: ${_fromFieldController.text}');
                          debugPrint('To: ${_toFieldController.text}');
                          debugPrint(
                              'Description: ${_descriptionController.text}');
                          debugPrint(
                            'Attachment: ${imageFieldController.text}',
                          );
                        } else {
                          debugPrint(
                              'Expense: ${context.read<DropdownExpenseMethodCubit>().state}');
                          debugPrint(
                              'Description: ${_descriptionController.text}');
                          debugPrint(
                              'Income Source: ${context.read<DropdownIncomeMethodCubit>().state}');
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
