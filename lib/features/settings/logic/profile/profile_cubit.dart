import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/consts/pref_keys.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/core/helpers/shared_prefs.dart';
import 'package:mo_store/features/settings/data/models/profile_model.dart';
import 'package:mo_store/features/settings/data/models/update_profile_request.dart';
import 'package:mo_store/features/settings/data/repo/profile_repo.dart';
import 'package:mo_store/features/settings/logic/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit({required this.profileRepo})
      : super(const ProfileState.initial());

  ProfileModel? userModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisibleText = false;

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> getProfile() async {
    emit(const ProfileState.loading());
    final result = await profileRepo.getProfile();
    result.when(
      success: (data) {
        SharedPrefHelper.setSecuredString(PrefKeys.userId, '${data.id}');
        String offlineProfile = jsonEncode(data);
        SharedPrefHelper.setSecuredString(PrefKeys.userProfile, offlineProfile);
        emit(ProfileState.success(data));
      },
      failure: (message) => emit(ProfileState.failure(message)),
    );
  }

  Future<void> getOfflineProfile() async {
    emit(const ProfileState.loading());
    final profileJson =
        await SharedPrefHelper.getSecuredString(PrefKeys.userProfile);
    if (profileJson != null) {
      final profileModel = ProfileModel.fromJson(jsonDecode(profileJson));
      userModel = profileModel;
      Prints.debug(message: userModel!.id.toString());
      emit(ProfileState.success(profileModel));
    } else {
      emit(const ProfileState.failure('No Profile Found'));
    }
  }

  Future<void> updateProfile() async {
    emit(const ProfileState.loading());
    // ProfileModel model = ProfileModel(
    //   id: userModel!.id,
    //   name: nameController.text.trim().isNullOrEmpty()
    //       ? userModel!.name
    //       : nameController.text.trim(),
    //   email: emailController.text.trim().isNullOrEmpty()
    //       ? userModel!.email
    //       : emailController.text.trim(),
    //   password: passwordController.text.trim().isNullOrEmpty()
    //       ? userModel!.password
    //       : passwordController.text.trim(),
    //   role: userModel!.role,
    //   avatar: userModel!.avatar,
    //   creationAt: userModel!.creationAt,
    //   updatedAt: DateTime.now().toString(),
    // );
    UpdateProfileRequest request =
        UpdateProfileRequest(name: nameController.text.trim());
    final result = await profileRepo.updateProfile(request);
    result.when(
      success: (profileModel) async {
        emit(ProfileState.updateProfileSuccess(profileModel));
        await getProfile();
        await getOfflineProfile();
        Prints.debug(
            message: SharedPrefHelper.getSecuredString(PrefKeys.userId));
      },
      failure: (message) => emit(ProfileState.updateProfileFailure(message)),
    );
  }
}
