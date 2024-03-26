
import 'package:get/get.dart';

class ProductController extends GetxController {
  
  final selectCategory = "Semua".obs;

  void changeCategory(String category) {
    selectCategory.value = category;
  }

} 