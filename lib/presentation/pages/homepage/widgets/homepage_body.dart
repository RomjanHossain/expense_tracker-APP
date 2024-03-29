import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/dropdown_months.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/ie_small_card.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/segmented_button_wid.dart';
import 'package:expense_tracker/presentation/widgets/charts/line_charts.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// {@template homepage_body}
/// Body of the HomepagePage.
///
/// Add what it does
/// {@endtemplate}
class HomepageBody extends StatelessWidget {
  /// {@macro homepage_body}
  const HomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageBloc, HomepageState>(
      builder: (context, state) {
        final width = MediaQuery.sizeOf(context).width;
        debugPrint('Width: ${width}');
        return CustomScrollView(
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
              title: width > 265 ? const DropdownMonths() : null,
              // leading: Container(
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50).r,
              //     color: ExpenseTrackerColors.violet,
              //   ),
              //   child: Text('x'),
              // ),
              leading: Center(
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: ExpenseTrackerColors.violet80,
                  child: CircleAvatar(
                    radius: 22.r,
                    backgroundColor: ExpenseTrackerColors.light,
                  ),
                  // child: avatar != null
                  //     ? FutureBuilder<Uint8List?>(
                  //         future: avatar.asRawSvgBytes(),
                  //         builder: (context, snapshot) {
                  //           // return SvgPicture.network(
                  //           //   avatar.svgUri.toString(),
                  //           // );
                  //           if (snapshot.connectionState !=
                  //               ConnectionState.done) {
                  //             return const CircularProgressIndicator();
                  //           }
                  //           if (snapshot.hasError) {
                  //             return const Icon(Icons.error);
                  //           }
                  //           if (snapshot.data == null) {
                  //             return const Icon(Icons.error);
                  //           }
                  //           return SvgPicture.memory(
                  //             snapshot.data!,
                  //             fit: BoxFit.cover,
                  //             width: double.infinity,
                  //           );
                  //         },
                  //       )
                  //     : null,
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
            //NOTE: a graph for showing todays expense
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
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 15.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: ExpenseTrackerTextStyle.title3.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 19.sp,
                        color: isDarkMode(context)
                            ? ExpenseTrackerColors.light
                            : ExpenseTrackerColors.dark,
                      ),
                    ),
                    FilledButton.tonal(
                      style: ButtonStyle(
                        // minimumSize: MaterialStateProperty.all(
                        //   Size(20.w, 40.h),
                        // ),
                        backgroundColor: MaterialStateProperty.all(
                          ExpenseTrackerColors.violet20,
                        ),
                        side: MaterialStateProperty.all(
                          BorderSide.none,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        width > 260 ? 'see all' : '...',
                        style: ExpenseTrackerTextStyle.body3.copyWith(
                          color: ExpenseTrackerColors.violet,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //NOTE: list of transactions
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
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20).r,
                            color: ExpenseTrackerColors.violet20,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
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
                                // fontSize: 21.sp,
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
                            fontSize: 16.sp,
                            color: ExpenseTrackerColors.red,
                          ),
                        ),
                        Text(
                          '${now.hour}:${now.minute}' ' AM',
                          style: ExpenseTrackerTextStyle.small.copyWith(
                            color: ExpenseTrackerColors.light20,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
