// account types
const accountTypesDB = [
  'Bank',
  'Credit Card',
  'Mobile Banking',
  'Wallet',
  'Cash',
  'Other',
];

// Enum: AccountType
enum AccountType {
  bank,
  creditCard,
  mobileBanking,
  wallet,
  cash,
  other,
}

class AccountTypeHelper {
  static AccountType fromString(String accountType) {
    switch (accountType) {
      case 'Bank':
        return AccountType.bank;
      case 'Credit Card':
        return AccountType.creditCard;
      case 'Mobile Banking':
        return AccountType.mobileBanking;
      case 'Wallet':
        return AccountType.wallet;
      case 'Cash':
        return AccountType.cash;
      case 'Other':
        return AccountType.other;
      default:
        return AccountType.other;
    }
  }
}
