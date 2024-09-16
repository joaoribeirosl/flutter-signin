import 'package:flutter/material.dart';

class TaskToastManager {
  static void showToast(String message, BuildContext context,
      [bool errorMessage = false]) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        message,
        style: TextStyle(color: errorMessage ? Colors.red : null),
      )));
    });
  }
}
