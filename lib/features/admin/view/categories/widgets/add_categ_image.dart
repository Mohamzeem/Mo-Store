import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_state.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/core/widgets/skelton_shimmer.dart';

class AddCategoryImage extends StatelessWidget {
  const AddCategoryImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
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
        final uploadImageCubit = BlocProvider.of<UploadImageCubit>(context);

        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          height: 150,
          width: double.infinity,
          child: InkWell(
            onTap: () => uploadImageCubit.uploadImage(
              ImageSource.gallery,
              context,
            ),
            child: state.maybeWhen(
              orElse: () {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_a_photo_outlined,
                      size: 70.r,
                      color: AppColors.lightBlue,
                    ),
                    Text('Add Category Photo',
                        style: AppFonts.regular18LightBlue),
                  ],
                );
              },
              success: (image) {
                return CustomCachedImage(
                  photoUrl: image,
                  height: 150,
                  width: double.infinity,
                  shape: BoxShape.rectangle,
                  border: 20,
                );
              },
              loading: () => const SkeltonShimmer(
                height: 150,
                shape: BoxShape.rectangle,
                width: double.infinity,
                borderRadius: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
