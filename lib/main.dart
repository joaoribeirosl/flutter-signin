import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/main_app.dart';
import 'package:flutter_signin/src/modules/user/user_module.dart';

void main() {
  runApp(ModularApp(module: UserModule(), child: const MainApp()));
}

