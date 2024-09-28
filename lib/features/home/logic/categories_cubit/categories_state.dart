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
      CategoriesResponseBody categories) = _SuccessCategories;
  const factory CategoriesState.emptyCategories() = _EmptyCategories;

  const factory CategoriesState.loadingSearchCategories() =
      _LoadingSearchCategories;
  const factory CategoriesState.failureSearchCategories(String message) =
      _FailureSearchCategories;
  const factory CategoriesState.successSearchCategories(
      List<CategoriesModel> categories) = _SuccessSearchCategories;
  const factory CategoriesState.emptySearchCategories() =
      _EmptySearchCategories;

  const factory CategoriesState.loadingAddCategories() = _LoadingAddCategories;
  const factory CategoriesState.failureAddCategories(String message) =
      _FailureAddCategories;
  const factory CategoriesState.successAddCategories() = _SuccessAddCategories;

  const factory CategoriesState.loadingUpdateCategories() =
      _LoadingUpdateCategories;
  const factory CategoriesState.failureUpdateCategories(String message) =
      _FailureUpdateCategories;
  const factory CategoriesState.successUpdateCategories() =
      _SuccessUpdateCategories;

  const factory CategoriesState.loadingDeleteCategories() =
      _LoadingDeleteCategories;
  const factory CategoriesState.failureDeleteCategories(String message) =
      _FailureDeleteCategories;
  const factory CategoriesState.successDeleteCategories() =
      _SuccessDeleteCategories;
}
