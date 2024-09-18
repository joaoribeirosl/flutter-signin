import 'package:flutter/material.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

class ProfilePage extends StatefulWidget {
  final User? user;
  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
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
                image: DecorationImage(
                    alignment: Alignment(-.2, 0),
                    image: AssetImage('assets/profile.png'),
                    fit: BoxFit.fill),
              ),
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 600),
              child: Text(
                widget.user!.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
