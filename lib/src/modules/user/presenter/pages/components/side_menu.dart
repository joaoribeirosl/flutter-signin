import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';

class SideMenu extends StatelessWidget {
  final User? user;
  final String taskCount;
  const SideMenu({super.key, required this.user, required this.taskCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(173, 82, 120, 1),
      width: 130,
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
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                  onPressed: () => Modular.to.navigate(
                      '/user_module/task/create_task_page/',
                      arguments: user),
                  label: const Text(
                    'Create Task',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 24),
                TextButton.icon(
                  icon: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  onPressed: () => Modular.to
                      .navigate('/user_module/task/', arguments: user),
                  label: const Text(
                    'Task List',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 24),
                TextButton.icon(
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                  onPressed: () => Modular.to
                      .navigate('/user_module/profile/', arguments: user),
                  label: const Text(
                    'Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 24),
                TextButton.icon(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () => Modular.to.navigate('/'),
                  label: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 24),
                TextButton.icon(
                  icon: const Icon(
                    Icons.task,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                  label: Text(
                    'Tasks: $taskCount',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
