import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipec_food/view/food/easternfood/screen/eastern_food.dart';
import 'package:recipec_food/view/food/salads/screen/salads_screen.dart';
import 'package:recipec_food/view/food/sweets/screen/sweets.dart';
import '../../../Core/const/app_colors.dart';
import '../../../Core/const/text_style.dart';
import '../../bottomnav/screen/bottom_nav.dart';
import '../../food/westernfood/screen/western_food.dart';
import '../widget/searchbox.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController(), permanent: true);
  static const List<Tab> _tabs = [
    Tab(child: Text('حلويات', style: FontStyles.tabBar)),
    Tab(child: Text('سلطات', style: FontStyles.tabBar)),
    Tab(child: Text('أكلات شرقية', style: FontStyles.tabBar)),
    Tab(child: Text('أكلات غربية', style: FontStyles.tabBar)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      appBar: AppBar(
        backgroundColor: ColorManger.white,
        elevation: 0,
        title: SearchBox(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20.sp),
          TabBar(
            controller: controller.tabController,
            unselectedLabelColor: ColorManger.text2,
            indicatorColor: ColorManger.oran,
            labelColor: ColorManger.oran,
            dividerColor: ColorManger.white,
            tabs: _tabs,
          ),
          SizedBox(height: 20.sp),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                SweetsScreen(),
                SaladsScreen(),
                EasternFoodScreen(),
                WesternFoodScreen(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

