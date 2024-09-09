import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_signin/src/modules/user/submodules/tasks/presenter/store/task_store.dart';

class CreateTaskPage extends StatefulWidget {
  final User? user;
  const CreateTaskPage({super.key, required this.user});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  late final TaskStore taskStore;

  final taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskStore = context.read<TaskStore>();
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
        title: Text('Welcome ${widget.user?.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                        ScaffoldMessenger.of(_).showSnackBar(
                          const SnackBar(
                            content: Text('Task created successfully!'),
                            duration: Duration(seconds: 1),
                          ),
                        );
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
