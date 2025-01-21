// account types
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:flutter/material.dart';

const accountTypesDB = [
  'Bank',
  'Credit Card',
  'Mobile Banking',
  'Wallet',
  'Cash',
  'Other',
];

List<String> accountTypesDBwithTrans(BuildContext context) {
  final l10n = context.l10n;
  return [
    l10n.accountTypeBank,
    l10n.accountTypeCreditCard,
    l10n.accountTypeMobileBaning,
    l10n.accountTypeWallet,
    l10n.accountTypeCash,
    l10n.accountTypeOther,
  ];
}
