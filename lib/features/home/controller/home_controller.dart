import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get to => Get.find();
  
  RxBool onTap = false.obs;
  
  void changeOnTap(bool value) {
    onTap.value = value ;
  }
}
