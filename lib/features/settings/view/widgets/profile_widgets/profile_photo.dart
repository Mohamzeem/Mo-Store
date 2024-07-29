import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';
import 'package:mo_store/core/widgets/custom_circular_loading.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';
import 'package:mo_store/features/settings/logic/profile/profile_state.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  return CustomCachedImage(
                    photoUrl: profileModel.avatar!,
                    width: 150.w,
                    height: 150.h,
                    isBorder: true,
                  );
                },
                loading: () =>
                    const CustomCircularLoading(height: 50, width: 50),
                orElse: () => Container(
                  decoration: const BoxDecoration(
                    color: AppColors.lightGrey,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
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
      ],
    );
  }
}
