import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipes_cook/view/favourite/screen/favourite_screen.dart';
import '../../addproduct/screen/addproduct.dart';
import '../controller/bottom_nav_controller.dart';
import '../../../Core/const/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final BottomNavController controller = Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: ColorManger.white,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home, "الرئيسية", 0),
            _buildAddButton(), // زر الإضافة
            _buildNavItem(Icons.favorite, "المفضلة", 1),
          ],
        ),
      ),
    ));
  }
  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () { controller.changeIndex(index);
      if(index==1){
        Get.to(FavoriteRecipesScreen());
      }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: controller.selectedIndex.value == index ? ColorManger.oran : ColorManger.GA2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: controller.selectedIndex.value == index ? ColorManger.oran : ColorManger.GA2),
            ),
        ],
      ),
    );
  }
  Widget _buildAddButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () => Get.dialog(
            AddProductDialog(),
            barrierDismissible: false,
          ),
          backgroundColor: ColorManger.oran,
          shape:  CircleBorder(),
          child:  Icon(Icons.add, size: 30, color: ColorManger.white),
        ),
      ],
    );
  }
}

