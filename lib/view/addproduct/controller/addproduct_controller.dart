import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
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

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  void setImageFromPath(String imagePath) {
    imageFile.value = File(imagePath);
  }

  Future<void> saveProduct() async {
    if (titleController.text.isNotEmpty) {
      RecipeModel  recipe = RecipeModel(
        title: titleController.text,
        description: descriptionController.text,
        category: selectedCategory.value,
        image: imageFile.value?.path,
      );
      await db.insertRecipe(recipe);
      getTargetController()?.loadData();
      clearFields();
      Get.back();
      Get.snackbar("نجاح", "تمت إضافة المنتج بنجاح", backgroundColor: Colors.green);
    } else {
      Get.snackbar("خطأ", "يرجى ملء جميع الحقول", backgroundColor: Colors.red);
    }
  }
  RecipesController? getTargetController() {
    return Get.find<RecipesController>(tag: selectedCategory.value);
  }
  Future<void> updateProduct(int id) async {
    if (titleController.text.isNotEmpty) {
      RecipeModel recipe = RecipeModel(
        id: id, // ضروري لضمان تعديل المنتج الصحيح
        title: titleController.text,
        description: descriptionController.text,
        category: selectedCategory.value,
        image: imageFile.value?.path,
      );
      await db.updateRecipe(recipe);
      RecipesController? targetController = Get.find<RecipesController>(tag: recipe.category);
      targetController?.loadData();
      clearFields();
      Get.back();
      Get.snackbar("نجاح", "تم تعديل المنتج بنجاح", backgroundColor: Colors.green);
    } else {
      Get.snackbar("خطأ", "يرجى ملء جميع الحقول", backgroundColor: Colors.red);
    }
  }

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    selectedCategory.value = 'حلويات';  // إعادة الفئة إلى الخيار الافتراضي
    imageFile.value = null;  // إزالة الصورة المحددة
  }}