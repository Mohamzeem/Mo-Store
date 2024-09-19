import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';

class AppFunctions {
  AppFunctions._();

  static Future<dynamic> showBtmSheet(
      {required bool isDismissible,
      required BuildContext context,
      required List<Widget> body}) {
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
              child: ListView(
                shrinkWrap: true,
                children: body,
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> addShowBtmSheet({
    required BuildContext context,
    required TextEditingController controller,
    required String title,
    required String lable,
    required String buttonText,
    required IconData sheetIcon,
    required IconData prefixIcon,
    required VoidCallback onPressedbutton,
    required VoidCallback onTapSheetIcon,
    VoidCallback? suffixIconFunction,
    bool obscureText = false,
    bool suffixIconShow = false,
  }) async {
    AppFunctions.showBtmSheet(
      isDismissible: true,
      context: context,
      body: [
        Text(
          title,
          style: AppFonts.regular18LightBlue
              .copyWith(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
        10.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          height: 150,
          width: double.infinity,
          child: InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_a_photo_outlined,
                  size: 70.r,
                  color: AppColors.lightBlue,
                ),
                Text('Add Category Photo', style: AppFonts.regular18LightBlue),
              ],
            ),
          ),
        ),
        10.verticalSpace,

        CustomTextFormField(
          padding: 0,
          obscureText: obscureText,
          suffixIconShow: suffixIconShow,
          suffixIconFunction: suffixIconFunction,
          label: lable,
          maxLength: 50,
          controller: controller,
          keyBoard: TextInputType.emailAddress,
          filled: AppColors.lightGrey,
        ),
        10.verticalSpace,
        CustomButton(
          padding: 0,
          onPressed: onPressedbutton,
          text: buttonText,
          width: double.infinity,
          height: 45,
          threeRadius: 10,
          lastRadius: 10,
          backgroundColor: AppColors.lightBlue,
        ),
        // SizedBox(height: Platform.isIOS ? 0.h : 0.h),
      ],
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
