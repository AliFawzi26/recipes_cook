import 'dart:ui';

import 'package:get/get.dart';
import '../../../../Core/local_storge/sqfilte_config.dart';
import '../../../../model/recipec.dart';

class RecipesController extends GetxController {
  final RxList<RecipeModel> recipesList = <RecipeModel>[].obs;
  final RxList<RecipeModel> filteredRecipesList=<RecipeModel>[].obs;
  final SqfliteConfg db = SqfliteConfg();
  var favoriteRecipes = <RecipeModel>[].obs;
  late String category; // تحديد الفئة لكل شاشة
  RecipesController(this.category);
  @override
  void onInit() {
    loadData();
    super.onInit();
    loadFavoriteRecipes();
  }


  Future<void> loadData() async {
    var data = await db.getRecipesByCategory(category);
    recipesList.assignAll(data);
    filteredRecipesList.assignAll(data);

  }
  void filterRecipes(String query){

if(query .isEmpty){
  filteredRecipesList.assignAll(recipesList);
}else{
  filteredRecipesList.assignAll( recipesList.where((recipe) => recipe.title.contains(query)).toList(),);
}


  }



  void addRecipe(RecipeModel recipe) {
    if (recipe.category == category) {
      recipesList.add(recipe);
    }
  }



  // 🟢 تحميل الوصفات المفضل
  void loadFavoriteRecipes() async {
    favoriteRecipes.value = await db.getFavoriteRecipes();
  }

  // 🟢 تحديث حالة التفضيل
  Future<void> updateFavoriteStatus(RecipeModel recipe) async {
    await db.toggleFavorite(recipe.id!, recipe.isFavorite.value ? true : false);

    if (!recipe.isFavorite.value) {
      favoriteRecipes.removeWhere((item) => item.id == recipe.id);
    } else {
      loadFavoriteRecipes();
    }
  }

  // 🟢 حذف وصفة
  Future<void> deleteRecipe(int id, String category) async {
    try {
      int result = await db.deleteRecipe(id);
      if (result > 0) {
        loadData(); // ✅ تحديث القائمة بعد الحذف
        Get.snackbar("نجاح", "تم حذف المنتج بنجاح", backgroundColor: const Color(0xFF4CAF50));
      } else {
        Get.snackbar("خطأ", "فشل في حذف المنتج", backgroundColor: const Color(0xFFF44336));
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء حذف المنتج: $e", backgroundColor: const Color(0xFFF44336));
    }
  }}