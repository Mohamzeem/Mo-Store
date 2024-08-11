import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/features/home/view/widgets/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scrollController = ScrollController();

  void scrollUp() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        children: [
          HomeBody(scrollController: scrollController),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.lightBlue,
                    AppColors.darkBlue.withOpacity(0.9),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: InkWell(
                onTap: () {
                  scrollUp();
                },
                child: Center(
                  child: Image.asset(
                    'assets/images/pngs/arrow-top.png',
                    color: AppColors.white,
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
