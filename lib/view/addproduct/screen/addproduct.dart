
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Core/local_storge/sqfilte_config.dart';
import '../../../model/recipec.dart';
import '../../food/sweets/controller/recipes_controller.dart';
class AddProductController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var selectedCategory = 'حلويات'.obs;
  var imageFile = Rx<File?>(null);
  final db = SqfliteConfg();
  /// ✅ تحميل الصورة
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }
  /// ✅ تعيين صورة موجودة مسبقًا
  void setImageFromPath(String imagePath) {
    if (imagePath.isNotEmpty) {
      imageFile.value = File(imagePath);
    }
  }
  /// ✅ تحميل بيانات وصفة لتعديلها
  void loadRecipe(RecipeModel recipe) {
    titleController.text = recipe.title;
    descriptionController.text = recipe.description;
    selectedCategory.value = recipe.category;
    setImageFromPath(recipe.image ?? '');
  }
  /// ✅ حفظ منتج جديد
  Future<void> saveProduct() async {
    if (titleController.text.isNotEmpty) {
      final recipe = RecipeModel(
        title: titleController.text,
        description: descriptionController.text,
        category: selectedCategory.value,
        image: imageFile.value?.path,
      );
      final insertedId = await db.insertRecipe(recipe);
      if (insertedId > 0) {
        getTargetController()?.loadData();
        clearFields();
        Get.back();
        Get.snackbar("نجاح", "تمت إضافة المنتج بنجاح", backgroundColor: Colors.green);
      } else {
        Get.snackbar("خطأ", "حدث خطأ أثناء الحفظ", backgroundColor: Colors.red);
      }
    } else {
      Get.snackbar("خطأ", "يرجى ملء جميع الحقول", backgroundColor: Colors.red);
    }
  }
  /// ✅ تعديل منتج موجود
  Future<void> updateProduct(int id) async {
    if (titleController.text.isNotEmpty) {
      final recipe = RecipeModel(
        id: id,
        title: titleController.text,
        description: descriptionController.text,
        category: selectedCategory.value,
        image: imageFile.value?.path,
      );
      final result = await db.updateRecipe(recipe);
      if (result > 0) {
        getTargetController()?.loadData();
        clearFields();
        Get.back();
        Get.snackbar("نجاح", "تم تعديل المنتج بنجاح", backgroundColor: Colors.green);
      } else {
        Get.snackbar("خطأ", "حدث خطأ أثناء التعديل", backgroundColor: Colors.red);
      }
    } else {
      Get.snackbar("خطأ", "يرجى ملء جميع الحقول", backgroundColor: Colors.red);
    }
  }
  /// ✅ جلب المتحكم الصحيح حسب الفئة
  RecipesController? getTargetController() {
    return Get.find<RecipesController>(tag: selectedCategory.value);
  }
  /// ✅ تفريغ الحقول بعد الحفظ أو التعديل
  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    selectedCategory.value = 'حلويات';
    imageFile.value = null;
  }
}

