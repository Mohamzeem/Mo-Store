import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/home/data/api/all_products_api.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

class AllProductsRepo {
  final AllProductsApi allProductsApi;
  AllProductsRepo({required this.allProductsApi});

  Future<ApiResult<List<ProductsResponseBody>>> getPaginatedProducts(
      {required int offset, required int limit}) async {
    try {
      final result = await allProductsApi.paginatedProducts(offset, limit);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
