import 'package:flutter/material.dart';
import 'package:mo_store/features/home/view/widgets/categories_widgets/category_list.dart';

class CategoriesWithCubit extends StatelessWidget {
  const CategoriesWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: const CategoryList());
  }
}
