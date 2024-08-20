// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_favorite_icon.dart';
import 'package:mo_store/features/favorites/logic/favorites_cubit/favorites_cubit.dart';
import 'package:mo_store/features/favorites/logic/favorites_cubit/favorites_state.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

class AddToCartAndFavorit extends StatelessWidget {
  final ProductsResponseBody product;
  const AddToCartAndFavorit({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<FavoritesCubit>(context);
              return CustomFavoiteIcon(
                size: 40,
                color: AppColors.lightBlue,
                onTap: () => cubit.addRemoveFavorite(
                  id: product.id!,
                  description: product.description!,
                  images: product.images!,
                  price: product.price!,
                  title: product.title!,
                ),
                isFavorite: cubit.isFavorite(favoriteId: product.id!),
              );
            },
          ),
          CustomButton(
            onPressed: () {},
            text: 'Add to cart',
            width: 175.w,
            height: 50.h,
            padding: 0,
          )
        ],
      ),
    );
  }
}
