import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipes_cook/Core/const/app_colors.dart';
import 'package:recipes_cook/Core/const/text_style.dart';
import '../../../model/recipec.dart';
import '../controller/addproduct_controller.dart';

class AddProductDialog extends StatelessWidget {
  final RecipeModel? recipe;
  AddProductDialog({super.key, this.recipe});
  final AddProductController controller = Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    if (recipe != null) {
      controller.titleController.text = recipe!.title;
      controller.descriptionController.text = recipe!.description;
      controller.selectedCategory.value = recipe!.category;
      controller.setImageFromPath(recipe!.image ?? '');
    }
    return AlertDialog(
      title: Text(
        recipe == null ? "إضافة منتج جديد" : "تعديل المنتج",
        style: FontStyles.textalr
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(labelText: "اسم المنتج"),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: controller.descriptionController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(labelText: "التفاصيل"),
            ),
            SizedBox(height: 12.h),
            Obx(
                  () => DropdownButtonFormField<String>(
                value: controller.selectedCategory.value,
                items: ['حلويات', 'سلطات', 'أكلات غربية', 'أكلات شرقية']
                    .map((String category) => DropdownMenuItem<String>(
                  value: category,
                  child: Text(category, style: FontStyles.phstyle),
                ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedCategory.value = value!;
                },
                decoration:  InputDecoration(labelText: "الفئة"),
              ),
            ),
            SizedBox(height: 12.h),
            Obx(
                  () => controller.imageFile.value == null
                  ? ElevatedButton(
                onPressed: controller.pickImage,
                child: Text("اختر صورة", style: FontStyles.phstyle),
              )
                  : Column(
                children: [
                  Image.file(
                    controller.imageFile.value!,
                    height: 120.h,
                    width: 120.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8.h),
                  IconButton(
                    icon: Icon(Icons.delete, color: ColorManger.red, size: 24.sp),
                    onPressed: () => controller.imageFile.value = null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text("إلغاء", style: FontStyles.exstyle),
        ),
        TextButton(
          onPressed: () {
            if (recipe == null) {
              controller.saveProduct();
            } else {
              controller.updateProduct(recipe?.id ?? 0);
            }
          },
          child: Text(recipe == null ? "حفظ" : "تعديل", style: FontStyles.phstyle),
        ),
      ],
    );
  }
}
