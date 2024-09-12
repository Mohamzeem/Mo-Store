import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/features/home/data/repo/categories_repo.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesCubit({required this.categoriesRepo})
      : super(const CategoriesState.initial());

  Future<void> getCategories() async {
    emit(const CategoriesState.loadingCategories());
    final result = await categoriesRepo.getCategories();
    result.when(
      success: (categories) {
        if (categories.isEmpty) {
          emit(const CategoriesState.emptyCategories());
        } else {
          Prints.debug(
              message: 'allCategoriesList ${categories.length.toString()}');
          emit(CategoriesState.successCategories(categories));
        }
      },
      failure: (message) => emit(CategoriesState.failureCategories(message)),
    );
  }
}
