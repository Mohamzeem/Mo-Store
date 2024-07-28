import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/shared_prefs.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/settings/view/widgets/settings_item.dart';
import 'package:mo_store/features/settings/view/widgets/settings_sub_title.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

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
              const SettingsSubTitle(title: 'Personal', icon: Icons.person),
              SettingsItem(title: 'Profile', onTap: () {}),
              const SettingsItem(title: 'Shipping Address', onTap: null),
              const SettingsItem(title: 'Payment Methods', onTap: null),
              20.verticalSpace,
              const SettingsSubTitle(
                  title: 'Shop', icon: Icons.shopping_cart_sharp),
              const SettingsItem(title: 'Country', onTap: null),
              const SettingsItem(title: 'Currency', onTap: null),
              20.verticalSpace,
              const SettingsSubTitle(title: 'Account', icon: Icons.settings),
              const SettingsItem(title: 'Language', onTap: null),
              SettingsItem(
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
              const SettingsItem(title: 'Delete Account', onTap: null),
            ],
          ),
        ),
      ),
    );
  }
}
