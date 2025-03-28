import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:recipes_cook/Core/const/app_colors.dart';

import '../../food/sweets/controller/recipes_controller.dart';
import '../../widgets/gridview.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  final RecipesController controller = Get.put(RecipesController(''),tag: '');
  @override
  Widget build(BuildContext context) {
    controller.loadFavoriteRecipes();

    return Scaffold(
      backgroundColor: ColorManger.white,
      appBar: AppBar(
        title:  Text("المفضلة"),
        backgroundColor: ColorManger.white,
      ),
      body: Obx(() => controller.favoriteRecipes.isEmpty
          ?  Center(child: Text("لا توجد وصفات مفضلة بعد"))
          : RecipeGridView(recipes: controller.favoriteRecipes, controller: controller)),
    );
  }
}
