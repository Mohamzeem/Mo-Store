import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/home/data/api/all_products_api.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

class AllProductsRepo {
  final AllProductsApi allProductsApi;
  AllProductsRepo({required this.allProductsApi});

  Future<ApiResult<List<ProductsResponseBody>>> getPaginatedProducts() async {
    try {
      final result = await allProductsApi.paginatedProducts(6, 6);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
