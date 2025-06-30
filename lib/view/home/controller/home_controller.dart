
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../food/sweets/controller/recipes_controller.dart';
class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final searchQuery = ''.obs;
  final List<String> _tags = ['حلويات', 'سلطات', 'أكلات شرقية', 'أكلات غربية'];
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
  }

  void filterCurrentTabRecipes(String query) {
    searchQuery.value = query;
    final tag = _tags[tabController.index];
    Get.find<RecipesController>(tag: tag).filterRecipes(query);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
