import 'package:mo_store/features/home/data/models/create_product_request.dart';

class GraphQlProductsQueries {
  static final _instance = GraphQlProductsQueries._internal();
  GraphQlProductsQueries._internal();
  factory GraphQlProductsQueries() {
    return _instance;
  }

  Map<String, dynamic> getAllProductsMapQuery() {
    return {
      'query': '''
            {
            products{
              id
              title
              price
              images
              description
              category{
                id
                name
                }
            }
          }
      ''',
    };
  }

  Map<String, dynamic> addProductsMapQuery(AddProductRequest body) {
    return {
      'query': r'''
          mutation CreateProduct($title: String!, $price: Float!, $description:String!, $categoryId: Float!,$imagesList:[String!]!) {
              addProduct(
                data: {
                  title: $title,
                  price: $price
                  description: $description
                  categoryId: $categoryId
                  images: $imagesList
                }
              ) {
                title
              }
            }
        ''',
      'variables': {
        'title': body.title,
        'price': body.price,
        'description': body.description,
        'categoryId': body.categoryId,
        'imagesList': body.images,
      },
    };
  }

  Map<String, dynamic> updateProductsMapQuery() {
    return {};
  }

  Map<String, dynamic> deleteProductsMapQuery(String productId) {
    return {};
  }
}
