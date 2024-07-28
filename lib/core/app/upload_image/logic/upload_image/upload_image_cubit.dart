// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/app/upload_image/data/upload_repo.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_state.dart';
import 'package:mo_store/core/helpers/image_picker.dart';
import 'package:mo_store/core/helpers/prints.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final UploadImageRepo uploadImageRepo;
  UploadImageCubit({required this.uploadImageRepo})
      : super(const UploadImageState.initial());

  String imageUrl = "";
  Future uploadImage(ImageSource source, BuildContext context) async {
    final response =
        await AppImagePicker().pickImage(source: source, context: context);
    Prints.debug(message: response.toString());
    if (response == null) return;

    emit(const UploadImageState.loading());
    final result = await uploadImageRepo.uploadImage(image: response);
    result.when(
      success: (data) {
        imageUrl = data.location ?? "";
        Prints.debug(message: 'data: $imageUrl');

        emit(UploadImageState.success(imageUrl));
      },
      failure: (error) {
        emit(UploadImageState.failure(error));
      },
    );
  }

  void removeImage() {
    final img = imageUrl = "";
    emit(UploadImageState.remove(img));
  }
}
