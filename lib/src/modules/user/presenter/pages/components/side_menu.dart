import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';

class SideMenu extends StatelessWidget {
  final AuthStore authStore;
  const SideMenu({super.key, required this.authStore});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color.fromRGBO(173, 82, 120, 1),
        width: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Menu",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Image(
                image: AssetImage("assets/URSO.gif"),
                height: 150.0,
                width: 150.0,
              ),
              const Column(
                children: [],
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.check_box,
                        color: Colors.white,
                      ),
                      onPressed: () => Modular.to.navigate(
                          '/user_module/task/create_task_page/',
                          arguments: authStore.actualUser),
                    ),
                    const SizedBox(height: 24),
                    IconButton(
                      icon: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ),
                      onPressed: () => Modular.to.navigate('/user_module/task/',
                          arguments: authStore.actualUser),
                    ),
                    const SizedBox(height: 24),
                    IconButton(
                      icon: const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      onPressed: () => Modular.to.navigate(
                          '/user_module/profile/',
                          arguments: authStore.actualUser),
                    ),
                    const SizedBox(height: 24),
                    IconButton(
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      onPressed: () => Modular.to.navigate('/'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
