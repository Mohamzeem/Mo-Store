import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';

class AllProdcutsBar extends StatelessWidget {
  const AllProdcutsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h, right: 20.w, left: 20.w),
      child: const CustomAppBar(
        title: 'All Products',
        isArrowBack: true,
      ),
    );
  }
}
