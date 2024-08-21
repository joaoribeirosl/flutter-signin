import 'package:flutter/material.dart';
import 'package:flutter_signin/src/modules/tasks/presenter/store/task_store.dart';

class SideMenu extends StatelessWidget {
  final TaskStore taskStore;
  const SideMenu({super.key, required this.taskStore});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
