// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
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
        profileModel = data;
        emit(ProfileState.success(data));
      },
      failure: (message) => emit(ProfileState.failure(message)),
    );
  }
}
