import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loadingCategories() = _LoadingCategories;
  const factory CategoriesState.failureCategories(String message) =
      _FailureCategories;
  const factory CategoriesState.successCategories(
      List<CategoriesResponseBody> categories) = _SuccessCategories;
  const factory CategoriesState.emptyCategories() = _EmptyCategories;
}
