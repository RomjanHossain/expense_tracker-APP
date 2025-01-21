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
      'pin', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
    } else if (isInserting) {
      context.missing(_pinMeta);
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
          .read(DriftSqlType.string, data['${effectivePrefix}pin'])!,
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
  final String pin;
  final Uint8List? imageUrl;
  const ProfileData(
      {required this.id, required this.name, required this.pin, this.imageUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['pin'] = Variable<String>(pin);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<Uint8List>(imageUrl);
    }
    return map;
  }

  ProfileCompanion toCompanion(bool nullToAbsent) {
    return ProfileCompanion(
      id: Value(id),
      name: Value(name),
      pin: Value(pin),
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
      pin: serializer.fromJson<String>(json['pin']),
      imageUrl: serializer.fromJson<Uint8List?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'pin': serializer.toJson<String>(pin),
      'imageUrl': serializer.toJson<Uint8List?>(imageUrl),
    };
  }

  ProfileData copyWith(
          {int? id,
          String? name,
          String? pin,
          Value<Uint8List?> imageUrl = const Value.absent()}) =>
      ProfileData(
        id: id ?? this.id,
        name: name ?? this.name,
        pin: pin ?? this.pin,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
      );
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
  final Value<String> pin;
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
    required String pin,
    this.imageUrl = const Value.absent(),
  })  : name = Value(name),
        pin = Value(pin);
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
      Value<String>? pin,
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
      'amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
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
          .read(DriftSqlType.double, data['${effectivePrefix}amount']),
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
  final double? amount;
  final int fromId;
  final String? description;
  final String? to;
  final String? attachment;
  final DateTime? createdDate;
  const Transfer(
      {required this.id,
      this.amount,
      required this.fromId,
      this.description,
      this.to,
      this.attachment,
      this.createdDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
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
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
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
      amount: serializer.fromJson<double?>(json['amount']),
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
      'amount': serializer.toJson<double?>(amount),
      'fromId': serializer.toJson<int>(fromId),
      'description': serializer.toJson<String?>(description),
      'to': serializer.toJson<String?>(to),
      'attachment': serializer.toJson<String?>(attachment),
      'createdDate': serializer.toJson<DateTime?>(createdDate),
    };
  }

  Transfer copyWith(
          {int? id,
          Value<double?> amount = const Value.absent(),
          int? fromId,
          Value<String?> description = const Value.absent(),
          Value<String?> to = const Value.absent(),
          Value<String?> attachment = const Value.absent(),
          Value<DateTime?> createdDate = const Value.absent()}) =>
      Transfer(
        id: id ?? this.id,
        amount: amount.present ? amount.value : this.amount,
        fromId: fromId ?? this.fromId,
        description: description.present ? description.value : this.description,
        to: to.present ? to.value : this.to,
        attachment: attachment.present ? attachment.value : this.attachment,
        createdDate: createdDate.present ? createdDate.value : this.createdDate,
      );
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
  final Value<double?> amount;
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
    this.amount = const Value.absent(),
    required int fromId,
    this.description = const Value.absent(),
    this.to = const Value.absent(),
    this.attachment = const Value.absent(),
    this.createdDate = const Value.absent(),
  }) : fromId = Value(fromId);
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
      Value<double?>? amount,
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $ProfileTable profile = $ProfileTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $IncomesTable incomes = $IncomesTable(this);
  late final $TransfersTable transfers = $TransfersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [profile, accounts, expenses, incomes, transfers];
}

typedef $$ProfileTableInsertCompanionBuilder = ProfileCompanion Function({
  Value<int> id,
  required String name,
  required String pin,
  Value<Uint8List?> imageUrl,
});
typedef $$ProfileTableUpdateCompanionBuilder = ProfileCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> pin,
  Value<Uint8List?> imageUrl,
});

class $$ProfileTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProfileTable,
    ProfileData,
    $$ProfileTableFilterComposer,
    $$ProfileTableOrderingComposer,
    $$ProfileTableProcessedTableManager,
    $$ProfileTableInsertCompanionBuilder,
    $$ProfileTableUpdateCompanionBuilder> {
  $$ProfileTableTableManager(_$AppDatabase db, $ProfileTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProfileTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProfileTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$ProfileTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> pin = const Value.absent(),
            Value<Uint8List?> imageUrl = const Value.absent(),
          }) =>
              ProfileCompanion(
            id: id,
            name: name,
            pin: pin,
            imageUrl: imageUrl,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String pin,
            Value<Uint8List?> imageUrl = const Value.absent(),
          }) =>
              ProfileCompanion.insert(
            id: id,
            name: name,
            pin: pin,
            imageUrl: imageUrl,
          ),
        ));
}

class $$ProfileTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ProfileTable,
    ProfileData,
    $$ProfileTableFilterComposer,
    $$ProfileTableOrderingComposer,
    $$ProfileTableProcessedTableManager,
    $$ProfileTableInsertCompanionBuilder,
    $$ProfileTableUpdateCompanionBuilder> {
  $$ProfileTableProcessedTableManager(super.$state);
}

class $$ProfileTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProfileTable> {
  $$ProfileTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get pin => $state.composableBuilder(
      column: $state.table.pin,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ProfileTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProfileTable> {
  $$ProfileTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get pin => $state.composableBuilder(
      column: $state.table.pin,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AccountsTableInsertCompanionBuilder = AccountsCompanion Function({
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

class $$AccountsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountsTable,
    Account,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableProcessedTableManager,
    $$AccountsTableInsertCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder> {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AccountsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AccountsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$AccountsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
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
          getInsertCompanionBuilder: ({
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
        ));
}

class $$AccountsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $AccountsTable,
    Account,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableProcessedTableManager,
    $$AccountsTableInsertCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder> {
  $$AccountsTableProcessedTableManager(super.$state);
}

class $$AccountsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get accountName => $state.composableBuilder(
      column: $state.table.accountName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get accountBalance => $state.composableBuilder(
      column: $state.table.accountBalance,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<AccountType, AccountType, int>
      get accountType => $state.composableBuilder(
          column: $state.table.accountType,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get accountTypeImg => $state.composableBuilder(
      column: $state.table.accountTypeImg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter expensesRefs(
      ComposableFilter Function($$ExpensesTableFilterComposer f) f) {
    final $$ExpensesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.expenses,
        getReferencedColumn: (t) => t.walletId,
        builder: (joinBuilder, parentComposers) =>
            $$ExpensesTableFilterComposer(ComposerState(
                $state.db, $state.db.expenses, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter incomesRefs(
      ComposableFilter Function($$IncomesTableFilterComposer f) f) {
    final $$IncomesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.incomes,
        getReferencedColumn: (t) => t.walletId,
        builder: (joinBuilder, parentComposers) => $$IncomesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.incomes, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter transfersRefs(
      ComposableFilter Function($$TransfersTableFilterComposer f) f) {
    final $$TransfersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.transfers,
        getReferencedColumn: (t) => t.fromId,
        builder: (joinBuilder, parentComposers) =>
            $$TransfersTableFilterComposer(ComposerState(
                $state.db, $state.db.transfers, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$AccountsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get accountName => $state.composableBuilder(
      column: $state.table.accountName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get accountBalance => $state.composableBuilder(
      column: $state.table.accountBalance,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accountType => $state.composableBuilder(
      column: $state.table.accountType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get accountTypeImg => $state.composableBuilder(
      column: $state.table.accountTypeImg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ExpensesTableInsertCompanionBuilder = ExpensesCompanion Function({
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

class $$ExpensesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpensesTable,
    Expense,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableProcessedTableManager,
    $$ExpensesTableInsertCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder> {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExpensesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExpensesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ExpensesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
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
          getInsertCompanionBuilder: ({
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
        ));
}

class $$ExpensesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ExpensesTable,
    Expense,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableProcessedTableManager,
    $$ExpensesTableInsertCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder> {
  $$ExpensesTableProcessedTableManager(super.$state);
}

class $$ExpensesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get categoryId => $state.composableBuilder(
      column: $state.table.categoryId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get attachment => $state.composableBuilder(
      column: $state.table.attachment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isRepeat => $state.composableBuilder(
      column: $state.table.isRepeat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get repeatType => $state.composableBuilder(
      column: $state.table.repeatType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$AccountsTableFilterComposer get walletId {
    final $$AccountsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletId,
        referencedTable: $state.db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AccountsTableFilterComposer(ComposerState(
                $state.db, $state.db.accounts, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ExpensesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get categoryId => $state.composableBuilder(
      column: $state.table.categoryId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get attachment => $state.composableBuilder(
      column: $state.table.attachment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isRepeat => $state.composableBuilder(
      column: $state.table.isRepeat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get repeatType => $state.composableBuilder(
      column: $state.table.repeatType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$AccountsTableOrderingComposer get walletId {
    final $$AccountsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletId,
        referencedTable: $state.db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AccountsTableOrderingComposer(ComposerState(
                $state.db, $state.db.accounts, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$IncomesTableInsertCompanionBuilder = IncomesCompanion Function({
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

class $$IncomesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IncomesTable,
    Income,
    $$IncomesTableFilterComposer,
    $$IncomesTableOrderingComposer,
    $$IncomesTableProcessedTableManager,
    $$IncomesTableInsertCompanionBuilder,
    $$IncomesTableUpdateCompanionBuilder> {
  $$IncomesTableTableManager(_$AppDatabase db, $IncomesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$IncomesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$IncomesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$IncomesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
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
          getInsertCompanionBuilder: ({
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
        ));
}

class $$IncomesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $IncomesTable,
    Income,
    $$IncomesTableFilterComposer,
    $$IncomesTableOrderingComposer,
    $$IncomesTableProcessedTableManager,
    $$IncomesTableInsertCompanionBuilder,
    $$IncomesTableUpdateCompanionBuilder> {
  $$IncomesTableProcessedTableManager(super.$state);
}

class $$IncomesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $IncomesTable> {
  $$IncomesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get categoryId => $state.composableBuilder(
      column: $state.table.categoryId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get attachment => $state.composableBuilder(
      column: $state.table.attachment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isRepeat => $state.composableBuilder(
      column: $state.table.isRepeat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get repeatType => $state.composableBuilder(
      column: $state.table.repeatType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$AccountsTableFilterComposer get walletId {
    final $$AccountsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletId,
        referencedTable: $state.db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AccountsTableFilterComposer(ComposerState(
                $state.db, $state.db.accounts, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$IncomesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $IncomesTable> {
  $$IncomesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get categoryId => $state.composableBuilder(
      column: $state.table.categoryId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get attachment => $state.composableBuilder(
      column: $state.table.attachment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isRepeat => $state.composableBuilder(
      column: $state.table.isRepeat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get repeatType => $state.composableBuilder(
      column: $state.table.repeatType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$AccountsTableOrderingComposer get walletId {
    final $$AccountsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.walletId,
        referencedTable: $state.db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AccountsTableOrderingComposer(ComposerState(
                $state.db, $state.db.accounts, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$TransfersTableInsertCompanionBuilder = TransfersCompanion Function({
  Value<int> id,
  Value<double?> amount,
  required int fromId,
  Value<String?> description,
  Value<String?> to,
  Value<String?> attachment,
  Value<DateTime?> createdDate,
});
typedef $$TransfersTableUpdateCompanionBuilder = TransfersCompanion Function({
  Value<int> id,
  Value<double?> amount,
  Value<int> fromId,
  Value<String?> description,
  Value<String?> to,
  Value<String?> attachment,
  Value<DateTime?> createdDate,
});

class $$TransfersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransfersTable,
    Transfer,
    $$TransfersTableFilterComposer,
    $$TransfersTableOrderingComposer,
    $$TransfersTableProcessedTableManager,
    $$TransfersTableInsertCompanionBuilder,
    $$TransfersTableUpdateCompanionBuilder> {
  $$TransfersTableTableManager(_$AppDatabase db, $TransfersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TransfersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TransfersTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TransfersTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<double?> amount = const Value.absent(),
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
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<double?> amount = const Value.absent(),
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
        ));
}

class $$TransfersTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TransfersTable,
    Transfer,
    $$TransfersTableFilterComposer,
    $$TransfersTableOrderingComposer,
    $$TransfersTableProcessedTableManager,
    $$TransfersTableInsertCompanionBuilder,
    $$TransfersTableUpdateCompanionBuilder> {
  $$TransfersTableProcessedTableManager(super.$state);
}

class $$TransfersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TransfersTable> {
  $$TransfersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get to => $state.composableBuilder(
      column: $state.table.to,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get attachment => $state.composableBuilder(
      column: $state.table.attachment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$AccountsTableFilterComposer get fromId {
    final $$AccountsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromId,
        referencedTable: $state.db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AccountsTableFilterComposer(ComposerState(
                $state.db, $state.db.accounts, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TransfersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TransfersTable> {
  $$TransfersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get to => $state.composableBuilder(
      column: $state.table.to,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get attachment => $state.composableBuilder(
      column: $state.table.attachment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$AccountsTableOrderingComposer get fromId {
    final $$AccountsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromId,
        referencedTable: $state.db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AccountsTableOrderingComposer(ComposerState(
                $state.db, $state.db.accounts, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
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
}
