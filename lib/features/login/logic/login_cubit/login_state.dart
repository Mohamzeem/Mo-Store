import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mo_store/features/login/data/models/login_response.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.failure(String message) = Failure;
  const factory LoginState.success(LoginResponseBody loginResponseBody) =
      Success;
}
