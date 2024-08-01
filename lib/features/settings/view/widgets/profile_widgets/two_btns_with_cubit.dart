import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';
import 'package:mo_store/features/settings/logic/profile/profile_state.dart';

class TwoButtonsWithCubit extends StatelessWidget {
  const TwoButtonsWithCubit({
    super.key,
    required ProfileCubit cubit,
  }) : _cubit = cubit;

  final ProfileCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (profileModel) {},
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomButton(
              padding: 0,
              onPressed: () {},
              text: 'Save Changes',
              width: double.infinity,
              height: 50,
            ),
            10.verticalSpace,
            CustomButton(
              padding: 0,
              onPressed: () {
                _cubit.clearControllers();
                CustomDialog.show(context: context, text: 'Changes Canceled');
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
          ],
        );
      },
    );
  }
}
