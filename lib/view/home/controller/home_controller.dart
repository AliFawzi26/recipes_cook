import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../food/sweets/controller/recipes_controller.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final searchQuery = ''.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
  }
  void filterAllRecipes(String query) {
    searchQuery.value = query;

    Get.find<RecipesController>(tag: 'حلويات').filterRecipes(query);
    Get.find<RecipesController>(tag: 'سلطات').filterRecipes(query);
    Get.find<RecipesController>(tag: 'أكلات شرقية').filterRecipes(query);
    Get.find<RecipesController>(tag: 'أكلات غربية').filterRecipes(query);
  }
  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
