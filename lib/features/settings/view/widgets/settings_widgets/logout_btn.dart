import 'package:flutter/material.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/local_database/shared_prefs.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/settings/view/widgets/settings_widgets/settings_item.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsItem(
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
    );
  }
}
