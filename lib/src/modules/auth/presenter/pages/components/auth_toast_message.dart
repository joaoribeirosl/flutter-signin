import 'package:flutter/material.dart';

class AuthToastMessage {
  static void showToast(String message, BuildContext context,
      [String? type]) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      type != 'error'
          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message), duration: const Duration(seconds: 1)))
          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                message,
                style: const TextStyle(color: Colors.red),
              ),
              duration: const Duration(seconds: 1)));
    });
  }
}
