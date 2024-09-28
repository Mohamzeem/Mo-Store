import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_state.dart';

class CategorySelect extends StatefulWidget {
  const CategorySelect({
    super.key,
  });

  @override
  State<CategorySelect> createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductsCubit>(context);
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final list = BlocProvider.of<CategoriesCubit>(context)
            .allCategories
            .map((e) => e.name)
            .toList();

        return Container(
          width: 210.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.lightBlue, width: 2.w),
          ),
          child: Center(
            child: DropdownButton<String>(
              iconEnabledColor: AppColors.lightBlue,
              style: TextStyle(color: AppColors.primaryColor, fontSize: 20.sp),
              elevation: 10,
              alignment: Alignment.center,
              dropdownColor: AppColors.bordersGrey,
              borderRadius: BorderRadius.circular(16.r),
              isExpanded: true,
              underline: const SizedBox.shrink(),
              hint: Text(
                'Category Name',
                style: AppFonts.regular18LightBlue,
              ),
              onChanged: (value) => setState(() {
                cubit.dropDownValue(value!);
              }),
              value: cubit.selectedCategory.isNullOrEmptyString()
                  ? null
                  : cubit.selectedCategory,
              items: list.map((category) {
                return DropdownMenuItem(
                  value: category,
                  alignment: Alignment.center,
                  child: Text(category!),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
