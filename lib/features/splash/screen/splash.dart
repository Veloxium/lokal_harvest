import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas/features/splash/controller/splash_controller.dart';
import 'package:project_uas/utils/constants/ccolor.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      backgroundColor: CColors.primary,
      body: Obx(
        () => Center(
          child: AnimatedOpacity(
            opacity: splashController.animate.value ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: Image.asset(
              "assets/logo.png",
              width: 463,
              height: 463,
            ),
          ),
        ),
      ),
    );
  }
}
