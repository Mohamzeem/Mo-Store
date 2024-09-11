import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class AdminAppBar extends StatelessWidget {
  final String title;
  final int padding;
  final TextStyle? style;
  final bool isMain;

  const AdminAppBar({
    super.key,
    required this.title,
    this.padding = 0,
    this.style,
    this.isMain = true,
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
            isMain
                ? Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: InkWell(
                      onTap: () => ZoomDrawer.of(context)!.toggle(),
                      child: const Center(
                        child: Icon(
                          Icons.menu,
                          size: 25,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Text(
              title,
              style: style ?? AppFonts.appBarTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
