
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipec_food/Core/const/app_colors.dart';
import 'package:recipec_food/Core/const/text_style.dart';
import '../../model/recipec.dart';
import '../addproduct/screen/addproduct.dart';
class RecipeGridView extends StatelessWidget {
  final List<RecipeModel> recipes;
  final dynamic controller; // يمكن أن يكون RecipesController أو FavoriteController
  final bool isFavoriteScreen;

  const RecipeGridView({
    Key? key,
    required this.recipes,
    required this.controller,
    this.isFavoriteScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = (constraints.maxWidth / 250.w).floor().clamp(1, 4);
        double aspectRatio = (constraints.maxWidth / crossAxisCount) / (400.h);
        return GridView.builder(
          padding: EdgeInsets.all(10.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: aspectRatio,
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r),),
              color: ColorManger.white,
              shadowColor: ColorManger.GA2.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                    child: recipe.image != null
                        ? Image.file(
                      File(recipe.image!), width: double.infinity, height: 180.h, fit: BoxFit.cover,
                    )
                        : Container(
                      height: 180.h,
                      width: double.infinity,
                      color: ColorManger.GA3,
                      child: Icon(Icons.image, size: 50.sp, color: ColorManger.GA2),
                    ),),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(recipe.title, style: FontStyles.lstyle),
                          SizedBox(height: 6.h),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(recipe.description, style: FontStyles.Mstyle),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: ColorManger.blcolor, size: 24.sp),
                                onPressed: () => Get.dialog(AddProductDialog(recipe: recipe)),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: ColorManger.red, size: 24.sp),
                                onPressed: () async {
                                  await controller.deleteRecipe(recipe.id!, recipe.category);
                                },),
                              Obx(() => IconButton(
                                icon: Icon(
                                  recipe.isFavorite.value
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: recipe.isFavorite.value
                                      ? ColorManger.red
                                      : ColorManger.GA2,
                                  size: 28.sp,
                                ),
                                onPressed: () async {
                                  recipe.isFavorite.toggle();
                                  if (isFavoriteScreen) {
                                    await controller.toggleFavorite(recipe.id!, !recipe.isFavorite.value);
                                  } else {
                                    await controller.updateFavoriteStatus(recipe);
                                  }
                                },
                              )),
                            ],
                          ),
                        ],),),),],
              ),);},);
      },);
  }
}
