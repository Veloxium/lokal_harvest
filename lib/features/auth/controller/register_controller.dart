import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas/features/splash/screen/splash.dart';
import 'package:http/http.dart' as http;

class RegisterScreenController extends GetxController {
  static RegisterScreenController get to => Get.find();
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController password;

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();
  }

  Future<void> register() async {
       if (email.text.isEmpty || password.text.isEmpty || username.text.isEmpty) {
      Get.snackbar(
        "Gagal",
        "Email atau Username atau Password tidak boleh kosong",
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      );
      return;
    }
    try {
      var res = await http.post(
        Uri.parse('http://10.0.2.2:3000/auth/register'),
        body: {
          'email': email.text,
          'username': username.text,
          'password': password.text,
        },
      );
      if (res.statusCode == 201) {
        Get.snackbar(
          "Berhasil",
          "Register Berhasil",
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        );
        email.clear();
        username.clear();
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
