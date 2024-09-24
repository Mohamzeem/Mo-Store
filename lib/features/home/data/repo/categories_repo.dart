import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/admin/data/models/categories/add_category_request.dart';
import 'package:mo_store/features/admin/data/models/categories/add_category_response.dart';
import 'package:mo_store/features/home/data/data_source/home_data_source.dart';
import 'package:mo_store/features/home/data/models/categories_request.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';

class CategoriesRepo {
  final HomeDataSource dataSource;
  CategoriesRepo({required this.dataSource});

  Future<ApiResult<CategoriesResponseBody>> getCategoriesGraphql() async {
    try {
      final response = await dataSource.getCategoriesGraphql();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<AddCategoriesResponseBody>> addCategoryGraphql(
      AddCategoriesRequest body) async {
    try {
      final response = await dataSource.addCategoryGraphql(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>> updateCategoryGraphql(CategoriesRequest body) async {
    try {
      final response = await dataSource.updateCategoryGraphql(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
