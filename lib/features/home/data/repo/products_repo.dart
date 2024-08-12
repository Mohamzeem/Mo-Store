import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/home/data/api/products_api.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

class ProductsRepo {
  final ProductsApi productsApi;
  ProductsRepo({required this.productsApi});

  Future<ApiResult<List<ProductsResponseBody>>> getProducts() async {
    try {
      final response = await productsApi.getProducts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
