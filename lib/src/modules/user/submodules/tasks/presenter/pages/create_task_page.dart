import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_signin/src/modules/auth/presenter/pages/components/auth_toast_message.dart';
import 'package:flutter_signin/src/modules/user/presenter/store/user_store.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/presenter/pages/components/task_toast_message.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/presenter/store/task_store.dart';

class CreateTaskPage extends StatefulWidget {
  final User? user;
  const CreateTaskPage({super.key, required this.user});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  late final TaskStore taskStore;
  late final UserStore userStore;

  final taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskStore = context.read<TaskStore>();
    userStore = context.read<UserStore>();
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${userStore.shortenedName(widget.user!.name)}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text('Create a task here:'),
            const SizedBox(height: 20),
            TextField(
              controller: taskController,
              onChanged: (value) => taskStore.toggleEnableTaskButton(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task',
              ),
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: taskStore.enableButton
                    ? () async {
                        await taskStore.addTask(
                            taskController.text, widget.user?.id ?? '-1');
                        TaskToastMessage.showToast(
                            'Task created successfully!', context);
                        taskController.text = '';
                      }
                    : null,
                child: const Text('Add Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
