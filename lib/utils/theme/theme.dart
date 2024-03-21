import 'package:flutter/material.dart';
import 'package:project_uas/utils/constants/ccolor.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: CColors.primary,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
  );
}