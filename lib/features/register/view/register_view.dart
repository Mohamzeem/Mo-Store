import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_state.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/register/view/widgets/create_account_text.dart';
import 'package:mo_store/features/register/view/widgets/register_btn_with_cubit.dart';
import 'package:mo_store/features/register/view/widgets/register_fields.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightBlue,
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //^ create account text
            const CreateAccountText(),
            30.verticalSpace,
            //^ upload photo
            const RegisterImage(),
            30.verticalSpace,
            //^ email and password
            const RegisterFields(),
            50.verticalSpace,
            const RegisterButtonWithCubit()
          ],
        ),
      ),
    );
  }
}

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
                context, 'Image Uploaded Successfully', (dismiss) {});
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
