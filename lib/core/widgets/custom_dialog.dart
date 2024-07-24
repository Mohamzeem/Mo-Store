import 'package:flutter/material.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';

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
}
