import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recipes_cook/Core/const/app_image.dart';
import 'package:recipes_cook/Core/const/text_style.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImage.logo,
                height: 150.h,
                width: 150.w,
              ),
            ],
          ),
        ),
    );
  }
}
