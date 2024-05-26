import 'package:flutter/material.dart';
import 'package:habit_project/constants/app_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.appColor,
    selectionColor: AppColors.appColor,
    selectionHandleColor: AppColors.appColor,
  ),
  colorScheme: const ColorScheme.light(
    background: Color(0xffEBEBEB),
    primary: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.appColor,
    selectionColor: AppColors.appColor,
    selectionHandleColor: AppColors.appColor,
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade200,
  ),
);