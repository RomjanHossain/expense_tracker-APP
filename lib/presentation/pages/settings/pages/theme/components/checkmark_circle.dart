import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckMark extends StatelessWidget {
  const CheckMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15.r,
      backgroundColor: const Color(0xff5233FF),
      child: Center(
        child: Icon(
          Icons.check,
          size: 15.r,
        ),
      ),
    );
  }
}
