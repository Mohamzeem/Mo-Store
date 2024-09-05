// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/animation.dart';
import 'package:mo_store/core/helpers/app_enums.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_state.dart';
import 'package:mo_store/features/home/view/widgets/search_widgets/name_price_btns.dart';
import 'package:mo_store/features/home/view/widgets/search_widgets/search_field.dart';
import 'package:mo_store/features/home/view/widgets/search_widgets/search_item.dart';

class SearchProductsView extends StatefulWidget {
  final List<ProductsResponseBody> allprodList;

  const SearchProductsView({
    super.key,
    required this.allprodList,
  });

  @override
  State<SearchProductsView> createState() => _SearchProductsViewState();
}

class _SearchProductsViewState extends State<SearchProductsView> {
  List<ProductsResponseBody> list = [];
  var searchTybe = SearchEnum.none;
  bool closeSearch = false;
  late ProductsCubit _cubit;

  void clearControllers() {
    _cubit.searchController.clear();
    _cubit.maxPriceController.clear();
    _cubit.minPriceController.clear();
  }

  void byPriceUi() {
    if (searchTybe == SearchEnum.none || searchTybe == SearchEnum.byName) {
      setState(() {
        searchTybe = SearchEnum.byPrice;
        closeSearch = false;
        list.clear();
        clearControllers();
      });
    } else {
      setState(() {
        searchTybe = SearchEnum.none;
      });
    }
  }

  void byNameUi() {
    if (searchTybe == SearchEnum.none || searchTybe == SearchEnum.byPrice) {
      setState(() {
        searchTybe = SearchEnum.byName;
        closeSearch = false;
        list.clear();
        clearControllers();
      });
    } else {
      setState(() {
        searchTybe = SearchEnum.none;
      });
    }
  }

  void searchNameFunction() {
    if (_cubit.searchController.text.isNotEmpty) {
      _cubit.searchProductsByName(widget.allprodList);

      if (closeSearch == true) {
        setState(() {
          _cubit.foundProductsList.clear();
          list.clear();
          _cubit.searchController.clear();
        });
      } else if (_cubit.foundProductsList.isEmpty) {
        CustomDialog.show(
            context: context, text: '0 products found', isSuccess: false);
      }

      setState(() {
        closeSearch = !closeSearch;
      });
    } else {
      CustomDialog.show(
          context: context, text: 'Product name required', isSuccess: false);
    }
  }

  void searchPriceFunction() {
    if (_cubit.minPriceController.text.isNotEmpty &&
        _cubit.maxPriceController.text.isNotEmpty) {
      _cubit.searchProductsByprice(widget.allprodList);
      if (closeSearch == true) {
        setState(() {
          _cubit.foundProductsList.clear();
          list.clear();
          _cubit.minPriceController.clear();
          _cubit.maxPriceController.clear();
        });
      } else if (_cubit.foundProductsList.isEmpty) {
        CustomDialog.show(
            context: context, text: '0 products found', isSuccess: false);
      }
      setState(() {
        closeSearch = !closeSearch;
      });
    } else if (_cubit.minPriceController.text.isEmpty) {
      CustomDialog.show(
          context: context, text: 'Min price required', isSuccess: false);
    } else if (_cubit.maxPriceController.text.isEmpty) {
      CustomDialog.show(
          context: context, text: 'Max price required', isSuccess: false);
    }
  }

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<ProductsCubit>(context);
  }

  @override
  void dispose() {
    _cubit.searchController.dispose();
    _cubit.minPriceController.dispose();
    _cubit.maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              list = _cubit.foundProductsList;
              Prints.debug(message: list.length.toString());
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomFadeInDown(
                      child: CustomAppBar(
                        title: 'Search Products',
                        isArrowBack: true,
                      ),
                    ),
                    NameAndPriceButtons(
                      byNameFunction: byNameUi,
                      byPriceFunction: byPriceUi,
                    ),
                    if (searchTybe == SearchEnum.none) ...[
                      Padding(
                        padding: EdgeInsets.only(top: 100.h),
                        child: CustomFadeInUp(
                          child: Column(
                            children: [
                              Text(
                                'Find Products',
                                style: AppFonts.regular18LightBlue.copyWith(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.search,
                                size: 250.r,
                                color: AppColors.lightBlue,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                    if (searchTybe == SearchEnum.byName) ...[
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SearchField(
                                controller: _cubit.searchController,
                                width: 300.w,
                                lable: 'By Name',
                              ),
                              SizedBox(
                                width: 50.w,
                                child: InkWell(
                                  onTap: () {
                                    searchNameFunction();
                                  },
                                  child: closeSearch
                                      ? Container(
                                          width: 45.w,
                                          height: 45.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              color: AppColors.lightBlue),
                                          child: Icon(
                                            Icons.close,
                                            color: AppColors.white,
                                            size: 35.r,
                                          ),
                                        )
                                      : Container(
                                          width: 45.w,
                                          height: 45.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              color: AppColors.lightBlue),
                                          child: Icon(
                                            Icons.circle_outlined,
                                            size: 35.r,
                                            color: AppColors.white,
                                          ),
                                        ),
                                ),
                              )
                            ],
                          ),
                          list.isNotEmpty
                              ? state.maybeWhen(
                                  orElse: () => const SizedBox.shrink(),
                                  successSearch: (searchProducts) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: SizedBox(
                                      height: 800.h,
                                      child: ListView.builder(
                                        itemCount: list.length,
                                        itemBuilder: (context, index) {
                                          final item = list[index];
                                          return SearchItem(product: item);
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink()
                        ],
                      )
                    ],
                    if (searchTybe == SearchEnum.byPrice) ...[
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SearchField(
                                keyboardType: TextInputType.number,
                                width: 150.w,
                                controller: _cubit.minPriceController,
                                showIcon: false,
                                lable: 'Min Price',
                              ),
                              SearchField(
                                keyboardType: TextInputType.number,
                                width: 150.w,
                                controller: _cubit.maxPriceController,
                                showIcon: false,
                                lable: 'Max Price',
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          CustomButton(
                            onPressed: () => searchPriceFunction(),
                            text: !closeSearch ? 'Search' : 'Reset Search',
                            width: double.infinity,
                            padding: 0,
                            height: 45,
                            backgroundColor: AppColors.primaryColor,
                          ),
                          list.isNotEmpty
                              ? state.maybeWhen(
                                  orElse: () => const SizedBox.shrink(),
                                  successSearch: (searchProducts) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: SizedBox(
                                      height: 700.h,
                                      child: ListView.builder(
                                        itemCount: list.length,
                                        itemBuilder: (context, index) {
                                          final item = list[index];
                                          return SearchItem(product: item);
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
