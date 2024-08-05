import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_state.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';

class RegisterImage extends StatelessWidget {
  const RegisterImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<UploadImageCubit>(context);
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (image) {
            CustomDialog.awsomeSuccess(
              context,
              'Image Uploaded Successfully',
              (dismiss) {},
            );
          },
          failure: (message) => CustomDialog.awsomeError(
            context,
            message.toString(),
          ),
        );
      },
      builder: (context, state) {
        final uploadedImage = cubit.imageUrl.isNotEmpty;
        return InkWell(
          onTap: () {
            CustomDialog.awsomeTwoButtons(
              context,
              'Pick Image From?',
              logIcon: Icons.image,
              okBtnTitle: 'Gallary',
              cancelBtnTitle: 'Camera',
              onPressCancel: () =>
                  cubit.uploadImage(ImageSource.camera, context),
              onPressOk: () => cubit.uploadImage(ImageSource.gallery, context),
            );
          },
          child: !uploadedImage
              ? SvgPicture.asset(
                  'assets/images/svgs/Upload Photo.svg',
                  colorFilter: const ColorFilter.mode(
                      AppColors.lightBlue, BlendMode.srcIn),
                  height: 150.h,
                )
              : CustomCachedImage(
                  photoUrl: cubit.imageUrl,
                  width: 150.w,
                  height: 150.h,
                ),
        );
      },
    );
  }
}
