import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/home/data/api/products_api.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

class ProductsRepo {
  final ProductsApi productsApi;
  ProductsRepo({required this.productsApi});

  Future<ApiResult<List<ProductsResponseBody>>> getProducts(
      {required int offset, required int limit}) async {
    try {
      final result = await productsApi.getProducts(offset, limit);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
