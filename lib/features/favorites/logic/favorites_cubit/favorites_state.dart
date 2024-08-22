import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mo_store/features/favorites/data/models/favorit_model.dart';

part 'favorites_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.add() = _Add;
  const factory FavoritesState.remove() = _Remove;
  const factory FavoritesState.getFavorites(List<FavoritModel> favoritesList) =
      _GetFavorites;
  const factory FavoritesState.emptyFavorites() = _EmptyFavorites;
}
