import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/all_months.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/dropdown_months.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/ie_small_card.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/segmented_button_wid.dart';
import 'package:expense_tracker/presentation/pages/homepage/widgets/homepage_body.dart';
import 'package:expense_tracker/presentation/widgets/charts/line_charts.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// {@template homepage_page}
/// A description for HomepagePage
/// {@endtemplate}
class HomepagePage extends StatefulWidget {
  /// {@macro homepage_page}
  const HomepagePage({super.key});

  /// The static route for HomepagePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomepagePage());
  }

  @override
  State<HomepagePage> createState() => _HomepagePageState();
}

class _HomepagePageState extends State<HomepagePage> {
  String? dpValue = calanderMonths[0];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => HomepageBloc(),
      child: Scaffold(
        // backgroundColor: Colors.red,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: 250.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(20).r,
                      bottomRight: const Radius.circular(20).r,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        if (isDarkMode(context)) ...[
                          ExpenseTrackerColors.violet60,
                          ExpenseTrackerColors.violet40,
                        ] else ...[
                          const Color(0x0ffff6e5),
                          const Color(0xffF8EDD8),
                        ],
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Account Balance',
                        style: ExpenseTrackerTextStyle.body3.copyWith(
                          color: isDarkMode(context)
                              ? ExpenseTrackerColors.dark25
                              : ExpenseTrackerColors.light20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        child: Text(
                          r'$1000',
                          style: ExpenseTrackerTextStyle.title1.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      height10,
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: width > 265
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 0.45.sw,
                                    child: IESmallCard(
                                      svgAsset: ExpenseAssets.incomeIcon,
                                      color: ExpenseTrackerColors.green,
                                      title: 'Income',
                                      money: '2024',
                                    ),
                                  ),
                                  width10,
                                  SizedBox(
                                    width: 0.45.sw,
                                    child: IESmallCard(
                                      svgAsset: ExpenseAssets.expenseIcon,
                                      color: ExpenseTrackerColors.red,
                                      title: 'Expense',
                                      money: '2023',
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    width: 0.5.sw,
                                    child: IESmallCard(
                                      svgAsset: ExpenseAssets.incomeIcon,
                                      color: ExpenseTrackerColors.green,
                                      title: 'Income',
                                      money: '2024',
                                    ),
                                  ),
                                  height10,
                                  SizedBox(
                                    width: 0.5.sw,
                                    child: IESmallCard(
                                      svgAsset: ExpenseAssets.expenseIcon,
                                      color: ExpenseTrackerColors.red,
                                      title: 'Expense',
                                      money: '2023',
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              title: const DropdownMonths(),
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: ExpenseTrackerColors.violet,
                ),
              ),
              actions: [
                SvgPicture.asset(
                  ExpenseAssets.notificationIcon,
                  color: ExpenseTrackerColors.violet,
                  height: 24.h,
                ),
              ],
            ),
            //* a graph for showing todays expense
            SliverToBoxAdapter(
              child: SizedBox(
                height: 240.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15).h,
                      child: Text(
                        'Spend Frequency',
                        style: ExpenseTrackerTextStyle.title3.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: isDarkMode(context)
                              ? ExpenseTrackerColors.light
                              : ExpenseTrackerColors.dark,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: ExpenseLineGraph(
                        spots: [
                          FlSpot(0, 3),
                          FlSpot(2.6, 2),
                          FlSpot(4.9, 5),
                          FlSpot(6.8, 3.1),
                          FlSpot(8, 4),
                          FlSpot(9.5, 3),
                          FlSpot(11, 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///* segmented buttons
            const SliverToBoxAdapter(
              child: HomeSegmentedButtonsWidget(),
            ),

            /// * recent transactions
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: ExpenseTrackerTextStyle.title3.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: isDarkMode(context)
                            ? ExpenseTrackerColors.light
                            : ExpenseTrackerColors.dark,
                      ),
                    ),
                    FilledButton.tonal(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          ExpenseTrackerColors.violet20,
                        ),
                        side: MaterialStateProperty.all(
                          BorderSide.none,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'see all',
                        style: ExpenseTrackerTextStyle.body3.copyWith(
                          color: ExpenseTrackerColors.violet,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///* list of transactions
            SliverList.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                final now = DateTime.now();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: ExpenseTrackerColors.violet20,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.h),
                          child: SvgPicture.asset(
                            'assets/icons/expense.svg',
                            color: ExpenseTrackerColors.violet,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Shopping',
                              style: ExpenseTrackerTextStyle.body1.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                // color: ExpenseTrackerColors.dark25,
                                color: isDarkMode(context)
                                    ? ExpenseTrackerColors.light
                                    : ExpenseTrackerColors.dark,
                              ),
                            ),
                            Text(
                              '${'Buy some groceries from the storxxxxxxxxxxxxxxxxxxxxe'.substring(0, 18)}...',
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: ExpenseTrackerTextStyle.body3.copyWith(
                                // color: ExpenseTrackerColors.light20,
                                color: isDarkMode(context)
                                    ? ExpenseTrackerColors.light20
                                    : ExpenseTrackerColors.dark25,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '-123',
                          style: ExpenseTrackerTextStyle.title3.copyWith(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: ExpenseTrackerColors.red,
                          ),
                        ),
                        Text(
                          '${now.hour}:${now.minute}' ' AM',
                          style: ExpenseTrackerTextStyle.small.copyWith(
                            color: ExpenseTrackerColors.light20,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
                // return ListTile(
                //   title: const Text('Shopping'),
                //   trailing: const Column(children: [
                //     Text('-123'),
                //     Text('10 AM'),
                //   ]),
                //   subtitle: const Text(
                //     'Buy some groceries from the store',
                //   ),
                //   isThreeLine: true,
                //   leading: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(50.r),
                //       color: ExpenseTrackerColors.violet,
                //     ),
                //     child: const Icon(
                //       Icons.shopping_bag,
                //       // color: ExpenseTrackerExpenseTrackerColors.white,
                //     ),
                //   ),
                // );
              },
            ),
            const SliverToBoxAdapter(
              child: HomepageView(),
            ),
          ],
        ),
      ),
    );
  }
}

/// {@template homepage_view}
/// Displays the Body of HomepageView
/// {@endtemplate}
class HomepageView extends StatelessWidget {
  /// {@macro homepage_view}
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomepageBody();
  }
}
