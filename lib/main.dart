import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/app/app_globals.dart';
import 'package:mo_store/core/app/app_injection.dart';
import 'package:mo_store/core/app/app_view.dart';
import 'package:mo_store/core/app/bloc_observer.dart';
import 'package:mo_store/core/local_database/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await AppInjection.injectorInit();
  await ScreenUtil.ensureScreenSize();
  await AppGlobals().checkUserLoggedIn();
  AppGlobals.systemOverlay();
  await LocalDatabase().initLocalDatabase();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(const AppView());
  });
}
