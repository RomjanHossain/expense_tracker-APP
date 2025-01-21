// // ignore_for_file: cascade_invocations, lines_longer_than_80_chars

// import 'package:flutter/rendering.dart';

// //Copy this CustomPainter code to the Bottom of the File
// class TransactionShape extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final path_0 = Path();
//     path_0.moveTo(18, 25);
//     path_0.lineTo(18, 24.618);
//     path_0.lineTo(18.624, 24.93);
//     path_0.arcToPoint(
//       const Offset(29.378, 40),
//       radius: const Radius.elliptical(11.357, 11.357),
//       clockwise: false,
//     );
//     path_0.lineTo(30.622, 40);
//     path_0.arcToPoint(
//       const Offset(38.878, 20.815),
//       radius: const Radius.elliptical(11.362, 11.362),
//       clockwise: false,
//     );
//     path_0.arcToPoint(
//       const Offset(38.234, 18),
//       radius: const Radius.elliptical(2.935, 2.935),
//       clockwise: false,
//     );
//     path_0.arcToPoint(
//       const Offset(38.234, 14),
//       radius: const Radius.elliptical(2.994, 2.994),
//       clockwise: false,
//     );
//     path_0.arcToPoint(
//       const Offset(36, 9),
//       radius: const Radius.elliptical(3, 3),
//       clockwise: false,
//     );
//     path_0.arcToPoint(
//       const Offset(35.848, 9.012),
//       radius: const Radius.elliptical(0.964, 0.964),
//       clockwise: false,
//     );
//     path_0.lineTo(34.474, 9.223);
//     path_0.lineTo(35.974, 3.2430000000000003);
//     path_0.arcToPoint(
//       const Offset(34.449, 2.168),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(32.277, 3.6130000000000004);
//     path_0.lineTo(30.831, 1.4450000000000003);
//     path_0.arcToPoint(
//       const Offset(29.131, 1.4960000000000002),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(27.6, 4.124);
//     path_0.lineTo(25.428, 3.1);
//     path_0.arcToPoint(
//       const Offset(24.028000000000002, 4.246),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(24.6, 6.527000000000001);
//     path_0.lineTo(18, 9.461);
//     path_0.lineTo(18, 9);
//     path_0.arcToPoint(
//       const Offset(17, 8),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(9, 8);
//     path_0.arcToPoint(
//       const Offset(8, 9),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(1, 9);
//     path_0.lineTo(1, 11);
//     path_0.lineTo(8, 11);
//     path_0.lineTo(8, 23);
//     path_0.lineTo(1, 23);
//     path_0.lineTo(1, 25);
//     path_0.lineTo(8, 25);
//     path_0.arcToPoint(
//       const Offset(9, 26),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(17, 26);
//     path_0.arcToPoint(
//       const Offset(18, 25),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.close();
//     path_0.moveTo(40, 28.622);
//     path_0.arcToPoint(
//       const Offset(30.622, 38),
//       radius: const Radius.elliptical(9.389, 9.389),
//     );
//     path_0.lineTo(29.378, 38);
//     path_0.arcToPoint(
//       const Offset(20.429000000000002, 25.833),
//       radius: const Radius.elliptical(9.365, 9.365),
//     );
//     path_0.lineTo(22.553, 26.9);
//     path_0.arcToPoint(
//       const Offset(23, 27),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(27, 27);
//     path_0.arcToPoint(
//       const Offset(30, 30),
//       radius: const Radius.elliptical(3, 3),
//       clockwise: false,
//     );
//     path_0.arcToPoint(
//       const Offset(29, 31),
//       radius: const Radius.elliptical(1, 1),
//       largeArc: true,
//     );
//     path_0.lineTo(27, 31);
//     path_0.arcToPoint(
//       const Offset(29, 33.816),
//       radius: const Radius.elliptical(3, 3),
//       clockwise: false,
//     );
//     path_0.lineTo(29, 36);
//     path_0.lineTo(31, 36);
//     path_0.lineTo(31, 33.816);
//     path_0.arcToPoint(
//       const Offset(30, 28),
//       radius: const Radius.elliptical(2.993, 2.993),
//       clockwise: false,
//     );
//     path_0.arcToPoint(
//       const Offset(29, 27),
//       radius: const Radius.elliptical(1, 1),
//     );
//     path_0.lineTo(34, 27);
//     path_0.arcToPoint(
//       const Offset(36.789, 22.9),
//       radius: const Radius.elliptical(3, 3),
//       clockwise: false,
//     );
//     path_0.arcToPoint(
//       const Offset(37.698, 22.474),
//       radius: const Radius.elliptical(2.994, 2.994),
//       clockwise: false,
//     );
//     path_0.arcToPoint(
//       const Offset(40, 28.622),
//       radius: const Radius.elliptical(9.413, 9.413),
//     );
//     path_0.close();
//     path_0.moveTo(27.572, 6.324);
//     path_0.arcToPoint(
//       const Offset(28.863, 5.9239999999999995),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(30.055, 3.8849999999999993);
//     path_0.lineTo(31.168, 5.553999999999999);
//     path_0.arcToPoint(
//       const Offset(32.555, 5.8309999999999995),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(33.402, 5.266);
//     path_0.lineTo(32.331, 9.553);
//     path_0.lineTo(27.599000000000004, 10.281);
//     path_0.lineTo(26.482000000000003, 5.808000000000001);
//     path_0.close();
//     path_0.moveTo(18, 11.65);
//     path_0.lineTo(25.093, 8.5);
//     path_0.lineTo(25.615, 10.589);
//     path_0.lineTo(22.848, 11.015);
//     path_0.lineTo(23.148, 12.991);
//     path_0.lineTo(36.063, 11);
//     path_0.arcToPoint(
//       const Offset(36, 13),
//       radius: const Radius.elliptical(1, 1),
//     );
//     path_0.lineTo(33, 13);
//     path_0.lineTo(33, 15);
//     path_0.lineTo(36, 15);
//     path_0.arcToPoint(
//       const Offset(36, 17),
//       radius: const Radius.elliptical(1, 1),
//     );
//     path_0.lineTo(33, 17);
//     path_0.lineTo(33, 19);
//     path_0.lineTo(36, 19);
//     path_0.arcToPoint(
//       const Offset(36, 21),
//       radius: const Radius.elliptical(1, 1),
//     );
//     path_0.lineTo(33, 21);
//     path_0.lineTo(33, 23);
//     path_0.lineTo(34, 23);
//     path_0.arcToPoint(
//       const Offset(34, 25),
//       radius: const Radius.elliptical(1, 1),
//     );
//     path_0.lineTo(23.236, 25);
//     path_0.lineTo(18, 22.382);
//     path_0.close();
//     path_0.moveTo(16, 24);
//     path_0.lineTo(10, 24);
//     path_0.lineTo(10, 10);
//     path_0.lineTo(16, 10);
//     path_0.close();
//     path_0.moveTo(63, 48);
//     path_0.lineTo(63, 46);
//     path_0.lineTo(58, 46);
//     path_0.arcToPoint(
//       const Offset(57, 45),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(49, 45);
//     path_0.arcToPoint(
//       const Offset(48, 46),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(48, 47.6);
//     path_0.arcToPoint(
//       const Offset(41.528999999999996, 45),
//       radius: const Radius.elliptical(9.313, 9.313),
//       clockwise: false,
//     );
//     path_0.lineTo(40.236, 45);
//     path_0.arcToPoint(
//       const Offset(36.436, 47),
//       radius: const Radius.elliptical(4.587, 4.587),
//       clockwise: false,
//     );
//     path_0.lineTo(30, 47);
//     path_0.arcToPoint(
//       const Offset(27.472, 48.4),
//       radius: const Radius.elliptical(2.992, 2.992),
//       clockwise: false,
//     );
//     path_0.lineTo(22.521, 44.22);
//     path_0.arcToPoint(
//       const Offset(16, 46.751),
//       radius: const Radius.elliptical(3.752, 3.752),
//       clockwise: false,
//     );
//     path_0.lineTo(16, 46.943999999999996);
//     path_0.arcToPoint(
//       const Offset(16.963, 49.45399999999999),
//       radius: const Radius.elliptical(3.749, 3.749),
//       clockwise: false,
//     );
//     path_0.lineTo(23.25, 56.43899999999999);
//     path_0.arcToPoint(
//       const Offset(28.945, 59),
//       radius: const Radius.elliptical(7.713, 7.713),
//       clockwise: false,
//     );
//     path_0.lineTo(48, 59.951);
//     path_0.lineTo(48, 62);
//     path_0.arcToPoint(
//       const Offset(49, 63),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(57, 63);
//     path_0.arcToPoint(
//       const Offset(58, 62),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.lineTo(63, 62);
//     path_0.lineTo(63, 60);
//     path_0.lineTo(58, 60);
//     path_0.lineTo(58, 48);
//     path_0.close();
//     path_0.moveTo(48, 57.949);
//     path_0.lineTo(29, 57);
//     path_0.arcToPoint(
//       const Offset(24.736, 55.1),
//       radius: const Radius.elliptical(5.745, 5.745),
//     );
//     path_0.lineTo(18.450000000000003, 48.116);
//     path_0.arcToPoint(
//       const Offset(18.000000000000004, 46.944),
//       radius: const Radius.elliptical(1.752, 1.752),
//     );
//     path_0.lineTo(18.000000000000004, 46.751000000000005);
//     path_0.arcToPoint(
//       const Offset(21.069000000000003, 45.6),
//       radius: const Radius.elliptical(1.751, 1.751),
//     );
//     path_0.arcToPoint(
//       const Offset(21.178000000000004, 45.706),
//       radius: const Radius.elliptical(1.091, 1.091),
//       clockwise: false,
//     );
//     path_0.lineTo(27.089000000000006, 50.694);
//     path_0.arcToPoint(
//       const Offset(30, 53),
//       radius: const Radius.elliptical(3, 3),
//       clockwise: false,
//     );
//     path_0.lineTo(37, 53);
//     path_0.lineTo(37, 51);
//     path_0.lineTo(30, 51);
//     path_0.arcToPoint(
//       const Offset(30, 49),
//       radius: const Radius.elliptical(1, 1),
//     );
//     path_0.lineTo(37, 49);
//     path_0.arcToPoint(
//       const Offset(37.9, 48.447),
//       radius: const Radius.elliptical(1, 1),
//       clockwise: false,
//     );
//     path_0.arcToPoint(
//       const Offset(40.236, 47),
//       radius: const Radius.elliptical(2.6, 2.6),
//     );
//     path_0.lineTo(41.528999999999996, 47);
//     path_0.arcToPoint(
//       const Offset(46.736, 49.149),
//       radius: const Radius.elliptical(7.323, 7.323),
//     );
//     path_0.arcToPoint(
//       const Offset(48, 51.256),
//       radius: const Radius.elliptical(22.034, 22.034),
//     );
//     path_0.close();
//     path_0.moveTo(56, 61);
//     path_0.lineTo(50, 61);
//     path_0.lineTo(50, 47);
//     path_0.lineTo(56, 47);
//     path_0.close();

//     Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
//     paint_0_fill.color = const Color(0xff000000).withOpacity(1.0);
//     canvas.drawPath(path_0, paint_0_fill);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
