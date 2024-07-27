import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/route/routes.dart';

class CustomDialog {
  static Future<void> show({
    required BuildContext context,
    required String text,
    bool isSuccess = true,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      builder: (context) {
        Future.delayed(const Duration(seconds: 1), () => context.pop());
        return AlertDialog(
          backgroundColor: isSuccess ? Colors.greenAccent : Colors.redAccent,
          surfaceTintColor: isSuccess ? Colors.greenAccent : Colors.redAccent,
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  static void awsomeSuccess(BuildContext context, String? title,
      void Function(DismissType) onDismissCallback) {
    AwesomeDialog(
      customHeader: CircleAvatar(
        backgroundColor: AppColors.lightBlue,
        radius: 45.r,
        child: Icon(
          Icons.done,
          size: 70.r,
          color: AppColors.white,
        ),
      ),
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: title,
      titleTextStyle: AppFonts.regular20Primary,
      btnOkOnPress: () {},
      btnOkColor: AppColors.lightBlue,
      context: context,
      headerAnimationLoop: false,
      autoDismiss: true,
      autoHide: const Duration(seconds: 1),
      transitionAnimationDuration: const Duration(milliseconds: 500),
      onDismissCallback: onDismissCallback,
    ).show();
  }

  static Future<void> awsomeError(
    BuildContext context,
    String? title,
  ) async {
    AwesomeDialog(
      customHeader: CircleAvatar(
        backgroundColor: AppColors.redAccent,
        radius: 45.r,
        child: Icon(
          Icons.close,
          size: 70.r,
          color: AppColors.white,
        ),
      ),
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: title,
      titleTextStyle: AppFonts.regular20Primary,
      btnOkOnPress: () {},
      btnOkColor: AppColors.redAccent,
      context: context,
      headerAnimationLoop: false,
      onDismissCallback: (type) {},
      autoDismiss: true,
      autoHide: const Duration(seconds: 1),
      transitionAnimationDuration: const Duration(milliseconds: 500),
    ).show();
  }

  static Future<void> awsomeTwoButtons(
    BuildContext context,
    String? title,
    VoidCallback? onPressOk,
  ) async {
    AwesomeDialog(
      customHeader: CircleAvatar(
        backgroundColor: AppColors.lightBlue,
        radius: 45.r,
        child: Icon(
          Icons.logout,
          size: 70.r,
          color: AppColors.white,
        ),
      ),
      dialogType: DialogType.question,
      animType: AnimType.bottomSlide,
      title: title,
      titleTextStyle: AppFonts.regular20Primary,
      btnOkOnPress: onPressOk,
      btnOkColor: AppColors.lightBlue,
      btnCancelOnPress: () => context.pop(),
      btnCancelColor: AppColors.primaryColor,
      context: context,
      headerAnimationLoop: false,
      autoDismiss: false,
      onDismissCallback: (type) {},
      // autoHide: const Duration(seconds: 1),
      transitionAnimationDuration: const Duration(milliseconds: 500),
    ).show();
  }
}
