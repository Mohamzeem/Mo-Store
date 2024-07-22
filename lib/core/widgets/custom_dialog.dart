import 'package:flutter/material.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';

class CustomDialog {
  static Future<void> success({
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
          backgroundColor: isSuccess
              ? AppColors.primaryColor.withOpacity(0.8)
              : Colors.redAccent,
          surfaceTintColor: isSuccess
              ? AppColors.primaryColor.withOpacity(0.4)
              : Colors.redAccent,
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  // static Future<void> oneButtonDialog({
  //   required BuildContext context,
  //   required String textBody,
  //   required String textButton,
  //   required void Function() onPressed,
  // }) async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (context) {
  //       return AlertDialog(
  //         backgroundColor: AppColors.kWhite,
  //         title: SizedBox(
  //             width: 200.w,
  //             height: 200.h,
  //             child: const Icon(Icons.account_circle_sharp)),
  //         content: CustomText(
  //           text: textBody,
  //         ),
  //         actions: [
  //           CustomButton(
  //             onPressed: onPressed,
  //             text: textButton,
  //             width: 320,
  //             height: 45,
  //             lastRadius: 10,
  //             threeRadius: 10,
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  // static Future<void> twoButtonDialog({
  //   required BuildContext context,
  //   required String textBody,
  //   Color? backGroundColor,
  //   required String textButton1,
  //   required String textButton2,
  //   required void Function() onPressed,
  // }) async {
  //   showDialog(
  //     barrierDismissible: true,
  //     barrierColor: AppColors.mainColor.withOpacity(0.1),
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       elevation: 10,
  //       surfaceTintColor: backGroundColor ?? AppColors.kWhite,
  //       backgroundColor: backGroundColor ?? AppColors.kWhite,
  //       title: Center(
  //         child: CustomText(
  //           text: textBody,
  //           softWrap: true,
  //           color: AppColors.mainColor,
  //           fontSize: 22,
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       actions: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             CustomButton(
  //               onPressed: onPressed,
  //               text: textButton1,
  //               width: 80,
  //               height: 40,
  //               fontSize: 16,
  //             ),
  //             CustomButton(
  //               onPressed: () => Get.back(),
  //               text: textButton2,
  //               width: 80,
  //               height: 40,
  //               fontSize: 16,
  //               backgroundColor: AppColors.kBlack,
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
