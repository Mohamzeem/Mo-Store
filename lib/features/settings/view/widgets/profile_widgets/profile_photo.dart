import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';
import 'package:mo_store/features/settings/logic/profile/profile_state.dart';
import 'package:mo_store/features/settings/view/widgets/profile_widgets/profile_cached_image.dart';
import 'package:mo_store/features/settings/view/widgets/profile_widgets/profile_shimmer.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);
    return Stack(
      children: [
        Container(
          height: 150.h,
          width: 150.w,
          padding: EdgeInsets.all(7.r),
          decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: AppColors.bordersGrey,
              )),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return state.maybeWhen(
                success: (profileModel) {
                  return ProfileCachedImage(
                    photoUrl: cubit.userModel!.avatar!,
                    isCircle: false,
                  );
                },
                profileUdateImgSuccess: (img) {
                  return ProfileCachedImage(
                    photoUrl: cubit.imageUrl,
                    isCircle: false,
                  );
                },
                updateProfileSuccess: (profileModel) {
                  return ProfileCachedImage(
                    photoUrl: profileModel.avatar!,
                    isCircle: false,
                  );
                },
                loading: () => const ProfileShimmer(isCircle: true),
                profileUdateImgLoading: () =>
                    const ProfileShimmer(isCircle: true),
                updateProfileLoading: () =>
                    const ProfileShimmer(isCircle: true),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              CustomDialog.awsomeTwoButtons(
                context,
                'Pick Image From?',
                logIcon: Icons.image,
                okBtnTitle: 'Gallary',
                cancelBtnTitle: 'Camera',
                onPressCancel: () =>
                    cubit.uploadImage(ImageSource.camera, context),
                onPressOk: () =>
                    cubit.uploadImage(ImageSource.gallery, context),
              );
            },
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: AppColors.white),
              ),
              child: const Icon(
                Icons.edit,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
