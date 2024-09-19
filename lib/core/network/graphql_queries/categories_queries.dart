import 'package:mo_store/features/admin/data/models/categories/add_category_request.dart';

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

  Map<String, dynamic> addAllCategoriesMapQuery(AddCategoriesRequest body) {
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

  Map<String, dynamic> updateAllCategoriesMapQuery() {
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

  Map<String, dynamic> deleteAllCategoriesMapQuery() {
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
}
