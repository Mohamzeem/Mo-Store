import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loadingCategories() = _LoadingCategories;
  const factory HomeState.failureCategories(String message) =
      _FailureCategories;
  const factory HomeState.successCategories(
      List<CategoriesResponseBody> categories) = _SuccessCategories;
  const factory HomeState.emptyCategories() = _EmptyCategories;

  const factory HomeState.loadingProducts() = _LoadingProducts;
  const factory HomeState.failureProducts(String message) = _FailureProducts;
  const factory HomeState.successProducts(List<ProductsResponseBody> products) =
      _SuccessProducts;
  const factory HomeState.emptyProducts() = _EmptyProducts;
}
