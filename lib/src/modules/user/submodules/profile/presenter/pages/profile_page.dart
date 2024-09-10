import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';

class ProfilePage extends StatefulWidget {
  final User? user;
  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final AuthStore authStore;

  @override
  void initState() {
    super.initState();
    authStore = context.read<AuthStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: const Image(
                image: AssetImage('assets/nopic.png'),
                width: 100,
                height: 100,
              ),
            ),
          ),
          Text(
            ' ${widget.user!.name}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ]),
      ),
    );
  }
}
