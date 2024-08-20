import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/local_database/local_database.dart';
import 'package:mo_store/features/favorites/data/models/favorit_model.dart';
import 'package:mo_store/features/favorites/logic/favorites_cubit/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState.initial());

  void addRemoveFavorite({
    required int id,
    required String description,
    required List<String> images,
    required int price,
    required String title,
  }) async {
    emit(const FavoritesState.initial());

    final localId = LocalDatabase()
        .favoritBox!
        .values
        .toList()
        .indexWhere((element) => element.id == id);
    if (localId >= 0) {
      await LocalDatabase().favoritBox!.deleteAt(localId);
      emit(const FavoritesState.remove());
    } else {
      await LocalDatabase().favoritBox!.add(FavoritModel(
            description: description,
            id: id,
            images: images,
            price: price,
            title: title,
          ));

      emit(const FavoritesState.add());
    }
  }

  bool isFavorite({required int favoriteId}) {
    return LocalDatabase()
        .favoritBox!
        .values
        .toList()
        .any((element) => element.id == favoriteId);
  }

  List<FavoritModel> getFavorites() {
    emit(const FavoritesState.initial());
    final result = LocalDatabase().favoritBox!.values.toList();
    if (result.isNotEmpty) {
      emit(FavoritesState.getFavorites(result));
    } else {
      emit(const FavoritesState.emptyFavorites());
    }
    return result;
  }
}
