import 'package:flutter/material.dart';

class AuthToastManager {
  static void showToast(String message, BuildContext context,
      [bool errorMessage = false]) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      errorMessage == true
          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                message,
                style: const TextStyle(color: Colors.red),
              ),
              duration: const Duration(seconds: 1)))
          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message), duration: const Duration(seconds: 1)));
    });
  }
}
