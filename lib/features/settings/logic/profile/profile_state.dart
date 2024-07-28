import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mo_store/features/settings/data/models/profile_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.failure(String message) = Failure;
  const factory ProfileState.success(ProfileModel profileModel) = Success;
}
