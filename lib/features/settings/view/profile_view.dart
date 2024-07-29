import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';
import 'package:mo_store/features/settings/logic/profile/profile_state.dart';
import 'package:mo_store/features/settings/view/widgets/profile_widgets/profile_field.dart';
import 'package:mo_store/features/settings/view/widgets/profile_widgets/profile_photo.dart';
import 'package:mo_store/features/settings/view/widgets/settings_widgets/settings_sub_title.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomAppBar(
                  title: 'Settings',
                  photoUrl: '',
                  isArrowBack: true,
                ),
                15.verticalSpace,
                const SettingsSubTitle(
                  title: 'You Profile',
                  icon: Icons.person,
                  visibleIcon: false,
                ),
                20.verticalSpace,
                const ProfilePhoto(),
                20.verticalSpace,
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (profileModel) {
                        return Column(
                          children: [
                            ProfileField(initialValue: profileModel.name!),
                            10.verticalSpace,
                            ProfileField(initialValue: profileModel.email!),
                            10.verticalSpace,
                            ProfileField(
                              initialValue: profileModel.password!,
                              obscureText: true,
                            ),
                          ],
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                300.verticalSpace,
                CustomButton(
                    padding: 0,
                    onPressed: () {},
                    text: 'Save Changes',
                    width: double.infinity,
                    height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
