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
  List<String> imagesList = ['', '', ''];
  List<String> imageUpdateList = [];

  Future uploadImage(ImageSource source, BuildContext context) async {
    final response =
        await AppImagePicker().pickImage(source: source, context: context);
    if (response == null) return;

    emit(const UploadImageState.loading());
    final result = await uploadImageRepo.uploadImage(image: response);
    result.when(
      success: (data) {
        imageUrl = data.location ?? "";
        Prints.debug(message: "imageUrl: $imageUrl");
        emit(UploadImageState.success(imageUrl));
      },
      failure: (error) {
        emit(UploadImageState.failure(error));
      },
    );
  }

  Future<void> addproductImages(
      int index, ImageSource source, BuildContext context) async {
    final response =
        await AppImagePicker().pickImage(source: source, context: context);
    if (response == null) return;

    emit(UploadImageState.loadingIndex(index));
    final result = await uploadImageRepo.uploadImage(image: response);
    result.when(
      success: (data) {
        imagesList
          ..removeAt(index)
          ..insert(index, data.location ?? "");

        emit(UploadImageState.success(imageUrl));
      },
      failure: (error) {
        emit(UploadImageState.failure(error));
      },
    );
  }

  Future<void> uploadUpdateImageList(
    int index,
    ImageSource source,
    BuildContext context,
    List<String> productImageList,
  ) async {
    final response =
        await AppImagePicker().pickImage(source: source, context: context);
    if (response == null) return;

    emit(UploadImageState.loadingIndex(index));
    final result = await uploadImageRepo.uploadImage(image: response);

    result.when(
      success: (image) {
        imageUpdateList = productImageList;
        imageUpdateList
          ..removeAt(index)
          ..insert(index, image.location ?? '');
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
