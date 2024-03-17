import 'package:get/get.dart';

class CTextFormController extends GetxController {
  final isPassword = true.obs;

  void visiblityIcon() {
    isPassword.value = !isPassword.value;
  }
}
