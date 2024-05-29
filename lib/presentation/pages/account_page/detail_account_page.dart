// import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
// import 'package:expense_tracker/app/ui/src/colors.dart';
// import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
// import 'package:expense_tracker/domain/entities/card_of_expense/card_of_expense_entity.dart';
// import 'package:expense_tracker/presentation/pages/expensedetails/view/expensedetails_page.dart';
// import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/card_of_expense.dart';
// import 'package:expense_tracker/core/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DetailAccountPage extends StatelessWidget {
//   const DetailAccountPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: isDarkMode(context)
//             ? ExpenseTrackerColors.dark
//             : ExpenseTrackerColors.light,
//         title: const Text('Detail Account'),
//         actions: [
//           // edit icon btn
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.edit,
//               // color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 0.02.sh,
//           ),
//           Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   // color: ExpenseTrackerColors.light60,
//                   color: isDarkMode(context)
//                       ? ExpenseTrackerColors.dark50
//                       : ExpenseTrackerColors.light60,
//                   borderRadius: BorderRadius.circular(20.r),
//                 ),
//                 child: Image.asset(
//                   ExpenseAssets.sureCashIcon,
//                   height: 50.h,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   vertical: 0.01.sh,
//                 ),
//                 child: Text(
//                   'Paypal',
//                   style: ExpenseTrackerTextStyle.title2.copyWith(
//                     fontWeight: FontWeight.w600,
//                     // color: ExpenseTrackerColors.dark,
//                     color: isDarkMode(context)
//                         ? ExpenseTrackerColors.light40
//                         : ExpenseTrackerColors.dark,
//                   ),
//                 ),
//               ),
//               Text(
//                 '₦ 233.00',
//                 style: ExpenseTrackerTextStyle.title1.copyWith(
//                   fontWeight: FontWeight.w600,
//                   color: isDarkMode(context)
//                       ? ExpenseTrackerColors.light
//                       : ExpenseTrackerColors.dark50,
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             'Today',
//             style: ExpenseTrackerTextStyle.title3.copyWith(
//               fontWeight: FontWeight.w600,
//               letterSpacing: 0.5,
//               color: isDarkMode(context)
//                   ? ExpenseTrackerColors.light40
//                   : ExpenseTrackerColors.dark50,
//             ),
//           ),
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: 5,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     ExpensedetailsPage.route(ExpenseTrackerColors.red),
//                   );
//                 },
//                 child: const CardOfExpense(
//                   cardOfExpense: CardOfExpenseEntity(
//                     color: ExpenseTrackerColors.violet,
//                     title: 'householdRepairs',
//                     subtitle: 'Walmart',
//                     amount: 23,
//                     date: 'Today',
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
