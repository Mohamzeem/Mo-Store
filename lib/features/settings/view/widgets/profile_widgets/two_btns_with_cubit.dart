import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';
import 'package:mo_store/features/settings/logic/profile/profile_state.dart';

class TwoButtonsWithCubit extends StatelessWidget {
  final ProfileCubit cubit;
  const TwoButtonsWithCubit({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          updateProfileSuccess: (profileModel) {
            CustomDialog.show(context: context, text: 'Profile Updated');
          },
        );
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            height: 130.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  padding: 0,
                  onPressed: () => cubit.updateProfile(),
                  text: 'Save Changes',
                  width: double.infinity,
                  height: 50,
                ),
                10.verticalSpace,
                CustomButton(
                  padding: 0,
                  onPressed: () {
                    cubit.clearControllers();
                    CustomDialog.show(
                        context: context, text: 'Changes Canceled');
                  },
                  text: 'Cancel Changes',
                  width: double.infinity,
                  height: 50,
                  backgroundColor: AppColors.primaryColor,
                  isLoading: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                ),
                Platform.isIOS ? 20.verticalSpace : 0.verticalSpace
              ],
            ),
          ),
        );
      },
    );
  }
}
