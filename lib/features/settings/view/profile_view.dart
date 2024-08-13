import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';
import 'package:mo_store/features/settings/view/widgets/profile_widgets/fields_with_cubit.dart';
import 'package:mo_store/features/settings/view/widgets/profile_widgets/profile_photo.dart';
import 'package:mo_store/features/settings/view/widgets/profile_widgets/two_btns_with_cubit.dart';
import 'package:mo_store/features/settings/view/widgets/settings_widgets/settings_sub_title.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<ProfileCubit>(context);
  }

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
                //^ app bar
                const CustomAppBar(
                  title: 'Settings',
                  isArrowBack: true,
                ),
                15.verticalSpace,
                //^ you profile text
                const SettingsSubTitle(
                  title: 'You Profile',
                  icon: Icons.person,
                  visibleIcon: false,
                ),
                20.verticalSpace,
                const ProfilePhoto(),
                20.verticalSpace,
                //^ name, email, password fields
                FieldsWithCubit(
                  cubit: _cubit,
                  suffixIconFunction: () => setState(
                      () => _cubit.isVisibleText = !_cubit.isVisibleText),
                ),
                250.verticalSpace,
                TwoButtonsWithCubit(cubit: _cubit)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
