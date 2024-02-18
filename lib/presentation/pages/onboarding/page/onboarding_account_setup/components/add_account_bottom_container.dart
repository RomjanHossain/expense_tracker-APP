import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/account_type_helper.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/local_banking.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/mobile_banking_db.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/app_home_page.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/onboarding_account_setup_bloc.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/components/account_name_textfield.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/components/account_type_dropdown.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
      height: createACState.acType == null
          ? 300.h
          : forbidenList.contains(createACState.acType)
              ? 300.h
              : 450.h,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: ExpenseTrackerColors.violet,
        color: isDarkMode(context)
            ? ExpenseTrackerColors.dark
            : ExpenseTrackerColors.light,
        borderRadius: const BorderRadius.only(
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
                style: ExpenseTrackerTextStyle.body1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDarkMode(context)
                      ? ExpenseTrackerColors.light80.withOpacity(0.64)
                      : ExpenseTrackerColors.light80.withOpacity(0.64),
                ),
              ),
            ),
            //* account type icons
            if (createACState.acType != null) ...[
              SizedBox(
                height: 100.h,
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
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
                              height: 40.h,
                              width: 60.w,
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
                              height: 40.h,
                              width: 70.w,
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
                        showBottomSheet(
                          backgroundColor: isDarkMode(context)
                              ? ExpenseTrackerColors.dark
                              : ExpenseTrackerColors.light,
                          elevation: 1,
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
                                    style:
                                        ExpenseTrackerTextStyle.body1.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: isDarkMode(context)
                                          ? ExpenseTrackerColors.light80
                                          : ExpenseTrackerColors.dark
                                              .withOpacity(0.64),
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
                                                            i,
                                                          ),
                                                        );
                                                  },
                                                  child: Tooltip(
                                                    message: i,
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                        5,
                                                      ),
                                                      height: 40.h,
                                                      width: 70.w,
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
                                                    height: 40.h,
                                                    width: 70.w,
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
                        height: 40.h,
                        width: 70.w,
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
            child: ElevatedButton(
              onPressed: () {
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
                  // Navigator.push(context, SuccessfullyAccountCreated.route());
                  context.pushNamed(
                    'successfully-account-created',
                  );
                }
              },
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
