import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipes_cook/main.dart';
import 'package:recipes_cook/view/food/%20westernfood/screen/western_food.dart';
import 'package:recipes_cook/view/food/easternfood/screen/eastern_food.dart';
import 'package:recipes_cook/view/food/salads/screen/salads_screen.dart';
import 'package:recipes_cook/view/food/sweets/screen/sweets.dart';
import '../../../Core/const/app_colors.dart';
import '../../../Core/const/text_style.dart';
import '../../bottomnav/screen/bottom_nav.dart';
import '../widget/searchbox.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController(), permanent: true);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
              tabs: [
                Tab(child: Text('حلويات', style: FontStyles.tabBar(context))),
                Tab(child: Text('سلطات', style: FontStyles.tabBar(context))),
                Tab(child: Text('أكلات شرقية', style: FontStyles.tabBar(context))),
                Tab(child: Text('أكلات غربية', style: FontStyles.tabBar(context))),
              ],
            ),
             SizedBox(height: 20.sp),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children:  [
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
      ),
    );
  }
}
