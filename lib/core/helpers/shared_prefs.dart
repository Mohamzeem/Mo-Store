import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //       encryptedSharedPreferences: true,
  //     );
  // static const flutterSecureStorage =
  //     FlutterSecureStorage(aOptions: _getAndroidOptions());

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    final val = await flutterSecureStorage.read(key: key) ?? 'No data found';
    debugPrint('FlutterSecureStorage : getSecuredString with key: $val');
    return val;
  }

  // static getAllSecured(String key) async {
  //   const flutterSecureStorage = FlutterSecureStorage();
  //   final val = await flutterSecureStorage.readAll() ?? 'No data found';
  //   debugPrint('FlutterSecureStorage : getSecuredString with key: $val');
  //   return val;
  // }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
