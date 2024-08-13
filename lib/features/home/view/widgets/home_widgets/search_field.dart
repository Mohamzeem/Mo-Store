import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class SearchField extends StatelessWidget {
  final bool closeSearch;
  const SearchField({
    super.key,
    this.closeSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 45.h,
        child: TextFormField(
          controller: TextEditingController(),
          keyboardType: TextInputType.text,
          inputFormatters: [LengthLimitingTextInputFormatter(20)],
          cursorColor: AppColors.primaryColor,
          textInputAction: TextInputAction.done,
          maxLines: 1,
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {},
              child: closeSearch
                  ? const Icon(
                      Icons.close,
                      color: AppColors.lightBlue,
                    )
                  : const Icon(
                      Icons.circle_outlined,
                      color: AppColors.lightBlue,
                    ),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
            fillColor: AppColors.white,
            filled: true,
            label: Text(
              'search',
              style: AppFonts.regular18LightBlue,
            ),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                borderSide:
                    BorderSide(width: 0.5, color: AppColors.bordersGrey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                borderSide:
                    BorderSide(width: 0.5, color: AppColors.bordersGrey)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(width: 0.5, color: AppColors.lightBlue)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(width: 0.5, color: AppColors.redAccent)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(width: 0.5, color: AppColors.redAccent)),
          ),
        ),
      ),
    );
  }
}
