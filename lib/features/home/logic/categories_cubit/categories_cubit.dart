import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/features/admin/data/models/categories/add_category_request.dart';
import 'package:mo_store/features/home/data/models/categories_request.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/data/repo/categories_repo.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesCubit({required this.categoriesRepo})
      : super(const CategoriesState.initial());
  List<CategoriesModel> allCategories = [];
  List<CategoriesModel> foundCategories = [];
  String searchText = '';

  Future<void> getCategories() async {
    emit(const CategoriesState.loadingCategories());
    final result = await categoriesRepo.getCategoriesGraphql();
    result.when(
      success: (categories) {
        if (categories.categoriesList.isEmpty) {
          emit(const CategoriesState.emptyCategories());
        } else {
          Prints.debug(
              message:
                  'allCategoriesList ${categories.categoriesList.length.toString()}');
          allCategories = categories.categoriesList;
          emit(CategoriesState.successCategories(categories));
        }
      },
      failure: (message) => emit(CategoriesState.failureCategories(message)),
    );
  }

  Future<void> searchCategory() async {
    emit(const CategoriesState.loadingSearchCategories());
    foundCategories = allCategories
        .where((e) => e.name!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    if (foundCategories.isEmpty) {
      emit(const CategoriesState.emptySearchCategories());
    } else {
      Prints.debug(message: 'searchCategories ${foundCategories.length}');
      emit(CategoriesState.successSearchCategories(foundCategories));
    }
  }

  Future<void> addCategory(AddCategoriesRequest body) async {
    emit(const CategoriesState.loadingAddCategories());
    final result = await categoriesRepo.addCategoryGraphql(body);
    result.when(
      success: (response) => emit(const CategoriesState.successAddCategories()),
      failure: (message) => emit(CategoriesState.failureAddCategories(message)),
    );
  }

  Future<void> updateCategory() async {}
  Future<void> deleteCategory() async {}
}
