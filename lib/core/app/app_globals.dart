import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/consts/pref_keys.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/core/local_database/local_database.dart';
import 'package:mo_store/core/local_database/shared_prefs.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';

class AppGlobals {
  bool isUserLoggedIn = false;
  static const String appFont = 'Raleway';
  static const Size appSize = Size(411.42857142857144, 867.4285714285714);

  checkUserLoggedIn() async {
    String token = await SharedPrefHelper.getSecuredString(PrefKeys.userToken);
    if (token.isNullOrEmptyString()) {
      isUserLoggedIn = false;
    } else {
      isUserLoggedIn = true;
    }
    Prints.debug(message: 'isUserLoggedIn => $isUserLoggedIn');
    Prints.debug(message: 'token => $token');
  }

  static void systemOverlay() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.white,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static void logOut(BuildContext context) {
    CustomDialog.awsomeTwoButtons(
      context,
      'Logout',
      onPressCancel: () {},
      onPressOk: () {
        SharedPrefHelper.clearAllSecuredData();
        SharedPrefHelper.clearAllData();
        LocalDatabase().clearAllData();
        CustomDialog.awsomeSuccess(
          context,
          'Logged out successfully',
          (onDismiss) => context.pushNamedAndRemoveUntil(
            Routes.loginView,
            predicate: (route) => false,
          ),
        );
      },
    );
  }
}
