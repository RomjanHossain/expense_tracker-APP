import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/helper/helper_.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/models/isar_entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/data/models/isar_entity/income_entity/income_entity.dart';
import 'package:expense_tracker/data/models/isar_entity/transfer_entity/transfer_entity.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_account_cubit.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_expense_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_income_method_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_account.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_expense_method.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_income_methods.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/from_dropdown.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/expenseform/components/attachment_picker.dart';
import 'package:expense_tracker/presentation/pages/expenseform/components/subscription_bottom.dart';
import 'package:expense_tracker/presentation/pages/expenseform/components/success_alertdialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ExpenseformBody extends StatefulWidget {
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
  // final _fromFieldController = TextEditingController();
  final _toFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocConsumer<ExpenseformBloc, ExpenseformState>(
      listener: (context, state) async {
        if (state is SuccessfullyAddedToDatabase) {
          await showDialog<void>(
            context: context,
            builder: (context) => const SuccessAlertDialog(
              status: ExpenseformStatus.success,
            ),
          );
        } else if (state is FailedToAddToDatabase) {
          await showDialog<void>(
            context: context,
            builder: (context) => const SuccessAlertDialog(
              status: ExpenseformStatus.fail,
            ),
          );
        }
      },
      builder: (context, state) {
        return ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: size.height * 0.27),
            //!NOTE: how much?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                'How much?',
                style: ExpenseTrackerTextStyle.title3.copyWith(
                  color: ExpenseTrackerColors.light80.withOpacity(0.64),
                ),
              ),
            ),
            //! NOTE: Ammount
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
            //PERF: the form

            AnimatedContainer(
              padding: const EdgeInsets.all(15),
              height: widget.expenseType == ExpenseType.income ||
                      widget.expenseType == ExpenseType.expense
                  ? state.expenseFormEntity.subStart != null
                      ? MediaQuery.of(context).size.height * 0.7
                      : MediaQuery.of(context).size.height * 0.6
                  : MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                // color: ExpenseTrackerColors.light,
                color: isDarkMode(context)
                    ? ExpenseTrackerColors.dark
                    : ExpenseTrackerColors.light,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              duration: 500.milliseconds,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.expenseType == ExpenseType.expense)
                    const ExpenseMethodsDropdown(),

                  if (widget.expenseType == ExpenseType.income)
                    const IncomeMehodsDropdown(),
                  if (widget.expenseType == ExpenseType.transfer)
                    Stack(
                      children: [
                        Row(
                          children: [
                            //NOTE: from (Transfer)
                            const Expanded(
                              child: FormDropdown(),
                            ),
                            //NOTE: to (Transfer)
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      borderSide: BorderSide(
                                        color: ExpenseTrackerColors.violet,
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      borderSide: BorderSide(
                                        color: ExpenseTrackerColors.light60,
                                      ),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
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
                        //NOTE: icon (transfer)
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
                  //NOTE: description textfield
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
                      style: TextStyle(
                        // color: ExpenseTrackerColors.dark50,
                        color: isDarkMode(context)
                            ? ExpenseTrackerColors.light80
                            : ExpenseTrackerColors.dark50,
                      ),
                    ),
                  ),
                  //NOTE: wallet (from DB)
                  if (widget.expenseType == ExpenseType.income ||
                      widget.expenseType == ExpenseType.expense)
                    const AccountListDropdown(),
                  //NOTE: attachment filed with dotted border
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
                    //NOTE: repeat (Subscription)
                    ListTile(
                      title: const Text(
                        'Repeat',
                        style: TextStyle(
                          color: ExpenseTrackerColors.dark25,
                        ),
                      ),
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
                                      backgroundColor: isDarkMode(
                                        context,
                                      )
                                          ? ExpenseTrackerColors.dark
                                          : ExpenseTrackerColors.light,
                                      context: context,
                                      builder: (context) {
                                        // !TODO: show
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
                  // !!! `TODO`: show subscription
                  if (state.expenseFormEntity.isExpense &&
                      state.expenseFormEntity.subStart != null) ...[
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text('Freqency'),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text:
                                      '${state.expenseFormEntity.subType?.split(".").last} - ',
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
                          child: OutlinedButton(
                            child: const Text('Edit'),
                            onPressed: () => showModalBottomSheet<void>(
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
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_accountBalanceController.text.isEmpty) {
                          showFailureToast(
                            context,
                            'Ammount cannot be 0.00',
                          );
                          return;
                        }
                        //NOTE: transfer
                        if (widget.expenseType == ExpenseType.transfer) {
                          final acE =
                              context.read<DropdownAccountCubit>().state.$2;

                          // must have a wallet
                          if (acE == null) {
                            showFailureToast(
                              context,
                              'Select a wallet',
                            );
                            return;
                          }
                          if (acE.accountBalance! <
                              double.parse(
                                _accountBalanceController.text,
                              )) {
                            showFailureToast(
                              context,
                              'Insufficient balance',
                            );
                            return;
                          }
                          final transferEntity = TransferEntity()
                            ..to = _toFieldController.text
                            ..fromID = acE.id
                            ..attachment = imageFieldController.text
                            ..description = _descriptionController.text
                            ..createdDate = DateTime.now()
                            ..ammount = double.parse(
                              _accountBalanceController.text,
                            );
                          context
                              .read<ExpenseformBloc>()
                              .add(TransferToDatbase(transferEntity));
                        } else {
                          // NOTE: add the income
                          if (widget.expenseType == ExpenseType.income) {
                            final acE =
                                context.read<DropdownAccountCubit>().state.$2;
                            // if (acE!.accountBalance! <
                            //     double.parse(_accountBalanceController.text)) {
                            //   showFailureToast(context, 'Insufficient balance');
                            //   return;
                            // }

                            // must have a wallet
                            if (acE == null) {
                              showFailureToast(
                                context,
                                'Select a wallet',
                              );
                              return;
                            }
                            final incomeEntity = IncomeIsarEntity()
                              ..attachment = imageFieldController.text
                              ..description = _descriptionController.text
                              ..createdDate = DateTime.now()
                              ..ammount = double.parse(
                                _accountBalanceController.text,
                              )
                              ..isRepeat = state.expenseFormEntity.isExpense
                              ..endDate = state.expenseFormEntity.subEnd
                              // ..startDate = state.expenseFormEntity.subStart
                              ..categoryID = context
                                  .read<DropdownIncomeMethodCubit>()
                                  .state
                              ..startDate =
                                  state.expenseFormEntity.subStart != null
                                      ? state.expenseFormEntity.subStart!
                                      : DateTime.now()
                              ..repeatType = state.expenseFormEntity.subType
                              ..walletId = acE.id;
                            context
                                .read<ExpenseformBloc>()
                                .add(IncomeToDatabase(incomeEntity));
                          }
                          // NOTE: add the expense
                          else {
                            final acE =
                                context.read<DropdownAccountCubit>().state.$2;
                            // must have a wallet
                            if (acE == null) {
                              showFailureToast(
                                context,
                                'Select a wallet',
                              );
                              return;
                            }
                            if (acE.accountBalance! <
                                double.parse(
                                  _accountBalanceController.text,
                                )) {
                              showFailureToast(
                                context,
                                'Insufficient balance',
                              );
                              return;
                            }
                            final expenseEntity = ExpenseIsarEntity()
                              ..attachment = imageFieldController.text
                              ..description = _descriptionController.text
                              ..createdDate = DateTime.now()
                              ..categoryID = context
                                  .read<DropdownExpenseMethodCubit>()
                                  .state
                              ..ammount = double.parse(
                                _accountBalanceController.text,
                              )
                              ..isRepeat = state.expenseFormEntity.isExpense
                              ..endDate = state.expenseFormEntity.subEnd
                              ..startDate =
                                  state.expenseFormEntity.subStart != null
                                      ? state.expenseFormEntity.subStart!
                                      : DateTime.now()
                              ..repeatType = state.expenseFormEntity.subType
                              ..walletId = acE.id;
                            context
                                .read<ExpenseformBloc>()
                                .add(ExpenseToDatabase(expenseEntity));
                          }
                          debugPrint(
                            'CategoryID : ${context.read<DropdownExpenseMethodCubit>().state}',
                          );
                          debugPrint(
                            'Description: ${_descriptionController.text}',
                          );
                          debugPrint(
                            'attachment: ${imageFieldController.text}',
                          );
                          debugPrint(
                            'Wallet: ${context.read<DropdownAccountCubit>().state.$2?.accountName}',
                          );
                          debugPrint(
                            'Repeat: ${state.expenseFormEntity.isExpense}',
                          );

                          debugPrint(
                            'Repeat subStart: ${state.expenseFormEntity.subStart}',
                          );

                          debugPrint(
                            'Repeat type: ${state.expenseFormEntity.subType}',
                          );
                          debugPrint(
                            'Repeat subEnd: ${state.expenseFormEntity.subEnd}',
                          );
                          Future.delayed(
                            const Duration(seconds: 1),
                            () {
                              if (!context.mounted) return;
                              // reset the form
                              context.read<ExpenseformBloc>().add(
                                    ResetExpenseForm(),
                                  );
                              // textcontroller clear
                              _accountBalanceController.clear();
                              _descriptionController.clear();
                              imageFieldController.clear();
                              // _fromFieldController.clear();
                              _toFieldController.clear();
                              // pop the dialog
                              Navigator.of(context).pop();
                            },
                          );
                        }
                      },
                      child: const Text('Continue'),
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

  @override
  void dispose() {
    _accountBalanceController.dispose();
    _descriptionController.dispose();
    imageFieldController.dispose();
    _transformController.dispose();
    _transtoController.dispose();
    // _fromFieldController.dispose();
    _toFieldController.dispose();
    super.dispose();
  }

  String getFormateDate(DateTime date) =>
      DateFormat('dd MMM, yyyy').format(date);
}
