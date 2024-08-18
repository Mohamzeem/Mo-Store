// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/features/home/data/repo/all_products_repo.dart';
import 'package:mo_store/features/home/logic/all_products_cubit/all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  final AllProductsRepo allProductsRepo;
  AllProductsCubit({required this.allProductsRepo})
      : super(const AllProductsInitial(list: [], hasMore: true));

  int offset = 8;
  Future<void> getPaginatedProducts() async {
    emit(const AllProductsLoading(list: [], hasMore: true));
    final result =
        await allProductsRepo.getPaginatedProducts(offset: 0, limit: 8);
    result.when(
      success: (products) {
        if (products.isEmpty) {
          emit(const AllProductsEmpty(
            list: [],
            hasMore: false,
            errMessage: 'No Products Found',
          ));
        } else {
          if (products.length < 8) {
            emit(AllProductsSuccess(list: products, hasMore: false));
          }
          emit(AllProductsSuccess(list: products, hasMore: true));
        }
      },
      failure: (message) => emit(AllProductsFailure(
        errMessage: message,
        list: state.list,
        hasMore: false,
      )),
    );
  }

  Future<void> _getMoreProducts() async {
    if (!state.hasMore) return;
    offset += 8;
    // emit(AllProductsLoading(list: state.list, hasMore: state.hasMore));
    final result =
        await allProductsRepo.getPaginatedProducts(offset: offset, limit: 8);
    result.when(
      success: (products) {
        if (products.isEmpty) {
          emit(AllProductsEmpty(
            list: state.list,
            hasMore: false,
            errMessage: 'No Products More Found',
          ));
        }
        final newList = [...state.list, ...products];
        emit(AllProductsSuccess(
          list: newList,
          hasMore: products.length < 8 ? false : true,
        ));
      },
      failure: (message) => emit(AllProductsFailure(
        errMessage: message,
        list: state.list,
        hasMore: state.hasMore,
      )),
    );
  }

  void scrollListener({
    required ScrollController scrollController,
  }) async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await _getMoreProducts();
    }
  }
}
