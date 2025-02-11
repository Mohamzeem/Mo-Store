// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_state.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';
import 'package:mo_store/core/widgets/custom_circular_loading.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';

class AddProductImages extends StatelessWidget {
  const AddProductImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              height: 90,
              width: double.infinity,
              child: BlocConsumer<UploadImageCubit, UploadImageState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: (image) {
                      CustomDialog.show(
                        context: context,
                        text: 'Image Uploaded Successfully',
                      );
                    },
                    failure: (message) => CustomDialog.show(
                      context: context,
                      text: message.toString(),
                    ),
                    remove: (image) => CustomDialog.show(
                      context: context,
                      text: 'Image Removed Successfully',
                    ),
                  );
                },
                builder: (context, state) {
                  final uploadImageCubit =
                      BlocProvider.of<UploadImageCubit>(context);
                  return state.maybeWhen(
                    orElse: () => SelectedProductImage(
                      index: index,
                      onTap: () => uploadImageCubit.addproductImages(
                        index,
                        ImageSource.gallery,
                        context,
                      ),
                    ),
                    loadingIndex: (imgIndex) {
                      if (imgIndex == index) {
                        return const CustomCircularLoading(
                          height: 30,
                          width: 30,
                        );
                      }
                      return SelectedProductImage(
                        index: index,
                        onTap: () {},
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class SelectedProductImage extends StatelessWidget {
  final int index;
  final VoidCallback onTap;

  const SelectedProductImage({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      height: 90,
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_a_photo_outlined,
              size: 50.r,
              color: AppColors.lightBlue,
            ),
            Text(
              'Add Product Photo',
              style: AppFonts.regular18LightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
