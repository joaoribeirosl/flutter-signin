import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final AuthStore userStore;

  @override
  void initState() {
    super.initState();
    userStore = context.read<AuthStore>();
    Modular.to.navigate('/auth_module');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('signin'),
      ),
      body: const Center(child: Text('como q escrev')),
    );
  }
}
