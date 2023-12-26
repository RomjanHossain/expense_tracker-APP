import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/local_ac_type.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:expense_tracker/utils/constrants/size_config.dart';
import 'package:flutter/material.dart';

class AddAccountBottomContainer extends StatefulWidget {
  const AddAccountBottomContainer({
    super.key,
  });

  @override
  State<AddAccountBottomContainer> createState() =>
      _AddAccountBottomContainerState();
}

class _AddAccountBottomContainerState extends State<AddAccountBottomContainer> {
  late TextEditingController _controller;
  late String _accountType;
  void _onAccountTypeChanged(String? value) {
    setState(() {
      _accountType = value!;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(300),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        // color: ExpenseTrackerColors.violet,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const TextField(
            decoration: InputDecoration(
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
              hintText: 'Account name',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
          ),
          //do account type dropdown
          DropdownButtonFormField(
            dropdownColor: ExpenseTrackerColors.violet,
            items: accountTypesDB
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: ExpenseTrackerTextStyle.regular3.copyWith(
                        color: ExpenseTrackerColors.light20,
                      ),
                    ),
                  ),
                )
                .toList(),
            isExpanded: true,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: ExpenseTrackerColors.violet,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                  color: ExpenseTrackerColors.light60,
                ),
              ),
              hintText: 'Account type',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: ExpenseTrackerColors.light60,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
            borderRadius: BorderRadius.circular(20),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: ExpenseTrackerColors.light20,
            ),
            onChanged: (d) {
              if (d is String) _onAccountTypeChanged(d);
            },
          ),
          Hero(
            tag: 'onboarding_account_setup_intro_button',
            child: PrimaryButton(
              onPress: () {},
              text: 'Continue',
            ),
          ),
        ],
      ),
    );
  }
}
