
import 'package:get/get.dart';
import '../../../Core/local_storge/sqfilte_config.dart';
import '../../../model/recipec.dart';
class FavoriteController extends GetxController {
  final SqfliteConfg db = SqfliteConfg();
  var favoriteRecipes = <RecipeModel>[].obs;

  void loadFavoriteRecipes() async {
    final data = await db.getFavoriteRecipes();
    favoriteRecipes.assignAll(data);
  }

  void toggleFavorite(int id, bool currentValue) async {
    await db.toggleFavorite(id, !currentValue);
    loadFavoriteRecipes(); // إعادة التحميل بعد التعديل
  }
}

