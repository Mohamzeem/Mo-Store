// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/consts/pref_keys.dart';
import 'package:mo_store/core/helpers/shared_prefs.dart';
import 'package:mo_store/features/settings/data/models/profile_model.dart';
import 'package:mo_store/features/settings/data/repo/profile_repo.dart';
import 'package:mo_store/features/settings/logic/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit({required this.profileRepo})
      : super(const ProfileState.initial());

  ProfileModel? profileModel;
  void getProfile() async {
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

  void getOfflineProfile() async {
    emit(const ProfileState.loading());
    final profileJson =
        await SharedPrefHelper.getSecuredString(PrefKeys.userProfile);
    if (profileJson != null) {
      final profileModel = ProfileModel.fromJson(jsonDecode(profileJson));
      emit(ProfileState.success(profileModel));
    } else {
      emit(const ProfileState.failure('No Profile Found'));
    }
  }
}
