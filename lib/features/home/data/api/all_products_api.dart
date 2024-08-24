import 'package:dio/dio.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:retrofit/retrofit.dart';

part 'all_products_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class AllProductsApi {
  factory AllProductsApi(Dio dio, {String baseUrl}) = _AllProductsApi;

  @GET('${AppEndPoints.getProducts}/?offset={offset}&limit={limit}')
  Future<List<ProductsResponseBody>> paginatedProducts(
      @Path('offset') int offset, @Path('limit') int limit);
}
