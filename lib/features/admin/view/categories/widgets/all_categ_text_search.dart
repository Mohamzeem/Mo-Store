import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_search_field.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';

class AllCategoriesTextAndSearch extends StatefulWidget {
  const AllCategoriesTextAndSearch({super.key});

  @override
  State<AllCategoriesTextAndSearch> createState() =>
      _AllCategoriesTextAndSearchState();
}

class _AllCategoriesTextAndSearchState
    extends State<AllCategoriesTextAndSearch> {
  bool showSearch = false;
  late CategoriesCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<CategoriesCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showSearch
                  ? SizedBox(
                      width: 310.w,
                      height: 45,
                      child: CustomSearchField(
                        padding: 0,
                        label: 'Category Name',
                        keyBoard: TextInputType.text,
                        onChanged: (value) {
                          _cubit.searchText = value;
                          _cubit.searchCategory();
                        },
                      ),
                    )
                  : Text('All Categories', style: AppFonts.medium22Primary),
              InkWell(
                onTap: () {
                  setState(() => showSearch = !showSearch);
                  if (showSearch == false) {
                    _cubit.searchText = '';
                    _cubit.foundCategories.clear();
                    _cubit.getCategories();
                  }
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  child: Icon(
                    showSearch ? Icons.close : Icons.circle_outlined,
                    size: 35.r,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
