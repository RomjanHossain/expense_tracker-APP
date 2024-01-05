import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_expense_method.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_income_methods.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/expenseform/components/attachment_picker.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final imageFieldController = TextEditingController();
  @override
  void dispose() {
    _accountBalanceController.dispose();
    _descriptionController.dispose();
    imageFieldController.dispose();
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
            if (widget.expenseType == ExpenseType.income)
              Container(
                padding: const EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height * 0.6,
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
                    const ExpenseMethodsDropdown(),
                    //* description
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ).h,
                      child: TextField(
                        controller: _descriptionController,
                        keyboardType: TextInputType.name,
                        onChanged: (d) {},
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: ExpenseTrackerColors.violet,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: ExpenseTrackerColors.light60,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: ExpenseTrackerColors.light60,
                            ),
                          ),
                          hintText: 'Description',
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                    //! wallet (place holder)
                    //*** [TODO: wallet from db]
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
                    //* repeat */
                    ListTile(
                      title: const Text('Repeat'),
                      subtitle: const Text('Repeat transaction'),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    //** a submit button */
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrimaryButton(onPress: () {}, text: 'Continue'),
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
