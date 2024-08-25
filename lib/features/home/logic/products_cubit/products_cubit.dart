import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Future<void> getProducts() async {
    emit(const ProductsState.loadingProducts());
    final result = await productsRepo.getProducts();
    result.when(
      success: (products) {
        if (products.isEmpty) {
          emit(const ProductsState.emptyProducts());
        } else {
          allProductsList = products;
          emit(ProductsState.successProducts(products));
        }
      },
      failure: (message) => emit(ProductsState.failureProducts(message)),
    );
  }

  Future<void> searchProductsByName() async {
    final result = allProductsList
        .where((e) => e.title!
            .toLowerCase()
            .contains(searchController.text.trim().toLowerCase()))
        .toList();
    allProductsList = result;
  }
}
