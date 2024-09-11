import 'package:flutter/material.dart';
import 'package:mo_store/core/app/app_globals.dart';
import 'package:mo_store/features/settings/view/widgets/settings_widgets/settings_item.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsItem(
      title: 'Logout',
      onTap: () {
        AppGlobals.logOut(context);
      },
    );
  }
}
