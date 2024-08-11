import 'package:flutter/material.dart';
import 'package:mo_store/features/home/view/widgets/banners.dart';
import 'package:mo_store/features/home/view/widgets/categories_widgets/category_list.dart';
import 'package:mo_store/features/home/view/widgets/products_widgets/products_list.dart';
import 'package:mo_store/features/home/view/widgets/products_widgets/products_viewall_btn.dart';
import 'package:mo_store/features/home/view/widgets/search_field.dart';

class HomeBody extends StatelessWidget {
  final ScrollController scrollController;
  const HomeBody({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: const [
        SearchField(),
        Banners(),
        CategoryList(),
        Allproducts(),
        ViewAllProductsButton(),
      ],
    );
  }
}
