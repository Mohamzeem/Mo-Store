import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/view/widgets/categories_widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  final List<CategoriesResponseBody> categories;
  final List<ProductsResponseBody> allprodList;

  const CategoryList({
    super.key,
    required this.categories,
    required this.allprodList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            index: index,
            categoryInfo: (allprodList: allprodList, category: category),
          );
        },
      ),
    );
  }
}
