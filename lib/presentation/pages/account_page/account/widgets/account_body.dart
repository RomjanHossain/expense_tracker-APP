import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/local_banking.dart';
import 'package:expense_tracker/data/models/isar_entity/create_account/create_account_isar.dart';
import 'package:expense_tracker/gen/assets.gen.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/pages/account_page/account/cubit/cubit.dart';
import 'package:expense_tracker/presentation/pages/account_page/account_detail/view/account_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// {@template account_body}
/// Body of the AccountPage.
///
/// Add what it does
/// {@endtemplate}
class AccountBody extends StatelessWidget {
  /// {@macro account_body}
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit,
        (double accountBalance, List<AccountEntity> accounts)>(
      builder: (context, state) {
        final l10n = context.l10n;
        return Column(
          children: [
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: const BoxDecoration(),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Account Balance',
                    style: ExpenseTrackerTextStyle.body3.copyWith(
                      // color: ExpenseTrackerColors.light20,
                      color: isDarkMode(context)
                          ? ExpenseTrackerColors.light20
                          : ExpenseTrackerColors.dark25,
                    ),
                  ),
                  Text(
                    '${l10n.currencySign} ${state.$1}',
                    style: ExpenseTrackerTextStyle.title1.copyWith(
                      // color: ExpenseTrackerColors.dark75,
                      color: isDarkMode(context)
                          ? ExpenseTrackerColors.light
                          : ExpenseTrackerColors.dark75,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.$2.length,
                itemBuilder: (context, index) {
                  final account = state.$2.elementAt(index);
                  debugPrint('Account Img: ${account.accountTypeImg}');
                  debugPrint('Account Type: ${account.accountType}');
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        AccountDetailPage.route(),
                      );
                    },
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 5.h,
                    ),
                    leading: Container(
                      width: 50.w,
                      height: 50.h,
                      padding: const EdgeInsets.all(5),
                      margin: EdgeInsets.only(
                        right: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: ExpenseTrackerColors.violet20,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: (account.accountType == AccountType.bank ||
                              account.accountType == AccountType.creditCard)
                          ? Image.asset(
                              realBanking[account.accountTypeImg]!,
                              fit: BoxFit.fitWidth,
                            )
                          : (account.accountType == AccountType.mobileBanking)
                              ? account.accountTypeImg!.endsWith('.svg')
                                  ? SvgPicture.asset(
                                      account.accountTypeImg!,
                                    )
                                  : Image.asset(
                                      account.accountTypeImg!,
                                    )
                              : account.accountType == AccountType.wallet
                                  ? Icon(
                                      Icons.wallet,
                                      color: isDarkMode(context)
                                          ? ExpenseTrackerColors.violet
                                          : ExpenseTrackerColors.violet20,
                                    )
                                  : AccountType.cash == account.accountType
                                      ? SvgPicture.asset(
                                          Assets.icons.other.cash.path,
                                          fit: BoxFit.fitWidth,
                                        )
                                      : SvgPicture.asset(
                                          Assets.icons.other.other.path,
                                        ),
                    ),
                    title: Text(
                      account.accountName ?? '',
                      style: ExpenseTrackerTextStyle.title3.copyWith(
                        // color: ExpenseTrackerColors.dark,
                        color: isDarkMode(context)
                            ? ExpenseTrackerColors.light
                            : ExpenseTrackerColors.dark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      '${l10n.currencySign} ${account.accountBalance}',
                      style: ExpenseTrackerTextStyle.title3.copyWith(
                        // color: ExpenseTrackerColors.dark50,
                        color: isDarkMode(context)
                            ? ExpenseTrackerColors.light40
                            : ExpenseTrackerColors.dark50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                // children: [
                //   for (final account in state.$2)
                // ],
              ),
            ),
          ],
        );
      },
    );
  }
}
