import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/features/home/data/models/create_product_request.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/data/repo/products_repo.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit({required this.productsRepo})
      : super(const ProductsState.initial());

  final searchController = TextEditingController();
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();
  String searchText = '';

  List<ProductsResponseBody> allProductsList = [];
  List<ProductsResponseBody> foundProductsList = [];
  List<ProductsResponseBody> categoryProductsList = [];

  String selectedCategory = '';
  void dropDownValue(String val) => selectedCategory = val;
  Future<void> getProducts() async {
    emit(const ProductsState.loadingProducts());
    final result = await productsRepo.getProducts();
    result.when(
      success: (products) {
        if (products.isEmpty) {
          emit(const ProductsState.emptyProducts());
        } else {
          allProductsList = products;
          Prints.debug(
              message: 'allProductsList ${products.length.toString()}');
          emit(ProductsState.successProducts(products));
        }
      },
      failure: (message) => emit(ProductsState.failureProducts(message)),
    );
  }

  Future<List<ProductsResponseBody>> adminSearchProduct() async {
    emit(const ProductsState.loadingSearch());
    foundProductsList = allProductsList
        .where((e) => e.title!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    if (foundProductsList.isEmpty) {
      emit(const ProductsState.emptySearch());
    } else {
      emit(ProductsState.successSearch(foundProductsList));
    }

    return foundProductsList;
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

  Future<void> addProductGraphql({
    required String title,
    required double price,
    required String description,
    required double categoryId,
    required List<String> images,
  }) async {
    emit(const ProductsState.loadingAddProduct());
    final result = await productsRepo.addProductGraphql(AddProductRequest(
      title: title,
      price: price,
      description: description,
      images: images,
      categoryId: categoryId,
    ));
    result.when(
      success: (response) => emit(const ProductsState.successAddProduct()),
      failure: (message) => emit(ProductsState.failureAddProduct(message)),
    );
  }
}
