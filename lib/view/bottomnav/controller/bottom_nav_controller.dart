import 'package:get/get.dart';
import 'package:recipes_cook/view/favourite/screen/favourite_screen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
