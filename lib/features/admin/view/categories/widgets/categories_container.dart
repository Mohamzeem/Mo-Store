import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/btn_sheet.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';
import 'package:mo_store/core/widgets/custom_container_icon.dart';
import 'package:mo_store/features/admin/view/categories/widgets/update_category_btn_body.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';

class CategoryContainer extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const CategoryContainer({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.w, left: 20.w, right: 20.w),
      child: Container(
        height: 140.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          color: AppColors.lightGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCachedImage(
              photoUrl: categoriesModel.image!,
              width: 220,
              height: double.infinity,
              shape: BoxShape.rectangle,
              fit: BoxFit.fill,
              border: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140.w,
                    child: Center(
                      child: Text(
                        categoriesModel.name!,
                        maxLines: 3,
                        style: AppFonts.medium30Primary,
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          AppFunctions.addShowBtmSheet(
                            context: context,
                            body: UpdateCategoryButtonSheetBody(
                              categoriesModel: categoriesModel,
                            ),
                          );
                        },
                        child: const CustomContainerIcon(
                          containerSize: 35,
                          iconSize: 25,
                          icon: Icons.edit,
                          iconColor: AppColors.white,
                        ),
                      ),
                      25.horizontalSpace,
                      const CustomContainerIcon(
                        containerSize: 35,
                        iconSize: 25,
                        icon: Icons.delete,
                        iconColor: AppColors.redAccent,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
