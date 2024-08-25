import 'package:flutter/material.dart';
import 'package:flutter_signin/src/modules/tasks/presenter/pages/components/custom_sidebar.dart';
import 'package:flutter_signin/src/modules/tasks/presenter/store/task_store.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late final TaskStore taskStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tasks'),
      ),
      drawer: CustomSidebar(taskStore: taskStore),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Adicionar uma nova task',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Task',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Adicionar Task'),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const ListTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
