// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  void register() async {
    emit(const RegisterState.loading());
    final result = await registerRepo.register(
      RegisterRequestModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        avatar: 'avatar',
      ),
    );
    result.when(
      success: (data) => emit(const RegisterState.success()),
      failure: (message) => emit(RegisterState.failure(message)),
    );
  }
}
