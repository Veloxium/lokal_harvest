import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas/features/upload/controller/upload_controller.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({super.key});
  final controller = Get.put(UploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Upload Screen'),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: ()  {
                controller.uploadUserImage();
              },
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
