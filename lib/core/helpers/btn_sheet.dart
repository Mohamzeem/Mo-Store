import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';

class AppFunctions {
  AppFunctions._();

  static Future<dynamic> showBtmSheet(
      {required bool isDismissible,
      required BuildContext context,
      required Widget body}) {
    return showModalBottomSheet(
      useSafeArea: true,
      barrierColor: AppColors.lightBlue.withOpacity(0.1),
      isScrollControlled: true,
      isDismissible: isDismissible,
      elevation: 10,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.bordersGrey,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: body,
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> addShowBtmSheet({
    required BuildContext context,
    required Widget body,
    VoidCallback? suffixIconFunction,
    String? photoUrl,
  }) async {
    AppFunctions.showBtmSheet(
      isDismissible: true,
      context: context,
      body: body,
    );
  }

  // static Future<void> permissionsDialog() {
  //   return Get.dialog(CupertinoAlertDialog(
  //     title: const Text('Permissions Denied'),
  //     content: const Text('Allow access to gallery and photos'),
  //     actions: [
  //       CupertinoDialogAction(
  //         child: const CustomText(text: 'cancel'),
  //         onPressed: () => Get.back(),
  //       ),
  //       const CupertinoDialogAction(
  //         isDefaultAction: true,
  //         onPressed: openAppSettings,
  //         child: Text('Settings'),
  //       )
  //     ],
  //   ));
  // }
}
