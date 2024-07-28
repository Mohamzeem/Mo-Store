import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/image_picker.dart';
import 'package:mo_store/core/helpers/shared_prefs.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/profile/view/widgets/profile_item.dart';
import 'package:mo_store/features/profile/view/widgets/profile_sub_title.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(title: 'Settings', photoUrl: ''),
              15.verticalSpace,
              const ProfileSubTitle(title: 'Personal', icon: Icons.person),
              ProfileItem(title: 'Profile', onTap: () {}),
              const ProfileItem(title: 'Shipping Address', onTap: null),
              const ProfileItem(title: 'Payment Methods', onTap: null),
              20.verticalSpace,
              const ProfileSubTitle(
                  title: 'Shop', icon: Icons.shopping_cart_sharp),
              const ProfileItem(title: 'Country', onTap: null),
              const ProfileItem(title: 'Currency', onTap: null),
              20.verticalSpace,
              const ProfileSubTitle(title: 'Account', icon: Icons.settings),
              const ProfileItem(title: 'Language', onTap: null),
              ProfileItem(
                title: 'Logout',
                onTap: () => CustomDialog.awsomeTwoButtons(
                  context,
                  'Logout',
                  onPressCancel: () {},
                  onPressOk: () {
                    SharedPrefHelper.clearAllSecuredData();
                    CustomDialog.awsomeSuccess(
                        context,
                        'Logged out successfully',
                        (onDismiss) => context.pushNamedAndRemoveUntil(
                            Routes.onboardingView,
                            predicate: (route) => false));
                  },
                ),
              ),
              const ProfileItem(title: 'Delete Account', onTap: null),
            ],
          ),
        ),
      ),
    );
  }
}
