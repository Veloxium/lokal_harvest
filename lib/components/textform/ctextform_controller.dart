import 'package:get/get.dart';

class CTextFormController extends GetxController {
  
  static CTextFormController get to => Get.find();
  final isPassword = false.obs;

  CTextFormController({required bool initialIsPassword}) {
    isPassword.value = initialIsPassword;
  }

  void visiblityIcon() {
    isPassword.value = !isPassword.value;
  }
}
