import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/home/data/api/categories_api.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';

class CategoriesRepo {
  final CategoriesApi categoriesApi;
  CategoriesRepo({required this.categoriesApi});

  Future<ApiResult<List<CategoriesResponseBody>>> getCategories() async {
    try {
      final response = await categoriesApi.getCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
