import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_uas/features/layout/screen/layout.dart';
import 'package:project_uas/features/splash/screen/splash.dart';
import 'package:project_uas/features/upload/screen/upload.dart';
import 'package:project_uas/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lokal Harvest',
      themeMode: ThemeMode.system,
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      // home: LayoutScreen(),
      home: UploadScreen(),
    );
  }
}
