import 'dart:io';

import 'package:hive/hive.dart';

class LocalDatabase {
  static final LocalDatabase _localDatabase = LocalDatabase._internal();
  factory LocalDatabase() => _localDatabase;
  LocalDatabase._internal();

  void initLocalDatabase() async {
    final path = Directory.current.path;
    Hive.init(path);
    // Hive.registerAdapter();
  }
}
