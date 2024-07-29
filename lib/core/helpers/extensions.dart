import 'package:flutter/material.dart';
import 'package:mo_store/core/helpers/prints.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushName(String routeName, {Object? args}) async {
    Prints.route('Navigat to => $routeName');
    return Navigator.of(this).pushNamed(routeName, arguments: args);
  }

  Future<dynamic> pushReplacmentName(String routeName, {Object? args}) async {
    Prints.route('Navigat And Replacment => $routeName');
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: args);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? args, required RoutePredicate predicate}) async {
    Prints.route('Navigat And RemoveUntil => $routeName');
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: args);
  }

  Future<dynamic> popAndPushNamed(String routeName, {Object? args}) async {
    Prints.route('Page Closed');
    return Navigator.of(this).popAndPushNamed(routeName);
  }

  void pop() {
    Prints.route('Page Closed');
    return Navigator.of(this).pop();
  }
}

extension StringExt on String? {
  bool isNullOrEmpty() => this == null || this == '';
}

extension ListExt on List? {
  bool isNullOrEmpty() => this == null || this == [];
}

// extension UserInfo on ProfileModel {
//   String toJson() => json.encode(toJson());
//   static ProfileModel fromJson(String source) =>
//       ProfileModel.fromJson(json.decode(source));
// }
