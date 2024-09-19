import 'package:mo_store/core/network/graphql_queries/categories_queries.dart';
import 'package:mo_store/features/admin/data/models/categories/add_category_request.dart';
import 'package:mo_store/features/admin/data/models/categories/add_category_response.dart';
import 'package:mo_store/features/home/data/api/categories_api.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';

class HomeDataSource {
  final CategoriesApi categoriesApi;

  HomeDataSource({required this.categoriesApi});

  Future<CategoriesResponseBody> getCategoriesGraphql() async {
    final response = await categoriesApi.getCategoriesGraphql(
        GraphQlCategoriesQueries().getAllCategoriesMapQuery());
    return response;
  }

  Future<AddCategoriesResponseBody> addCategoryGraphql(
      AddCategoriesRequest body) async {
    final response = await categoriesApi.addCategoryGraphql(
        GraphQlCategoriesQueries().addAllCategoriesMapQuery(body));
    return response;
  }
}
