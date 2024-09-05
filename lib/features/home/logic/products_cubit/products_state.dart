import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loadingProducts() = _LoadingProducts;
  const factory ProductsState.failureProducts(String message) =
      _FailureProducts;
  const factory ProductsState.successProducts(
      List<ProductsResponseBody> products) = _SuccessProducts;
  const factory ProductsState.emptyProducts() = _EmptyProducts;

  const factory ProductsState.loadingSearch() = _LoadingSearch;
  const factory ProductsState.failureSearch(String message) = _FailureSearch;
  const factory ProductsState.successSearch(
      List<ProductsResponseBody> searchProducts) = _SuccessSearch;
  const factory ProductsState.emptySearch() = _EmptySearch;

  const factory ProductsState.loadingCategory() = _LoadingCategory;
  const factory ProductsState.failureCategory(String message) =
      _FailureCategory;
  const factory ProductsState.successCategory(
      List<ProductsResponseBody> categoryProducts) = _SuccessCategory;
  const factory ProductsState.emptyCategory() = _EmptyCategory;
}
