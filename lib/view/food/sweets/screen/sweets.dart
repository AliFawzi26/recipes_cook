import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../Core/const/app_colors.dart';
import '../../../widgets/gridview.dart';
import '../controller/recipes_controller.dart';

class SweetsScreen extends StatelessWidget {
  SweetsScreen({Key? key}) : super(key: key);

  final RecipesController controller = Get.put(RecipesController('حلويات'), tag: 'حلويات');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      body: Obx(() {
        if (controller.filteredRecipesList.isEmpty) {
          return Center(child: Text("لا توجد وصفات مطابقة"));
        } else {
          return RecipeGridView(recipes: controller.filteredRecipesList, controller: controller);
        }
      }),
    );
  }
}
