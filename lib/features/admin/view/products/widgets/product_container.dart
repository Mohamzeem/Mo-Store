import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/app/app_injection.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/btn_sheet.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';
import 'package:mo_store/core/widgets/custom_container_icon.dart';
import 'package:mo_store/features/admin/view/categories/widgets/del_categ_btn_body.dart';
import 'package:mo_store/features/admin/view/categories/widgets/update_category_btn_body.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

class ProductContainer extends StatelessWidget {
  final ProductsResponseBody productModel;
  const ProductContainer({super.key, required this.productModel});

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
              photoUrl: productModel.images!.first,
              width: 160,
              height: double.infinity,
              shape: BoxShape.rectangle,
              fit: BoxFit.fill,
              border: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Center(
                      child: Text(
                        productModel.title!,
                        maxLines: 2,
                        style: AppFonts.medium22Primary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  SizedBox(
                    width: 200.w,
                    child: Center(
                      child: Text(
                        '${productModel.price!} \$',
                        maxLines: 2,
                        style: AppFonts.medium22Primary.copyWith(
                            color: AppColors.black.withOpacity(0.4),
                            fontSize: 25.sp),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // AppFunctions.addShowBtmSheet(
                          //   context: context,
                          //   body: BlocProvider(
                          //     create: (context) => di<UploadImageCubit>(),
                          //     child: UpdateCategoryButtonSheetBody(
                          //       categoriesModel: categoriesModel,
                          //     ),
                          //   ),
                          // );
                        },
                        child: const CustomContainerIcon(
                          containerSize: 35,
                          iconSize: 25,
                          icon: Icons.edit,
                          iconColor: AppColors.white,
                        ),
                      ),
                      25.horizontalSpace,
                      InkWell(
                        onTap: () {
                          // AppFunctions.addShowBtmSheet(
                          //   context: context,
                          //   body: DeleteCategoryButtonBody(
                          //     categoriesModel: categoriesModel,
                          //   ),
                          // );
                        },
                        child: const CustomContainerIcon(
                          containerSize: 35,
                          iconSize: 25,
                          icon: Icons.delete,
                          iconColor: AppColors.redAccent,
                        ),
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
