import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_signin/src/modules/tasks/presenter/store/task_store.dart';

class TaskPage extends StatefulWidget {
  final User? user;
  const TaskPage({super.key, required this.user});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late final TaskStore taskStore;

  final taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskStore = context.read<TaskStore>();
    taskController.addListener(_taskPrinter);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      taskStore.getAllTasks(widget.user!.id);
    });
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  void _taskPrinter() {
    final text = taskController.text;
    print('Second text field: $text');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome ${widget.user?.name}',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 213, 131, 150),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('logout'),
              onTap: () => Modular.to.navigate('/'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: taskController,
              onChanged: (value) => taskStore.toggleEnableTaskButton(value),
              decoration: const InputDecoration(
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
            const SizedBox(height: 16),
            Text(
              '${widget.user?.name}\'s Task List:',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Observer(
              builder: (_) => Expanded(
                child: ListView.builder(
                  itemCount: taskStore.taskList.length,
                  itemBuilder: (context, index) {
                    final actualTask = taskStore.taskList[index];
                    return Card(
                      child: ListTile(
                        title: Text(actualTask.task),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await taskStore.removeTaskById(actualTask.id);
                            ScaffoldMessenger.of(_).showSnackBar(const SnackBar(
                                content: Text('Task removed successfully!'),
                                duration: Duration(seconds: 1)));
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
