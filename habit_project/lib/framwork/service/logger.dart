import 'dart:developer';
import 'package:flutter/foundation.dart';

class Logger {
  static void e(
    Object error,
    StackTrace stackTrace, {
    String? message,
  }) {
    log('$error, $stackTrace, $message');
  }

  static void flutterError(FlutterErrorDetails details) {
    log('********$details*********');
  }
}