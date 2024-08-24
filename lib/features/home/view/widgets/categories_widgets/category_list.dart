// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/view/widgets/categories_widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  final List<CategoriesResponseBody> categories;
  const CategoryList({super.key, required this.categories});

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
          return CategoryItem(index: index, category: category);
        },
      ),
    );
  }
}
