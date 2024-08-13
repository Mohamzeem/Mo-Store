import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/features/home/data/repo/products_repo.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit({required this.productsRepo})
      : super(const ProductsState.initial());

  Future<void> getProducts() async {
    emit(const ProductsState.loadingProducts());
    final result = await productsRepo.getProducts();
    result.when(
      success: (products) {
        if (products.isEmpty) {
          emit(const ProductsState.emptyProducts());
        } else {
          emit(ProductsState.successProducts(products));
        }
      },
      failure: (message) => emit(ProductsState.failureProducts(message)),
    );
  }
}
