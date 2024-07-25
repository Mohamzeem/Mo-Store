import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/app/app_globals.dart';
import 'package:mo_store/core/app/app_injection.dart';
import 'package:mo_store/core/app/app_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInjection.injectorInit();
  await ScreenUtil.ensureScreenSize();
  AppGlobals.systemOverlay();
  await AppGlobals.checkUserLoggedIn();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(const AppView());
  });
}
