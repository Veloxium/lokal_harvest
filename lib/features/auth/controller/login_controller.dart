import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas/features/layout/screen/layout.dart';
import 'package:project_uas/features/splash/screen/splash.dart';
import 'package:http/http.dart' as http;
import 'package:project_uas/utils/api/capi.dart';

class LoginScreenController extends GetxController {
  static LoginScreenController get to => Get.find();
  late TextEditingController email;
  late TextEditingController password;

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  Future<void> login() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar(
        "Gagal",
        "Email atau Password tidak boleh kosong",
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      );
      return;
    }
    try {
      var res = await http.post(
        Uri.parse(CApi.login),
        body: {
          'email': email.text,
          'password': password.text,
        },
      );
      if (res.statusCode == 201) {
        Get.snackbar(
          "Berhasil",
          "Login Berhasil",
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.green,
        );
        email.clear();
        password.clear();
        Get.offAll(() => const LayoutScreen());
      } else {
        Get.snackbar(
          "Gagal",
          "Login Gagal",
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
