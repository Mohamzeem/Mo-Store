// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/widgets/skelton_shimmer.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';
import 'package:mo_store/features/settings/logic/profile/profile_state.dart';
import 'package:mo_store/features/settings/view/widgets/profile_widgets/profile_field.dart';

class FieldsWithCubit extends StatelessWidget {
  final ProfileCubit cubit;
  final void Function()? suffixIconFunction;
  const FieldsWithCubit({
    super.key,
    required this.cubit,
    this.suffixIconFunction,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.maybeWhen(
          updateProfileSuccess: (profileModel) {
            return Column(
              children: [
                ProfileField(
                  initialValue: profileModel.name!,
                  controller: cubit.nameController,
                ),
                10.verticalSpace,
                ProfileField(
                  initialValue: profileModel.email!,
                  controller: cubit.emailController,
                ),
                10.verticalSpace,
                ProfileField(
                  initialValue: profileModel.password!,
                  isVisibleText: cubit.isVisibleText,
                  suffixIconFunction: suffixIconFunction,
                  showIcon: true,
                  controller: cubit.passwordController,
                ),
              ],
            );
          },
          success: (profileModel) {
            return Column(
              children: [
                ProfileField(
                  initialValue: profileModel.name!,
                  controller: cubit.nameController,
                ),
                10.verticalSpace,
                ProfileField(
                  initialValue: profileModel.email!,
                  controller: cubit.emailController,
                ),
                10.verticalSpace,
                ProfileField(
                  initialValue: profileModel.password!,
                  isVisibleText: cubit.isVisibleText,
                  suffixIconFunction: suffixIconFunction,
                  showIcon: true,
                  controller: cubit.passwordController,
                ),
              ],
            );
          },
          profileUdateImgSuccess: (image) {
            return Column(
              children: [
                ProfileField(
                  initialValue: cubit.userModel!.name!,
                  controller: cubit.nameController,
                ),
                10.verticalSpace,
                ProfileField(
                  initialValue: cubit.userModel!.email!,
                  controller: cubit.emailController,
                ),
                10.verticalSpace,
                ProfileField(
                  initialValue: cubit.userModel!.password!,
                  isVisibleText: cubit.isVisibleText,
                  suffixIconFunction: suffixIconFunction,
                  showIcon: true,
                  controller: cubit.passwordController,
                ),
              ],
            );
          },
          profileUdateImgLoading: () {
            return Column(
              children: [
                ProfileField(
                  initialValue: cubit.userModel!.name!,
                  controller: cubit.nameController,
                ),
                10.verticalSpace,
                ProfileField(
                  initialValue: cubit.userModel!.email!,
                  controller: cubit.emailController,
                ),
                10.verticalSpace,
                ProfileField(
                  initialValue: cubit.userModel!.password!,
                  isVisibleText: cubit.isVisibleText,
                  suffixIconFunction: suffixIconFunction,
                  showIcon: true,
                  controller: cubit.passwordController,
                ),
              ],
            );
          },
          updateProfileLoading: () {
            return Column(
              children: [
                SkeltonShimmer(
                  height: 50.h,
                  width: double.infinity,
                ),
                10.verticalSpace,
                SkeltonShimmer(
                  height: 50.h,
                  width: double.infinity,
                ),
                10.verticalSpace,
                SkeltonShimmer(
                  height: 50.h,
                  width: double.infinity,
                ),
              ],
            );
          },
          updateProfileFailure: (message) {
            return Column(
              children: [
                ProfileField(
                  initialValue: 'Some thing went wrong',
                  controller: cubit.nameController,
                ),
                10.verticalSpace,
                ProfileField(
                  initialValue: 'Some thing went wrong',
                  controller: cubit.emailController,
                ),
                10.verticalSpace,
                ProfileField(
                  initialValue: 'Some thing went wrong',
                  isVisibleText: cubit.isVisibleText,
                  suffixIconFunction: suffixIconFunction,
                  showIcon: true,
                  controller: cubit.passwordController,
                ),
              ],
            );
          },
          orElse: () => Column(
            children: [
              SkeltonShimmer(
                shape: BoxShape.rectangle,
                height: 50.h,
                width: double.infinity,
              ),
              10.verticalSpace,
              SkeltonShimmer(
                shape: BoxShape.rectangle,
                height: 50.h,
                width: double.infinity,
              ),
              10.verticalSpace,
              SkeltonShimmer(
                shape: BoxShape.rectangle,
                height: 50.h,
                width: double.infinity,
              ),
            ],
          ),
        );
      },
    );
  }
}
