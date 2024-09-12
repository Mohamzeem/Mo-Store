import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/features/admin/view/dashboard/widgets/dashboard_container.dart';
import 'package:mo_store/features/admin/view/dashboard/widgets/error_container.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_state.dart';

class CategoriesContainerWIthCubit extends StatelessWidget {
  const CategoriesContainerWIthCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const ErrorContainer(
            text: 'Categories',
          ),
          successCategories: (categories) => DashboardContainer(
            title: 'Categories',
            number: categories.length.toString(),
            image: 'assets/images/pngs/category.png',
          ),
          loadingCategories: () => const DashboardContainer(
            isLoading: true,
            title: 'Categories',
            number: '',
            image: 'assets/images/pngs/category.png',
          ),
        );
      },
    );
  }
}
