import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/helpers/prints.dart';
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
  List<ProductsResponseBody> categoryProductsList = [];

  List<String> roleList = ['customer', 'admin', 'moderator', 'super_admin'];
  String selectedRole = '';
  void dropDownValue(String val) => selectedRole = val;
  Future<void> getProducts() async {
    emit(const ProductsState.loadingProducts());
    final result = await productsRepo.getProducts();
    result.when(
      success: (products) {
        if (products.isEmpty) {
          emit(const ProductsState.emptyProducts());
        } else {
          allProductsList.addAll(products);
          Prints.debug(
              message: 'allProductsList ${products.length.toString()}');
          emit(ProductsState.successProducts(products));
        }
      },
      failure: (message) => emit(ProductsState.failureProducts(message)),
    );
  }

  Future<List<ProductsResponseBody>> searchProductsByName(
      List<ProductsResponseBody> list) async {
    emit(const ProductsState.loadingSearch());
    final findProducts = list
        .where((e) => e.title!
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    if (findProducts.isEmpty) {
      emit(const ProductsState.emptySearch());
    } else {
      emit(ProductsState.successSearch(findProducts));
    }
    foundProductsList = findProducts;
    return findProducts;
  }

  Future<List<ProductsResponseBody>> searchProductsByprice(
      List<ProductsResponseBody> list) async {
    emit(const ProductsState.loadingSearch());
    final findProducts = list
        .where((e) =>
            e.price! >= double.parse(minPriceController.text) &&
            e.price! <= double.parse(maxPriceController.text))
        .toList();
    if (findProducts.isEmpty) {
      emit(const ProductsState.emptySearch());
    } else {
      emit(ProductsState.successSearch(findProducts));
    }
    foundProductsList = findProducts;
    return findProducts;
  }

  Future<List<ProductsResponseBody>> categoriesProducts(
    categoryId,
    List<ProductsResponseBody> list,
  ) async {
    emit(const ProductsState.loadingCategory());
    categoryProductsList =
        list.where((e) => e.category!.id! == categoryId).toList();
    if (categoryProductsList.isEmpty) {
      emit(const ProductsState.emptyCategory());
    } else {
      emit(ProductsState.successCategory(categoryProductsList));
    }

    return categoryProductsList;
  }
}
