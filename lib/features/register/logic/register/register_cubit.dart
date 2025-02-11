// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/register/data/models/register_request.dart';
import 'package:mo_store/features/register/data/repo/register_repo.dart';
import 'package:mo_store/features/register/logic/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  RegisterCubit({required this.registerRepo})
      : super(const RegisterState.initial());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;
  List<String> roleList = ['customer', 'admin'];
  String selectedRole = '';
  void dropDownValue(String val) => selectedRole = val;
  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void _register(String imageUrl) async {
    emit(const RegisterState.loading());
    final result = await registerRepo.register(
      RegisterRequestModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        avatar: imageUrl,
        role: selectedRole,
      ),
    );
    result.when(
      success: (data) => emit(const RegisterState.success()),
      failure: (message) => emit(RegisterState.failure(message)),
    );
  }

  void registerFunction(String imageUrl, BuildContext context) async {
    if (selectedRole.isNullOrEmptyString()) {
      return CustomDialog.show(
          context: context, text: 'Role Required', isSuccess: false);
    } else if (nameController.text.isNullOrEmptyString()) {
      return CustomDialog.show(
          context: context, text: 'Name Required Or Invalid', isSuccess: false);
    } else if (emailController.text.isEmpty) {
      return CustomDialog.show(
          context: context, text: 'Email Required', isSuccess: false);
    } else if (!emailController.text.contains('@')) {
      return CustomDialog.show(
          context: context, text: 'Invalid Email', isSuccess: false);
    } else if (passwordController.text.isEmpty) {
      return CustomDialog.show(
          context: context, text: 'Password Required', isSuccess: false);
    } else {
      _register(imageUrl);
    }
  }
}
