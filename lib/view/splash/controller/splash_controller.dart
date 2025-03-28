import 'package:get/get.dart';

import '../../home/screen/home_screen.dart';

class SplashController extends GetxController{

  @override
  void onInit() async {
    super.onInit();
    Future.delayed(Duration(seconds:2), () {
      Get.off(() => HomeScreen());
    });
  }}

