import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/all_months.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/dropdown_months.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/ie_small_card.dart';
import 'package:expense_tracker/presentation/pages/homepage/widgets/homepage_body.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
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
    return BlocProvider(
      create: (context) => HomepageBloc(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250.h,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0x0ffff6e5),
                        Color(0xffF8EDD8),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Account Balance',
                        style: ExpenseTrackerTextStyle.regular3.copyWith(
                          color: ExpenseTrackerColors.light20,
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IESmallCard(
                            svgAsset: ExpenseAssets.incomeIcon,
                            color: ExpenseTrackerColors.green,
                            title: 'Income',
                            money: '2024',
                          ),
                          IESmallCard(
                            svgAsset: ExpenseAssets.expenseIcon,
                            color: ExpenseTrackerColors.red,
                            title: 'Expense',
                            money: '2023',
                          ),
                        ],
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
              // bottom: PreferredSize(
              //   preferredSize: const Size.fromHeight(100),
              //   child: Container(
              //     color: Colors.lime,
              //     margin: const EdgeInsets.only(bottom: 10),
              //     child: const Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Text(
              //           'Account Balance',
              //           style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         Text(
              //           '\$1000',
              //           style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         Row(
              //           children: [
              //             Text('income'),
              //             Text('expense'),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ),
            // a graph for showing todays expense
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
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1.7,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                            // color: Color(0xff232d37),
                          ),
                          child: LineChart(
                            LineChartData(
                              gridData: const FlGridData(
                                show: false,
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              titlesData: const FlTitlesData(
                                show: false,
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: const [
                                    FlSpot(0, 3),
                                    FlSpot(2.6, 2),
                                    FlSpot(4.9, 5),
                                    FlSpot(6.8, 3.1),
                                    FlSpot(8, 4),
                                    FlSpot(9.5, 3),
                                    FlSpot(11, 4),
                                  ],
                                  color: ExpenseTrackerColors.violet,
                                  isCurved: true,
                                  barWidth: 6.h,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(
                                    show: false,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffCA50FF).withOpacity(0.24),
                                        Color(0xff8B50FF).withOpacity(0),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: HomepageView(),
            ),
            SliverList.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                final now = DateTime.now();
                return ListTile(
                  title: Text('${calanderMonths[now.month - 1]} data $index'),
                );
              },
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
