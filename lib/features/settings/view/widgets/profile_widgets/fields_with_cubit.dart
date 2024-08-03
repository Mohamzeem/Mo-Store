// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          orElse: () => Column(
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
          ),
        );
      },
    );
  }
}
