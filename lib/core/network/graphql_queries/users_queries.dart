class GraphQlUsersQueries {
  static final _instance = GraphQlUsersQueries._internal();
  GraphQlUsersQueries._internal();
  factory GraphQlUsersQueries() {
    return _instance;
  }

  Map<String, dynamic> getAllCategoriesMapQuery() {
    return {
      'query': '''
            {
            users{
              id
              name
              email
            }
          }
      ''',
    };
  }
}
