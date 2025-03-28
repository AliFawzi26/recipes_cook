
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/const/app_colors.dart';
import '../../../widgets/gridview.dart';
import '../../sweets/controller/recipes_controller.dart';


class EasternFoodScreen extends StatelessWidget {
  EasternFoodScreen({Key? key}) : super(key: key);

  final RecipesController controller = Get.put(RecipesController('أكلات شرقية'), tag: 'أكلات شرقية');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManger.white,
      body: Obx(() => controller.filteredRecipesList.isEmpty
          ?  Center(child: Text("لا توجد وصفات بعد"))
          : RecipeGridView(recipes: controller.filteredRecipesList, controller: controller)),

    );
  }
}