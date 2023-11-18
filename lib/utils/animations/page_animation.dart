// import 'package:animations/animations.dart';
// import 'package:flutter/material.dart';

// class PageAnimationWrapper {
// // fade through transition page wrapper
//   static Route fadeThroughTransitionPageWrapper(Widget nxtPage) =>
//       PageRouteBuilder(
//         transitionsBuilder: (
//           BuildContext context,
//           Animation<double> animation,
//           Animation<double> secondaryAnimation,
//           Widget child,
//         ) =>
//             FadeThroughTransition(
//           fillColor: Theme.of(context).scaffoldBackgroundColor,
//           animation: animation,
//           secondaryAnimation: secondaryAnimation,
//           child: child,
//         ),
//         pageBuilder: (
//           BuildContext context,
//           Animation<double> animation,
//           Animation<double> secondaryAnimation,
//         ) =>
//             nxtPage,
//       );

// // shared axis transition page wrapper
//   static Route sharedAxisTransitionPageWrapper(Widget nxtPage) =>
//       PageRouteBuilder(
//         transitionsBuilder: (
//           BuildContext context,
//           Animation<double> animation,
//           Animation<double> secondaryAnimation,
//           Widget child,
//         ) =>
//             SharedAxisTransition(
//           fillColor: Theme.of(context).cardColor,
//           animation: animation,
//           secondaryAnimation: secondaryAnimation,
//           transitionType: SharedAxisTransitionType.scaled,
//           child: child,
//         ),
//         pageBuilder: (
//           BuildContext context,
//           Animation<double> animation,
//           Animation<double> secondaryAnimation,
//         ) =>
//             nxtPage,
//       );
// }