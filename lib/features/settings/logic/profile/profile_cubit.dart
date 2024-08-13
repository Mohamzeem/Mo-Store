import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/app/upload_image/data/upload_repo.dart';
import 'package:mo_store/core/consts/pref_keys.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/image_picker.dart';
import 'package:mo_store/core/helpers/shared_prefs.dart';
import 'package:mo_store/features/settings/data/models/profile_model.dart';
import 'package:mo_store/features/settings/data/models/update_profile_request.dart';
import 'package:mo_store/features/settings/data/repo/profile_repo.dart';
import 'package:mo_store/features/settings/logic/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  final UploadImageRepo uploadImageRepo;
  ProfileCubit({required this.profileRepo, required this.uploadImageRepo})
      : super(const ProfileState.initial());

  String imageUrl = "";
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
        userModel = data;
        SharedPrefHelper.setSecuredString(PrefKeys.userId, data.id.toString());
        String offlineProfile = jsonEncode(data.toJson());
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
      emit(ProfileState.success(profileModel));
    } else {
      emit(const ProfileState.failure('No Profile Found'));
    }
  }

  Future<void> updateProfile() async {
    emit(const ProfileState.loading());
    UpdateProfileRequest request = UpdateProfileRequest(
      name: nameController.text.isNullOrEmpty()
          ? userModel!.name
          : nameController.text.trim(),
      email: emailController.text.isNullOrEmpty()
          ? userModel!.email
          : emailController.text.trim(),
      password: passwordController.text.trim().isNullOrEmpty()
          ? userModel!.password
          : passwordController.text.trim(),
      avatar: imageUrl == "" || imageUrl.isNullOrEmpty()
          ? userModel!.avatar
          : imageUrl,
      updatedAt: DateTime.now().toString(),
    );
    int id = int.parse('${userModel!.id}');
    final result = await profileRepo.updateProfile(request, id);
    result.when(
      success: (profileModel) async {
        String offlineProfile = jsonEncode(profileModel);
        SharedPrefHelper.setSecuredString(PrefKeys.userProfile, offlineProfile);
        await getOfflineProfile();
        emit(ProfileState.updateProfileSuccess(profileModel));
      },
      failure: (message) => emit(ProfileState.updateProfileFailure(message)),
    );
  }

  Future uploadImage(ImageSource source, BuildContext context) async {
    final response =
        await AppImagePicker().pickImage(source: source, context: context);
    if (response == null) return;

    emit(const ProfileState.profileUdateImgLoading());
    final result = await uploadImageRepo.uploadImage(image: response);
    result.when(
      success: (data) {
        imageUrl = data.location ?? "";
        emit(ProfileState.profileUdateImgSuccess(imageUrl));
      },
      failure: (error) {
        emit(ProfileState.profileUdateImgFailure(error));
      },
    );
  }

  void removeImage() {
    final img = imageUrl = "";
    emit(ProfileState.profileUdateImgRemove(img));
  }
}
