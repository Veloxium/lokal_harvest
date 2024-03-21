import 'package:get/get.dart';

class LayoutController extends GetxController {
  RxInt selectedIndex = 0.obs; // Using Rx for reactive updates

  void changeIndex(RxInt index) {
    selectedIndex.value = index.value;
  }
}
