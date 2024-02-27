import 'package:expense_tracker/gen/assets.gen.dart';

abstract class ExpenseAssets {
  // static final String _icons = 'assets/icons/';
  // static final String _mobileBanking = 'assets/icons/MobileBanking/';
  // static final String bankingAsset = 'assets/icons/Bank/';
  // static final String _illustrations = 'assets/illustrations/';

  /*
    All icons are down below
  */
  // plus sign icon
  static final String plusIcon = Assets.icons.add.path;
  // arrow down
  static final String arrowDownIcon = Assets.icons.arrowDown.path;
  // arrow left long
  // static final String arrowLeftLongIcon = '${_icons}arrow_left_long.svg';
  static final String arrowLeftLongIcon = Assets.icons.arrowLeftLong.path;
  // arrow right
  // static final String arrowRightIcon = '${_icons}arrow_right.svg';
  static final String arrowRightIcon = Assets.icons.arrowRight.path;
  // attachment icon
  // static final String attachmentIcon = '${_icons}attachment.svg';
  static final String attachmentIcon = Assets.icons.attachment.path;
  // camera
  // static final String cameraIcon = '${_icons}camera.svg';
  static final String cameraIcon = Assets.icons.camera.path;
  // car
  // static final String carIcon = '${_icons}car.svg';
  static final String carIcon = Assets.icons.car.path;
  // close
  // static final String closeIcon = '${_icons}close.svg';
  static final String closeIcon = Assets.icons.close.path;
  // create
  // static final String createIcon = '${_icons}create.svg';
  static final String createIcon = Assets.icons.create.path;
  // create_fill
  // static final String createFillIcon = '${_icons}create_fill.svg';
  static final String createFillIcon = Assets.icons.createFill.path;
  // currency_exchange
  // static final String currencyExchangeIcon = '${_icons}currency_exchange.svg';
  static final String currencyExchangeIcon = Assets.icons.currencyExchange.path;
  // download
  // static final String downloadIcon = '${_icons}download.svg';
  static final String downloadIcon = Assets.icons.download.path;
  // edit
  // static final String editIcon = '${_icons}edit.svg';
  static final String editIcon = Assets.icons.edit.path;
  // expense
  // static final String expenseIcon = '${_icons}expense.svg';
  static final String expenseIcon = Assets.icons.expense.path;
  // flat_color_icons_google
  static final String flatColorIconsGoogleIcon =
      Assets.icons.flatColorIconsGoogle.path;
  // gallery
  static final String galleryIcon = Assets.icons.gallery.path;
  // home
  static final String homeIcon = Assets.icons.home.path;
  // income
  static final String incomeIcon = Assets.icons.income.path;
  // line_chart
  static final String lineChartIcon = Assets.icons.lineChart.path;
  // logout
  static final String logoutIcon = Assets.icons.logout.path;
  // more_horizontal
  static final String moreHorizontalIcon = Assets.icons.moreHorizontal.path;
  // new
  static final String newIcon = Assets.icons.newicon.path;
  // notifiaction
  static final String notificationIcon = Assets.icons.notification.path;
  // notification
  static final String notificationFillIcon = Assets.icons.notification.path;
  // pie_chart
  static final String pieChartIcon = Assets.icons.pieChart.path;
  // recurring_bill
  static final String recurringBillIcon = Assets.icons.recurringBill.path;
  // restaurant
  static final String restaurantIcon = Assets.icons.restaurant.path;
  // salary
  static final String salaryIcon = Assets.icons.salary.path;
  // search
  static final String searchIcon = Assets.icons.search.path;
  // settings
  static final String settingsIcon = Assets.icons.settings.path;
  // shopping_bag
  static final String shoppingBagIcon = Assets.icons.shoppingBag.path;
  // show
  static final String showIcon = Assets.icons.show.path;
  // sort
  static final String sortIcon = Assets.icons.sort.path;
  // sort_highest_lowest
  static final String sortHighestLowestIcon =
      Assets.icons.sortHighestLowest.path;
  // success
  static final String successIcon = Assets.icons.success.path;
  // transaction
  static final String transactionIcon = Assets.icons.transaction.path;
  // transaction_color
  static final String transactionColorIcon = Assets.icons.transactionColor.path;
  // trash
  static final String trashIcon = Assets.icons.trash.path;
  // user
  static final String userIcon = Assets.icons.user.path;
  // wallet
  static final String walletIcon = Assets.icons.wallet.path;
  // warning
  static final String warningIcon = Assets.icons.warning.path;

  /*
    All illustrations are down below
  */
  // Export Data
  static final String exportDataIll = Assets.illustrations.exportData.path;
  // Gain total control of your money
  static final String gainTotalControlOfYourMoneyIll =
      Assets.illustrations.gainTotalControlOfYourMoney.path;
  // Know where your money goes
  static final String knowWhereYourMoneyGoesIll =
      Assets.illustrations.knowWhereYourMoneyGoes.path;
  // Planning ahead
  static final String planningAheadIll =
      Assets.illustrations.planningAhead.path;
  // Your email is on the way
  static final String yourEmailIsOnTheWayIll =
      Assets.illustrations.yourEmailIsOnTheWay.path;

  /*
    All mobile banking icons are down below
  */
  // Bkash
  static final String bkashIcon = Assets.icons.mobileBanking.bkash.path;
  // Nagad
  static final String nagadIcon = Assets.icons.mobileBanking.nagad.path;
  // Rocket
  static final String rocketIcon = Assets.icons.mobileBanking.rocket.path;
  // SureCash
  static final String sureCashIcon = Assets.icons.mobileBanking.surecash.path;
  // ucash
  static final String ucashIcon = Assets.icons.mobileBanking.ucash.path;
  // Upay
  static final String upayIcon = Assets.icons.mobileBanking.upay.path;
  // mCash
  static final String mCashIcon = Assets.icons.mobileBanking.mcash.path;
  // ok
  static final String okIcon = Assets.icons.mobileBanking.ok.path;
  // t-cash
  static final String tCashIcon = Assets.icons.mobileBanking.tcash.path;

  ///* get all mobile banking icons
  static List<String> get allMobileBankingIcons => [
        bkashIcon,
        nagadIcon,
        rocketIcon,
        sureCashIcon,
        ucashIcon,
        upayIcon,
        mCashIcon,
        okIcon,
        tCashIcon,
      ];
}
