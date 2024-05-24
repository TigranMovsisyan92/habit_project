import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_project/translations/codegen_loader.g.dart';

class AppLocalization {
  static EasyLocalization init({required Widget child}) {
    return EasyLocalization(
      path: 'assets/translations',
      fallbackLocale: const Locale('ru', 'RU'),
      assetLoader: const CodegenLoader(),
      supportedLocales: const [
        Locale('en', 'US'), Locale('ru', 'RU'),
      ],
      child: child,
    );
  }
}