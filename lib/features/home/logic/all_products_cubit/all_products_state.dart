import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

part 'all_products_state.freezed.dart';

@freezed
class AllProductsState with _$AllProductsState {
  const factory AllProductsState.initial() = _Initial;

  const factory AllProductsState.loading() = _Loading;

  const factory AllProductsState.failure(String message) = _Failure;

  const factory AllProductsState.success(List<ProductsResponseBody> products) =
      _Success;

  const factory AllProductsState.empty() = _Empty;
}
