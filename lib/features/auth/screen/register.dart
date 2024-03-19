import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas/components/button/cbutton.dart';
import 'package:project_uas/components/textform/ctextform.dart';
import 'package:project_uas/features/auth/controller/register_controller.dart';
import 'package:project_uas/features/splash/screen/splash.dart';
import 'package:project_uas/utils/constants/ccolor.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final controller = Get.put(RegisterScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Buat Akun",
            style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.w600,
            )),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
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
            CTextForm(label: "Email", textController: controller.email,),
            const SizedBox(
              height: 11.0,
            ),
            CTextForm(label: "Username", textController: controller.username),
            const SizedBox(
              height: 11.0,
            ),
            CTextForm(label: "Kata Sandi", isPassword: true, textController: controller.password),
            const SizedBox(
              height: 32.0,
            ),
            CButton(
                label: "Daftar",
                onPressed: () {
                  controller.register();
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
                    Get.back();
                  },
                  child: const Text(
                    "Sudah Punya Akun Lokal Harvest",
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
