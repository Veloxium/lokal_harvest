import 'package:get/get.dart';
import 'package:project_uas/features/auth/screen/login.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get to => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 400));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    Get.offAll(const LoginScreen(),
        transition: Transition.fade,
        duration: const Duration(milliseconds: 400));
  }
}
