import 'package:dio/dio.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:retrofit/retrofit.dart';

part 'products_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class ProductsApi {
  factory ProductsApi(Dio dio, {String baseUrl}) = _ProductsApi;
  @GET(AppEndPoints.getProducts)
  Future<List<ProductsResponseBody>> allProducts();
}
