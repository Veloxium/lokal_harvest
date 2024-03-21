import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas/features/auth/screen/login.dart';
import 'package:project_uas/features/splash/screen/splash.dart';
import 'package:http/http.dart' as http;
import 'package:project_uas/utils/api/capi.dart';

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
        Uri.parse(CApi.register),
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
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.green,
        );
        email.clear();
        username.clear();
        password.clear();
        Get.offAll(() => LoginScreen());
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
