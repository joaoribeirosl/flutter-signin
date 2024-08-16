import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/user/presenter/store/user_store.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  late final UserStore userStore;

  @override
  void initState() {
    super.initState();
    userStore = context.read<UserStore>();
    Modular.to.navigate('/user_module'); //main -> user
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}