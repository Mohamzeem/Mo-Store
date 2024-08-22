import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/features/favorites/logic/favorites_cubit/favorites_cubit.dart';
import 'package:mo_store/features/favorites/logic/favorites_cubit/favorites_state.dart';
import 'package:mo_store/features/favorites/view/widgets/empty_error.dart';
import 'package:mo_store/features/favorites/view/widgets/favorite_item.dart';

class FavoritesWithCubit extends StatelessWidget {
  const FavoritesWithCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavoritesCubit>(context);
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final list = cubit.getFavorites();
        return list.isEmpty
            ? const EmptyAndError()
            : Column(
                children: [
                  SizedBox(height: 55.h),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: list.length,
                      semanticChildCount: 2,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        final product = list[index];
                        return FavoriteItem(product: product);
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
