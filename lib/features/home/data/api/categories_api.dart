import 'package:dio/dio.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:mo_store/features/admin/data/models/categories/add_category_response.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:retrofit/retrofit.dart';

part 'categories_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class CategoriesApi {
  factory CategoriesApi(Dio dio, {String baseUrl}) = _CategoriesApi;

  @POST(AppEndPoints.graphql)
  Future<CategoriesResponseBody> getCategoriesGraphql(
      @Body() Map<String, dynamic> body);

  @POST(AppEndPoints.graphql)
  Future<AddCategoriesResponseBody> addCategoryGraphql(
      @Body() Map<String, dynamic> mutation);

  @POST(AppEndPoints.graphql)
  Future<void> updateCategoryGraphql(@Body() Map<String, dynamic> mutation);

  @POST(AppEndPoints.graphql)
  Future<void> deleteCategoryGraphql(@Body() Map<String, dynamic> mutation);
}
