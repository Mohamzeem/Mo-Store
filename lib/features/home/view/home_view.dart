import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/home_body.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/home_scroll_btn.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isAtBottom = false;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollUp() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      bool isBottom = _scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent;
      setState(() => isAtBottom = isBottom);
    } else {
      setState(() => isAtBottom = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: RefreshIndicator(
        color: AppColors.white,
        backgroundColor: AppColors.lightBlue,
        onRefresh: () => BlocProvider.of<ProductsCubit>(context).getProducts(),
        child: Stack(
          children: [
            HomeBody(scrollController: _scrollController),
            HomeScrolllButton(onTap: () => scrollUp()),
          ],
        ),
      ),
    );
  }
}
