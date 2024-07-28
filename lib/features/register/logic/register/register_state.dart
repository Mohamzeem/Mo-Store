import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;

  const factory RegisterState.loading() = Loading;

  const factory RegisterState.failure(String message) = Failure;

  const factory RegisterState.success() = Success;
}
