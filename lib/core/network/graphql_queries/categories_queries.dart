import 'package:mo_store/features/admin/data/models/categories/add_category_request.dart';
import 'package:mo_store/features/home/data/models/categories_request.dart';

class GraphQlCategoriesQueries {
  static final _instance = GraphQlCategoriesQueries._internal();
  GraphQlCategoriesQueries._internal();
  factory GraphQlCategoriesQueries() {
    return _instance;
  }

  Map<String, dynamic> getAllCategoriesMapQuery() {
    return {
      'query': '''
            {
            categories{
              id
              name
              image
            }
          }
      ''',
    };
  }

  Map<String, dynamic> addCategoriesMapQuery(AddCategoriesRequest body) {
    return {
      'query': r'''
          mutation Create($name: String!, $image: String!) {
            addCategory(
              data: {name: $name, image: $image}
            ) {
              id
              name
              image
            }
          }
      ''',
      'variables': {
        'name': body.name,
        'image': body.image,
      },
    };
  }

  Map<String, dynamic> updateCategoriesMapQuery(CategoriesRequest body) {
    return {
      'query': r'''
            mutation Update($id: ID!, $name: String!, $image: String!) {
            updateCategory(id: $id, changes: {name: $name, image: $image}) {
              id
            }
          }
        ''',
      'variables': {
        'id': body.id,
        'name': body.name,
        'image': body.image,
      },
    };
  }

  Map<String, dynamic> deleteCategoriesMapQuery(String categoryId) {
    return {
      'query': r'''
            mutation DeleteCategory($categoryId: ID!) {
              deleteCategory(id: $categoryId)
            }
      ''',
      'variables': {
        'categoryId': categoryId,
      },
    };
  }
}
