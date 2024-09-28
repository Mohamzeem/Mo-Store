import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_state.dart';

class DeleteCategoryButtonBody extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const DeleteCategoryButtonBody({
    super.key,
    required this.categoriesModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          'Delete Category',
          style: AppFonts.regular18LightBlue.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
        ),
        10.verticalSpace,
        // UpdateCategoryImage(categoriesModel: categoriesModel),

        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          height: 150,
          width: double.infinity,
          child: CustomCachedImage(
            photoUrl: categoriesModel.image!,
            height: 150,
            width: double.infinity,
            shape: BoxShape.rectangle,
            border: 20,
          ),
        ),

        10.verticalSpace,
        CustomTextFormField(
          padding: 0,
          label: categoriesModel.name!,
          maxLength: 50,
          keyBoard: TextInputType.emailAddress,
          filled: AppColors.lightGrey,
          readOnly: true,
        ),
        10.verticalSpace,
        BlocConsumer<CategoriesCubit, CategoriesState>(
          listener: (context, state) {
            state.whenOrNull(
              successDeleteCategories: () {
                context.pop();
                BlocProvider.of<CategoriesCubit>(context).getCategories();
                CustomDialog.show(
                  context: context,
                  text: 'Category Deleted Successfully',
                );
              },
              failureDeleteCategories: (message) => CustomDialog.awsomeError(
                context,
                message.toString(),
              ),
            );
          },
          builder: (context, state) {
            return CustomButton(
              padding: 0,
              text: 'Delete Category',
              onPressed: () {
                BlocProvider.of<CategoriesCubit>(context)
                    .deleteCategoryGraphQl(categoryId: categoriesModel.id!);
              },
              width: double.infinity,
              height: 45,
              threeRadius: 10,
              lastRadius: 10,
              backgroundColor: AppColors.lightBlue,
              isLoading: state.maybeWhen(
                orElse: () => false,
                loadingDeleteCategories: () => true,
              ),
            );
          },
        ),
      ],
    );

    // return BlocConsumer<CategoriesCubit, CategoriesState>(
    // listener: (context, state) {
    //   state.whenOrNull(
    //     successDeleteCategories: () {
    //       context.pop();
    //       BlocProvider.of<CategoriesCubit>(context).getCategories();
    //       CustomDialog.show(
    //         context: context,
    //         text: 'Category Deleted Successfully',
    //       );
    //     },
    //     failureDeleteCategories: (message) => CustomDialog.awsomeError(
    //       context,
    //       message.toString(),
    //     ),
    //   );
    // },
    //   builder: (context, state) {
    //     return InkWell(
    //       onTap: () {
    //         CustomDialog.awsomeTwoButtons(
    //           context,
    //           'Delete Category',
    //           onPressCancel: () {
    //             context.pop();
    //           },
    //           onPressOk: () {
    //             BlocProvider.of<CategoriesCubit>(context)
    //                 .deleteCategoryGraphQl(categoryId: categoryId);
    //           },
    //         );
    //       },
    //       child: const CustomContainerIcon(
    //         containerSize: 35,
    //         iconSize: 25,
    //         icon: Icons.delete,
    //         iconColor: AppColors.redAccent,
    //       ),
    //     );
    //   },
    // );
  }
}
