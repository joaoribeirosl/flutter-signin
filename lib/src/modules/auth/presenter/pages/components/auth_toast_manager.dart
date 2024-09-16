import 'package:flutter/material.dart';

class AuthToastManager {
  static void showToast(String message, BuildContext context,
      [bool errorMessage = false]) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 1),
          content: Text(
            message,
            style: TextStyle(color: errorMessage ? Colors.red : null),
          )));
    });
  }
}
