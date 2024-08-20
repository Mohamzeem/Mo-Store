import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_favorite_icon.dart';
import 'package:mo_store/features/favorites/data/models/favorit_model.dart';
import 'package:mo_store/features/favorites/logic/favorites_cubit/favorites_cubit.dart';
import 'package:mo_store/features/favorites/logic/favorites_cubit/favorites_state.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/home_cached_image.dart';

class FavoriteItem extends StatelessWidget {
  final FavoritModel product;
  const FavoriteItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => context.pushName(Routes.productDetailsView, args: product),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.lightBlue.withOpacity(0.3),
              AppColors.lightBlue.withOpacity(0.7),
              AppColors.darkBlue.withOpacity(0.7),
              AppColors.darkBlue.withOpacity(0.9),
            ],
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            //^ share and favorite
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.share,
                      size: 25.r,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  BlocBuilder<FavoritesCubit, FavoritesState>(
                    builder: (context, state) {
                      final cubit = BlocProvider.of<FavoritesCubit>(context);
                      return CustomFavoiteIcon(
                        size: 25,
                        color: AppColors.primaryColor,
                        onTap: () {
                          cubit.addRemoveFavorite(
                            id: product.id!,
                            description: product.description!,
                            images: product.images!,
                            price: product.price!,
                            title: product.title!,
                          );
                          cubit.getFavorites();
                        },
                        isFavorite: cubit.isFavorite(favoriteId: product.id!),
                      );
                    },
                  ),
                ],
              ),
            ),
            //^ image
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: HomeCachedNetworkImage(
                photoUrl: product.images!.first,
                width: double.infinity,
                height: 110,
                shape: BoxShape.rectangle,
                fit: BoxFit.cover,
              ),
            ),
            //^ title and price
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.title!,
                    style: AppFonts.medium18Primary.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('${product.price} \$', style: AppFonts.medium18Primary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
