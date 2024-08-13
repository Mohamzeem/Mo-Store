// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/data/repo/all_products_repo.dart';
import 'package:mo_store/features/home/logic/all_products_cubit/all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  final AllProductsRepo allProductsRepo;
  AllProductsCubit({required this.allProductsRepo})
      : super(const AllProductsState.initial([]));

  final ScrollController scrollController = ScrollController();
  final List<ProductsResponseBody> list = [];
  bool isLoading = false;
  bool hasMore = true;

  Future<void> getPaginatedProducts() async {
    emit(const AllProductsState.loading([]));
    final result = await allProductsRepo.getPaginatedProducts(
        offset: list.length, limit: 8);
    result.when(
      success: (products) {
        if (products.isEmpty) {
          emit(const AllProductsState.empty());
        } else {
          hasMore = true;
          list.addAll(products);
          emit(AllProductsState.success(products));
        }
      },
      failure: (message) => emit(AllProductsState.failure(message)),
    );
  }

  Future<void> getMoreProducts() async {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        hasMore) {
      emit(AllProductsState.loading(list));
      final result = await allProductsRepo.getPaginatedProducts(
          offset: list.length, limit: 8);
      result.when(
        success: (products) {
          list.addAll(products);
          emit(AllProductsState.success(list));
        },
        failure: (message) => emit(AllProductsState.failure(message)),
      );
    }
  }
}
