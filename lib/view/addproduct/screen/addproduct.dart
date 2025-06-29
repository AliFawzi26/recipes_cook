
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipec_food/Core/const/app_colors.dart';
import 'package:recipec_food/Core/const/text_style.dart';
import '../../../model/recipec.dart';
import '../controller/addproduct_controller.dart';
class AddProductDialog extends StatelessWidget {
  final RecipeModel? recipe;
  AddProductDialog({super.key, this.recipe});

  final AddProductController controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    // تحميل البيانات مرة واحدة فقط
    if (recipe != null) {
      controller.loadRecipe(recipe!);
    } else {
      controller.clearFields(); // إعادة تعيين إذا تم الفتح للإضافة
    }
    return AlertDialog(
      title: Text(
        recipe == null ? "إضافة منتج جديد" : "تعديل المنتج",
        style: FontStyles.textalr,
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(labelText: "اسم المنتج"),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: controller.descriptionController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(labelText: "التفاصيل"),
            ),
            SizedBox(height: 12.h),
            Obx(() => DropdownButtonFormField<String>(
              value: controller.selectedCategory.value,
              items: ['حلويات', 'سلطات', 'أكلات غربية', 'أكلات شرقية']
                  .map((category) => DropdownMenuItem(
                value: category,
                child: Text(category, style: FontStyles.phstyle),
              ))
                  .toList(),
              onChanged: (value) {
                controller.selectedCategory.value = value!;
              },
              decoration: const InputDecoration(labelText: "الفئة"),
            )),
            SizedBox(height: 12.h),
            _buildImagePicker(),
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
            recipe == null
                ? controller.saveProduct()
                : controller.updateProduct(recipe!.id!);
          },
          child: Text(recipe == null ? "حفظ" : "تعديل", style: FontStyles.phstyle),
        ),
      ],
    );
  }
  Widget _buildImagePicker() {
    return Obx(() {
      if (controller.imageFile.value == null) {
        return ElevatedButton(
          onPressed: controller.pickImage,
          child: Text("اختر صورة", style: FontStyles.phstyle),
        );
      } else {
        return Column(
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
        );
      }
    });
  }
}


