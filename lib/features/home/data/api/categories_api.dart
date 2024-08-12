import 'package:dio/dio.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:retrofit/retrofit.dart';

part 'categories_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class CategoriesApi {
  factory CategoriesApi(Dio dio, {String baseUrl}) = _CategoriesApi;

  @GET(AppEndPoints.getCategories)
  Future<List<CategoriesResponseBody>> getCategories();
}
