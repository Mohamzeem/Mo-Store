// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/core/widgets/auth_two_btns.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/register/logic/register/register_cubit.dart';
import 'package:mo_store/features/register/logic/register/register_state.dart';

class RegisterButtonWithCubit extends StatelessWidget {
  const RegisterButtonWithCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.whenOrNull(success: () {
          CustomDialog.awsomeSuccess(context, 'Account Created Successfully',
              (dismiss) {
            context.pushNamedAndRemoveUntil(Routes.loginView,
                predicate: (route) => false);
          });
        });
      },
      builder: (context, state) {
        return AuthTwoButtons(
            text: 'Create Account',
            onPressed: () => _register(context),
            isLoading:
                state.maybeWhen(loading: () => true, orElse: () => false));
      },
    );
  }

  _register(BuildContext context) async {
    final cubit = BlocProvider.of<RegisterCubit>(context);
    final uploadImg = BlocProvider.of<UploadImageCubit>(context).imageUrl;
    if (!uploadImg.isNullOrEmpty()) {
      cubit.registerFunction(uploadImg, context);
    } else {
      CustomDialog.awsomeError(context, 'Please Upload Image');
    }
  }
}
