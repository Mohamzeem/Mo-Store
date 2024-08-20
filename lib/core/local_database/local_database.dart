import 'package:hive_flutter/hive_flutter.dart';
import 'package:mo_store/core/consts/pref_keys.dart';
import 'package:mo_store/features/favorites/data/models/favorit_model.dart';

class LocalDatabase {
  static final LocalDatabase _localDatabase = LocalDatabase._internal();
  factory LocalDatabase() => _localDatabase;
  LocalDatabase._internal();

  Box<FavoritModel>? favoritBox;
  Future<void> initLocalDatabase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FavoritModelAdapter());

    favoritBox = await Hive.openBox<FavoritModel>(PrefKeys.favoriteBox);
  }
}
