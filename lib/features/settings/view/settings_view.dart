import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/features/settings/view/widgets/settings_widgets/logout_btn.dart';
import 'package:mo_store/features/settings/view/widgets/settings_widgets/settings_item.dart';
import 'package:mo_store/features/settings/view/widgets/settings_widgets/settings_sub_title.dart';

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
              SettingsItem(
                  title: 'Profile',
                  onTap: () => context.pushName(Routes.profileView)),
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
              const LogoutButton(),
              SettingsItem(
                title: 'Delete Account',
                onTap: null,
                textStyle: AppFonts.regular20Primary.copyWith(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
