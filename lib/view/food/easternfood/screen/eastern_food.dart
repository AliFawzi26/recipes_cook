import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/const/app_colors.dart';
import '../../../widgets/gridview.dart';
import '../../sweets/controller/recipes_controller.dart';

class EasternFoodScreen extends StatelessWidget {
  EasternFoodScreen({Key? key}) : super(key: key);
  final RecipesController controller = Get.put(  RecipesController('أكلات شرقية'),  tag: 'أكلات شرقية', );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Obx(() {
      if (controller.filteredRecipesList.isEmpty) {
        return const Center(child: Text("لا توجد وصفات بعد"));
      } else {
        return RecipeGridView(
          recipes: controller.filteredRecipesList,
          controller: controller,
        );
      }
    });
  }
}
