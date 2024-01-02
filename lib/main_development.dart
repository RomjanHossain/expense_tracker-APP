import 'package:expense_tracker/app/app.dart';
import 'package:expense_tracker/bootstrap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() async{
    await ScreenUtil.ensureScreenSize();
  await bootstrap(() => const App());
}
