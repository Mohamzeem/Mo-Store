// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/home/data/api/products_api.dart';
import 'package:mo_store/features/home/data/data_source/home_data_source.dart';
import 'package:mo_store/features/home/data/models/create_product_request.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

class ProductsRepo {
  final ProductsApi productsApi;
  final HomeDataSource homeDataSource;
  ProductsRepo({
    required this.productsApi,
    required this.homeDataSource,
  });

  Future<ApiResult<List<ProductsResponseBody>>> getProducts() async {
    try {
      final result = await productsApi.allProducts();
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>> addProductGraphql(CreateProductRequest body) async {
    try {
      final response = await homeDataSource.addProductGraphql();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
