import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/features/home/data/repo/home_repo.dart';
import 'package:mo_store/features/home/logic/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(const HomeState.initial());

  Future<void> getCategories() async {
    emit(const HomeState.loadingCategories());
    final result = await homeRepo.getCategories();
    result.when(
      success: (categories) {
        if (categories.isEmpty) {
          emit(const HomeState.emptyCategories());
        }
        emit(HomeState.successCategories(categories));
      },
      failure: (message) => emit(HomeState.failureCategories(message)),
    );
  }

  Future<void> getProducts() async {
    emit(const HomeState.loadingProducts());
    final result = await homeRepo.getProducts();
    result.when(
      success: (products) {
        if (products.isEmpty) {
          emit(const HomeState.emptyProducts());
        }
        emit(HomeState.successProducts(products));
      },
      failure: (message) => emit(HomeState.failureProducts(message)),
    );
  }
}
