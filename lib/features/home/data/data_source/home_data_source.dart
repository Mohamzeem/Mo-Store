import 'package:mo_store/core/network/graphql_queries/categories_queries.dart';
import 'package:mo_store/core/network/graphql_queries/products_queries.dart';
import 'package:mo_store/features/admin/data/models/categories/add_category_request.dart';
import 'package:mo_store/features/admin/data/models/categories/add_category_response.dart';
import 'package:mo_store/features/home/data/api/categories_api.dart';
import 'package:mo_store/features/home/data/api/products_api.dart';
import 'package:mo_store/features/home/data/models/categories_request.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/data/models/create_product_request.dart';

class HomeDataSource {
  final CategoriesApi categoriesApi;
  final ProductsApi productsApi;

  HomeDataSource({required this.categoriesApi, required this.productsApi});

  Future<CategoriesResponseBody> getCategoriesGraphql() async {
    final response = await categoriesApi.getCategoriesGraphql(
        GraphQlCategoriesQueries().getAllCategoriesMapQuery());
    return response;
  }

  Future<AddCategoriesResponseBody> addCategoryGraphql(
      AddCategoriesRequest body) async {
    final response = await categoriesApi.addCategoryGraphql(
        GraphQlCategoriesQueries().addCategoriesMapQuery(body));
    return response;
  }

  Future<void> updateCategoryGraphql(CategoriesRequest body) async {
    final response = await categoriesApi.updateCategoryGraphql(
        GraphQlCategoriesQueries().updateCategoriesMapQuery(body));
    return response;
  }

  Future<void> deleteCategoryGraphql(String categoryId) async {
    final response = await categoriesApi.deleteCategoryGraphql(
        GraphQlCategoriesQueries().deleteCategoriesMapQuery(categoryId));
    return response;
  }

  Future<void> addProductGraphql() async {
    final response = await productsApi.addProductGraphql(
        GraphQlProductsQueries().addProductsMapQuery(CreateProductRequest()));
    return response;
  }
}
