import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image_state.freezed.dart';

@freezed
class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.loading() = Loading;
  const factory UploadImageState.loadingIndex(int index) = LoadingIndex;
  const factory UploadImageState.failure(String message) = Failure;
  const factory UploadImageState.success(String image) = Success;
  const factory UploadImageState.remove(String image) = Remove;
}
