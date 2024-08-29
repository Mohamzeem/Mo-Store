import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/core/local_database/shared_prefs.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/data/repo/products_repo.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit({required this.productsRepo})
      : super(const ProductsState.initial());

  final TextEditingController searchController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  List<ProductsResponseBody> allProductsList = [];
  List<ProductsResponseBody> foundProductsList = [];

  Future<void> getProducts() async {
    emit(const ProductsState.loadingProducts());
    final result = await productsRepo.getProducts();
    result.when(
      success: (products) {
        if (products.isEmpty) {
          emit(const ProductsState.emptyProducts());
        } else {
          allProductsList.addAll(products);
          Prints.debug(message: allProductsList.length.toString());
          emit(ProductsState.successProducts(products));
        }
      },
      failure: (message) => emit(ProductsState.failureProducts(message)),
    );
  }

  Future<List<ProductsResponseBody>> searchProductsByName() async {
    final findProducts = allProductsList
        .where((e) => e.title!
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    foundProductsList = findProducts;
    return findProducts;
  }

  // Future<void> saveAllProductslocaly(
  //     List<ProductsResponseBody> products) async {
  //   List<String> jsonStringList =
  //       products.map((product) => jsonEncode(product.toJson())).toList();
  //   // Save the string list to Shared Preferences
  //   await SharedPrefHelper.setData('saved products', jsonStringList).then((_) {
  //     Prints.debug(message: 'local saved successfully');
  //   }).catchError((error) {
  //     Prints.error(endPoint: error.toString());
  //   });
  // }

  // Future<List<ProductsResponseBody>> loadProductList() async {
  //   List<String>? stringList =
  //       await SharedPrefHelper.getStringList('saved products');
  //   if (stringList != null) {
  //     try {
  //       savedProductsList = stringList
  //           .map((jsonString) =>
  //               ProductsResponseBody.fromJson(jsonDecode(jsonString)))
  //           .toList();
  //       return savedProductsList;
  //     } on Exception catch (e) {
  //       Prints.error(endPoint: e.toString());
  //       return [];
  //     }
  //   } else {
  //     return [];
  //   }
  // }
}
