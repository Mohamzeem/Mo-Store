import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/home/data/api/home_api.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

class HomeRepo {
  final HomeApi homeApi;
  HomeRepo({required this.homeApi});

  Future<ApiResult<List<CategoriesResponseBody>>> getCategories() async {
    try {
      final response = await homeApi.getCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<List<ProductsResponseBody>>> getProducts() async {
    try {
      final response = await homeApi.getProducts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
