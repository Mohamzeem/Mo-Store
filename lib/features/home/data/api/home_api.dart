import 'package:dio/dio.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class HomeApi {
  factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

  @GET(AppEndPoints.getCategories)
  Future<List<CategoriesResponseBody>> getCategories();

  @GET(AppEndPoints.getProducts)
  Future<List<ProductsResponseBody>> getProducts();
}
