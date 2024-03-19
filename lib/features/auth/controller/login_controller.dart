import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas/features/splash/screen/splash.dart';
import 'package:http/http.dart' as http;

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
        Uri.parse('http://10.0.2.2:3000/auth/login'),
        body: {
          'email': email.text,
          'password': password.text,
        },
      );
      if (res.statusCode == 201) {
        Get.snackbar(
          "Berhasil",
          "Login Berhasil",
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        );
        email.clear();
        password.clear();
        Get.offAll(() => SplashScreen());
      } else {
        Get.snackbar(
          "Gagal",
          "Login Gagal",
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
