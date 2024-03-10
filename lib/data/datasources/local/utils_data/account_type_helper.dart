import 'package:expense_tracker/utils/constrants/enums_.dart';

class AccountTypeHelper {
  static AccountType fromString(String accountType) {
    switch (accountType) {
      case 'Bank' || 'ব্যাংক' || 'Banco':
        return AccountType.bank;
      case 'Credit Card' || 'ক্রেডিট কার্ড' || 'Tarjeta de crédito':
        return AccountType.creditCard;
      case 'Mobile Banking' || 'মোবাইল ব্যাংকিং' || 'Banca móvil':
        return AccountType.mobileBanking;
      case 'Wallet' || 'Billetera' || 'ওয়ালেট':
        return AccountType.wallet;
      case 'Cash' || 'ক্যাশ' || 'Efectivo':
        return AccountType.cash;
      case 'Other' || 'অন্যান্য' || 'Otro':
        return AccountType.other;
      default:
        return AccountType.other;
    }
  }

  static String toString2(AccountType accountType) {
    switch (accountType) {
      case AccountType.bank:
        return 'Bank';
      case AccountType.creditCard:
        return 'Credit Card';
      case AccountType.mobileBanking:
        return 'Mobile Banking';
      case AccountType.wallet:
        return 'Wallet';
      case AccountType.cash:
        return 'Cash';
      case AccountType.other:
        return 'Other';
    }
  }
}
