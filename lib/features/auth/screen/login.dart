import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_uas/components/button/cbutton.dart';
import 'package:project_uas/components/textform/ctextform.dart';
import 'package:project_uas/features/auth/controller/login_controller.dart';
import 'package:project_uas/features/auth/screen/register.dart';
import 'package:project_uas/utils/constants/ccolor.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Masuk",
            style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.w600,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            CTextForm(
              label: "Email",
              textController: controller.email,
            ),
            const SizedBox(
              height: 11.0,
            ),
            CTextForm(
                label: "Kata Sandi",
                isPassword: true,
                textController: controller.password),
            const SizedBox(
              height: 11.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Lupa kata sandi?",
                    style: TextStyle(
                      color: CColors.labelinput,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            CButton(
                label: "Masuk",
                onPressed: () {
                  controller.login();
                }),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: 50,
                    height: 2,
                    color: CColors.labelinput,
                  ),
                ),
                const SizedBox(
                  width: 25.0,
                ),
                const Text(
                  "atau",
                  style: TextStyle(
                    color: CColors.labelinput,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 25.0,
                ),
                Expanded(
                  child: Container(
                    width: 50,
                    height: 2,
                    color: CColors.labelinput,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: const Text(
                    "Daftar Akun Lokal Harvest",
                    style: TextStyle(
                      color: CColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
