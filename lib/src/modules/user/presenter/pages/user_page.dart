import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';
import 'package:flutter_signin/src/modules/user/presenter/pages/components/side_menu.dart';
import 'package:flutter_signin/src/modules/user/presenter/store/user_store.dart';
import 'package:window_manager/window_manager.dart';

class UserPage extends StatefulWidget {
  final User? user;
  const UserPage({super.key, required this.user});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with WindowListener {
  late final UserStore userStore;
  late final AuthStore authStore;

  @override
  void initState() {
    windowManager.addListener(this);
    userStore = context.read<UserStore>();
    authStore = context.read<AuthStore>();
    Modular.to.navigate('/user_module/task/', arguments: widget.user);
    // userStore.changeRoute('Task', 'task');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideMenu(user: widget.user),
          const Expanded(
            child: RouterOutlet(),
          ),
        ],
      ),
    );
  }
}
