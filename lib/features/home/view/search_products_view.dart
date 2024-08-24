import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/animation.dart';
import 'package:mo_store/core/helpers/app_enums.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/features/home/view/widgets/search_widgets/name_price_btns.dart';
import 'package:mo_store/features/home/view/widgets/search_widgets/search_field.dart';

class SearchProductsView extends StatefulWidget {
  const SearchProductsView({super.key});

  @override
  State<SearchProductsView> createState() => _SearchProductsViewState();
}

class _SearchProductsViewState extends State<SearchProductsView> {
  void byPriceFunction() {
    if (searchTybe == SearchEnum.none || searchTybe == SearchEnum.byName) {
      setState(() {
        searchTybe = SearchEnum.byPrice;
      });
    } else {
      setState(() {
        searchTybe = SearchEnum.none;
      });
    }
  }

  void byNameFunction() {
    if (searchTybe == SearchEnum.none || searchTybe == SearchEnum.byPrice) {
      setState(() {
        searchTybe = SearchEnum.byName;
      });
    } else {
      setState(() {
        searchTybe = SearchEnum.none;
      });
    }
  }

  var searchTybe = SearchEnum.none;
  bool closeSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const CustomFadeInDown(
                child: CustomAppBar(
                  title: 'Search Products',
                  isArrowBack: true,
                ),
              ),
              NameAndPriceButtons(
                byNameFunction: byNameFunction,
                byPriceFunction: byPriceFunction,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchField(
                      width: 300.w,
                      lable: 'By Name',
                    ),
                    SizedBox(
                      width: 50.w,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            closeSearch = !closeSearch;
                          });
                        },
                        child: closeSearch
                            ? Container(
                                width: 45.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5.r),
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
                                    borderRadius: BorderRadius.circular(5.r),
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
                )
              ],
              if (searchTybe == SearchEnum.byPrice) ...[
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SearchField(
                          width: 150.w,
                          showIcon: false,
                          lable: 'Min Price',
                        ),
                        SearchField(
                          width: 150.w,
                          showIcon: false,
                          lable: 'Max Price',
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    CustomButton(
                      onPressed: () {},
                      text: 'Search',
                      width: 200,
                      height: 45,
                      backgroundColor: AppColors.primaryColor,
                    )
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
