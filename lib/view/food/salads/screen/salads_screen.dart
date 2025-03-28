import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/const/app_colors.dart';
import '../../../widgets/gridview.dart';
import '../../sweets/controller/recipes_controller.dart';
class SaladsScreen extends StatelessWidget {
  SaladsScreen({Key? key}) : super(key: key);

  final RecipesController controller = Get.put(RecipesController('سلطات'), tag: 'سلطات');

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
