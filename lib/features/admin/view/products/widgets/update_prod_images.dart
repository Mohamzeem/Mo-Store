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
import 'package:mo_store/features/home/data/models/products_response.dart';

class UpdateProductImages extends StatelessWidget {
  final ProductsResponseBody prodModel;

  const UpdateProductImages({
    super.key,
    required this.prodModel,
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
                      prodModel: prodModel,
                      index: index,
                      onTap: () => uploadImageCubit.uploadUpdateImageList(
                        index,
                        ImageSource.gallery,
                        context,
                        prodModel.images ?? [],
                      ),
                    ),
                    loadingIndex: (imgIndex) {
                      if (index == imgIndex) {
                        return const CustomCircularLoading(
                          height: 30,
                          width: 30,
                        );
                      }
                      return SelectedProductImage(
                        prodModel: prodModel,
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
  final ProductsResponseBody prodModel;
  final int index;
  final VoidCallback onTap;

  const SelectedProductImage({
    super.key,
    required this.index,
    required this.onTap,
    required this.prodModel,
  });

  @override
  Widget build(BuildContext context) {
    final uploadImageCubit = BlocProvider.of<UploadImageCubit>(context);

    return uploadImageCubit.imagesList[index].isNotEmpty
        ? CustomCachedImage(
            photoUrl: uploadImageCubit.imagesList[index],
            height: 150,
            width: double.infinity,
            shape: BoxShape.rectangle,
            border: 20,
          )
        : InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20.r),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(prodModel.images![index]),
                      )),
                  height: 90,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  height: 90,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo_outlined,
                        size: 50.r,
                        color: AppColors.lightBlue,
                      ),
                      Text(
                        'Update Product Photo',
                        style: AppFonts.regular18LightBlue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
