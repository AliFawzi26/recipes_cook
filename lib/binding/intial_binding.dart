import 'package:get/get.dart';


import '../Core/class/Curd.dart';
import '../Core/network_connection/network_connection.dart';
import '../view/addproduct/controller/addproduct_controller.dart';
import '../view/food/sweets/controller/recipes_controller.dart';




class InitialBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(Crud());
    Get.put(NetworkManager());


  }


}