// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProfileTable extends Profile with TableInfo<$ProfileTable, ProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfileTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pinMeta = const VerificationMeta('pin');
  @override
  late final GeneratedColumn<String> pin = GeneratedColumn<String>(
      'pin', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<Uint8List> imageUrl = GeneratedColumn<Uint8List>(
      'image_url', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, pin, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profile';
  @override
  VerificationContext validateIntegrity(Insertable<ProfileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('pin')) {
      context.handle(
          _pinMeta, pin.isAcceptableOrUnknown(data['pin']!, _pinMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      pin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image_url']),
    );
  }

  @override
  $ProfileTable createAlias(String alias) {
    return $ProfileTable(attachedDatabase, alias);
  }
}

class ProfileData extends DataClass implements Insertable<ProfileData> {
  final int id;
  final String name;
  final String? pin;
  final Uint8List? imageUrl;
  const ProfileData(
      {required this.id, required this.name, this.pin, this.imageUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || pin != null) {
      map['pin'] = Variable<String>(pin);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<Uint8List>(imageUrl);
    }
    return map;
  }

  ProfileCompanion toCompanion(bool nullToAbsent) {
    return ProfileCompanion(
      id: Value(id),
      name: Value(name),
      pin: pin == null && nullToAbsent ? const Value.absent() : Value(pin),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
    );
  }

  factory ProfileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      pin: serializer.fromJson<String?>(json['pin']),
      imageUrl: serializer.fromJson<Uint8List?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'pin': serializer.toJson<String?>(pin),
      'imageUrl': serializer.toJson<Uint8List?>(imageUrl),
    };
  }

  ProfileData copyWith(
          {int? id,
          String? name,
          Value<String?> pin = const Value.absent(),
          Value<Uint8List?> imageUrl = const Value.absent()}) =>
      ProfileData(
        id: id ?? this.id,
        name: name ?? this.name,
        pin: pin.present ? pin.value : this.pin,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
      );
  ProfileData copyWithCompanion(ProfileCompanion data) {
    return ProfileData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      pin: data.pin.present ? data.pin.value : this.pin,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pin: $pin, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, pin, $driftBlobEquality.hash(imageUrl));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileData &&
          other.id == this.id &&
          other.name == this.name &&
          other.pin == this.pin &&
          $driftBlobEquality.equals(other.imageUrl, this.imageUrl));
}

class ProfileCompanion extends UpdateCompanion<ProfileData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> pin;
  final Value<Uint8List?> imageUrl;
  const ProfileCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.pin = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  ProfileCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.pin = const Value.absent(),
    this.imageUrl = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ProfileData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? pin,
    Expression<Uint8List>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (pin != null) 'pin': pin,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  ProfileCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? pin,
      Value<Uint8List?>? imageUrl}) {
    return ProfileCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      pin: pin ?? this.pin,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (pin.present) {
      map['pin'] = Variable<String>(pin.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<Uint8List>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pin: $pin, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _accountNameMeta =
      const VerificationMeta('accountName');
  @override
  late final GeneratedColumn<String> accountName = GeneratedColumn<String>(
      'account_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountBalanceMeta =
      const VerificationMeta('accountBalance');
  @override
  late final GeneratedColumn<double> accountBalance = GeneratedColumn<double>(
      'account_balance', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _accountTypeMeta =
      const VerificationMeta('accountType');
  @override
  late final GeneratedColumnWithTypeConverter<AccountType, int> accountType =
      GeneratedColumn<int>('account_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<AccountType>($AccountsTable.$converteraccountType);
  static const VerificationMeta _accountTypeImgMeta =
      const VerificationMeta('accountTypeImg');
  @override
  late final GeneratedColumn<String> accountTypeImg = GeneratedColumn<String>(
      'account_type_img', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, accountName, accountBalance, accountType, accountTypeImg];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_name')) {
      context.handle(
          _accountNameMeta,
          accountName.isAcceptableOrUnknown(
              data['account_name']!, _accountNameMeta));
    } else if (isInserting) {
      context.missing(_accountNameMeta);
    }
    if (data.containsKey('account_balance')) {
      context.handle(
          _accountBalanceMeta,
          accountBalance.isAcceptableOrUnknown(
              data['account_balance']!, _accountBalanceMeta));
    } else if (isInserting) {
      context.missing(_accountBalanceMeta);
    }
    context.handle(_accountTypeMeta, const VerificationResult.success());
    if (data.containsKey('account_type_img')) {
      context.handle(
          _accountTypeImgMeta,
          accountTypeImg.isAcceptableOrUnknown(
              data['account_type_img']!, _accountTypeImgMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      accountName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_name'])!,
      accountBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}account_balance'])!,
      accountType: $AccountsTable.$converteraccountType.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_type'])!),
      accountTypeImg: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}account_type_img']),
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountType, int, int> $converteraccountType =
      const EnumIndexConverter<AccountType>(AccountType.values);
}

class Account extends DataClass implements Insertable<Account> {
  final int id;
  final String accountName;
  final double accountBalance;
  final AccountType accountType;
  final String? accountTypeImg;
  const Account(
      {required this.id,
      required this.accountName,
      required this.accountBalance,
      required this.accountType,
      this.accountTypeImg});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_name'] = Variable<String>(accountName);
    map['account_balance'] = Variable<double>(accountBalance);
    {
      map['account_type'] = Variable<int>(
          $AccountsTable.$converteraccountType.toSql(accountType));
    }
    if (!nullToAbsent || accountTypeImg != null) {
      map['account_type_img'] = Variable<String>(accountTypeImg);
    }
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      accountName: Value(accountName),
      accountBalance: Value(accountBalance),
      accountType: Value(accountType),
      accountTypeImg: accountTypeImg == null && nullToAbsent
          ? const Value.absent()
          : Value(accountTypeImg),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<int>(json['id']),
      accountName: serializer.fromJson<String>(json['accountName']),
      accountBalance: serializer.fromJson<double>(json['accountBalance']),
      accountType: $AccountsTable.$converteraccountType
          .fromJson(serializer.fromJson<int>(json['accountType'])),
      accountTypeImg: serializer.fromJson<String?>(json['accountTypeImg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountName': serializer.toJson<String>(accountName),
      'accountBalance': serializer.toJson<double>(accountBalance),
      'accountType': serializer.toJson<int>(
          $AccountsTable.$converteraccountType.toJson(accountType)),
      'accountTypeImg': serializer.toJson<String?>(accountTypeImg),
    };
  }

  Account copyWith(
          {int? id,
          String? accountName,
          double? accountBalance,
          AccountType? accountType,
          Value<String?> accountTypeImg = const Value.absent()}) =>
      Account(
        id: id ?? this.id,
        accountName: accountName ?? this.accountName,
        accountBalance: accountBalance ?? this.accountBalance,
        accountType: accountType ?? this.accountType,
        accountTypeImg:
            accountTypeImg.present ? accountTypeImg.value : this.accountTypeImg,
      );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      id: data.id.present ? data.id.value : this.id,
      accountName:
          data.accountName.present ? data.accountName.value : this.accountName,
      accountBalance: data.accountBalance.present
          ? data.accountBalance.value
          : this.accountBalance,
      accountType:
          data.accountType.present ? data.accountType.value : this.accountType,
      accountTypeImg: data.accountTypeImg.present
          ? data.accountTypeImg.value
          : this.accountTypeImg,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('accountName: $accountName, ')
          ..write('accountBalance: $accountBalance, ')
          ..write('accountType: $accountType, ')
          ..write('accountTypeImg: $accountTypeImg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, accountName, accountBalance, accountType, accountTypeImg);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.accountName == this.accountName &&
          other.accountBalance == this.accountBalance &&
          other.accountType == this.accountType &&
          other.accountTypeImg == this.accountTypeImg);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> id;
  final Value<String> accountName;
  final Value<double> accountBalance;
  final Value<AccountType> accountType;
  final Value<String?> accountTypeImg;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.accountName = const Value.absent(),
    this.accountBalance = const Value.absent(),
    this.accountType = const Value.absent(),
    this.accountTypeImg = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String accountName,
    required double accountBalance,
    required AccountType accountType,
    this.accountTypeImg = const Value.absent(),
  })  : accountName = Value(accountName),
        accountBalance = Value(accountBalance),
        accountType = Value(accountType);
  static Insertable<Account> custom({
    Expression<int>? id,
    Expression<String>? accountName,
    Expression<double>? accountBalance,
    Expression<int>? accountType,
    Expression<String>? accountTypeImg,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountName != null) 'account_name': accountName,
      if (accountBalance != null) 'account_balance': accountBalance,
      if (accountType != null) 'account_type': accountType,
      if (accountTypeImg != null) 'account_type_img': accountTypeImg,
    });
  }

  AccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? accountName,
      Value<double>? accountBalance,
      Value<AccountType>? accountType,
      Value<String?>? accountTypeImg}) {
    return AccountsCompanion(
      id: id ?? this.id,
      accountName: accountName ?? this.accountName,
      accountBalance: accountBalance ?? this.accountBalance,
      accountType: accountType ?? this.accountType,
      accountTypeImg: accountTypeImg ?? this.accountTypeImg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountName.present) {
      map['account_name'] = Variable<String>(accountName.value);
    }
    if (accountBalance.present) {
      map['account_balance'] = Variable<double>(accountBalance.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<int>(
          $AccountsTable.$converteraccountType.toSql(accountType.value));
    }
    if (accountTypeImg.present) {
      map['account_type_img'] = Variable<String>(accountTypeImg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('accountName: $accountName, ')
          ..write('accountBalance: $accountBalance, ')
          ..write('accountType: $accountType, ')
          ..write('accountTypeImg: $accountTypeImg')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _walletIdMeta =
      const VerificationMeta('walletId');
  @override
  late final GeneratedColumn<int> walletId = GeneratedColumn<int>(
      'wallet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES accounts (id)'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attachmentMeta =
      const VerificationMeta('attachment');
  @override
  late final GeneratedColumn<String> attachment = GeneratedColumn<String>(
      'attachment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isRepeatMeta =
      const VerificationMeta('isRepeat');
  @override
  late final GeneratedColumn<bool> isRepeat = GeneratedColumn<bool>(
      'is_repeat', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_repeat" IN (0, 1))'));
  static const VerificationMeta _repeatTypeMeta =
      const VerificationMeta('repeatType');
  @override
  late final GeneratedColumn<String> repeatType = GeneratedColumn<String>(
      'repeat_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amount,
        description,
        walletId,
        categoryId,
        attachment,
        isRepeat,
        repeatType,
        startDate,
        endDate,
        createdDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(Insertable<Expense> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('wallet_id')) {
      context.handle(_walletIdMeta,
          walletId.isAcceptableOrUnknown(data['wallet_id']!, _walletIdMeta));
    } else if (isInserting) {
      context.missing(_walletIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('attachment')) {
      context.handle(
          _attachmentMeta,
          attachment.isAcceptableOrUnknown(
              data['attachment']!, _attachmentMeta));
    }
    if (data.containsKey('is_repeat')) {
      context.handle(_isRepeatMeta,
          isRepeat.isAcceptableOrUnknown(data['is_repeat']!, _isRepeatMeta));
    }
    if (data.containsKey('repeat_type')) {
      context.handle(
          _repeatTypeMeta,
          repeatType.isAcceptableOrUnknown(
              data['repeat_type']!, _repeatTypeMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      walletId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wallet_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      attachment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attachment']),
      isRepeat: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_repeat']),
      repeatType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}repeat_type']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final int id;
  final double amount;
  final String? description;
  final int walletId;
  final String categoryId;
  final String? attachment;
  final bool? isRepeat;
  final String? repeatType;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? createdDate;
  const Expense(
      {required this.id,
      required this.amount,
      this.description,
      required this.walletId,
      required this.categoryId,
      this.attachment,
      this.isRepeat,
      this.repeatType,
      this.startDate,
      this.endDate,
      this.createdDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['wallet_id'] = Variable<int>(walletId);
    map['category_id'] = Variable<String>(categoryId);
    if (!nullToAbsent || attachment != null) {
      map['attachment'] = Variable<String>(attachment);
    }
    if (!nullToAbsent || isRepeat != null) {
      map['is_repeat'] = Variable<bool>(isRepeat);
    }
    if (!nullToAbsent || repeatType != null) {
      map['repeat_type'] = Variable<String>(repeatType);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      amount: Value(amount),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      walletId: Value(walletId),
      categoryId: Value(categoryId),
      attachment: attachment == null && nullToAbsent
          ? const Value.absent()
          : Value(attachment),
      isRepeat: isRepeat == null && nullToAbsent
          ? const Value.absent()
          : Value(isRepeat),
      repeatType: repeatType == null && nullToAbsent
          ? const Value.absent()
          : Value(repeatType),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
    );
  }

  factory Expense.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      description: serializer.fromJson<String?>(json['description']),
      walletId: serializer.fromJson<int>(json['walletId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      attachment: serializer.fromJson<String?>(json['attachment']),
      isRepeat: serializer.fromJson<bool?>(json['isRepeat']),
      repeatType: serializer.fromJson<String?>(json['repeatType']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'description': serializer.toJson<String?>(description),
      'walletId': serializer.toJson<int>(walletId),
      'categoryId': serializer.toJson<String>(categoryId),
      'attachment': serializer.toJson<String?>(attachment),
      'isRepeat': serializer.toJson<bool?>(isRepeat),
      'repeatType': serializer.toJson<String?>(repeatType),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
    };
  }

  Expense copyWith(
          {int? id,
          double? amount,
          Value<String?> description = const Value.absent(),
          int? walletId,
          String? categoryId,
          Value<String?> attachment = const Value.absent(),
          Value<bool?> isRepeat = const Value.absent(),
          Value<String?> repeatType = const Value.absent(),
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          Value<DateTime?> createdDate = const Value.absent()}) =>
      Expense(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        description: description.present ? description.value : this.description,
        walletId: walletId ?? this.walletId,
        categoryId: categoryId ?? this.categoryId,
        attachment: attachment.present ? attachment.value : this.attachment,
        isRepeat: isRepeat.present ? isRepeat.value : this.isRepeat,
        repeatType: repeatType.present ? repeatType.value : this.repeatType,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
      );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      description:
          data.description.present ? data.description.value : this.description,
      walletId: data.walletId.present ? data.walletId.value : this.walletId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      attachment:
          data.attachment.present ? data.attachment.value : this.attachment,
      isRepeat: data.isRepeat.present ? data.isRepeat.value : this.isRepeat,
      repeatType:
          data.repeatType.present ? data.repeatType.value : this.repeatType,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('walletId: $walletId, ')
          ..write('categoryId: $categoryId, ')
          ..write('attachment: $attachment, ')
          ..write('isRepeat: $isRepeat, ')
          ..write('repeatType: $repeatType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, description, walletId, categoryId,
      attachment, isRepeat, repeatType, startDate, endDate, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.description == this.description &&
          other.walletId == this.walletId &&
          other.categoryId == this.categoryId &&
          other.attachment == this.attachment &&
          other.isRepeat == this.isRepeat &&
          other.repeatType == this.repeatType &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.createdDate == this.createdDate);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<int> id;
  final Value<double> amount;
  final Value<String?> description;
  final Value<int> walletId;
  final Value<String> categoryId;
  final Value<String?> attachment;
  final Value<bool?> isRepeat;
  final Value<String?> repeatType;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<DateTime?> createdDate;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.description = const Value.absent(),
    this.walletId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.attachment = const Value.absent(),
    this.isRepeat = const Value.absent(),
    this.repeatType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    this.description = const Value.absent(),
    required int walletId,
    required String categoryId,
    this.attachment = const Value.absent(),
    this.isRepeat = const Value.absent(),
    this.repeatType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.createdDate = const Value.absent(),
  })  : amount = Value(amount),
        walletId = Value(walletId),
        categoryId = Value(categoryId);
  static Insertable<Expense> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<String>? description,
    Expression<int>? walletId,
    Expression<String>? categoryId,
    Expression<String>? attachment,
    Expression<bool>? isRepeat,
    Expression<String>? repeatType,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (description != null) 'description': description,
      if (walletId != null) 'wallet_id': walletId,
      if (categoryId != null) 'category_id': categoryId,
      if (attachment != null) 'attachment': attachment,
      if (isRepeat != null) 'is_repeat': isRepeat,
      if (repeatType != null) 'repeat_type': repeatType,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  ExpensesCompanion copyWith(
      {Value<int>? id,
      Value<double>? amount,
      Value<String?>? description,
      Value<int>? walletId,
      Value<String>? categoryId,
      Value<String?>? attachment,
      Value<bool?>? isRepeat,
      Value<String?>? repeatType,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<DateTime?>? createdDate}) {
    return ExpensesCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      walletId: walletId ?? this.walletId,
      categoryId: categoryId ?? this.categoryId,
      attachment: attachment ?? this.attachment,
      isRepeat: isRepeat ?? this.isRepeat,
      repeatType: repeatType ?? this.repeatType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (walletId.present) {
      map['wallet_id'] = Variable<int>(walletId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (attachment.present) {
      map['attachment'] = Variable<String>(attachment.value);
    }
    if (isRepeat.present) {
      map['is_repeat'] = Variable<bool>(isRepeat.value);
    }
    if (repeatType.present) {
      map['repeat_type'] = Variable<String>(repeatType.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('walletId: $walletId, ')
          ..write('categoryId: $categoryId, ')
          ..write('attachment: $attachment, ')
          ..write('isRepeat: $isRepeat, ')
          ..write('repeatType: $repeatType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

class $IncomesTable extends Incomes with TableInfo<$IncomesTable, Income> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _walletIdMeta =
      const VerificationMeta('walletId');
  @override
  late final GeneratedColumn<int> walletId = GeneratedColumn<int>(
      'wallet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES accounts (id)'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attachmentMeta =
      const VerificationMeta('attachment');
  @override
  late final GeneratedColumn<String> attachment = GeneratedColumn<String>(
      'attachment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isRepeatMeta =
      const VerificationMeta('isRepeat');
  @override
  late final GeneratedColumn<bool> isRepeat = GeneratedColumn<bool>(
      'is_repeat', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_repeat" IN (0, 1))'));
  static const VerificationMeta _repeatTypeMeta =
      const VerificationMeta('repeatType');
  @override
  late final GeneratedColumn<String> repeatType = GeneratedColumn<String>(
      'repeat_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amount,
        description,
        walletId,
        categoryId,
        attachment,
        isRepeat,
        repeatType,
        startDate,
        endDate,
        createdDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'incomes';
  @override
  VerificationContext validateIntegrity(Insertable<Income> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('wallet_id')) {
      context.handle(_walletIdMeta,
          walletId.isAcceptableOrUnknown(data['wallet_id']!, _walletIdMeta));
    } else if (isInserting) {
      context.missing(_walletIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('attachment')) {
      context.handle(
          _attachmentMeta,
          attachment.isAcceptableOrUnknown(
              data['attachment']!, _attachmentMeta));
    }
    if (data.containsKey('is_repeat')) {
      context.handle(_isRepeatMeta,
          isRepeat.isAcceptableOrUnknown(data['is_repeat']!, _isRepeatMeta));
    }
    if (data.containsKey('repeat_type')) {
      context.handle(
          _repeatTypeMeta,
          repeatType.isAcceptableOrUnknown(
              data['repeat_type']!, _repeatTypeMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Income map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Income(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      walletId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wallet_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      attachment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attachment']),
      isRepeat: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_repeat']),
      repeatType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}repeat_type']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
    );
  }

  @override
  $IncomesTable createAlias(String alias) {
    return $IncomesTable(attachedDatabase, alias);
  }
}

class Income extends DataClass implements Insertable<Income> {
  final int id;
  final double amount;
  final String description;
  final int walletId;
  final String categoryId;
  final String? attachment;
  final bool? isRepeat;
  final String? repeatType;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? createdDate;
  const Income(
      {required this.id,
      required this.amount,
      required this.description,
      required this.walletId,
      required this.categoryId,
      this.attachment,
      this.isRepeat,
      this.repeatType,
      this.startDate,
      this.endDate,
      this.createdDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<double>(amount);
    map['description'] = Variable<String>(description);
    map['wallet_id'] = Variable<int>(walletId);
    map['category_id'] = Variable<String>(categoryId);
    if (!nullToAbsent || attachment != null) {
      map['attachment'] = Variable<String>(attachment);
    }
    if (!nullToAbsent || isRepeat != null) {
      map['is_repeat'] = Variable<bool>(isRepeat);
    }
    if (!nullToAbsent || repeatType != null) {
      map['repeat_type'] = Variable<String>(repeatType);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    return map;
  }

  IncomesCompanion toCompanion(bool nullToAbsent) {
    return IncomesCompanion(
      id: Value(id),
      amount: Value(amount),
      description: Value(description),
      walletId: Value(walletId),
      categoryId: Value(categoryId),
      attachment: attachment == null && nullToAbsent
          ? const Value.absent()
          : Value(attachment),
      isRepeat: isRepeat == null && nullToAbsent
          ? const Value.absent()
          : Value(isRepeat),
      repeatType: repeatType == null && nullToAbsent
          ? const Value.absent()
          : Value(repeatType),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
    );
  }

  factory Income.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Income(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      description: serializer.fromJson<String>(json['description']),
      walletId: serializer.fromJson<int>(json['walletId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      attachment: serializer.fromJson<String?>(json['attachment']),
      isRepeat: serializer.fromJson<bool?>(json['isRepeat']),
      repeatType: serializer.fromJson<String?>(json['repeatType']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'description': serializer.toJson<String>(description),
      'walletId': serializer.toJson<int>(walletId),
      'categoryId': serializer.toJson<String>(categoryId),
      'attachment': serializer.toJson<String?>(attachment),
      'isRepeat': serializer.toJson<bool?>(isRepeat),
      'repeatType': serializer.toJson<String?>(repeatType),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
    };
  }

  Income copyWith(
          {int? id,
          double? amount,
          String? description,
          int? walletId,
          String? categoryId,
          Value<String?> attachment = const Value.absent(),
          Value<bool?> isRepeat = const Value.absent(),
          Value<String?> repeatType = const Value.absent(),
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          Value<DateTime?> createdDate = const Value.absent()}) =>
      Income(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        description: description ?? this.description,
        walletId: walletId ?? this.walletId,
        categoryId: categoryId ?? this.categoryId,
        attachment: attachment.present ? attachment.value : this.attachment,
        isRepeat: isRepeat.present ? isRepeat.value : this.isRepeat,
        repeatType: repeatType.present ? repeatType.value : this.repeatType,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
      );
  Income copyWithCompanion(IncomesCompanion data) {
    return Income(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      description:
          data.description.present ? data.description.value : this.description,
      walletId: data.walletId.present ? data.walletId.value : this.walletId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      attachment:
          data.attachment.present ? data.attachment.value : this.attachment,
      isRepeat: data.isRepeat.present ? data.isRepeat.value : this.isRepeat,
      repeatType:
          data.repeatType.present ? data.repeatType.value : this.repeatType,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Income(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('walletId: $walletId, ')
          ..write('categoryId: $categoryId, ')
          ..write('attachment: $attachment, ')
          ..write('isRepeat: $isRepeat, ')
          ..write('repeatType: $repeatType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, description, walletId, categoryId,
      attachment, isRepeat, repeatType, startDate, endDate, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Income &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.description == this.description &&
          other.walletId == this.walletId &&
          other.categoryId == this.categoryId &&
          other.attachment == this.attachment &&
          other.isRepeat == this.isRepeat &&
          other.repeatType == this.repeatType &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.createdDate == this.createdDate);
}

class IncomesCompanion extends UpdateCompanion<Income> {
  final Value<int> id;
  final Value<double> amount;
  final Value<String> description;
  final Value<int> walletId;
  final Value<String> categoryId;
  final Value<String?> attachment;
  final Value<bool?> isRepeat;
  final Value<String?> repeatType;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<DateTime?> createdDate;
  const IncomesCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.description = const Value.absent(),
    this.walletId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.attachment = const Value.absent(),
    this.isRepeat = const Value.absent(),
    this.repeatType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  IncomesCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    required String description,
    required int walletId,
    required String categoryId,
    this.attachment = const Value.absent(),
    this.isRepeat = const Value.absent(),
    this.repeatType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.createdDate = const Value.absent(),
  })  : amount = Value(amount),
        description = Value(description),
        walletId = Value(walletId),
        categoryId = Value(categoryId);
  static Insertable<Income> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<String>? description,
    Expression<int>? walletId,
    Expression<String>? categoryId,
    Expression<String>? attachment,
    Expression<bool>? isRepeat,
    Expression<String>? repeatType,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (description != null) 'description': description,
      if (walletId != null) 'wallet_id': walletId,
      if (categoryId != null) 'category_id': categoryId,
      if (attachment != null) 'attachment': attachment,
      if (isRepeat != null) 'is_repeat': isRepeat,
      if (repeatType != null) 'repeat_type': repeatType,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  IncomesCompanion copyWith(
      {Value<int>? id,
      Value<double>? amount,
      Value<String>? description,
      Value<int>? walletId,
      Value<String>? categoryId,
      Value<String?>? attachment,
      Value<bool?>? isRepeat,
      Value<String?>? repeatType,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<DateTime?>? createdDate}) {
    return IncomesCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      walletId: walletId ?? this.walletId,
      categoryId: categoryId ?? this.categoryId,
      attachment: attachment ?? this.attachment,
      isRepeat: isRepeat ?? this.isRepeat,
      repeatType: repeatType ?? this.repeatType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (walletId.present) {
      map['wallet_id'] = Variable<int>(walletId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (attachment.present) {
      map['attachment'] = Variable<String>(attachment.value);
    }
    if (isRepeat.present) {
      map['is_repeat'] = Variable<bool>(isRepeat.value);
    }
    if (repeatType.present) {
      map['repeat_type'] = Variable<String>(repeatType.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomesCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('walletId: $walletId, ')
          ..write('categoryId: $categoryId, ')
          ..write('attachment: $attachment, ')
          ..write('isRepeat: $isRepeat, ')
          ..write('repeatType: $repeatType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

class $TransfersTable extends Transfers
    with TableInfo<$TransfersTable, Transfer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransfersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fromIdMeta = const VerificationMeta('fromId');
  @override
  late final GeneratedColumn<int> fromId = GeneratedColumn<int>(
      'from_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES accounts (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _toMeta = const VerificationMeta('to');
  @override
  late final GeneratedColumn<String> to = GeneratedColumn<String>(
      'to', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _attachmentMeta =
      const VerificationMeta('attachment');
  @override
  late final GeneratedColumn<String> attachment = GeneratedColumn<String>(
      'attachment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, amount, fromId, description, to, attachment, createdDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transfers';
  @override
  VerificationContext validateIntegrity(Insertable<Transfer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('from_id')) {
      context.handle(_fromIdMeta,
          fromId.isAcceptableOrUnknown(data['from_id']!, _fromIdMeta));
    } else if (isInserting) {
      context.missing(_fromIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('to')) {
      context.handle(_toMeta, to.isAcceptableOrUnknown(data['to']!, _toMeta));
    }
    if (data.containsKey('attachment')) {
      context.handle(
          _attachmentMeta,
          attachment.isAcceptableOrUnknown(
              data['attachment']!, _attachmentMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transfer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transfer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      fromId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}from_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      to: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}to']),
      attachment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attachment']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date']),
    );
  }

  @override
  $TransfersTable createAlias(String alias) {
    return $TransfersTable(attachedDatabase, alias);
  }
}

class Transfer extends DataClass implements Insertable<Transfer> {
  final int id;
  final double amount;
  final int fromId;
  final String? description;
  final String? to;
  final String? attachment;
  final DateTime? createdDate;
  const Transfer(
      {required this.id,
      required this.amount,
      required this.fromId,
      this.description,
      this.to,
      this.attachment,
      this.createdDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<double>(amount);
    map['from_id'] = Variable<int>(fromId);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || to != null) {
      map['to'] = Variable<String>(to);
    }
    if (!nullToAbsent || attachment != null) {
      map['attachment'] = Variable<String>(attachment);
    }
    if (!nullToAbsent || createdDate != null) {
      map['created_date'] = Variable<DateTime>(createdDate);
    }
    return map;
  }

  TransfersCompanion toCompanion(bool nullToAbsent) {
    return TransfersCompanion(
      id: Value(id),
      amount: Value(amount),
      fromId: Value(fromId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      to: to == null && nullToAbsent ? const Value.absent() : Value(to),
      attachment: attachment == null && nullToAbsent
          ? const Value.absent()
          : Value(attachment),
      createdDate: createdDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createdDate),
    );
  }

  factory Transfer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transfer(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      fromId: serializer.fromJson<int>(json['fromId']),
      description: serializer.fromJson<String?>(json['description']),
      to: serializer.fromJson<String?>(json['to']),
      attachment: serializer.fromJson<String?>(json['attachment']),
      createdDate: serializer.fromJson<DateTime?>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'fromId': serializer.toJson<int>(fromId),
      'description': serializer.toJson<String?>(description),
      'to': serializer.toJson<String?>(to),
      'attachment': serializer.toJson<String?>(attachment),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
    };
  }

  Transfer copyWith(
          {int? id,
          double? amount,
          int? fromId,
          Value<String?> description = const Value.absent(),
          Value<String?> to = const Value.absent(),
          Value<String?> attachment = const Value.absent(),
          Value<DateTime?> createdDate = const Value.absent()}) =>
      Transfer(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        fromId: fromId ?? this.fromId,
        description: description.present ? description.value : this.description,
        to: to.present ? to.value : this.to,
        attachment: attachment.present ? attachment.value : this.attachment,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
      );
  Transfer copyWithCompanion(TransfersCompanion data) {
    return Transfer(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      fromId: data.fromId.present ? data.fromId.value : this.fromId,
      description:
          data.description.present ? data.description.value : this.description,
      to: data.to.present ? data.to.value : this.to,
      attachment:
          data.attachment.present ? data.attachment.value : this.attachment,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transfer(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('fromId: $fromId, ')
          ..write('description: $description, ')
          ..write('to: $to, ')
          ..write('attachment: $attachment, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, amount, fromId, description, to, attachment, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transfer &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.fromId == this.fromId &&
          other.description == this.description &&
          other.to == this.to &&
          other.attachment == this.attachment &&
          other.createdDate == this.createdDate);
}

class TransfersCompanion extends UpdateCompanion<Transfer> {
  final Value<int> id;
  final Value<double> amount;
  final Value<int> fromId;
  final Value<String?> description;
  final Value<String?> to;
  final Value<String?> attachment;
  final Value<DateTime?> createdDate;
  const TransfersCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.fromId = const Value.absent(),
    this.description = const Value.absent(),
    this.to = const Value.absent(),
    this.attachment = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  TransfersCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    required int fromId,
    this.description = const Value.absent(),
    this.to = const Value.absent(),
    this.attachment = const Value.absent(),
    this.createdDate = const Value.absent(),
  })  : amount = Value(amount),
        fromId = Value(fromId);
  static Insertable<Transfer> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<int>? fromId,
    Expression<String>? description,
    Expression<String>? to,
    Expression<String>? attachment,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (fromId != null) 'from_id': fromId,
      if (description != null) 'description': description,
      if (to != null) 'to': to,
      if (attachment != null) 'attachment': attachment,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  TransfersCompanion copyWith(
      {Value<int>? id,
      Value<double>? amount,
      Value<int>? fromId,
      Value<String?>? description,
      Value<String?>? to,
      Value<String?>? attachment,
      Value<DateTime?>? createdDate}) {
    return TransfersCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      fromId: fromId ?? this.fromId,
      description: description ?? this.description,
      to: to ?? this.to,
      attachment: attachment ?? this.attachment,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (fromId.present) {
      map['from_id'] = Variable<int>(fromId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (to.present) {
      map['to'] = Variable<String>(to.value);
    }
    if (attachment.present) {
      map['attachment'] = Variable<String>(attachment.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransfersCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('fromId: $fromId, ')
          ..write('description: $description, ')
          ..write('to: $to, ')
          ..write('attachment: $attachment, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

class $BudgetsTable extends Budgets with TableInfo<$BudgetsTable, Budget> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _spentMeta = const VerificationMeta('spent');
  @override
  late final GeneratedColumn<double> spent = GeneratedColumn<double>(
      'spent', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _remainingMeta =
      const VerificationMeta('remaining');
  @override
  late final GeneratedColumn<double> remaining = GeneratedColumn<double>(
      'remaining', aliasedName, false,
      generatedAs: GeneratedAs(amount - spent, false),
      type: DriftSqlType.double,
      requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _percentageMeta =
      const VerificationMeta('percentage');
  @override
  late final GeneratedColumn<double> percentage = GeneratedColumn<double>(
      'percentage', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isRepeatMeta =
      const VerificationMeta('isRepeat');
  @override
  late final GeneratedColumn<bool> isRepeat = GeneratedColumn<bool>(
      'is_repeat', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_repeat" IN (0, 1))'));
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amount,
        spent,
        remaining,
        category,
        percentage,
        isRepeat,
        createdDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budgets';
  @override
  VerificationContext validateIntegrity(Insertable<Budget> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('spent')) {
      context.handle(
          _spentMeta, spent.isAcceptableOrUnknown(data['spent']!, _spentMeta));
    } else if (isInserting) {
      context.missing(_spentMeta);
    }
    if (data.containsKey('remaining')) {
      context.handle(_remainingMeta,
          remaining.isAcceptableOrUnknown(data['remaining']!, _remainingMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('percentage')) {
      context.handle(
          _percentageMeta,
          percentage.isAcceptableOrUnknown(
              data['percentage']!, _percentageMeta));
    }
    if (data.containsKey('is_repeat')) {
      context.handle(_isRepeatMeta,
          isRepeat.isAcceptableOrUnknown(data['is_repeat']!, _isRepeatMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Budget map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Budget(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      spent: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}spent'])!,
      remaining: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}remaining'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      percentage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}percentage']),
      isRepeat: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_repeat']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
    );
  }

  @override
  $BudgetsTable createAlias(String alias) {
    return $BudgetsTable(attachedDatabase, alias);
  }
}

class Budget extends DataClass implements Insertable<Budget> {
  final int id;
  final double amount;
  final double spent;
  final double remaining;
  final String category;
  final double? percentage;
  final bool? isRepeat;
  final DateTime createdDate;
  const Budget(
      {required this.id,
      required this.amount,
      required this.spent,
      required this.remaining,
      required this.category,
      this.percentage,
      this.isRepeat,
      required this.createdDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<double>(amount);
    map['spent'] = Variable<double>(spent);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || percentage != null) {
      map['percentage'] = Variable<double>(percentage);
    }
    if (!nullToAbsent || isRepeat != null) {
      map['is_repeat'] = Variable<bool>(isRepeat);
    }
    map['created_date'] = Variable<DateTime>(createdDate);
    return map;
  }

  BudgetsCompanion toCompanion(bool nullToAbsent) {
    return BudgetsCompanion(
      id: Value(id),
      amount: Value(amount),
      spent: Value(spent),
      category: Value(category),
      percentage: percentage == null && nullToAbsent
          ? const Value.absent()
          : Value(percentage),
      isRepeat: isRepeat == null && nullToAbsent
          ? const Value.absent()
          : Value(isRepeat),
      createdDate: Value(createdDate),
    );
  }

  factory Budget.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Budget(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      spent: serializer.fromJson<double>(json['spent']),
      remaining: serializer.fromJson<double>(json['remaining']),
      category: serializer.fromJson<String>(json['category']),
      percentage: serializer.fromJson<double?>(json['percentage']),
      isRepeat: serializer.fromJson<bool?>(json['isRepeat']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'spent': serializer.toJson<double>(spent),
      'remaining': serializer.toJson<double>(remaining),
      'category': serializer.toJson<String>(category),
      'percentage': serializer.toJson<double?>(percentage),
      'isRepeat': serializer.toJson<bool?>(isRepeat),
      'createdDate': serializer.toJson<DateTime>(createdDate),
    };
  }

  Budget copyWith(
          {int? id,
          double? amount,
          double? spent,
          double? remaining,
          String? category,
          Value<double?> percentage = const Value.absent(),
          Value<bool?> isRepeat = const Value.absent(),
          DateTime? createdDate}) =>
      Budget(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        spent: spent ?? this.spent,
        remaining: remaining ?? this.remaining,
        category: category ?? this.category,
        percentage: percentage.present ? percentage.value : this.percentage,
        isRepeat: isRepeat.present ? isRepeat.value : this.isRepeat,
        createdDate: createdDate ?? this.createdDate,
      );
  @override
  String toString() {
    return (StringBuffer('Budget(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('spent: $spent, ')
          ..write('remaining: $remaining, ')
          ..write('category: $category, ')
          ..write('percentage: $percentage, ')
          ..write('isRepeat: $isRepeat, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, spent, remaining, category,
      percentage, isRepeat, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Budget &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.spent == this.spent &&
          other.remaining == this.remaining &&
          other.category == this.category &&
          other.percentage == this.percentage &&
          other.isRepeat == this.isRepeat &&
          other.createdDate == this.createdDate);
}

class BudgetsCompanion extends UpdateCompanion<Budget> {
  final Value<int> id;
  final Value<double> amount;
  final Value<double> spent;
  final Value<String> category;
  final Value<double?> percentage;
  final Value<bool?> isRepeat;
  final Value<DateTime> createdDate;
  const BudgetsCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.spent = const Value.absent(),
    this.category = const Value.absent(),
    this.percentage = const Value.absent(),
    this.isRepeat = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  BudgetsCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    required double spent,
    required String category,
    this.percentage = const Value.absent(),
    this.isRepeat = const Value.absent(),
    required DateTime createdDate,
  })  : amount = Value(amount),
        spent = Value(spent),
        category = Value(category),
        createdDate = Value(createdDate);
  static Insertable<Budget> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<double>? spent,
    Expression<String>? category,
    Expression<double>? percentage,
    Expression<bool>? isRepeat,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (spent != null) 'spent': spent,
      if (category != null) 'category': category,
      if (percentage != null) 'percentage': percentage,
      if (isRepeat != null) 'is_repeat': isRepeat,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  BudgetsCompanion copyWith(
      {Value<int>? id,
      Value<double>? amount,
      Value<double>? spent,
      Value<String>? category,
      Value<double?>? percentage,
      Value<bool?>? isRepeat,
      Value<DateTime>? createdDate}) {
    return BudgetsCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      spent: spent ?? this.spent,
      category: category ?? this.category,
      percentage: percentage ?? this.percentage,
      isRepeat: isRepeat ?? this.isRepeat,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (spent.present) {
      map['spent'] = Variable<double>(spent.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (percentage.present) {
      map['percentage'] = Variable<double>(percentage.value);
    }
    if (isRepeat.present) {
      map['is_repeat'] = Variable<bool>(isRepeat.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('spent: $spent, ')
          ..write('category: $category, ')
          ..write('percentage: $percentage, ')
          ..write('isRepeat: $isRepeat, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfileTable profile = $ProfileTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $IncomesTable incomes = $IncomesTable(this);
  late final $TransfersTable transfers = $TransfersTable(this);
  late final $BudgetsTable budgets = $BudgetsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [profile, accounts, expenses, incomes, transfers, budgets];
}

typedef $$ProfileTableCreateCompanionBuilder = ProfileCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> pin,
  Value<Uint8List?> imageUrl,
});
typedef $$ProfileTableUpdateCompanionBuilder = ProfileCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> pin,
  Value<Uint8List?> imageUrl,
});

class $$ProfileTableFilterComposer
    extends Composer<_$AppDatabase, $ProfileTable> {
  $$ProfileTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));
}

class $$ProfileTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfileTable> {
  $$ProfileTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));
}

class $$ProfileTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfileTable> {
  $$ProfileTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get pin =>
      $composableBuilder(column: $table.pin, builder: (column) => column);

  GeneratedColumn<Uint8List> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$ProfileTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProfileTable,
    ProfileData,
    $$ProfileTableFilterComposer,
    $$ProfileTableOrderingComposer,
    $$ProfileTableAnnotationComposer,
    $$ProfileTableCreateCompanionBuilder,
    $$ProfileTableUpdateCompanionBuilder,
    (ProfileData, BaseReferences<_$AppDatabase, $ProfileTable, ProfileData>),
    ProfileData,
    PrefetchHooks Function()> {
  $$ProfileTableTableManager(_$AppDatabase db, $ProfileTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfileTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfileTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfileTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> pin = const Value.absent(),
            Value<Uint8List?> imageUrl = const Value.absent(),
          }) =>
              ProfileCompanion(
            id: id,
            name: name,
            pin: pin,
            imageUrl: imageUrl,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> pin = const Value.absent(),
            Value<Uint8List?> imageUrl = const Value.absent(),
          }) =>
              ProfileCompanion.insert(
            id: id,
            name: name,
            pin: pin,
            imageUrl: imageUrl,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProfileTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProfileTable,
    ProfileData,
    $$ProfileTableFilterComposer,
    $$ProfileTableOrderingComposer,
    $$ProfileTableAnnotationComposer,
    $$ProfileTableCreateCompanionBuilder,
    $$ProfileTableUpdateCompanionBuilder,
    (ProfileData, BaseReferences<_$AppDatabase, $ProfileTable, ProfileData>),
    ProfileData,
    PrefetchHooks Function()>;
typedef $$AccountsTableCreateCompanionBuilder = AccountsCompanion Function({
  Value<int> id,
  required String accountName,
  required double accountBalance,
  required AccountType accountType,
  Value<String?> accountTypeImg,
});
typedef $$AccountsTableUpdateCompanionBuilder = AccountsCompanion Function({
  Value<int> id,
  Value<String> accountName,
  Value<double> accountBalance,
  Value<AccountType> accountType,
  Value<String?> accountTypeImg,
});

final class $$AccountsTableReferences
    extends BaseReferences<_$AppDatabase, $AccountsTable, Account> {
  $$AccountsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.expenses,
          aliasName:
              $_aliasNameGenerator(db.accounts.id, db.expenses.walletId));

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager($_db, $_db.expenses)
        .filter((f) => f.walletId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$IncomesTable, List<Income>> _incomesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.incomes,
          aliasName: $_aliasNameGenerator(db.accounts.id, db.incomes.walletId));

  $$IncomesTableProcessedTableManager get incomesRefs {
    final manager = $$IncomesTableTableManager($_db, $_db.incomes)
        .filter((f) => f.walletId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_incomesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransfersTable, List<Transfer>>
      _transfersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.transfers,
          aliasName: $_aliasNameGenerator(db.accounts.id, db.transfers.fromId));

  $$TransfersTableProcessedTableManager get transfersRefs {
    final manager = $$TransfersTableTableManager($_db, $_db.transfers)
        .filter((f) => f.fromId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transfersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get accountBalance => $composableBuilder(
      column: $table.accountBalance,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<AccountType, AccountType, int>
      get accountType => $composableBuilder(
          column: $table.accountType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get accountTypeImg => $composableBuilder(
      column: $table.accountTypeImg,
      builder: (column) => ColumnFilters(column));

  Expression<bool> expensesRefs(
      Expression<bool> Function($$ExpensesTableFilterComposer f) f) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.walletId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableFilterComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> incomesRefs(
      Expression<bool> Function($$IncomesTableFilterComposer f) f) {
    final $$IncomesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomes,
        getReferencedColumn: (t) => t.walletId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableFilterComposer(
              $db: $db,
              $table: $db.incomes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> transfersRefs(
      Expression<bool> Function($$TransfersTableFilterComposer f) f) {
    final $$TransfersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transfers,
        getReferencedColumn: (t) => t.fromId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransfersTableFilterComposer(
              $db: $db,
              $table: $db.transfers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get accountBalance => $composableBuilder(
      column: $table.accountBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountTypeImg => $composableBuilder(
      column: $table.accountTypeImg,
      builder: (column) => ColumnOrderings(column));
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => column);

  GeneratedColumn<double> get accountBalance => $composableBuilder(
      column: $table.accountBalance, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AccountType, int> get accountType =>
      $composableBuilder(
          column: $table.accountType, builder: (column) => column);

  GeneratedColumn<String> get accountTypeImg => $composableBuilder(
      column: $table.accountTypeImg, builder: (column) => column);

  Expression<T> expensesRefs<T extends Object>(
      Expression<T> Function($$ExpensesTableAnnotationComposer a) f) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.walletId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> incomesRefs<T extends Object>(
      Expression<T> Function($$IncomesTableAnnotationComposer a) f) {
    final $$IncomesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomes,
        getReferencedColumn: (t) => t.walletId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableAnnotationComposer(
              $db: $db,
              $table: $db.incomes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> transfersRefs<T extends Object>(
      Expression<T> Function($$TransfersTableAnnotationComposer a) f) {
    final $$TransfersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transfers,
        getReferencedColumn: (t) => t.fromId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransfersTableAnnotationComposer(
              $db: $db,
              $table: $db.transfers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AccountsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountsTable,
    Account,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (Account, $$AccountsTableReferences),
    Account,
    PrefetchHooks Function(
        {bool expensesRefs, bool incomesRefs, bool transfersRefs})> {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> accountName = const Value.absent(),
            Value<double> accountBalance = const Value.absent(),
            Value<AccountType> accountType = const Value.absent(),
            Value<String?> accountTypeImg = const Value.absent(),
          }) =>
              AccountsCompanion(
            id: id,
            accountName: accountName,
            accountBalance: accountBalance,
            accountType: accountType,
            accountTypeImg: accountTypeImg,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String accountName,
            required double accountBalance,
            required AccountType accountType,
            Value<String?> accountTypeImg = const Value.absent(),
          }) =>
              AccountsCompanion.insert(
            id: id,
            accountName: accountName,
            accountBalance: accountBalance,
            accountType: accountType,
            accountTypeImg: accountTypeImg,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$AccountsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {expensesRefs = false,
              incomesRefs = false,
              transfersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (expensesRefs) db.expenses,
                if (incomesRefs) db.incomes,
                if (transfersRefs) db.transfers
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (expensesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$AccountsTableReferences._expensesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AccountsTableReferences(db, table, p0)
                                .expensesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.walletId == item.id),
                        typedResults: items),
                  if (incomesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$AccountsTableReferences._incomesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AccountsTableReferences(db, table, p0)
                                .incomesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.walletId == item.id),
                        typedResults: items),
                  if (transfersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$AccountsTableReferences._transfersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AccountsTableReferences(db, table, p0)
                                .transfersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.fromId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AccountsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AccountsTable,
    Account,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (Account, $$AccountsTableReferences),
    Account,
    PrefetchHooks Function(
        {bool expensesRefs, bool incomesRefs, bool transfersRefs})>;
typedef $$ExpensesTableCreateCompanionBuilder = ExpensesCompanion Function({
  Value<int> id,
  required double amount,
  Value<String?> description,
  required int walletId,
  required String categoryId,
  Value<String?> attachment,
  Value<bool?> isRepeat,
  Value<String?> repeatType,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<DateTime?> createdDate,
});
typedef $$ExpensesTableUpdateCompanionBuilder = ExpensesCompanion Function({
  Value<int> id,
  Value<double> amount,
  Value<String?> description,
  Value<int> walletId,
  Value<String> categoryId,
  Value<String?> attachment,
  Value<bool?> isRepeat,
  Value<String?> repeatType,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<DateTime?> createdDate,
});

final class $$ExpensesTableReferences
    extends BaseReferences<_$AppDatabase, $ExpensesTable, Expense> {
  $$ExpensesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountsTable _walletIdTable(_$AppDatabase db) => db.accounts
      .createAlias($_aliasNameGenerator(db.expenses.walletId, db.accounts.id));

  $$AccountsTableProcessedTableManager get walletId {
    final $_column = $_itemColumn<int>('wallet_id')!;

    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_walletIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRepeat => $composableBuilder(
      column: $table.isRepeat, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get repeatType => $composableBuilder(
      column: $table.repeatType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  $$AccountsTableFilterComposer get walletId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRepeat => $composableBuilder(
      column: $table.isRepeat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get repeatType => $composableBuilder(
      column: $table.repeatType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  $$AccountsTableOrderingComposer get walletId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableOrderingComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => column);

  GeneratedColumn<bool> get isRepeat =>
      $composableBuilder(column: $table.isRepeat, builder: (column) => column);

  GeneratedColumn<String> get repeatType => $composableBuilder(
      column: $table.repeatType, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  $$AccountsTableAnnotationComposer get walletId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpensesTable,
    Expense,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableAnnotationComposer,
    $$ExpensesTableCreateCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder,
    (Expense, $$ExpensesTableReferences),
    Expense,
    PrefetchHooks Function({bool walletId})> {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> walletId = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<String?> attachment = const Value.absent(),
            Value<bool?> isRepeat = const Value.absent(),
            Value<String?> repeatType = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
          }) =>
              ExpensesCompanion(
            id: id,
            amount: amount,
            description: description,
            walletId: walletId,
            categoryId: categoryId,
            attachment: attachment,
            isRepeat: isRepeat,
            repeatType: repeatType,
            startDate: startDate,
            endDate: endDate,
            createdDate: createdDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double amount,
            Value<String?> description = const Value.absent(),
            required int walletId,
            required String categoryId,
            Value<String?> attachment = const Value.absent(),
            Value<bool?> isRepeat = const Value.absent(),
            Value<String?> repeatType = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
          }) =>
              ExpensesCompanion.insert(
            id: id,
            amount: amount,
            description: description,
            walletId: walletId,
            categoryId: categoryId,
            attachment: attachment,
            isRepeat: isRepeat,
            repeatType: repeatType,
            startDate: startDate,
            endDate: endDate,
            createdDate: createdDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ExpensesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({walletId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (walletId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.walletId,
                    referencedTable:
                        $$ExpensesTableReferences._walletIdTable(db),
                    referencedColumn:
                        $$ExpensesTableReferences._walletIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ExpensesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExpensesTable,
    Expense,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableAnnotationComposer,
    $$ExpensesTableCreateCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder,
    (Expense, $$ExpensesTableReferences),
    Expense,
    PrefetchHooks Function({bool walletId})>;
typedef $$IncomesTableCreateCompanionBuilder = IncomesCompanion Function({
  Value<int> id,
  required double amount,
  required String description,
  required int walletId,
  required String categoryId,
  Value<String?> attachment,
  Value<bool?> isRepeat,
  Value<String?> repeatType,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<DateTime?> createdDate,
});
typedef $$IncomesTableUpdateCompanionBuilder = IncomesCompanion Function({
  Value<int> id,
  Value<double> amount,
  Value<String> description,
  Value<int> walletId,
  Value<String> categoryId,
  Value<String?> attachment,
  Value<bool?> isRepeat,
  Value<String?> repeatType,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<DateTime?> createdDate,
});

final class $$IncomesTableReferences
    extends BaseReferences<_$AppDatabase, $IncomesTable, Income> {
  $$IncomesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountsTable _walletIdTable(_$AppDatabase db) => db.accounts
      .createAlias($_aliasNameGenerator(db.incomes.walletId, db.accounts.id));

  $$AccountsTableProcessedTableManager get walletId {
    final $_column = $_itemColumn<int>('wallet_id')!;

    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_walletIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$IncomesTableFilterComposer
    extends Composer<_$AppDatabase, $IncomesTable> {
  $$IncomesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRepeat => $composableBuilder(
      column: $table.isRepeat, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get repeatType => $composableBuilder(
      column: $table.repeatType, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  $$AccountsTableFilterComposer get walletId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IncomesTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomesTable> {
  $$IncomesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRepeat => $composableBuilder(
      column: $table.isRepeat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get repeatType => $composableBuilder(
      column: $table.repeatType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  $$AccountsTableOrderingComposer get walletId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableOrderingComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IncomesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomesTable> {
  $$IncomesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => column);

  GeneratedColumn<bool> get isRepeat =>
      $composableBuilder(column: $table.isRepeat, builder: (column) => column);

  GeneratedColumn<String> get repeatType => $composableBuilder(
      column: $table.repeatType, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  $$AccountsTableAnnotationComposer get walletId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IncomesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IncomesTable,
    Income,
    $$IncomesTableFilterComposer,
    $$IncomesTableOrderingComposer,
    $$IncomesTableAnnotationComposer,
    $$IncomesTableCreateCompanionBuilder,
    $$IncomesTableUpdateCompanionBuilder,
    (Income, $$IncomesTableReferences),
    Income,
    PrefetchHooks Function({bool walletId})> {
  $$IncomesTableTableManager(_$AppDatabase db, $IncomesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> walletId = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<String?> attachment = const Value.absent(),
            Value<bool?> isRepeat = const Value.absent(),
            Value<String?> repeatType = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
          }) =>
              IncomesCompanion(
            id: id,
            amount: amount,
            description: description,
            walletId: walletId,
            categoryId: categoryId,
            attachment: attachment,
            isRepeat: isRepeat,
            repeatType: repeatType,
            startDate: startDate,
            endDate: endDate,
            createdDate: createdDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double amount,
            required String description,
            required int walletId,
            required String categoryId,
            Value<String?> attachment = const Value.absent(),
            Value<bool?> isRepeat = const Value.absent(),
            Value<String?> repeatType = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
          }) =>
              IncomesCompanion.insert(
            id: id,
            amount: amount,
            description: description,
            walletId: walletId,
            categoryId: categoryId,
            attachment: attachment,
            isRepeat: isRepeat,
            repeatType: repeatType,
            startDate: startDate,
            endDate: endDate,
            createdDate: createdDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$IncomesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({walletId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (walletId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.walletId,
                    referencedTable:
                        $$IncomesTableReferences._walletIdTable(db),
                    referencedColumn:
                        $$IncomesTableReferences._walletIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$IncomesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IncomesTable,
    Income,
    $$IncomesTableFilterComposer,
    $$IncomesTableOrderingComposer,
    $$IncomesTableAnnotationComposer,
    $$IncomesTableCreateCompanionBuilder,
    $$IncomesTableUpdateCompanionBuilder,
    (Income, $$IncomesTableReferences),
    Income,
    PrefetchHooks Function({bool walletId})>;
typedef $$TransfersTableCreateCompanionBuilder = TransfersCompanion Function({
  Value<int> id,
  required double amount,
  required int fromId,
  Value<String?> description,
  Value<String?> to,
  Value<String?> attachment,
  Value<DateTime?> createdDate,
});
typedef $$TransfersTableUpdateCompanionBuilder = TransfersCompanion Function({
  Value<int> id,
  Value<double> amount,
  Value<int> fromId,
  Value<String?> description,
  Value<String?> to,
  Value<String?> attachment,
  Value<DateTime?> createdDate,
});

final class $$TransfersTableReferences
    extends BaseReferences<_$AppDatabase, $TransfersTable, Transfer> {
  $$TransfersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountsTable _fromIdTable(_$AppDatabase db) => db.accounts
      .createAlias($_aliasNameGenerator(db.transfers.fromId, db.accounts.id));

  $$AccountsTableProcessedTableManager get fromId {
    final $_column = $_itemColumn<int>('from_id')!;

    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fromIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TransfersTableFilterComposer
    extends Composer<_$AppDatabase, $TransfersTable> {
  $$TransfersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get to => $composableBuilder(
      column: $table.to, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  $$AccountsTableFilterComposer get fromId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransfersTableOrderingComposer
    extends Composer<_$AppDatabase, $TransfersTable> {
  $$TransfersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get to => $composableBuilder(
      column: $table.to, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  $$AccountsTableOrderingComposer get fromId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableOrderingComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransfersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransfersTable> {
  $$TransfersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get to =>
      $composableBuilder(column: $table.to, builder: (column) => column);

  GeneratedColumn<String> get attachment => $composableBuilder(
      column: $table.attachment, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  $$AccountsTableAnnotationComposer get fromId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransfersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransfersTable,
    Transfer,
    $$TransfersTableFilterComposer,
    $$TransfersTableOrderingComposer,
    $$TransfersTableAnnotationComposer,
    $$TransfersTableCreateCompanionBuilder,
    $$TransfersTableUpdateCompanionBuilder,
    (Transfer, $$TransfersTableReferences),
    Transfer,
    PrefetchHooks Function({bool fromId})> {
  $$TransfersTableTableManager(_$AppDatabase db, $TransfersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransfersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransfersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransfersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<int> fromId = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> to = const Value.absent(),
            Value<String?> attachment = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
          }) =>
              TransfersCompanion(
            id: id,
            amount: amount,
            fromId: fromId,
            description: description,
            to: to,
            attachment: attachment,
            createdDate: createdDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double amount,
            required int fromId,
            Value<String?> description = const Value.absent(),
            Value<String?> to = const Value.absent(),
            Value<String?> attachment = const Value.absent(),
            Value<DateTime?> createdDate = const Value.absent(),
          }) =>
              TransfersCompanion.insert(
            id: id,
            amount: amount,
            fromId: fromId,
            description: description,
            to: to,
            attachment: attachment,
            createdDate: createdDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransfersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({fromId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (fromId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.fromId,
                    referencedTable:
                        $$TransfersTableReferences._fromIdTable(db),
                    referencedColumn:
                        $$TransfersTableReferences._fromIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TransfersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransfersTable,
    Transfer,
    $$TransfersTableFilterComposer,
    $$TransfersTableOrderingComposer,
    $$TransfersTableAnnotationComposer,
    $$TransfersTableCreateCompanionBuilder,
    $$TransfersTableUpdateCompanionBuilder,
    (Transfer, $$TransfersTableReferences),
    Transfer,
    PrefetchHooks Function({bool fromId})>;
typedef $$BudgetsTableCreateCompanionBuilder = BudgetsCompanion Function({
  Value<int> id,
  required double amount,
  required double spent,
  required String category,
  Value<double?> percentage,
  Value<bool?> isRepeat,
  required DateTime createdDate,
});
typedef $$BudgetsTableUpdateCompanionBuilder = BudgetsCompanion Function({
  Value<int> id,
  Value<double> amount,
  Value<double> spent,
  Value<String> category,
  Value<double?> percentage,
  Value<bool?> isRepeat,
  Value<DateTime> createdDate,
});

class $$BudgetsTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get spent => $composableBuilder(
      column: $table.spent, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get remaining => $composableBuilder(
      column: $table.remaining, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get percentage => $composableBuilder(
      column: $table.percentage, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRepeat => $composableBuilder(
      column: $table.isRepeat, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));
}

class $$BudgetsTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get spent => $composableBuilder(
      column: $table.spent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get remaining => $composableBuilder(
      column: $table.remaining, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get percentage => $composableBuilder(
      column: $table.percentage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRepeat => $composableBuilder(
      column: $table.isRepeat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));
}

class $$BudgetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get spent =>
      $composableBuilder(column: $table.spent, builder: (column) => column);

  GeneratedColumn<double> get remaining =>
      $composableBuilder(column: $table.remaining, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get percentage => $composableBuilder(
      column: $table.percentage, builder: (column) => column);

  GeneratedColumn<bool> get isRepeat =>
      $composableBuilder(column: $table.isRepeat, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);
}

class $$BudgetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BudgetsTable,
    Budget,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (Budget, BaseReferences<_$AppDatabase, $BudgetsTable, Budget>),
    Budget,
    PrefetchHooks Function()> {
  $$BudgetsTableTableManager(_$AppDatabase db, $BudgetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<double> spent = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<double?> percentage = const Value.absent(),
            Value<bool?> isRepeat = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
          }) =>
              BudgetsCompanion(
            id: id,
            amount: amount,
            spent: spent,
            category: category,
            percentage: percentage,
            isRepeat: isRepeat,
            createdDate: createdDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double amount,
            required double spent,
            required String category,
            Value<double?> percentage = const Value.absent(),
            Value<bool?> isRepeat = const Value.absent(),
            required DateTime createdDate,
          }) =>
              BudgetsCompanion.insert(
            id: id,
            amount: amount,
            spent: spent,
            category: category,
            percentage: percentage,
            isRepeat: isRepeat,
            createdDate: createdDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BudgetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BudgetsTable,
    Budget,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (Budget, BaseReferences<_$AppDatabase, $BudgetsTable, Budget>),
    Budget,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfileTableTableManager get profile =>
      $$ProfileTableTableManager(_db, _db.profile);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$IncomesTableTableManager get incomes =>
      $$IncomesTableTableManager(_db, _db.incomes);
  $$TransfersTableTableManager get transfers =>
      $$TransfersTableTableManager(_db, _db.transfers);
  $$BudgetsTableTableManager get budgets =>
      $$BudgetsTableTableManager(_db, _db.budgets);
}
