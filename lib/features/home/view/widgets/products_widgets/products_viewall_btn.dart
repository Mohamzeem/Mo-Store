import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/core/widgets/custom_button.dart';

class ViewAllProductsButton extends StatelessWidget {
  const ViewAllProductsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: CustomButton(
          onPressed: () => context.pushReplacmentName(Routes.allProductsView),
          padding: 0,
          text: 'View All Products',
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
