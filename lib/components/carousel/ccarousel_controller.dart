
import 'package:get/get.dart';

class CCarouselController extends GetxController {
  static CCarouselController get to => Get.find();
  
  final currentIndex = 0.obs;

  
  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

}