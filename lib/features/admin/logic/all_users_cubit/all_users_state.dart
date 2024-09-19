import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mo_store/features/admin/data/models/all_users_respons.dart';

part 'all_users_state.freezed.dart';

@freezed
class AllUsersState with _$AllUsersState {
  const factory AllUsersState.initial() = _Initial;

  const factory AllUsersState.loading() = _Loading;

  const factory AllUsersState.failure(String message) = _Failure;

  const factory AllUsersState.success(AllUsersResponse users) = _Success;
}
