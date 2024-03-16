import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get to => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 400));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 900));
    // Get.to(() => const (),
    //     transition: Transition.fade,
    //     duration: const Duration(milliseconds: 400));
  }
}
