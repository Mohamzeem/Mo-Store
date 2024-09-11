// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/consts/pref_keys.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/local_database/shared_prefs.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/core/widgets/auth_two_btns.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/login/logic/login_cubit/login_cubit.dart';
import 'package:mo_store/features/login/logic/login_cubit/login_state.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';

class LoginButtonWithCubit extends StatelessWidget {
  const LoginButtonWithCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (loginResponse) {
            CustomDialog.awsomeSuccess(context, 'Logged in successfully',
                (onDismiss) {
              SharedPrefHelper.getSecuredString(PrefKeys.userRole) == 'customer'
                  ? context.pushNamedAndRemoveUntil(Routes.controlView,
                      predicate: (route) => false)
                  : context.pushNamedAndRemoveUntil(Routes.adminView,
                      predicate: (route) => false);
            });
          },
          failure: (message) => CustomDialog.awsomeSuccess(
              context, message.toString(), (onDismiss) {}),
        );
      },
      builder: (context, state) {
        return AuthTwoButtons(
          text: 'Login',
          isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
          onPressed: () async {
            cubit.loginFunction(context);
            await BlocProvider.of<ProfileCubit>(context).getProfile();
          },
        );
      },
    );
  }
}
