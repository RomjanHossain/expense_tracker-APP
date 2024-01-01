import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/account_type_helper.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/local_banking.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/local_mobile_banking.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/mobile_banking_db.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/page/successfully_account_created.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:expense_tracker/utils/constrants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddAccountBottomContainer extends StatefulWidget {
  const AddAccountBottomContainer({
    super.key,
  });

  @override
  State<AddAccountBottomContainer> createState() =>
      _AddAccountBottomContainerState();
}

class _AddAccountBottomContainerState extends State<AddAccountBottomContainer> {
  late TextEditingController _accountName;

  @override
  void initState() {
    super.initState();
    _accountName = TextEditingController();
  }

  @override
  void dispose() {
    _accountName.dispose();
    super.dispose();
  }

  final forbidenList = [
    AccountType.cash,
    AccountType.other,
    AccountType.wallet,
  ];

  @override
  Widget build(BuildContext context) {
    final createACState =
        context.watch<OnboardingAccountSetupBloc>().state.createAccount;
    return Container(
      height: getProportionateScreenHeight(
        createACState.acType == null
            ? 300
            : forbidenList.contains(createACState.acType)
                ? 300
                : 450,
      ),
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
          //! Account name
          const AccountNameTextField(),
          //do account type dropdown
          const AccountTypeDropdown(),
          if (!forbidenList.contains(createACState.acType)) ...[
            //* text of Ac type
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                createACState.acType != null
                    ? AccountTypeHelper.toString2(createACState.acType!)
                    : '',
                textAlign: TextAlign.left,
                style: ExpenseTrackerTextStyle.regular1.copyWith(
                  fontWeight: FontWeight.w600,
                  // color: ExpenseTrackerColors.light80.withOpacity(0.64),
                ),
              ),
            ),
            //* account type icons
            if (createACState.acType != null) ...[
              SizedBox(
                height: getProportionateScreenHeight(110),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.5,
                  ),
                  children: [
                    //! if mobile banking
                    if (createACState.acType == AccountType.mobileBanking)
                      for (final i
                          in ExpenseAssets.allMobileBankingIcons.getRange(0, 7))
                        InkWell(
                          onTap: () {
                            context.read<OnboardingAccountSetupBloc>().add(
                                  AddAccountLogoEvent(i),
                                );
                          },
                          child: Tooltip(
                            message: mobileBankingReverse[i],
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: getProportionateScreenHeight(40),
                              width: getProportionateScreenWidth(70),
                              decoration: BoxDecoration(
                                // color: ExpenseTrackerColors.inactiveSelectedBox,
                                color: i == createACState.acLogo
                                    ? ExpenseTrackerColors.violet20
                                    : ExpenseTrackerColors.inactiveSelectedBox,
                                borderRadius: BorderRadius.circular(10),
                                border: i == createACState.acLogo
                                    ? Border.all(
                                        color: ExpenseTrackerColors.violet,
                                      )
                                    : Border.all(
                                        width: 0,
                                        color: Colors.transparent,
                                      ),
                              ),
                              child: i.endsWith('.svg')
                                  ? SvgPicture.asset(
                                      i,
                                    )
                                  : Image.asset(
                                      i,
                                    ),
                            ),
                          ),
                        ),
                    //! all bnaking
                    if (createACState.acType == AccountType.bank ||
                        createACState.acType == AccountType.creditCard)
                      for (final i in realBanking.getRange(0, 7))
                        InkWell(
                          onTap: () {
                            context.read<OnboardingAccountSetupBloc>().add(
                                  AddAccountLogoEvent(i),
                                );
                          },
                          child: Tooltip(
                            message: i,
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: getProportionateScreenHeight(40),
                              width: getProportionateScreenWidth(70),
                              decoration: BoxDecoration(
                                // color: ExpenseTrackerColors.inactiveSelectedBox,
                                color: i == createACState.acLogo
                                    ? ExpenseTrackerColors.violet20
                                    : ExpenseTrackerColors.inactiveSelectedBox,
                                borderRadius: BorderRadius.circular(10),
                                border: i == createACState.acLogo
                                    ? Border.all(
                                        color: ExpenseTrackerColors.violet,
                                      )
                                    : Border.all(
                                        width: 0,
                                        color: Colors.transparent,
                                      ),
                              ),
                              child: Image.asset(
                                '${ExpenseAssets.bankingAsset}$i.png',
                              ),
                            ),
                          ),
                        ),

                    /// * see all
                    InkWell(
                      onTap: () async {
                        showBottomSheet<OnboardingAccountSetupBloc>(
                          backgroundColor: Colors.indigo,
                          context: context,
                          builder: (context) => SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 20,
                                  ),
                                  child: Text(
                                    createACState.acType != null
                                        ? AccountTypeHelper.toString2(
                                            createACState.acType!,
                                          )
                                        : '',
                                    textAlign: TextAlign.left,
                                    style: ExpenseTrackerTextStyle.regular1
                                        .copyWith(
                                      fontWeight: FontWeight.w600,
                                      // color: ExpenseTrackerColors.light80.withOpacity(0.64),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Wrap(
                                      children: [
                                        if (createACState.acType ==
                                                AccountType.bank ||
                                            createACState.acType ==
                                                AccountType.creditCard)
                                          for (final i in realBanking)
                                            BlocConsumer<
                                                OnboardingAccountSetupBloc,
                                                OnboardingAccountSetupState>(
                                              listener: (context, state) {},
                                              builder: (context, state) {
                                                return InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<
                                                            OnboardingAccountSetupBloc>()
                                                        .add(
                                                          AddAccountLogoEvent(
                                                              i),
                                                        );
                                                  },
                                                  child: Tooltip(
                                                    message: i,
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              5),
                                                      height:
                                                          getProportionateScreenHeight(
                                                        40,
                                                      ),
                                                      width:
                                                          getProportionateScreenWidth(
                                                        70,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        // color: ExpenseTrackerColors.inactiveSelectedBox,
                                                        color: i ==
                                                                state
                                                                    .createAccount
                                                                    .acLogo
                                                            ? ExpenseTrackerColors
                                                                .violet20
                                                            : ExpenseTrackerColors
                                                                .inactiveSelectedBox,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          10,
                                                        ),
                                                        border: i ==
                                                                state
                                                                    .createAccount
                                                                    .acLogo
                                                            ? Border.all(
                                                                color:
                                                                    ExpenseTrackerColors
                                                                        .violet,
                                                              )
                                                            : Border.all(
                                                                width: 0,
                                                                color: Colors
                                                                    .transparent,
                                                              ),
                                                      ),
                                                      child: Image.asset(
                                                        '${ExpenseAssets.bankingAsset}$i.png',
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                        for (final i in ExpenseAssets
                                            .allMobileBankingIcons)
                                          BlocConsumer<
                                              OnboardingAccountSetupBloc,
                                              OnboardingAccountSetupState>(
                                            listener: (context, state) {},
                                            builder: (context, state) {
                                              return InkWell(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          OnboardingAccountSetupBloc>()
                                                      .add(
                                                        AddAccountLogoEvent(i),
                                                      );
                                                },
                                                child: Tooltip(
                                                  message:
                                                      mobileBankingReverse[i],
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.all(5),
                                                    height:
                                                        getProportionateScreenHeight(
                                                      40,
                                                    ),
                                                    width:
                                                        getProportionateScreenWidth(
                                                      70,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      // color: ExpenseTrackerColors.inactiveSelectedBox,
                                                      color: i ==
                                                              state
                                                                  .createAccount
                                                                  .acLogo
                                                          ? ExpenseTrackerColors
                                                              .violet20
                                                          : ExpenseTrackerColors
                                                              .inactiveSelectedBox,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10,
                                                      ),
                                                      border: i ==
                                                              state
                                                                  .createAccount
                                                                  .acLogo
                                                          ? Border.all(
                                                              color:
                                                                  ExpenseTrackerColors
                                                                      .violet,
                                                            )
                                                          : Border.all(
                                                              width: 0,
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                    ),
                                                    child: i.endsWith('.svg')
                                                        ? SvgPicture.asset(
                                                            i,
                                                          )
                                                        : Image.asset(
                                                            i,
                                                          ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        height: getProportionateScreenHeight(40),
                        width: getProportionateScreenWidth(70),
                        decoration: BoxDecoration(
                          color: const Color(0xffeee5ff),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'See All',
                            style: ExpenseTrackerTextStyle.tiny.copyWith(
                              color: ExpenseTrackerColors.violet,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
          Hero(
            tag: 'onboarding_account_setup_intro_button',
            child: PrimaryButton(
              onPress: () {
                debugPrint('Balance: ${createACState.acBalance}');
                debugPrint('Name: ${createACState.acName}');
                debugPrint('Type: ${createACState.acType}');
                debugPrint('Logo: ${createACState.acLogo}');
                if (createACState.acBalance.isNaN) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid balance'),
                    ),
                  );
                  return;
                } else if (createACState.acName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid account name'),
                    ),
                  );
                  return;
                } else if (createACState.acType == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select an account type'),
                    ),
                  );
                  return;
                } else {
                  // show a success page
                  Navigator.push(context, SuccessfullyAccountCreated.route());
                }
              },
              text: 'Continue',
            ),
          ),
        ],
      ),
    );
  }
}

class AccountTypeDropdown extends StatelessWidget {
  const AccountTypeDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
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
        if (d is String) {
          context.read<OnboardingAccountSetupBloc>().add(
                AddAccountTypeEvent(AccountTypeHelper.fromString(d)),
              );
          // _onAccountTypeChanged(d);
        }
      },
    );
  }
}

class AccountNameTextField extends StatelessWidget {
  const AccountNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.name,
      onChanged: (d) {
        context.read<OnboardingAccountSetupBloc>().add(
              AddAccountNameEvent(d),
            );
      },
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
        hintText: 'Account name',
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
    );
  }
}
