import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isArrowBack;
  final int padding;
  final TextStyle? style;
  final VoidCallback? backBtn;
  final Widget? endWidget;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isArrowBack = false,
    this.padding = 0,
    this.style,
    this.backBtn,
    this.endWidget = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: SizedBox(
        height: 40.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 320.w,
              child: Text(
                title,
                style: style ?? AppFonts.appBarTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            isArrowBack
                ? Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: InkWell(
                      onTap: backBtn ?? () => context.pop(),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  )
                : endWidget!,
          ],
        ),
      ),
    );
  }
}
