// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class AppImagePicker {
  AppImagePicker._();
  static final AppImagePicker _instance = AppImagePicker._();
  factory AppImagePicker() => _instance;

  final ImagePicker _imagePicker = ImagePicker();
  Future pickImage(
      {required ImageSource source, required BuildContext context}) async {
    try {
      final image = await _imagePicker.pickImage(
        source: source,
        imageQuality: 80,
        maxHeight: 800,
        maxWidth: 800,
      );

      if (image != null) {
        return XFile(image.path);
      }
      return null;
    } on Exception catch (e) {
      final permissionStatus = await Permission.photos.status;
      if (permissionStatus.isDenied) {
        await _permissions(context);
      } else {
        CustomDialog.awsomeError(context, e.toString());
      }
    }
  }

  static Future<void> _permissions(BuildContext context) async {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Permissions Denied'),
          content: const Text('Allow access to gallery and photos'),
          actions: [
            CupertinoDialogAction(
              child: const Text('cancel'),
              onPressed: () => context.pop(),
            ),
            const CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: openAppSettings,
              child: Text('Settings'),
            )
          ],
        );
      },
    );
  }
}
