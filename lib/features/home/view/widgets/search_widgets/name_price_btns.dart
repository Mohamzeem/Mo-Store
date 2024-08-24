import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/animation.dart';
import 'package:mo_store/core/widgets/custom_button.dart';

class NameAndPriceButtons extends StatelessWidget {
  final VoidCallback byNameFunction;
  final VoidCallback byPriceFunction;
  const NameAndPriceButtons({
    super.key,
    required this.byNameFunction,
    required this.byPriceFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomFadeInLeft(
            child: CustomButton(
              onPressed: byNameFunction,
              padding: 0,
              text: 'By Name',
              width: 150,
              height: 50,
            ),
          ),
          CustomFadeInRight(
            child: CustomButton(
              onPressed: byPriceFunction,
              padding: 0,
              text: 'By Price',
              width: 150,
              height: 50,
            ),
          )
        ],
      ),
    );
  }
}
