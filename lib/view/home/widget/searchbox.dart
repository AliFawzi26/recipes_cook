import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipes_cook/Core/const/text_style.dart';
import '../../../Core/const/app_colors.dart';
import '../controller/home_controller.dart';

class SearchBox extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h, // ارتفاع متكيف
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: ColorManger.black.withOpacity(0.1),
            blurRadius: 5.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        onChanged: controller.filterAllRecipes,
        style: FontStyles.phstyle,
        decoration: FontStyles.searchDecoration,
      ),
    );
  }
}
