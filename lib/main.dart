import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/main_app.dart';
import 'package:flutter_signin/src/modules/auth/auth_module.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowManager.instance.ensureInitialized();
  await windowManager.setMinimumSize(const Size(800, 600));
  runApp(ModularApp(module: AuthModule(), child: const MainApp()));
}
